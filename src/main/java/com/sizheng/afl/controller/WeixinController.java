/**
 * WeixinController.java
 */
package com.sizheng.afl.controller;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sizheng.afl.base.BaseController;
import com.sizheng.afl.component.PropUtil;
import com.sizheng.afl.component.WeiXinApiInvoker;
import com.sizheng.afl.pojo.constant.SysConstant;
import com.sizheng.afl.pojo.model.WeiXinBaseMsg;
import com.sizheng.afl.pojo.model.WeiXinEventType;
import com.sizheng.afl.pojo.model.WeiXinMsg;
import com.sizheng.afl.pojo.model.WeiXinMsgType;
import com.sizheng.afl.service.IBusinessService;
import com.sizheng.afl.service.IQrcodeService;
import com.sizheng.afl.service.IWeiXinService;
import com.sizheng.afl.util.DateUtil;
import com.sizheng.afl.util.EncoderUtil;
import com.sizheng.afl.util.StringUtil;
import com.sizheng.afl.util.WebUtil;
import com.sizheng.afl.util.XmlUtil;

/**
 * 【微信】请求控制层.
 * 
 * @creation 2014年03月19日 02:07:25
 * @modification 2014年03月19日 02:07:25
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Controller
@RequestMapping(value = "weixin")
public class WeixinController extends BaseController {

	private static Logger logger = Logger.getLogger(WeixinController.class);

	private static Set<String> set = new HashSet<>();

	@Autowired
	WeiXinApiInvoker weiXinApiInvoker;

	@Autowired
	IWeiXinService weiXinService;

	@Autowired
	PropUtil propUtil;

	@Autowired
	IBusinessService businessService;

	@Autowired
	IQrcodeService qrcodeService;

	/**
	 * 接收微信服务器消息并相应.
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月20日 下午12:44:07
	 * @modification 2014年3月20日 下午12:44:07
	 * @param reqBody
	 * @param locale
	 * @return
	 */
	@RequestMapping("invoke")
	public void invoke(@ModelAttribute WeiXinMsg weiXinMsg, @RequestBody(required = false) String reqBody,
			HttpServletResponse response, Locale locale) {

		logger.debug("响应微信服务器消息【微信】");

		// 验证请求来自微信服务器
		if (verify(weiXinMsg, locale)) {

			// 微信服务器验证 第三方服务器资源
			if (StringUtil.isNotEmpty(weiXinMsg.getEchostr())) {
				WebUtil.writeString(response, weiXinMsg.getEchostr());
				return;
			}

			if (logger.isDebugEnabled()) {
				logger.debug(XmlUtil.format(reqBody));
			}

			// 解析消息
			WeiXinBaseMsg bean = XmlUtil.toBean(reqBody, WeiXinBaseMsg.class);

			// 对消息进行排重检查
			String key = StringUtil.isEmpty(bean.getMsgId()) ? (bean.getFromUserName() + "_" + bean.getCreateTime())
					: bean.getMsgId();

			if (set.contains(key)) {
				logger.debug("消息重复,key:" + key);
				WebUtil.writeString(response, StringUtil.EMPTY);
				return;
			} else {
				set.clear();
				set.add(key);
			}

			// 保存所有来自微信的消息
			// text image voice video location link
			if (propUtil.isSaveWeixinMsg()) {
				weiXinService.saveMessage(bean);
			}

			// 消息类型
			String msgType = bean.getMsgType();

			if (WeiXinMsgType.EVENT.getValue().equals(msgType)) {
				// 事件类型
				String event = bean.getEvent();

				if (WeiXinEventType.SUBSCRIBE.getValue().equals(event)) {// 关注事件

					String eventKey = bean.getEventKey();

					// 扫描带参数二维码事件
					// 用户未关注时，进行关注后的事件推送
					if (eventKey != null && eventKey.startsWith("qrscene_")) {
						weiXinService.subscribe(bean, locale);

						String type = qrcodeService.getQrCodeType(locale, eventKey.split(SysConstant.UNDERLINE)[1]);
						// 台桌二维码扫描
						if (SysConstant.QR_TYPE_TZ.equals(type)) {
							String result = businessService.addConsumer(locale, bean);
							writeText(response, bean, result);
						} else if (SysConstant.QR_TYPE_JS.equals(type)) {
							String result = businessService.addRole(locale, bean);
							writeText(response, bean, result);
						} else {
							WebUtil.writeString(response, StringUtil.EMPTY);
						}
					} else {
						weiXinService.subscribe(bean, locale);
						writeText(response, bean, "欢迎您的订阅!");
					}
				} else if (WeiXinEventType.UNSUBSCRIBE.getValue().equals(event)) {// 取消关注事件
					weiXinService.unsubscribe(bean, locale);
					writeText(response, bean, "期待您的再次回来!");
				} else if (WeiXinEventType.CLICK.getValue().equals(event)) { // 菜单点击事件

					// 菜单项对应的键值
					String eventKey = bean.getEventKey();

					String result = weiXinService.click(bean, locale);

					// 需要客服消息回复的处理.
					if (StringUtil.isNotEmpty(result)) {
						writeText(response, bean, result);
					} else {
						WebUtil.writeString(response, StringUtil.EMPTY);
					}
				} else if (WeiXinEventType.VIEW.getValue().equals(event)) { // 菜单点击事件
					weiXinService.view(bean, locale);
					writeText(response, bean, "点击菜单跳转链接时的事件推送!");
				} else if (WeiXinEventType.LOCATION.getValue().equals(event)) {// 上报地理位置事件
					weiXinService.location(bean, locale);
					writeText(response, bean, "获取到您的地理位置!");
				} else if (WeiXinEventType.SCAN.getValue().equals(event)) {// 扫描带参数二维码事件

					String type = qrcodeService.getQrCodeType(locale, bean.getEventKey());

					if (SysConstant.QR_TYPE_TZ.equals(type)) {
						String result = businessService.addConsumer(locale, bean);
						writeText(response, bean, result);
					} else if (SysConstant.QR_TYPE_JS.equals(type)) {
						String result = businessService.addRole(locale, bean);
						writeText(response, bean, result);
					} else {
						// TODO
						writeText(response, bean, "不识别二维码类型!");
					}
				}

			} else if (WeiXinMsgType.TEXT.getValue().equals(msgType)) {
				// TODO
				writeText(response, bean, "我们已经接收到您的文本消息,谢谢!");

			} else if (WeiXinMsgType.IMAGE.getValue().equals(msgType)) {
				// TODO
				writeText(response, bean, "我们已经接收到您的图片消息,谢谢!");

			} else if (WeiXinMsgType.VOICE.getValue().equals(msgType)) {
				// TODO
				writeText(response, bean, "我们已经接收到您的语音消息,谢谢!");

			} else if (WeiXinMsgType.VIDEO.getValue().equals(msgType)) {
				// TODO
				writeText(response, bean, "我们已经接收到您的视频消息,谢谢!");

			} else if (WeiXinMsgType.LOCATION.getValue().equals(msgType)) {
				// TODO
				writeText(response, bean, "我们已经接收到您的地理为位置消息,谢谢!");

				bean.setLatitude(bean.getLocation_X());
				bean.setLongitude(bean.getLocation_Y());
				bean.setPrecision(bean.getScale());

				weiXinService.location(bean, locale);

			} else if (WeiXinMsgType.LINK.getValue().equals(msgType)) {
				// TODO
				writeText(response, bean, "我们已经接收到您的链接消息,谢谢!");

			} else {
				weiXinService.handleMsgTypeFail(bean, locale);
				writeText(response, bean, "系统不能识别该种消息类型!");
			}
		} else {
			logger.error("验证[消息来自微信服务器]没有通过!");
			weiXinService.verifyFail(weiXinMsg, locale);
			WebUtil.writeString(response, StringUtil.EMPTY);
		}
	}

	/**
	 * 微信验证.
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月20日 下午12:59:04
	 * @modification 2014年3月20日 下午12:59:04
	 * @param weiXinMsg
	 * @param locale
	 */
	private boolean verify(WeiXinMsg weiXinMsg, Locale locale) {

		logger.debug("验证【微信】");

		try {

			if (weiXinMsg != null) {
				String[] arr = new String[] { propUtil.getToken(), weiXinMsg.getTimestamp(), weiXinMsg.getNonce() };
				Arrays.sort(arr);
				String join = StringUtil.join(SysConstant.EMPTY, arr);
				String encode = EncoderUtil.encodeBySHA1(join);

				if (encode.equals(weiXinMsg.getSignature())) {
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
		}

		return false;
	}

	/**
	 * 回复文本[text]类型消息
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月22日 下午11:45:54
	 * @modification 2014年3月22日 下午11:45:54
	 * @param response
	 * @param bean
	 */
	private void writeText(HttpServletResponse response, WeiXinBaseMsg bean, String text) {
		String resp = StringUtil.replaceByKV(propUtil.getTplText(), "FromUserName", bean.getToUserName(), "ToUserName",
				bean.getFromUserName(), "CreateTime", String.valueOf(DateUtil.now().getTime()), "MsgType", "text",
				"Content", text);

		WebUtil.writeString(response, resp);
	}

	// /**
	// * 添加商家
	// *
	// * @author xiweicheng
	// * @creation 2014年4月3日 下午2:01:36
	// * @modification 2014年4月3日 下午2:01:36
	// * @param request
	// * @param locale
	// * @param model
	// * @return
	// */
	// @RequestMapping("businessAdd")
	// public String businessAdd(HttpServletRequest request, Locale locale,
	// Model model) {
	// model.addAttribute("url",
	// weiXinService.getWebpageCodeUrl("business/add.do", "param-state"));
	// return "weixin/business-add";
	// }

	@RequestMapping("test")
	public String test(HttpServletRequest request, Locale locale, Model model) {
		return "test";
	}

}

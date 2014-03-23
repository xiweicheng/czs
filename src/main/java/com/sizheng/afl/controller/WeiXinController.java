/**
 * WeiXinController.java
 */
package com.sizheng.afl.controller;

import java.util.Arrays;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sizheng.afl.base.BaseController;
import com.sizheng.afl.component.PropUtil;
import com.sizheng.afl.component.WeiXinApiInvoker;
import com.sizheng.afl.pojo.constant.SysConstant;
import com.sizheng.afl.pojo.model.WeiXinBaseMsg;
import com.sizheng.afl.pojo.model.WeiXinEventType;
import com.sizheng.afl.pojo.model.WeiXinMsg;
import com.sizheng.afl.pojo.model.WeiXinMsgType;
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
@RequestMapping(value = "weiXin")
public class WeiXinController extends BaseController {

	private static Logger logger = Logger.getLogger(WeiXinController.class);

	@Autowired
	WeiXinApiInvoker weiXinApiInvoker;

	@Autowired
	IWeiXinService weiXinService;

	@Autowired
	PropUtil propUtil;

	/**
	 * 验证【微信】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月19日 02:07:25
	 * @modification 2014年03月19日 02:07:25
	 * @return
	 */
	// @RequestMapping("verify")
	@ResponseBody
	public String verify(@ModelAttribute WeiXinMsg weiXinMsg, Locale locale) {

		if (weixinVerify(weiXinMsg, locale)) {
			return weiXinMsg.getEchostr();
		}

		return StringUtil.EMPTY;
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
	private boolean weixinVerify(WeiXinMsg weiXinMsg, Locale locale) {

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
	 * 接收微信服务器消息并相应.
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月20日 下午12:44:07
	 * @modification 2014年3月20日 下午12:44:07
	 * @param reqBody
	 * @param locale
	 * @return
	 */
	@RequestMapping("verify")
	public void verify(@ModelAttribute WeiXinMsg weiXinMsg, @RequestBody String reqBody, HttpServletResponse response,
			Locale locale) {

		logger.debug("响应消息【微信】");

		logger.info(reqBody);

		// 验证请求来自微信服务器
		if (weixinVerify(weiXinMsg, locale)) {

			// 解析消息
			WeiXinBaseMsg bean = XmlUtil.toBean(reqBody, WeiXinBaseMsg.class);

			// 消息类型
			String msgType = bean.getMsgType();

			if (WeiXinMsgType.EVENT.getValue().equals(msgType)) {
				// 事件类型
				String event = bean.getEvent();

				if (WeiXinEventType.SUBSCRIBE.getValue().equals(event)) {// 关注事件
					weiXinService.subscribe(bean, locale);
					writeText(response, bean, "欢迎您的订阅!");
				} else if (WeiXinEventType.UNSUBSCRIBE.getValue().equals(event)) {// 取消关注事件
					weiXinService.unsubscribe(bean, locale);
					writeText(response, bean, "期待您的再次回来!");
				} else if (WeiXinEventType.CLICK.getValue().equals(event)) { // 菜单点击事件
					weiXinService.click(bean, locale);
					writeText(response, bean, "你点击了自定义菜单项!");
				} else if (WeiXinEventType.LOCATION.getValue().equals(event)) {// 上报地理位置事件
					weiXinService.location(bean, locale);
					writeText(response, bean, "获取到您的地理位置!");
				}

			} else if (WeiXinMsgType.TEXT.getValue().equals(msgType)) {

				// 原样文本内容回复
				// TODO
				writeText(response, bean, bean.getContent());

			} else {
				logger.error("未识别消息类型[" + msgType + "]");
				weiXinService.handleMsgTypeFail(bean, locale);
			}
		} else {
			logger.error("验证[消息来自微信服务器]没有通过!");
			weiXinService.verifyFail(weiXinMsg, locale);
			WebUtil.writeString(response, StringUtil.EMPTY);
		}
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

	@RequestMapping("view01")
	public String view01(HttpServletRequest request, Locale locale, Model model) {
		model.addAttribute("title", "测试标题1");
		model.addAttribute("webpageCodeGetUrl", weiXinService.getWebpageCodeUrl());
		return "view01";
	}

	@RequestMapping("view02")
	public String view02(HttpServletRequest request, Locale locale, Model model) {
		model.addAttribute("title", "测试标题2");
		return "view02";
	}

}

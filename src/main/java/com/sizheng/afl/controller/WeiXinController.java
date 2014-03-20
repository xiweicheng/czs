/**
 * WeiXinController.java
 */
package com.sizheng.afl.controller;

import java.util.Arrays;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sizheng.afl.base.BaseController;
import com.sizheng.afl.component.WeiXinApiInvoker;
import com.sizheng.afl.pojo.constant.SysConstant;
import com.sizheng.afl.pojo.model.WeiXinBaseMsg;
import com.sizheng.afl.pojo.model.WeiXinMsg;
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

	@Value("#{systemProperties['weixin.token']}")
	private String token;

	@Value("#{systemProperties['weixin.resp.tpl.text']}")
	private String tplText;
	
	@Autowired
	WeiXinApiInvoker weiXinApiInvoker;

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
				String[] arr = new String[] { token, weiXinMsg.getTimestamp(), weiXinMsg.getNonce() };
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

		if (weixinVerify(weiXinMsg, locale)) {

			WeiXinBaseMsg bean = XmlUtil.toBean(reqBody, WeiXinBaseMsg.class);

			if ("event".equals(bean.getMsgType()) && "CLICK".equals(bean.getEvent())) {

				String eventKey = bean.getEventKey();

				if ("c_001".equals(eventKey)) {
					weiXinApiInvoker.sendServiceMsg(bean.getFromUserName(), "你点击了[我要请假]");
				} else if ("c_002".equals(eventKey)) {
					weiXinApiInvoker.sendServiceMsg(bean.getFromUserName(), "你点击了[允许请假]");
				}

				return;
			}

			String resp = StringUtil.replaceByKV(tplText, "FromUserName", bean.getToUserName(), "ToUserName",
					bean.getFromUserName(), "CreateTime", String.valueOf(DateUtil.now().getTime()), "MsgType", "text",
					"Content", bean.getContent());

			logger.info(resp);

			WebUtil.writeString(response, resp);
		} else {
			WebUtil.writeString(response, StringUtil.EMPTY);
		}
	}

}

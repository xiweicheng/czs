package com.canzs.czs.component;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpResponseException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.canzs.czs.pojo.constant.SysConstant;
import com.canzs.czs.pojo.model.WeiXinAccessToken;
import com.canzs.czs.pojo.model.WeiXinButton;
import com.canzs.czs.pojo.model.WeiXinClickButton;
import com.canzs.czs.pojo.model.WeiXinCustomMsg;
import com.canzs.czs.pojo.model.WeiXinCustomText;
import com.canzs.czs.pojo.model.WeiXinCustomVoice;
import com.canzs.czs.pojo.model.WeiXinMenu;
import com.canzs.czs.pojo.model.WeiXinQrcode;
import com.canzs.czs.pojo.model.WeiXinQrcodeCreateParam;
import com.canzs.czs.pojo.model.WeiXinUserInfo;
import com.canzs.czs.util.JsonUtil;
import com.canzs.czs.util.StringUtil;
import com.canzs.czs.util.WebUtil;

/**
 * 微信api调用接口.
 * 
 * @creation 2014年3月21日 上午10:06:16
 * @modification 2014年3月21日 上午10:06:16
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Component
public class WeiXinApiInvoker {

	@Autowired
	SimpleMailSender simpleMailSender;

	/** accessToken [String] access token */
	@Value("#{writableProperties['weixin.api.url.access.token']}")
	private String accessToken;
	/** expiresIn [long] access token 过期时间(默认两个小时) */
	@Value("#{writableProperties['weixin.api.url.access.expires.in']}")
	private long expiresIn;

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public long getExpiresIn() {
		return expiresIn;
	}

	public void setExpiresIn(long expiresIn) {
		this.expiresIn = expiresIn;
	}

	private static Logger logger = Logger.getLogger(WeiXinApiInvoker.class);

	@Autowired
	PropUtil propUtil;

	/**
	 * zabbix api invoke.
	 * 
	 * @author xiweicheng
	 * @creation 2013年12月28日 下午3:27:01
	 * @modification 2013年12月28日 下午3:27:01
	 * @param param
	 * @return
	 */
	public JSONObject invoke(String url, Object param, String... path) {
		return invoke(url, JsonUtil.toJson(param), path);
	}

	/**
	 * zabbix api invoke,对结果不进行封装处理,直接返回字符串结果.
	 * 
	 * @author xiweicheng
	 * @creation 2013年12月30日 下午2:28:48
	 * @modification 2013年12月30日 下午2:28:48
	 * @param param
	 * @param path
	 * @return
	 */
	public String invokeSimple(String url, Object param, String... path) {
		return invokeSimple(url, JsonUtil.toJson(param), path);
	}

	/**
	 * zabbix api invoke,对结果不进行封装处理,直接返回字符串结果.
	 * 
	 * @author xiweicheng
	 * @creation 2013年12月30日 下午2:28:48
	 * @modification 2013年12月30日 下午2:28:48
	 * @param param
	 * @param path
	 * @return
	 */
	public String invokeSimple(String url, String jsonParams, String... path) {

		if (logger.isDebugEnabled()) {
			logger.debug("[invokeAPI jsonParams] " + SysConstant.NEW_LINE + JsonUtil.toPrettyJson(jsonParams));
		}

		CloseableHttpClient httpclient = HttpClients.createDefault();

		HttpPost httpPost = new HttpPost(WebUtil.JoinUrls(url, path));
		httpPost.setEntity(new StringEntity(jsonParams, ContentType.APPLICATION_JSON));
		String response = null;

		try {
			response = httpclient.execute(httpPost, new ResponseHandler<String>() {

				@Override
				public String handleResponse(HttpResponse response) throws ClientProtocolException, IOException {
					final StatusLine statusLine = response.getStatusLine();
					final HttpEntity entity = response.getEntity();
					if (statusLine.getStatusCode() >= 300) {
						EntityUtils.consume(entity);
						throw new HttpResponseException(statusLine.getStatusCode(), statusLine.getReasonPhrase());
					}
					return entity == null ? null : EntityUtils.toString(entity, Consts.UTF_8);
				}

			});
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (logger.isDebugEnabled()) {
			logger.debug("[invokeAPI jsonResult] " + SysConstant.NEW_LINE + JsonUtil.toPrettyJson(response));
		}

		return response;
	}

	/**
	 * zabbix api invoke.
	 * 
	 * @author xiweicheng
	 * @creation 2013年12月28日 下午3:26:43
	 * @modification 2013年12月28日 下午3:26:43
	 * @param jsonParams
	 * @return
	 */
	public JSONObject invoke(String url, String jsonParams, String... path) {

		JSONObject rs = null;

		try {
			rs = JSON.parseObject(invokeSimple(url, jsonParams, path));
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			rs = new JSONObject();
		}

		return rs;
	}

	/**
	 * access token init.
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月20日 下午6:26:33
	 * @modification 2014年3月20日 下午6:26:33
	 */
	public boolean initAccessToken() {

		String url = StringUtil.replaceByKV(propUtil.getTokenGetUrl(), "appid", propUtil.getAppid(), "secret",
				propUtil.getSecret());

		JSONObject invoke = invoke(url, StringUtil.EMPTY);

		if (invoke.containsKey("access_token")) {
			setAccessToken(invoke.getString("access_token"));
			setExpiresIn(invoke.getLongValue("expires_in"));

			// 将access token写入系统配置中,以便下次系统启动后使用.因为这个资源有获取次数限制.
			com.canzs.czs.util.PropUtil.save("weixin.api.url.access.token", getAccessToken());
			com.canzs.czs.util.PropUtil.save("weixin.api.url.access.expires.in", String.valueOf(getExpiresIn()));

			logger.info(getAccessToken());
			logger.info(getExpiresIn());

			return true;
		} else if (invoke.containsKey("errcode")) {
			logger.info(invoke.getString("errmsg"));
			simpleMailSender.sendFormatText("微信[access token]获取错误!", "{?1} - {?2}", invoke.getLongValue("errcode"),
					invoke.getString("errmsg"));
		}

		return false;
	}

	/**
	 * 删除自定义菜单
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月22日 下午8:27:40
	 * @modification 2014年3月22日 下午8:27:40
	 * @return
	 */
	public boolean deleteMenu() {
		JSONObject invoke = invoke(
				StringUtil.replaceByKV(propUtil.getMenuDeleteUrl(), "accessToken", getAccessToken()), StringUtil.EMPTY);

		if (invoke.containsKey("errcode")) {
			logger.info(invoke.getString("errcode"));
			logger.info(invoke.getString("errmsg"));
			if (invoke.getLongValue("errcode") == 0) {
				return true;
			} else if (invoke.getLongValue("errcode") == 42001) {
				logger.debug("[access token]过期,重新获取!");
				if (initAccessToken()) {
					logger.debug("[access token]过期,重新获取成功!");
					return deleteMenu();
				} else {
					logger.debug("[access token]过期,重新获取失败!");
				}
			}
		}

		return false;
	}

	/**
	 * 创建菜单.
	 * 
	 * @return
	 */
	public boolean createMenu() {

		// 先删除以前创建的菜单.
		if (deleteMenu()) {

			WeiXinMenu weiXinMenu = new WeiXinMenu();
			List<WeiXinButton> button = new ArrayList<>();

			WeiXinButton weiXinButton = new WeiXinButton("食客服务");
			List<WeiXinButton> sub_button = new ArrayList<>();
			sub_button.add(new WeiXinClickButton("我的菜单", "customer_evt_key_1"));
			sub_button.add(new WeiXinClickButton("我的收藏", "customer_evt_key_2"));
			sub_button.add(new WeiXinClickButton("呼叫服务", "customer_evt_key_3"));
			sub_button.add(new WeiXinClickButton("我要结账", "customer_evt_key_4"));
			sub_button.add(new WeiXinClickButton("其它服务", "customer_evt_key_5"));

			weiXinButton.setSub_button(sub_button);
			button.add(weiXinButton);

			weiXinButton = new WeiXinButton("平台服务");
			sub_button = new ArrayList<>();
			sub_button.add(new WeiXinClickButton("关于平台", "platform_evt_key_1"));
			sub_button.add(new WeiXinClickButton("平台管理", "platform_evt_key_2"));
			sub_button.add(new WeiXinClickButton("加盟合作", "platform_evt_key_3"));
			sub_button.add(new WeiXinClickButton("建议留言", "platform_evt_key_4"));

			weiXinButton.setSub_button(sub_button);
			button.add(weiXinButton);

			weiXinButton = new WeiXinButton("商家服务");
			sub_button = new ArrayList<>();
			sub_button.add(new WeiXinClickButton("申请入驻", "business_evt_key_1"));
			sub_button.add(new WeiXinClickButton("店员入口", "business_evt_key_3"));
			sub_button.add(new WeiXinClickButton("其它服务", "business_evt_key_2"));

			weiXinButton.setSub_button(sub_button);
			button.add(weiXinButton);

			weiXinMenu.setButton(button);

			JSONObject invoke = invoke(
					StringUtil.replaceByKV(propUtil.getMenuCreateUrl(), "accessToken", getAccessToken()),
					JsonUtil.toJson(weiXinMenu));

			if (invoke.containsKey("errcode")) {
				logger.info(invoke.getString("errcode"));
				logger.info(invoke.getString("errmsg"));
				if (invoke.getLongValue("errcode") == 0) {
					return true;
				} else if (invoke.getLongValue("errcode") == 42001) {
					logger.debug("[access token]过期,重新获取!");
					if (initAccessToken()) {
						logger.debug("[access token]过期,重新获取成功!");
						return createMenu();
					} else {
						logger.debug("[access token]过期,重新获取失败!");
					}
				}
			}
		}
		return false;
	}

	/**
	 * send custom msg.
	 * 
	 * @param openId
	 * @param msg
	 * @return
	 */
	public boolean sendServiceMsg(String openId, String msg) {

		logger.debug("向关注用户发送客服消息.");

		WeiXinCustomMsg weiXinCustomMsg = new WeiXinCustomMsg();
		weiXinCustomMsg.setMsgtype("text");
		weiXinCustomMsg.setTouser(openId);
		weiXinCustomMsg.setText(new WeiXinCustomText(msg));

		JSONObject invoke = invoke(
				StringUtil.replaceByKV(propUtil.getCustomSendUrl(), "accessToken", getAccessToken()),
				JsonUtil.toJson(weiXinCustomMsg));

		if (invoke.containsKey("errcode")) {
			logger.info(invoke.getString("errcode"));
			logger.info(invoke.getString("errmsg"));
			if (invoke.getLongValue("errcode") == 0) {
				logger.debug("发送客服消息成功!");
				return true;
			} else if (invoke.getLongValue("errcode") == 42001) {
				logger.debug("[access token]过期,重新获取!");
				if (initAccessToken()) {
					logger.debug("[access token]过期,重新获取成功!");
					return sendServiceMsg(openId, msg);
				} else {
					logger.debug("[access token]过期,重新获取失败!");
				}
			} else {
				logger.error("发送客服消息失败! errcode:" + invoke.getString("errcode") + " errmsg:"
						+ invoke.getString("errmsg"));
			}
		} else {
			logger.debug("发送客服消息失败!");
		}

		return false;
	}

	/**
	 * 获取微信用户基本信息
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月22日 下午4:53:40
	 * @modification 2014年3月22日 下午4:53:40
	 * @param fromUserName
	 * @return
	 */
	public WeiXinUserInfo getUserInfo(String openId) {

		logger.debug("获取微信用户基本信息");

		JSONObject invoke = invoke(
				StringUtil.replaceByKV(propUtil.getUserInfoGetUrl(), "accessToken", getAccessToken(), "openid", openId),
				StringUtil.EMPTY);

		if (invoke.containsKey("errcode")) {
			logger.info(invoke.getString("errcode"));
			logger.info(invoke.getString("errmsg"));
			if (invoke.getLongValue("errcode") == 42001) {
				logger.debug("[access token]过期,重新获取!");
				if (initAccessToken()) {
					logger.debug("[access token]过期,重新获取成功!");
					return getUserInfo(openId);
				} else {
					logger.debug("[access token]过期,重新获取失败!");
				}
			}
		} else {
			return JsonUtil.json2Object(invoke.toJSONString(), WeiXinUserInfo.class);
		}
		logger.error("获取微信用户基本信息失败!");
		return null;
	}

	/**
	 * 获取网页授权验证code的URL
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月22日 下午10:00:58
	 * @modification 2014年3月22日 下午10:00:58
	 * @return
	 */
	public String getWebpageCodeUrl(String requestMapping, String state) {
		logger.debug("网页授权验证code获取的URL");

		if (!requestMapping.startsWith("/")) {
			requestMapping = "/" + requestMapping;
		}

		try {
			String url = StringUtil.replaceByKV(propUtil.getWebpageCodeGetUrl(), "appid", propUtil.getAppid(), "state",
					state, "redirect_uri", URLEncoder.encode(propUtil.getRedirectUrl() + requestMapping, "UTF-8"));
			logger.debug(url);
			return url;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
		}

		return StringUtil.EMPTY;
	}

	/**
	 * 正确获取事返回[JSONObject] {"ticket":
	 * "gQG28DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL0FuWC1DNmZuVEhvMVp4NDNMRnNRAAIEesLvUQMECAcAAA=="
	 * ,"expire_seconds":1800}
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月23日 下午9:42:44
	 * @modification 2014年3月23日 下午9:42:44
	 * @return
	 */
	public JSONObject getTicket(WeiXinQrcodeCreateParam param) {

		logger.debug("创建二维码ticket");

		JSONObject invoke = invoke(
				StringUtil.replaceByKV(propUtil.getQrcodeCreateUrl(), "accessToken", getAccessToken()), param);

		if (invoke.containsKey("errcode")) {
			logger.info(invoke.getString("errcode"));
			logger.info(invoke.getString("errmsg"));
			if (invoke.getLongValue("errcode") == 42001) {
				logger.debug("[access token]过期,重新获取!");
				if (initAccessToken()) {
					logger.debug("[access token]过期,重新获取成功!");
					return getTicket(param);
				} else {
					logger.debug("[access token]过期,重新获取失败!");
				}
			}
		} else {
			return invoke;
		}
		logger.debug("创建二维码ticket失败!");
		return null;
	}

	/**
	 * 获取二维码图片获取的URL
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月23日 下午10:16:44
	 * @modification 2014年3月23日 下午10:16:44
	 * @param param
	 * @return
	 */
	public String getQrcodeUrl(WeiXinQrcodeCreateParam param) {
		JSONObject ticket = getTicket(param);

		if (ticket != null && ticket.containsKey("ticket")) {
			try {
				return StringUtil.replaceByKV(propUtil.getShowqrcodeUrl(), "ticket",
						URLEncoder.encode(ticket.getString("ticket"), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}

		return null;
	}

	/**
	 * 下载二维码图片
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月23日 下午10:20:19
	 * @modification 2014年3月23日 下午10:20:19
	 * @param url
	 * @param filePath
	 * @return
	 */
	public boolean downQrcodeImage(String url, final String fileName) {

		logger.debug("下载二维码图片");

		logger.debug(url);
		logger.debug(fileName);

		try {
			File parentFile = new File(fileName).getParentFile();
			if (!parentFile.exists()) {
				parentFile.mkdirs();
			}

		} catch (Exception e1) {
			e1.printStackTrace();
			logger.error(e1.getMessage(), e1);
			return false;
		}

		try {

			CloseableHttpClient httpclient = HttpClients.createDefault();

			return httpclient.execute(new HttpGet(url), new ResponseHandler<Boolean>() {

				@Override
				public Boolean handleResponse(HttpResponse response) throws ClientProtocolException, IOException {
					final StatusLine statusLine = response.getStatusLine();
					final HttpEntity entity = response.getEntity();

					if (statusLine.getStatusCode() >= 300) {
						EntityUtils.consume(entity);
						logger.error("下载二维码异常! 异常信息: " + statusLine.getStatusCode() + statusLine.getReasonPhrase());
						throw new HttpResponseException(statusLine.getStatusCode(), statusLine.getReasonPhrase());
					}

					entity.writeTo(new FileOutputStream(fileName));

					return true;
				}

			});
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
		}

		return false;
	}

	/**
	 * 下载二维码图片
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月23日 下午10:31:21
	 * @modification 2014年3月23日 下午10:31:21
	 * @param param
	 * @param path
	 * @param realPath
	 *            TODO
	 * @return
	 */
	public WeiXinQrcode downQrcodeImage(WeiXinQrcodeCreateParam param, String path, String realPath) {

		try {
			String qrcodeUrl = null;

			JSONObject ticketJsonObject = getTicket(param);

			String ticket = null;

			if (ticketJsonObject != null && ticketJsonObject.containsKey("ticket")) {
				try {
					ticket = ticketJsonObject.getString("ticket");
					qrcodeUrl = StringUtil.replaceByKV(propUtil.getShowqrcodeUrl(), "ticket",
							URLEncoder.encode(ticket, "UTF-8"));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}

			if (StringUtil.isNotEmpty(ticket)) {

				logger.debug(path);

				// 文件的本地存储路径 ex:c:/aaa/aa.jpg
				String filePath = realPath + path;

				if (downQrcodeImage(qrcodeUrl, filePath)) {
					return new WeiXinQrcode(qrcodeUrl, ticket, filePath, path);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
		}

		return null;
	}

	/**
	 * 返回access token.
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月25日 下午2:08:59
	 * @modification 2014年3月25日 下午2:08:59
	 * @param code
	 * @return
	 */
	public WeiXinAccessToken getAccessToken(String code) {

		logger.debug("[微信API调用]通过code换取网页授权access_token");

		JSONObject invoke = invoke(StringUtil.replaceByKV(propUtil.getAccessTokenGetUrl(), "appid",
				propUtil.getAppid(), "secret", propUtil.getSecret(), "code", code), StringUtil.EMPTY);

		if (invoke.containsKey("errcode")) {
			logger.error(invoke.getString("errcode"));
			logger.error(invoke.getString("errmsg"));
			return new WeiXinAccessToken();
		} else {
			return JsonUtil.jsonObj2Object(invoke, WeiXinAccessToken.class);
		}
	}

	/**
	 * 刷新access token.
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月25日 下午2:30:15
	 * @modification 2014年3月25日 下午2:30:15
	 * @param refreshToken
	 * @return
	 */
	public WeiXinAccessToken refreshAccessToken(String refreshToken) {

		logger.debug("[微信API调用]刷新网页授权access_token");

		JSONObject invoke = invoke(StringUtil.replaceByKV(propUtil.getAccessTokenRefreshUrl(), "appid",
				propUtil.getAppid(), "refresh_token", refreshToken), StringUtil.EMPTY);

		if (invoke.containsKey("errcode")) {
			logger.error(invoke.getString("errcode"));
			logger.error(invoke.getString("errmsg"));
			return new WeiXinAccessToken();
		} else {
			return JsonUtil.jsonObj2Object(invoke, WeiXinAccessToken.class);
		}
	}

	/**
	 * 获取用户信息
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月25日 下午2:41:16
	 * @modification 2014年3月25日 下午2:41:16
	 * @param accessToken
	 * @param openId
	 * @return
	 */
	/*
	 * private WeiXinUserInfo getUserInfo(String accessToken, String openId) {
	 * logger.debug("[微信API调用]获取用户信息");
	 * 
	 * JSONObject invoke = invoke(
	 * StringUtil.replaceByKV(propUtil.getWebUserInfoGetUrl(), "access_token",
	 * accessToken, "openid", openId), StringUtil.EMPTY);
	 * 
	 * if (invoke.containsKey("errcode")) {
	 * logger.info(invoke.getString("errcode"));
	 * logger.info(invoke.getString("errmsg")); if
	 * (invoke.getLongValue("errcode") == 42001) {
	 * logger.debug("[access token]过期,重新获取!"); if (initAccessToken()) {
	 * logger.debug("[access token]过期,重新获取成功!"); return getUserInfo(accessToken,
	 * openId); } else { logger.debug("[access token]过期,重新获取失败!"); } } } else {
	 * return JsonUtil.jsonObj2Object(invoke, WeiXinUserInfo.class); }
	 * 
	 * return new WeiXinUserInfo(); }
	 */

	/**
	 * 发送语音客服消息.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月29日 下午6:36:14
	 * @modification 2014年4月29日 下午6:36:14
	 * @param openId
	 * @param mediaId
	 * @return
	 */
	public boolean sendServiceVoice(String openId, String mediaId) {

		logger.debug("向关注用户发送客服消息.");

		WeiXinCustomMsg weiXinCustomMsg = new WeiXinCustomMsg();
		weiXinCustomMsg.setMsgtype("voice");
		weiXinCustomMsg.setTouser(openId);
		weiXinCustomMsg.setVoice(new WeiXinCustomVoice(mediaId));

		JSONObject invoke = invoke(
				StringUtil.replaceByKV(propUtil.getCustomSendUrl(), "accessToken", getAccessToken()),
				JsonUtil.toJson(weiXinCustomMsg));

		if (invoke.containsKey("errcode")) {
			logger.info(invoke.getString("errcode"));
			logger.info(invoke.getString("errmsg"));
			if (invoke.getLongValue("errcode") == 0) {
				logger.debug("发送语音客服消息成功!");
				return true;
			} else if (invoke.getLongValue("errcode") == 42001) {
				logger.debug("[access token]过期,重新获取!");
				if (initAccessToken()) {
					logger.debug("[access token]过期,重新获取成功!");
					return sendServiceVoice(openId, mediaId);
				} else {
					logger.debug("[access token]过期,重新获取失败!");
				}
			} else {
				logger.error("发送语音客服消息失败! errcode:" + invoke.getString("errcode") + " errmsg:"
						+ invoke.getString("errmsg"));
			}
		} else {
			logger.debug("发送语音客服消息失败!");
		}

		return false;
	}
}

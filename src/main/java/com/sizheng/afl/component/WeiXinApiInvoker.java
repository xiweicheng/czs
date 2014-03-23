package com.sizheng.afl.component;

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
import com.sizheng.afl.pojo.constant.SysConstant;
import com.sizheng.afl.pojo.model.WeiXinButton;
import com.sizheng.afl.pojo.model.WeiXinClickButton;
import com.sizheng.afl.pojo.model.WeiXinCustomMsg;
import com.sizheng.afl.pojo.model.WeiXinCustomText;
import com.sizheng.afl.pojo.model.WeiXinMenu;
import com.sizheng.afl.pojo.model.WeiXinUserInfo;
import com.sizheng.afl.pojo.model.WeiXinViewButton;
import com.sizheng.afl.util.JsonUtil;
import com.sizheng.afl.util.StringUtil;
import com.sizheng.afl.util.WebUtil;

/**
 * 微信api调用接口.
 * 
 * @creation 2014年3月21日 上午10:06:16
 * @modification 2014年3月21日 上午10:06:16
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Component
public class WeiXinApiInvoker {

	@Autowired
	SimpleMailSender simpleMailSender;

	/** accessToken [String] access token */
	private String accessToken = "m4I69V04Y-ziehmwYr1_dgbTs_hxkavjfZePuGKX6hogVwyVkqnqY8C4360A5CFP-QSWYnoIi1VBRKwNtUXstpH6P6UysHwHfNaix4Bd-nAtCVR5GgrN3iCrpuLT9Bk8K5n8fkaiCHgHRvKVV8x6fA";
	/** expiresIn [long] access token 过期时间(默认两个小时) */
	private long expiresIn = 7200L;

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

	@Value("#{systemProperties['weixin.api.url.token.get']}")
	private String tokenGetUrl;

	@Value("#{systemProperties['weixin.api.url.menu.create']}")
	private String menuCreateUrl;

	@Value("#{systemProperties['weixin.api.url.custom.send']}")
	private String customSendUrl;

	@Value("#{systemProperties['weixin.api.client.credential.appid']}")
	private String appid;

	@Value("#{systemProperties['weixin.api.client.credential.secret']}")
	private String secret;

	@Value("#{systemProperties['weixin.api.url.user.info.get']}")
	private String userInfoGetUrl;

	@Value("#{systemProperties['weixin.api.url.menu.delete']}")
	private String menuDeleteUrl;

	@Value("#{systemProperties['weixin.api.url.connect.oauth2.authorize']}")
	private String webpageCodeGetUrl;

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

		String url = StringUtil.replaceByKV(tokenGetUrl, "appid", appid, "secret", secret);

		JSONObject invoke = invoke(url, StringUtil.EMPTY);

		if (invoke.containsKey("access_token")) {
			setAccessToken(invoke.getString("access_token"));
			setExpiresIn(invoke.getLongValue("expires_in"));
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
		JSONObject invoke = invoke(StringUtil.replaceByKV(menuDeleteUrl, "accessToken", getAccessToken()),
				StringUtil.EMPTY);

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

		WeiXinMenu weiXinMenu = new WeiXinMenu();
		List<WeiXinButton> button = new ArrayList<>();
		button.add(new WeiXinClickButton("我要请假", "evt_key_01"));
		button.add(new WeiXinClickButton("允许请假", "evt_key_02"));

		WeiXinButton weiXinButton = new WeiXinButton("使用帮助");
		List<WeiXinButton> sub_button = new ArrayList<>();
		sub_button.add(new WeiXinViewButton("打开网页", "http://202.120.2.86/afl/weiXin/view01.do"));

		weiXinButton.setSub_button(sub_button);
		button.add(weiXinButton);

		weiXinMenu.setButton(button);

		JSONObject invoke = invoke(StringUtil.replaceByKV(menuCreateUrl, "accessToken", getAccessToken()),
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

		JSONObject invoke = invoke(StringUtil.replaceByKV(customSendUrl, "accessToken", getAccessToken()),
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
			}
		}
		logger.debug("发送客服消息失败!");
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
				StringUtil.replaceByKV(userInfoGetUrl, "accessToken", getAccessToken(), "openid", openId),
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
		logger.debug("发送客服消息失败!");
		return null;
	}

	/**
	 * 获取网页授权验证code
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月22日 下午9:37:52
	 * @modification 2014年3月22日 下午9:37:52
	 * @return
	 */
	public String getWebpageCode() {
		logger.debug("获取网页授权验证code");

		return invokeSimple(StringUtil.replaceByKV(webpageCodeGetUrl, "appid", appid, "redirect_uri",
				"http://202.120.2.86/afl/weiXin/view01"), StringUtil.EMPTY);
	}

	/**
	 * 获取网页授权验证code的URL
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月22日 下午10:00:58
	 * @modification 2014年3月22日 下午10:00:58
	 * @return
	 */
	public String getWebpageCodeUrl() {
		logger.debug("网页授权验证code获取的URL");

		try {
			return StringUtil.replaceByKV(webpageCodeGetUrl, "appid", appid, "redirect_uri",
					URLEncoder.encode("http://202.120.2.86/afl/weiXin/view02.do", "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
		}

		return StringUtil.EMPTY;
	}
}

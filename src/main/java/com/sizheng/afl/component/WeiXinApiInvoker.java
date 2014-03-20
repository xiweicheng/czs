package com.sizheng.afl.component;

import java.util.ArrayList;
import java.util.List;

import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.log4j.Logger;
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
import com.sizheng.afl.pojo.model.WeiXinViewButton;
import com.sizheng.afl.util.JsonUtil;
import com.sizheng.afl.util.StringUtil;
import com.sizheng.afl.util.WebUtil;

@Component
public class WeiXinApiInvoker {

	private String accessToken = "hfsYf66j79d3F3u0vTQ8BQ_AefHIZ_VlU7GKiWdwXiXiD3HGyvZ-0t-DzSw3QpaG_Nejgl5Y9M8SpKD_b-EdY2rirO0_I6w8F-wB0pt3k-O-RIzWrm1DioUJIbiY1hgZy_ZuhhDAsgizdoZbuXkJCg";
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

	/**
	 * access token init.
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月20日 下午6:26:33
	 * @modification 2014年3月20日 下午6:26:33
	 */
	public boolean accessTokenInit() {
		JSONObject invoke = invoke(tokenGetUrl, StringUtil.EMPTY);

		if (invoke.containsKey("access_token")) {
			setAccessToken(invoke.getString("access_token"));
			setExpiresIn(invoke.getLongValue("expires_in"));
			logger.info(getAccessToken());
			logger.info(getExpiresIn());
			return true;
		} else if (invoke.containsKey("errcode")) {
			logger.info(invoke.getString("errmsg"));
		}

		return false;
	}

	/**
	 * 创建菜单.
	 * 
	 * @return
	 */
	public boolean menuCreate() {

		WeiXinMenu weiXinMenu = new WeiXinMenu();
		List<WeiXinButton> button = new ArrayList<>();
		button.add(new WeiXinClickButton("我要请假", "c_001"));
		button.add(new WeiXinClickButton("允许请假", "c_002"));
		
		WeiXinButton weiXinButton = new WeiXinButton("使用帮助");
		List<WeiXinButton> sub_button = new ArrayList<>();
		sub_button.add(new WeiXinViewButton("百度一下", "http://www.baidu.com/"));
		
		weiXinButton.setSub_button(sub_button);
		button.add(weiXinButton);

		weiXinMenu.setButton(button);

		String url = StringUtil.replaceByKV(menuCreateUrl, "accessToken",
				getAccessToken());

		JSONObject invoke = invoke(url, JsonUtil.toJson(weiXinMenu));

		if (invoke.containsKey("errcode")) {
			logger.info(invoke.getString("errcode"));
			logger.info(invoke.getString("errmsg"));
			if (invoke.getLongValue("errcode") == 0) {
				return true;
			}
		}
		return false;
	}

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
			logger.debug("[invokeAPI jsonParams] " + SysConstant.NEW_LINE
					+ JsonUtil.toPrettyJson(jsonParams));
		}

		CloseableHttpClient httpclient = HttpClients.createDefault();

		url = WebUtil.JoinUrls(url, path);
		logger.debug(url);

		HttpPost httpPost = new HttpPost(url);
		httpPost.setEntity(new StringEntity(jsonParams,
				ContentType.APPLICATION_JSON));

		String response = null;

		try {
			response = httpclient.execute(httpPost, new BasicResponseHandler());
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (logger.isDebugEnabled()) {
			logger.debug("[invokeAPI jsonResult] " + SysConstant.NEW_LINE
					+ response);
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

		if (logger.isDebugEnabled()) {
			logger.debug("[invokeAPI jsonParams] " + SysConstant.NEW_LINE
					+ JsonUtil.toPrettyJson(jsonParams));
		}

		CloseableHttpClient httpclient = HttpClients.createDefault();

		url = WebUtil.JoinUrls(url, path);
		logger.debug(url);

		HttpPost httpPost = new HttpPost(url);
		httpPost.setEntity(new StringEntity(jsonParams,
				ContentType.APPLICATION_JSON));

		JSONObject rs = null;
		String response = null;

		try {
			response = httpclient.execute(httpPost, new BasicResponseHandler());
			rs = JSON.parseObject(response);
		} catch (Exception e) {
			e.printStackTrace();
			rs = new JSONObject();
		}

		if (logger.isDebugEnabled()) {
			logger.debug("[invokeAPI jsonResult] " + SysConstant.NEW_LINE
					+ JsonUtil.toPrettyJson(response));
		}

		return rs;
	}

	/**
	 * send custom msg.
	 * 
	 * @param openId
	 * @param msg
	 * @return
	 */
	public boolean sendServiceMsg(String openId, String msg) {
		
		WeiXinCustomMsg weiXinCustomMsg = new WeiXinCustomMsg();
		weiXinCustomMsg.setMsgtype("text");
		weiXinCustomMsg.setTouser(openId);
		weiXinCustomMsg.setText(new WeiXinCustomText(msg));

		String url = StringUtil.replaceByKV(customSendUrl, "accessToken",
				getAccessToken());

		JSONObject invoke = invoke(url, JsonUtil.toJson(weiXinCustomMsg));

		if (invoke.containsKey("errcode")) {
			logger.info(invoke.getString("errcode"));
			logger.info(invoke.getString("errmsg"));
			if (invoke.getLongValue("errcode") == 0) {
				return true;
			}
		}
		return false;
	}
}

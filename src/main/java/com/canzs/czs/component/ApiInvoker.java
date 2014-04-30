/**
 * ApiInvoker.java
 */
package com.canzs.czs.component;

import java.io.IOException;

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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.canzs.czs.pojo.constant.SysConstant;
import com.canzs.czs.pojo.vo.ApiResult;
import com.canzs.czs.util.JsonUtil;
import com.canzs.czs.util.WebUtil;

/**
 * zabbix API调用层.
 * 
 * @creation 2013年12月27日 下午5:32:16
 * @modification 2013年12月27日 下午5:32:16
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Component
public class ApiInvoker {

	private static Logger logger = Logger.getLogger(ApiInvoker.class);

	@Value("#{systemProperties['zabbix.api.url']}")
	private String zabbixApiUrl;

	public String getZabbixApiUrl() {
		return zabbixApiUrl;
	}

	public void setZabbixApiUrl(String zabbixApiUrl) {
		this.zabbixApiUrl = zabbixApiUrl;
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
	public ApiResult invoke(Object param, String... path) {
		return invoke(JsonUtil.toJson(param), path);
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
	public String invokeSimple(Object param, String... path) {
		return invokeSimple(JsonUtil.toJson(param), path);
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
	public String invokeSimple(String jsonParams, String... path) {

		if (logger.isDebugEnabled()) {
			logger.debug("[invokeAPI jsonParams] " + SysConstant.NEW_LINE + JsonUtil.toPrettyJson(jsonParams));
		}

		CloseableHttpClient httpclient = HttpClients.createDefault();

		String url = WebUtil.JoinUrls(zabbixApiUrl, path);
		logger.debug(url);

		HttpPost httpPost = new HttpPost(url);
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
	public ApiResult invoke(String jsonParams, String... path) {

		String response = invokeSimple(jsonParams, path);

		JSONObject rs = null;

		try {
			rs = JSON.parseObject(response);
		} catch (Exception e) {
			e.printStackTrace();
			rs = new JSONObject();
		}

		ApiResult apiResult = new ApiResult(rs);

		return apiResult;
	}
}

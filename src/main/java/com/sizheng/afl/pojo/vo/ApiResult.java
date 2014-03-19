/**
 * ApiResult.java
 */
package com.sizheng.afl.pojo.vo;

import java.io.Serializable;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.sizheng.afl.util.StringUtil;

/**
 * 对调用zabbix api返回结果的封装.
 * 
 * @creation 2013-10-15 上午11:44:31
 * @modification 2013-10-15 上午11:44:31
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public class ApiResult implements Serializable {

	/** serialVersionUID [long] */
	private static final long serialVersionUID = 8896678889526483526L;

	public static final String RESULT = "result";

	public static final String ERROR = "error";

	public static final String MESSAGE = "message";

	public static final String DATA = "data";

	public static final String EMPTY = "";

	private String message;

	private JSONObject jsonObject;

	private boolean succeed;

	private Object extraData;

	public ApiResult() {
	}

	public ApiResult(JSONObject jsonObject) {
		this.jsonObject = jsonObject;
		this.succeed = this.jsonObject.containsKey(RESULT);

		if (!succeed) {
			setMessage(getErrorData());
		}
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getExtraData() {
		return extraData;
	}

	public void setExtraData(Object extraData) {
		this.extraData = extraData;
	}

	public JSONObject getJsonObject() {
		return jsonObject;
	}

	public boolean succeed() {
		return succeed;
	}

	public boolean failed() {
		return !succeed;
	}

	public void setSucceed(boolean succeed) {
		this.succeed = succeed;
	}

	public JSONObject getJSONObjectResult() {
		return jsonObject.getJSONObject(RESULT);
	}

	public JSONArray getJSONArrayResult() {
		return jsonObject.getJSONArray(RESULT);
	}

	public boolean getBooleanResult() {
		return jsonObject.getBooleanValue(RESULT);
	}

	public String getStringResult() {
		return jsonObject.getString(RESULT);
	}

	public int getIntResult() {
		return jsonObject.getIntValue(RESULT);
	}

	public double getDoubleResult() {
		return jsonObject.getDoubleValue(RESULT);
	}

	public long getLongResult() {
		return jsonObject.getLongValue(RESULT);
	}

	public JSONObject getError() {
		JSONObject error = jsonObject.getJSONObject(ERROR);
		return error == null ? new JSONObject() : error;
	}

	public String getErrorMsg() {
		return succeed ? EMPTY : StringUtil.toString(getError().get(MESSAGE));
	}

	public String getErrorData() {
		return succeed ? EMPTY : StringUtil.toString(getError().get(DATA));
	}

	public String getIdResult(String idName) {

		String[] idArrResult = getIdArrResult(idName);

		if (idArrResult != null && idArrResult.length > 0) {
			return idArrResult[0];
		}

		return null;
	}

	public String[] getIdArrResult(String idName) {

		if (succeed() && getJSONObjectResult() != null && getJSONObjectResult().getJSONArray(idName) != null) {

			JSONArray jsonArr = getJSONObjectResult().getJSONArray(idName);

			String[] arr = new String[jsonArr.size()];

			for (int i = 0; i < jsonArr.size(); i++) {
				arr[i] = jsonArr.getString(i);
			}

			return arr;
		}

		return null;
	}

	@Override
	public String toString() {

		return "ApiResult [succeed=" + succeed + ", jsonObject=" + jsonObject + ", extraData=" + extraData + "]";
	}

}

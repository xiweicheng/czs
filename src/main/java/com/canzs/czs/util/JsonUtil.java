/**
 * JsonUtil.java
 */
package com.canzs.czs.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

/**
 * Json操作工具类.
 * 
 * @creation 2013-9-17 下午5:14:33
 * @modification 2013-9-17 下午5:14:33
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public final class JsonUtil {

	private static Logger logger = Logger.getLogger(JsonUtil.class);

	private static final Gson gson1 = new GsonBuilder().disableHtmlEscaping().setDateFormat("yyyy/MM/dd HH:mm:ss")
			.create();

	private static final Gson gson2 = new GsonBuilder().disableHtmlEscaping().setDateFormat("yyyy/MM/dd HH:mm:ss")
			.setPrettyPrinting().create();

	private static JsonParser jsonParser = new JsonParser();

	private JsonUtil() {
		super();
	}

	/**
	 * 实体对象转化为json字符串.
	 * 
	 * @param object
	 * @return
	 */
	public static String toJson(Object object) {

		try {
			return gson1.toJson(object);
		} catch (Exception e) {
			e.printStackTrace();
			logger.fatal(e.getMessage(), e);
		}
		return null;
	}

	/**
	 * 格式化json字符串.
	 * 
	 * @param json
	 * @return
	 */
	public static String toPrettyJson(String json) {

		try {
			JsonElement jsonElement = jsonParser.parse(json);

			return gson2.toJson(jsonElement);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * json字符串转换为对象.
	 * 
	 * @author xiweicheng
	 * @creation 2013年12月27日 下午1:15:00
	 * @modification 2013年12月27日 下午1:15:00
	 * @param json
	 * @param classOfT
	 * @return
	 */
	public static <T> T json2Object(String json, Class<T> classOfT) {

		try {
			logger.debug(json);
			return gson1.fromJson(json, classOfT);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * JSONArray转换为对象.
	 * 
	 * @author xiweicheng
	 * @creation 2013年12月27日 下午1:15:00
	 * @modification 2013年12月27日 下午1:15:00
	 * @param json
	 * @param classOfT
	 * @return
	 */
	public static <T> List<T> jsonArr2Object(JSONArray jsonArray, Class<T> classOfT) {

		List<T> list = new ArrayList<>();

		try {
			for (Object object : jsonArray) {
				JSONObject jsonObject = (JSONObject) object;
				T t = jsonObj2Object(jsonObject, classOfT);

				if (t != null) {
					list.add(t);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	/**
	 * JSONObject转换为对象.
	 * 
	 * @author xiweicheng
	 * @creation 2013年12月27日 下午1:15:00
	 * @modification 2013年12月27日 下午1:15:00
	 * @param json
	 * @param classOfT
	 * @return
	 */
	public static <T> T jsonObj2Object(JSONObject jsonObject, Class<T> classOfT) {

		try {
			return JSON.toJavaObject(jsonObject, classOfT);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

}

package com.canzs.czs.util;

import org.junit.Test;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.canzs.czs.pojo.model.WeiXinUserInfo;
import com.canzs.czs.util.JsonUtil;

public class JsonUtilTest {

	@Test
	public void test() {
		String json = "{\"city\":\"浦东新区\",\"country\":\"中国\"}";
		JSONObject parseObject = JSON.parseObject(json);

		WeiXinUserInfo jsonObj2Object = JsonUtil.jsonObj2Object(parseObject, WeiXinUserInfo.class);

		System.out.println(jsonObj2Object);
	}

}

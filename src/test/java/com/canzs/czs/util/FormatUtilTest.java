package com.canzs.czs.util;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;

import com.canzs.czs.pojo.model.WeiXinBaseMsg;
import com.canzs.czs.util.FormatUtil;
import com.canzs.czs.util.XmlUtil;

public class FormatUtilTest {

	@Test
	public void test() {

		String xml = "<xml><ToUserName><![CDATA[gh_b401b0f3d9a6]]></ToUserName><FromUserName><![CDATA[o_gy-uDW8XJuRMZRzTOLEWVDJBok]]></FromUserName><CreateTime>1395291909</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA[哈哈哈]]></Content><MsgId>5992733117728498379</MsgId></xml>";
		WeiXinBaseMsg bean = XmlUtil.toBean(xml, WeiXinBaseMsg.class);

		Map<String, Object> dataModelMap = new HashMap<String, Object>();
		dataModelMap.put("msg", bean);
		
		String tpl = "<xml><ToUserName><![CDATA[${msg.ToUserName}]]></ToUserName><FromUserName><![CDATA[${msg.FromUserName}]]></FromUserName><CreateTime>${msg.CreateTime}</CreateTime><MsgType><![CDATA[${msg.MsgType}]]></MsgType><Content><![CDATA[${msg.Content}]]></Content></xml>";
		
		String format = FormatUtil.format(tpl, dataModelMap);

		System.out.println(format);
	}

}

package com.canzs.czs.pojo.model;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.canzs.czs.pojo.model.WeiXinMsgType;

public class WeiXinMsgTypeTest {

	@Test
	public void test() {
		assertTrue(WeiXinMsgType.EVENT.equals("event"));
	}

	@Test
	public void test2() {
		assertTrue("event".equals(WeiXinMsgType.EVENT.toString()));
	}

	@Test
	public void test3() {
		WeiXinMsgType type = WeiXinMsgType.valueOf("event");
		assertTrue(type == WeiXinMsgType.EVENT);
	}

}

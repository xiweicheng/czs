package com.canzs.czs.service.impl;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.canzs.czs.base.BaseServiceTest;
import com.canzs.czs.pojo.model.WeiXinBaseMsg;
import com.canzs.czs.service.IWeiXinService;

public class WeiXinServiceImplTest extends BaseServiceTest {

	@Autowired
	IWeiXinService weiXinService;

	@Test
	public void testSaveMessage() {
		WeiXinBaseMsg bean = new WeiXinBaseMsg();
		bean.setContent("测试内容");
		bean.setCreateTime("111111111");
		bean.setMsgId("1111111");

		assertNotNull(weiXinService.saveMessage(bean));
	}

}

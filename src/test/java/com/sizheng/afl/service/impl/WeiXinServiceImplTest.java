package com.sizheng.afl.service.impl;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.sizheng.afl.base.BaseServiceTest;
import com.sizheng.afl.pojo.model.WeiXinBaseMsg;
import com.sizheng.afl.service.IWeiXinService;

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

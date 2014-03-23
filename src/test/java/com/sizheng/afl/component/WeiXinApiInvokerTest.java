package com.sizheng.afl.component;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.sizheng.afl.base.BaseTest;
import com.sizheng.afl.pojo.model.WeiXinUserInfo;

public class WeiXinApiInvokerTest extends BaseTest {

	@Autowired
	WeiXinApiInvoker weiXinApiInvoker;

	@Test
	public void accessTokenInitTest() {
		assertTrue(weiXinApiInvoker.initAccessToken());
	}
	
	@Test
	public void menuCreateTest() {
		assertTrue(weiXinApiInvoker.createMenu());
	}
	
	@Test
	public void deleteMenuTest() {
		assertTrue(weiXinApiInvoker.deleteMenu());
	}

	@Test
	public void sendServiceMsgTest() {
		assertTrue(weiXinApiInvoker.sendServiceMsg("okPUDtzjrogWsWdsI_Fz39VNbgBc", "这是一条客服消息!"));
	}

	@Test
	public void getWebpageCode() {
		assertNotNull(weiXinApiInvoker.getWebpageCode());
	}

	@Test
	public void getUserInfo() {
		WeiXinUserInfo userInfo = weiXinApiInvoker.getUserInfo("okPUDtzjrogWsWdsI_Fz39VNbgBc");
		assertNotNull(userInfo);
	}

}

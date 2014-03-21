package com.sizheng.afl.component;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.sizheng.afl.base.BaseTest;

public class WeiXinApiInvokerTest extends BaseTest {

	@Autowired
	WeiXinApiInvoker weiXinApiInvoker;

	@Test
	public void accessTokenInitTest() {
		assertTrue(weiXinApiInvoker.accessTokenInit());
	}
	
	@Test
	public void menuCreateTest() {
		assertTrue(weiXinApiInvoker.menuCreate());
	}
	
	@Test
	public void sendServiceMsgTest() {
		assertTrue(weiXinApiInvoker.sendServiceMsg("okPUDtzjrogWsWdsI_Fz39VNbgBc", "这是一条客服消息!"));
	}

}

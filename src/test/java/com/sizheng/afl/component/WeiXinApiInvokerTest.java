package com.sizheng.afl.component;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.sizheng.afl.base.BaseTest;

public class WeiXinApiInvokerTest extends BaseTest {

	@Autowired
	WeiXinApiInvoker weiXinApiInvoker;

	@Test
	public void accessTokenInitTest() {
		boolean flag = weiXinApiInvoker.accessTokenInit();
		System.out.println(flag);
	}
	
	@Test
	public void menuCreateTest() {
		boolean flag = weiXinApiInvoker.menuCreate();
		System.out.println(flag);
	}
	
	@Test
	public void sendServiceMsgTest() {
		boolean flag = weiXinApiInvoker.sendServiceMsg("okPUDtzjrogWsWdsI_Fz39VNbgBc", "这是一条客服消息!");
		System.out.println(flag);
	}

}

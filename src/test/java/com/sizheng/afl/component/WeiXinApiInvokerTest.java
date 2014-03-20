package com.sizheng.afl.component;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.sizheng.afl.base.BaseTest;

public class WeiXinApiInvokerTest extends BaseTest {

	@Autowired
	WeiXinApiInvoker weiXinApiInvoker;

	@Test
	public void accessTokenInitTest() {
		boolean accessTokenInit = weiXinApiInvoker.accessTokenInit();
		System.out.println(accessTokenInit);
	}

}

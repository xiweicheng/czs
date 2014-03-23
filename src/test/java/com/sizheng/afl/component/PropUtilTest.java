package com.sizheng.afl.component;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.sizheng.afl.base.BaseTest;

public class PropUtilTest extends BaseTest {

	@Autowired
	PropUtil propUtil;

	@Test
	public void test() {
		assertTrue(propUtil.isLogReqbody());
	}

}

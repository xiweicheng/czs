package com.canzs.czs.component;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.canzs.czs.base.BaseTest;
import com.canzs.czs.component.PropUtil;

public class PropUtilTest extends BaseTest {

	@Autowired
	PropUtil propUtil;

	@Test
	public void test() {
		assertTrue(propUtil.isLogReqbody());
	}

}

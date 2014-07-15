package com.canzs.czs.service.impl;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.canzs.czs.base.BaseServiceTest;
import com.canzs.czs.service.ICzsUserService;

public class CzsUserServiceImplTest extends BaseServiceTest {

	@Autowired
	ICzsUserService czsUserService;

	@Test
	public void testIsCzsMgr01() {
		assertTrue(czsUserService.isCzsMgr(locale, "okPUDtzjrogWsWdsI_Fz39VNbgBc"));
	}

	@Test
	public void testIsCzsMgr02() {
		assertFalse(czsUserService.isCzsMgr(locale, "okPUDtzjrogWsWdsI_Fz39VNbgBc__"));
	}

}

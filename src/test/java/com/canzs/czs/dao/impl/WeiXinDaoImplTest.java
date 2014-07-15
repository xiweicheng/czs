package com.canzs.czs.dao.impl;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.canzs.czs.base.BaseDaoTest;
import com.canzs.czs.dao.IWeiXinDao;
import com.canzs.czs.pojo.model.WeiXinUserInfo;
import com.canzs.czs.util.DateUtil;

public class WeiXinDaoImplTest extends BaseDaoTest {

	@Autowired
	IWeiXinDao weiXinDao;

	@Test
	public void testSaveSubscriber() {
		assertTrue(weiXinDao.saveSubscriber("12345678", String.valueOf(DateUtil.now().getTime())));
	}

	@Test
	public void deleteSubscriberTest() {
		assertTrue(weiXinDao.deleteSubscriber("12345678", String.valueOf(DateUtil.now().getTime())));
	}

	@Test
	public void saveWeiXinUserInfoTest() {
		WeiXinUserInfo userInfo = new WeiXinUserInfo();
		userInfo.setCity("shanghai");
		assertTrue(weiXinDao.saveWeiXinUserInfo(userInfo));
	}

}

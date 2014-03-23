package com.sizheng.afl.dao.impl;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.sizheng.afl.base.BaseDaoTest;
import com.sizheng.afl.dao.IWeiXinDao;
import com.sizheng.afl.pojo.model.WeiXinUserInfo;
import com.sizheng.afl.util.DateUtil;

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

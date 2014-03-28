package com.sizheng.afl.util;

import java.lang.reflect.InvocationTargetException;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.BeanUtils;

import com.sizheng.afl.pojo.entity.Business;

public class BeanUtilTest {

	@Test
	public void test() {
		Business business = new Business();
		business.setAddress("xxxx");

		Business business2 = new Business();

		BeanUtils.copyProperties(business2, business, "address");

		Assert.assertEquals("xxxx", business.getAddress());
	}

	@Test
	public void test2() throws IllegalAccessException, InvocationTargetException {
		Business business = new Business();
		business.setAddress("xxxx");

		Business business2 = new Business();

		// BeanUtilsBean.getInstance().copyProperties(business, business2);
		org.apache.commons.beanutils.BeanUtils.copyProperties(business, business2);

		Assert.assertEquals("xxxx", business.getAddress());
	}

}

package com.canzs.czs.util;

import java.lang.reflect.InvocationTargetException;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.BeanUtils;

import com.canzs.czs.pojo.entity.Business;
import com.canzs.czs.pojo.entity.Menu;
import com.canzs.czs.util.BeanUtil;

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

	@Test
	public void test3() {
		Menu menu = new Menu();
		menu.setId(1111111L);
		menu.setName("name1");

		Menu menu2 = new Menu();
		menu.setId(2222L);
		menu.setName("name2");
		menu.setIntroduce("xxxxxxxx");

		BeanUtil.copyNotEmptyFields(menu, menu2);

		System.out.println();
	}

}

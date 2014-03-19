/**
 * SpringAppContextUtilTest.java
 */
package com.sizheng.afl.component;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.sizheng.afl.base.BaseTest;
import com.sizheng.afl.component.SpringAppContextUtil;
import com.sizheng.afl.pojo.constant.SysConstant;
import com.sizheng.afl.util.StringUtil;

/**
 * 
 * 
 * @creation 2013年12月27日 下午4:39:52
 * @modification 2013年12月27日 下午4:39:52
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public class SpringAppContextUtilTest extends BaseTest {

	private static Logger logger = Logger.getLogger(SpringAppContextUtilTest.class);

	@Autowired
	SpringAppContextUtil springAppContextUtil;

	@Test
	public void testPrintSpringMgrBeans() {

		String[] beanDefinitionNames = springAppContextUtil.getApplicationContext().getBeanDefinitionNames();

		assertNotNull(springAppContextUtil.getApplicationContext());

		List<String> list = new ArrayList<>();

		for (String beanDefinitionName : beanDefinitionNames) {

			list.add(springAppContextUtil.getBean(beanDefinitionName).getClass().getName() + " [" + beanDefinitionName
					+ "]");
		}
		list.add("总数: " + list.size());

		Collections.sort(list);

		logger.info(StringUtil.join(SysConstant.NEW_LINE, list));
	}

}

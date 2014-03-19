/**
 * BaseTest.java
 */
package com.sizheng.afl.base;

import java.util.Locale;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * 测试基类.
 * 
 * @creation 2013年12月24日 下午12:58:53
 * @modification 2013年12月24日 下午12:58:53
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@ContextConfiguration(locations = { "classpath*:servlet-context.xml", "classpath*:root-context.xml" })
@RunWith(SpringJUnit4ClassRunner.class)
public class BaseTest {

	protected Locale locale = Locale.CHINA;
}

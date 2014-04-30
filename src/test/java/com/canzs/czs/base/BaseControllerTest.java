/**
 * BaseControllerTest.java
 */
package com.canzs.czs.base;

import org.junit.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

/**
 * 控制层测试基类.
 * 
 * @creation 2013年12月26日 下午3:44:55
 * @modification 2013年12月26日 下午3:44:55
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@WebAppConfiguration
public class BaseControllerTest extends BaseTest {

	@Autowired
	protected WebApplicationContext context;

	@Autowired
	protected MockHttpSession session;

	@Autowired
	protected MockHttpServletRequest request;

	protected MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
}

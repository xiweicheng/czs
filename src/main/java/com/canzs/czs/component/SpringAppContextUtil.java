/** SpringContextUtil.java */
package com.canzs.czs.component;

import java.util.Locale;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

/**
 * @author XiWeiCheng
 * 
 */
@Component
public class SpringAppContextUtil implements ApplicationContextAware {

	public static ApplicationContext applicationContext;

	protected SpringAppContextUtil() {
	}

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		SpringAppContextUtil.applicationContext = applicationContext;
	}

	public ApplicationContext getApplicationContext() {
		return applicationContext;
	}

	/**
	 * 获取spring注册管理的bean.
	 * 
	 * @param name
	 * @return
	 * @throws BeansException
	 */
	@SuppressWarnings("unchecked")
	public <T> T getBean(String name) throws BeansException {
		return (T) applicationContext.getBean(name);
	}

	/**
	 * 获取国际化信息.
	 * 
	 * @param key
	 * @param params
	 * @param locale
	 * @return
	 */
	public String getMsg(String key, Object[] params, Locale locale) {

		return applicationContext.getMessage(key, params, locale);
	}

}

/**
 * MessageSource.java
 */
package com.sizheng.afl.component;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;

/**
 * 国际化配置消息获取.
 * 
 * @creation 2013年12月31日 下午3:08:27
 * @modification 2013年12月31日 下午3:08:27
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Component
public class MessageUtil {

	@Autowired
	MessageSource messageSource;

	public String getMsg(String code, Locale locale, Object... args) {
		return messageSource.getMessage(code, args, locale);
	}

	public String getMsg(String code, String defaultValue, Locale locale, Object... args) {
		return messageSource.getMessage(code, args, defaultValue, locale);
	}
}

package com.sizheng.afl.util;

import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.sizheng.afl.pojo.entity.Menu;

public class BeanUtil {

	private static final Logger logger = Logger.getLogger(BeanUtil.class);

	public static void copyNotEmptyFields(Menu menu, Menu menu3) {

		try {
			Map<String, String> describe = BeanUtils.describe(menu);

			for (String name : describe.keySet()) {
				try {
					if (describe.get(name) != null) {
						BeanUtils.setProperty(menu3, name, describe.get(name));
					}
				} catch (Exception e) {
					e.printStackTrace();
					logger.error(e.getMessage(), e);
					continue;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
		}
	}

}

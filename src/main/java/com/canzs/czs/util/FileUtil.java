package com.canzs.czs.util;

import org.apache.log4j.Logger;

public class FileUtil {

	private static final Logger logger = Logger.getLogger(FileUtil.class);
	private static final String EMPTY = "";

	/**
	 * 获取文件名.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月26日 下午6:43:41
	 * @modification 2014年4月26日 下午6:43:41
	 * @param filePath
	 * @return
	 */
	public static String getName(String filePath) {
		if (filePath == null || filePath.length() == 0) {
			return EMPTY;
		}

		int i = filePath.lastIndexOf("/");
		int j = filePath.lastIndexOf(".");

		if (i != -1) {
			if (j > i) {
				return filePath.substring(i + 1, j);
			} else if (i != filePath.length() - 1) {
				return filePath.substring(i + 1);
			}
		} else {
			if (j > 0) {
				return filePath.substring(0, j);
			} else if (j == 0) {
				return EMPTY;
			}
		}

		return filePath;
	}

}

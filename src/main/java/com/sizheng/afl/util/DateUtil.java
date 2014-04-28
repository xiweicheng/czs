/** WebUtil.java */
package com.sizheng.afl.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author XiWeiCheng
 * 
 */
public final class DateUtil {

	/** EMPTY [String] */
	public static final String EMPTY = "";
	public static final String FORMAT1 = "yyyy-MM-dd HH:mm:ss";
	public static final String FORMAT2 = "yyyy/MM/dd HH:mm:ss";
	public static final String FORMAT3 = "yyyy-MM-dd";
	public static final String FORMAT4 = "yyyy/MM/dd";
	public static final String FORMAT5 = "yyyyMMddHHmmss";
	public static final String FORMAT6 = "yyyyMMdd";

	private static SimpleDateFormat dateFormat = new SimpleDateFormat(FORMAT2);

	private DateUtil() {
		super();
	}

	/**
	 * 解析日期字符串.
	 * 
	 * @param date
	 * @param format
	 * @return
	 */
	public static Date parse(String date, String... formats) {

		if (date == null || date.length() == 0) {
			return null;
		}

		for (String format : formats) {

			try {
				return new SimpleDateFormat(format).parse(date);
			} catch (Exception e) {
				// e.printStackTrace();
				continue;
			}
		}

		return null;
	}

	/**
	 * 返回当前日期.
	 * 
	 * @return
	 */
	public static Date now() {
		return new Date();
	}

	/**
	 * 格式化日期.
	 * 
	 * @param date
	 * @param format
	 * @return
	 */
	public static String format(Date date, String format) {

		dateFormat.applyPattern(format);

		return dateFormat.format(date);
	}

	/**
	 * 获取日期时间秒值.
	 * 
	 * @author xiweicheng
	 * @creation 2014年2月28日 下午1:31:34
	 * @modification 2014年2月28日 下午1:31:34
	 * @param dateTime
	 * @return
	 */
	public static Long getTime(String dateTime) {

		if (StringUtil.isNotEmpty(dateTime)) {
			Date date = parse(dateTime, FORMAT1, FORMAT2, FORMAT3, FORMAT4);

			if (date != null) {
				return date.getTime() / 1000;
			}
		}

		return null;
	}

	/**
	 * 获取当天限制码.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月9日 上午11:46:44
	 * @modification 2014年4月9日 上午11:46:44
	 * @return
	 */
	public static String getTodayLimitCode() {
		return format(now(), FORMAT6);
	}

	// /**
	// * 将距今的秒数转为为 秒 分 时 天 月
	// *
	// * @author xiweicheng
	// * @creation 2014年4月15日 上午10:31:39
	// * @modification 2014年4月15日 上午10:31:39
	// * @param sec
	// * @return
	// */
	// public static String convert(long sec) {
	//
	// if (sec < 60) {
	// return sec + "秒";
	// } else if (sec / 60 < 60) {
	// return (sec / 60) + "分" + (sec % 60) + "秒";
	// } else if (sec / 3600 < 60) {
	// long limit = sec % 3600;
	// if (limit < 60) {
	// return (sec / 3600) + "时" + (limit) + "分";
	// } else {
	// return (sec / 3600) + "时" + (limit / 60) + "分" + (limit % 60) + "秒";
	// }
	// } else {
	// return sec + "秒";
	// }
	// }

	/**
	 * 将距今的秒数转为为 秒 分 时 天 月
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月15日 上午10:31:39
	 * @modification 2014年4月15日 上午10:31:39
	 * @param sec
	 * @return
	 */
	public static String convert(Long sec) {
		
		if (sec == null) {
			return EMPTY;
		}

		if (sec < 60) {
			return sec + "秒";
		} else if (sec / 60 < 60) {
			return (sec / 60) + "分" + convert(sec % 60);
		} else if (sec / 3600 < 60) {
			return (sec / 3600) + "时" + convert(sec % 3600);
		} else if (sec / (3600 * 24) < 30) {
			return sec / (3600 * 24) + "天" + convert(sec % (3600 * 24));
		} else {
			return ">" + sec / (3600 * 24) + "天";
		}
	}
}

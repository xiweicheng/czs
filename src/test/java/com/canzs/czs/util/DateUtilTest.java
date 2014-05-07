package com.canzs.czs.util;

import org.joda.time.DateTime;
import org.junit.Test;

public class DateUtilTest {

	@Test
	public void testToNiceTimeString() {
		System.out.println(DateUtil.toNiceTime(DateUtil.now()));
		System.out.println(DateUtil.toNiceTime("2014-05-07 09:03:11"));
		System.out.println(DateUtil.toNiceTime("2014-05-06 09:53:11"));
		System.out.println(DateUtil.toNiceTime("2014-05-05 09:53:11"));
		System.out.println(DateUtil.toNiceTime("2014-05-01 12:53:11"));
		System.out.println(DateUtil.toNiceTime("2014-04-07 12:53:11"));
		System.out.println(DateUtil.toNiceTime("2014-03-07 12:53:11"));
		System.out.println(DateUtil.toNiceTime("2013-05-07 12:53:11"));
		System.out.println(DateUtil.toNiceTime("2012-05-07 12:53:11"));
		System.out.println(DateUtil.toNiceTime("2011-05-07 12:53:11"));

		System.out.println(DateTime.now().getMillis());
		System.out.println(DateUtil.now().getTime());
	}

}

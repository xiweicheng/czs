package com.sizheng.afl.util;

import org.junit.Test;

public class EncoderUtilTest {

	@Test
	public void testEncode() {

		System.out.println("123456 MD5  :" + EncoderUtil.encode("MD5", "123456"));
		System.out.println("123456 SHA1 :" + EncoderUtil.encode("SHA1", "123456"));

		String data = "123456";
		String digest = new SHA1().getDigestOfString(data.getBytes());
		System.out.println("123456 SHA1 :" + digest);
	}

	@Test
	public void testEncodeByMD5() {
		System.out.println("123456 MD5  :" + EncoderUtil.encodeByMD5("123456"));
	}

}

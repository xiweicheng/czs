package com.canzs.czs.util;

import java.io.File;

import org.junit.Test;

import com.canzs.czs.util.ZipUtil;

public class ZipUtilTest {

	@Test
	public void test() throws Exception {
		// ZipUtil.unzip("f:/zip.zip", "f:/zips");
		// System.out.println("over....................");
		// ZipUtil.zip(new File("f:/zips"), new File("f:/zips.zip"));
		// System.out.println("over..............");

		String[] filePaths = new String[] { "f:/1.docx", "f:/1.jpg" };

		ZipUtil.zip(new File("f:/zips1.zip"), filePaths);
	}

}

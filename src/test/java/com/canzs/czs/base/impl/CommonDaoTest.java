/**
 * CommonDaoTest.java
 */
package com.canzs.czs.base.impl;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.canzs.czs.base.BaseTest;
import com.canzs.czs.base.impl.CommonDao;

/**
 * 
 * 
 * @creation 2013年12月27日 下午3:51:10
 * @modification 2013年12月27日 下午3:51:10
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
public class CommonDaoTest extends BaseTest {

	@Autowired
	CommonDao commonDao;

	@Test
	@Transactional
	public void testBatch() {

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("INSERT INTO `test`.`t_item` (\n");
		sqlSb.append("	`id`,\n");
		sqlSb.append("	`price`,\n");
		sqlSb.append("	`product`,\n");
		sqlSb.append("	`quantity`,\n");
		sqlSb.append("	`order_id`\n");
		sqlSb.append(")\n");
		sqlSb.append("VALUES\n");
		sqlSb.append("	(NULL,?,?,?,?);\n");

		List<List<Object>> params = new ArrayList<>();
		params.add(Arrays.asList((Object) "20", "刀具1", "100", "7"));
		params.add(Arrays.asList((Object) "20", "刀具2", "100", "7"));
		params.add(Arrays.asList((Object) "20", "刀具3", "100", "7"));

		int batch = commonDao.batch(sqlSb, params);

		assertEquals(3, batch);
	}

}

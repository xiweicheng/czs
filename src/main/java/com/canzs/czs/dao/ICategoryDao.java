/**
 * ICategoryDao.java
 */
package com.canzs.czs.dao;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.canzs.czs.pojo.entity.Category;

/**
 * 【分类】持久化接口层.
 * 
 * @creation 2014年03月26日 01:06:34
 * @modification 2014年03月26日 01:06:34
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface ICategoryDao {

	/**
	 * 查询【分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月26日 01:06:34
	 * @modification 2014年03月26日 01:06:34
	 * @param locale
	 * @param category
	 * @param start
	 * @param limit
	 * @return
	 */
	List<Map<String, Object>> query(Locale locale, Category category, Long start, Long limit);

	/**
	 * 查询总数查询【分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月26日 01:06:34
	 * @modification 2014年03月26日 01:06:34
	 * @param locale
	 * @param category
	 * @return
	 */
	long queryCount(Locale locale, Category category);
	
}

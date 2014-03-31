/**
 * IMenuCategoryDao.java
 */
package com.sizheng.afl.dao;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.sizheng.afl.pojo.entity.MenuCategory;

/**
 * 【菜单分类】持久化接口层.
 * 
 * @creation 2014年03月29日 05:09:48
 * @modification 2014年03月29日 05:09:48
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IMenuCategoryDao {

	/**
	 * 查询【菜单分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:09:48
	 * @modification 2014年03月29日 05:09:48
	 * @param locale
	 * @param menuCategory
	 * @param start
	 * @param limit
	 * @return
	 */
	List<Map<String, Object>> query(Locale locale, MenuCategory menuCategory, Long start, Long limit);

	/**
	 * 查询总数查询【菜单分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:09:48
	 * @modification 2014年03月29日 05:09:48
	 * @param locale
	 * @param menuCategory
	 * @return
	 */
	long queryCount(Locale locale, MenuCategory menuCategory);
	
}

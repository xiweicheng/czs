/**
 * IMenuTasteDao.java
 */
package com.canzs.czs.dao;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.canzs.czs.pojo.entity.MenuTaste;

/**
 * 【菜单口味】持久化接口层.
 * 
 * @creation 2014年03月29日 09:50:42
 * @modification 2014年03月29日 09:50:42
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IMenuTasteDao {

	/**
	 * 查询【菜单口味】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 09:50:42
	 * @modification 2014年03月29日 09:50:42
	 * @param locale
	 * @param menuTaste
	 * @param start
	 * @param limit
	 * @return
	 */
	List<Map<String, Object>> query(Locale locale, MenuTaste menuTaste, Long start, Long limit);

	/**
	 * 查询总数查询【菜单口味】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 09:50:42
	 * @modification 2014年03月29日 09:50:42
	 * @param locale
	 * @param menuTaste
	 * @return
	 */
	long queryCount(Locale locale, MenuTaste menuTaste);
	
}

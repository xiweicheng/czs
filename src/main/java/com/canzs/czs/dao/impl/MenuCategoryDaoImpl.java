/**
 * MenuCategoryDaoImpl.java
 */
package com.canzs.czs.dao.impl;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.canzs.czs.base.impl.BaseDaoImpl;
import com.canzs.czs.dao.IMenuCategoryDao;
import com.canzs.czs.pojo.entity.MenuCategory;

/**
 * 【菜单分类】持久化实现层.
 * 
 * @creation 2014年03月29日 05:09:48
 * @modification 2014年03月29日 05:09:48
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Repository
@Transactional
public class MenuCategoryDaoImpl extends BaseDaoImpl implements IMenuCategoryDao {

	@Override
	public List<Map<String, Object>> query(Locale locale, MenuCategory menuCategory, Long start, Long limit) {
		
		// TODO
		
		return null;
	}

	@Override
	public long queryCount(Locale locale, MenuCategory menuCategory) {
	
		// TODO
	
		return 0L;
	}
	
}

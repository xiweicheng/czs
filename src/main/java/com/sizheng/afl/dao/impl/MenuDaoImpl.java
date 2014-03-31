/**
 * MenuDaoImpl.java
 */
package com.sizheng.afl.dao.impl;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sizheng.afl.base.impl.BaseDaoImpl;
import com.sizheng.afl.dao.IMenuDao;
import com.sizheng.afl.pojo.entity.Menu;

/**
 * 【菜单】持久化实现层.
 * 
 * @creation 2014年03月29日 08:37:32
 * @modification 2014年03月29日 08:37:32
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Repository
@Transactional
public class MenuDaoImpl extends BaseDaoImpl implements IMenuDao {

	@Override
	public List<Map<String, Object>> query(Locale locale, Menu menu, Long start, Long limit) {
		
		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("SELECT\n");
		sqlSb.append("	menu.id,\n");
		sqlSb.append("	menu.date_time,\n");
		sqlSb.append("	menu.introduce,\n");
		sqlSb.append("	menu.is_delete,\n");
		sqlSb.append("	menu.`name`,\n");
		sqlSb.append("	menu.price,\n");
		sqlSb.append("	menu.privilege,\n");
		sqlSb.append("	menu_category.`name` AS category,\n");
		sqlSb.append("	menu_taste.`name` AS taste,\n");
		sqlSb.append("	resources.path\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	menu\n");
		sqlSb.append("INNER JOIN resources ON menu.resource_id = resources.id\n");
		sqlSb.append("INNER JOIN menu_taste ON menu.taste_id = menu_taste.id\n");
		sqlSb.append("INNER JOIN menu_category ON menu.category_id = menu_category.id\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	menu.`owner` = ?\n");
		
		return getMapList(sqlSb, menu.getOwner());
	}

	@Override
	public long queryCount(Locale locale, Menu menu) {
	
		// TODO
	
		return 0L;
	}
	
}

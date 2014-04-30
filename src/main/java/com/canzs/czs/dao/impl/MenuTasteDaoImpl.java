/**
 * MenuTasteDaoImpl.java
 */
package com.canzs.czs.dao.impl;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.canzs.czs.base.impl.BaseDaoImpl;
import com.canzs.czs.dao.IMenuTasteDao;
import com.canzs.czs.pojo.entity.MenuTaste;

/**
 * 【菜单口味】持久化实现层.
 * 
 * @creation 2014年03月29日 09:50:42
 * @modification 2014年03月29日 09:50:42
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Repository
@Transactional
public class MenuTasteDaoImpl extends BaseDaoImpl implements IMenuTasteDao {

	@Override
	public List<Map<String, Object>> query(Locale locale, MenuTaste menuTaste, Long start, Long limit) {
		
		// TODO
		
		return null;
	}

	@Override
	public long queryCount(Locale locale, MenuTaste menuTaste) {
	
		// TODO
	
		return 0L;
	}
	
}

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
		
		// TODO
		
		return null;
	}

	@Override
	public long queryCount(Locale locale, Menu menu) {
	
		// TODO
	
		return 0L;
	}
	
}

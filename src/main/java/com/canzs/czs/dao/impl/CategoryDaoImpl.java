/**
 * CategoryDaoImpl.java
 */
package com.canzs.czs.dao.impl;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.canzs.czs.base.impl.BaseDaoImpl;
import com.canzs.czs.dao.ICategoryDao;
import com.canzs.czs.pojo.entity.Category;

/**
 * 【分类】持久化实现层.
 * 
 * @creation 2014年03月26日 01:06:34
 * @modification 2014年03月26日 01:06:34
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Repository
@Transactional
public class CategoryDaoImpl extends BaseDaoImpl implements ICategoryDao {

	@Override
	public List<Map<String, Object>> query(Locale locale, Category category, Long start, Long limit) {
		
		// TODO
		
		return null;
	}

	@Override
	public long queryCount(Locale locale, Category category) {
	
		// TODO
	
		return 0L;
	}
	
}

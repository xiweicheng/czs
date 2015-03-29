/**
 * RequestDaoImpl.java
 */
package com.canzs.czs.dao.impl;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.canzs.czs.base.impl.BaseDaoImpl;
import com.canzs.czs.dao.IRequestDao;
import com.canzs.czs.pojo.entity.Request;

/**
 * 【顾客实时请求】持久化实现层.
 * 
 * @creation 2014年04月11日 03:18:24
 * @modification 2014年04月11日 03:18:24
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Repository
@Transactional
public class RequestDaoImpl extends BaseDaoImpl implements IRequestDao {

	@Override
	public List<Map<String, Object>> query(Locale locale, Request request, Long start, Long limit) {
		
		// TODO
		
		return null;
	}

	@Override
	public long queryCount(Locale locale, Request request) {
	
		// TODO
	
		return 0L;
	}
	
}

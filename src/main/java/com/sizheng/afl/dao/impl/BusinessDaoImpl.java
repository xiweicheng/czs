/**
 * BusinessDaoImpl.java
 */
package com.sizheng.afl.dao.impl;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sizheng.afl.base.impl.BaseDaoImpl;
import com.sizheng.afl.dao.IBusinessDao;
import com.sizheng.afl.pojo.model.Business;

/**
 * 【商家】持久化实现层.
 * 
 * @creation 2014年03月25日 02:46:32
 * @modification 2014年03月25日 02:46:32
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Repository
@Transactional
public class BusinessDaoImpl extends BaseDaoImpl implements IBusinessDao {

	@Override
	public List<Map<String, Object>> query(Locale locale, Business business, Long start, Long limit) {
		
		// TODO
		
		return null;
	}

	@Override
	public long queryCount(Locale locale, Business business) {
	
		// TODO
	
		return 0L;
	}
	
}

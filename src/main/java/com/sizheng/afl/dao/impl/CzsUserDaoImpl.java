/**
 * CzsUserDaoImpl.java
 */
package com.sizheng.afl.dao.impl;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sizheng.afl.base.impl.BaseDaoImpl;
import com.sizheng.afl.dao.ICzsUserDao;
import com.sizheng.afl.pojo.entity.CzsUser;

/**
 * 【平台用户】持久化实现层.
 * 
 * @creation 2014年04月23日 04:32:37
 * @modification 2014年04月23日 04:32:37
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Repository
@Transactional
public class CzsUserDaoImpl extends BaseDaoImpl implements ICzsUserDao {

	@Override
	public List<Map<String, Object>> query(Locale locale, CzsUser czsUser, Long start, Long limit) {
		
		// TODO
		
		return null;
	}

	@Override
	public long queryCount(Locale locale, CzsUser czsUser) {
	
		// TODO
	
		return 0L;
	}
	
}

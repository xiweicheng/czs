/**
 * BusinessRoleDaoImpl.java
 */
package com.sizheng.afl.dao.impl;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sizheng.afl.base.impl.BaseDaoImpl;
import com.sizheng.afl.dao.IBusinessRoleDao;
import com.sizheng.afl.pojo.entity.BusinessRole;

/**
 * 【商家角色管理】持久化实现层.
 * 
 * @creation 2014年04月22日 10:02:47
 * @modification 2014年04月22日 10:02:47
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Repository
@Transactional
public class BusinessRoleDaoImpl extends BaseDaoImpl implements IBusinessRoleDao {

	@Override
	public List<Map<String, Object>> query(Locale locale, BusinessRole businessRole, Long start, Long limit) {
		
		// TODO
		
		return null;
	}

	@Override
	public long queryCount(Locale locale, BusinessRole businessRole) {
	
		// TODO
	
		return 0L;
	}
	
}

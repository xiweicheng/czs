/**
 * IBusinessRoleDao.java
 */
package com.canzs.czs.dao;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.canzs.czs.pojo.entity.BusinessRole;

/**
 * 【商家角色管理】持久化接口层.
 * 
 * @creation 2014年04月22日 10:02:47
 * @modification 2014年04月22日 10:02:47
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IBusinessRoleDao {

	/**
	 * 查询【商家角色管理】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 10:02:47
	 * @modification 2014年04月22日 10:02:47
	 * @param locale
	 * @param businessRole
	 * @param start
	 * @param limit
	 * @return
	 */
	List<Map<String, Object>> query(Locale locale, BusinessRole businessRole, Long start, Long limit);

	/**
	 * 查询总数查询【商家角色管理】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 10:02:47
	 * @modification 2014年04月22日 10:02:47
	 * @param locale
	 * @param businessRole
	 * @return
	 */
	long queryCount(Locale locale, BusinessRole businessRole);
	
}

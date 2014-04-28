/**
 * IBusinessRoleService.java
 */
package com.sizheng.afl.service;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.sizheng.afl.base.IBaseService;
import com.sizheng.afl.pojo.entity.BusinessRole;
import com.sizheng.afl.pojo.vo.PageResult;

/**
 * 【商家角色管理】业务逻辑接口.
 * 
 * @creation 2014年04月22日 10:02:47
 * @modification 2014年04月22日 10:02:47
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IBusinessRoleService extends IBaseService {

	/**
	 * 创建【商家角色管理】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 10:02:47
	 * @modification 2014年04月22日 10:02:47
	 * @param businessRole
	 * @return
	 */
	boolean save(Locale locale, BusinessRole businessRole);

	/**
	 * 删除【商家角色管理】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 10:02:47
	 * @modification 2014年04月22日 10:02:47
	 * @param businessRole
	 * @return
	 */
	boolean delete(Locale locale, BusinessRole businessRole);

	/**
	 * 获取【商家角色管理】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 10:02:47
	 * @modification 2014年04月22日 10:02:47
	 * @param businessRole
	 * @return
	 */
	BusinessRole get(Locale locale, BusinessRole businessRole);
	
	/**
	 * 更新【商家角色管理】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 10:02:47
	 * @modification 2014年04月22日 10:02:47
	 * @param businessRole
	 * @return
	 */
	boolean update(Locale locale, BusinessRole businessRole);
	
	/**
	 * 列举【商家角色管理】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 10:02:47
	 * @modification 2014年04月22日 10:02:47
	 * @param businessRole
	 * @return
	 */
	List<BusinessRole> list(Locale locale);

	/**
	 * 查询【商家角色管理】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 10:02:47
	 * @modification 2014年04月22日 10:02:47
	 * @param businessRole
	 * @return
	 */
	List<BusinessRole> query(Locale locale, BusinessRole businessRole);

	/**
	 * 查询【商家角色管理】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 10:02:47
	 * @modification 2014年04月22日 10:02:47
	 * @param businessRole
	 * @return
	 */
	List<Map<String, Object>> queryMapList(Locale locale, BusinessRole businessRole);

	/**
	 * 查询【商家角色管理】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 10:02:47
	 * @modification 2014年04月22日 10:02:47
	 * @param businessRole
	 * @return
	 */
	PageResult paging(Locale locale, BusinessRole businessRole, Long start, Long limit);

	/**
	 * 判断【商家角色管理】是否存在.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 10:02:47
	 * @modification 2014年04月22日 10:02:47
	 * @param businessRole
	 * @return
	 */
	boolean exists(Locale locale, BusinessRole businessRole);

	boolean requestHandle(Locale locale, String[] ids, String status, String accepterId);

	boolean serviceHandle(Locale locale, String[] ids, String status, String accepterId);
}

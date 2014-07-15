/**
 * IBusinessRoleService.java
 */
package com.canzs.czs.service;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.canzs.czs.base.IBaseService;
import com.canzs.czs.pojo.entity.BusinessRole;
import com.canzs.czs.pojo.vo.PageResult;

/**
 * 【商家角色管理】业务逻辑接口.
 * 
 * @creation 2014年04月22日 10:02:47
 * @modification 2014年04月22日 10:02:47
 * @company Canzs
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

	long countAllConsumer(Locale locale, String businessId);

	long countTodayConsumer(Locale locale, String businessId);

	long countTodayOngoingConsumer(Locale locale, String businessId);

	long countAllMenuBill(Locale locale, String businessId);

	long countTodayMenuBill(Locale locale, String businessId);

	long countTodayWaitMenuBill(Locale locale, String businessId);

	double countAllBillBill(Locale locale, String businessId);

	double countTodayBill(Locale locale, String businessId);

	double countYesterdayBill(Locale locale, String businessId);

	long countAllMsg(Locale locale, String businessId);

	long countNewMsg(Locale locale, String businessId);

	long countStowMsg(Locale locale, String businessId);

	long countAllService(Locale locale, String businessId);

	long countNewService(Locale locale, String businessId);

	long countTodayService(Locale locale, String businessId);
}

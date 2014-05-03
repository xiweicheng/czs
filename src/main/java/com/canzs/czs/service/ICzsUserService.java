/**
 * ICzsUserService.java
 */
package com.canzs.czs.service;

import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.canzs.czs.base.IBaseService;
import com.canzs.czs.pojo.entity.Business;
import com.canzs.czs.pojo.entity.CzsUser;
import com.canzs.czs.pojo.vo.PageResult;

/**
 * 【平台用户】业务逻辑接口.
 * 
 * @creation 2014年04月23日 04:32:37
 * @modification 2014年04月23日 04:32:37
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface ICzsUserService extends IBaseService {

	/**
	 * 创建【平台用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 04:32:37
	 * @modification 2014年04月23日 04:32:37
	 * @param czsUser
	 * @return
	 */
	boolean save(Locale locale, CzsUser czsUser);

	/**
	 * 删除【平台用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 04:32:37
	 * @modification 2014年04月23日 04:32:37
	 * @param czsUser
	 * @return
	 */
	boolean delete(Locale locale, CzsUser czsUser);

	/**
	 * 获取【平台用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 04:32:37
	 * @modification 2014年04月23日 04:32:37
	 * @param czsUser
	 * @return
	 */
	CzsUser get(Locale locale, CzsUser czsUser);
	
	/**
	 * 更新【平台用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 04:32:37
	 * @modification 2014年04月23日 04:32:37
	 * @param czsUser
	 * @return
	 */
	boolean update(Locale locale, CzsUser czsUser);
	
	/**
	 * 列举【平台用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 04:32:37
	 * @modification 2014年04月23日 04:32:37
	 * @param czsUser
	 * @return
	 */
	List<CzsUser> list(Locale locale);

	/**
	 * 查询【平台用户】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 04:32:37
	 * @modification 2014年04月23日 04:32:37
	 * @param czsUser
	 * @return
	 */
	List<CzsUser> query(Locale locale, CzsUser czsUser);

	/**
	 * 查询【平台用户】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 04:32:37
	 * @modification 2014年04月23日 04:32:37
	 * @param czsUser
	 * @return
	 */
	List<Map<String, Object>> queryMapList(Locale locale, CzsUser czsUser);

	/**
	 * 查询【平台用户】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 04:32:37
	 * @modification 2014年04月23日 04:32:37
	 * @param czsUser
	 * @return
	 */
	PageResult paging(Locale locale, CzsUser czsUser, Long start, Long limit);

	/**
	 * 判断【平台用户】是否存在.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 04:32:37
	 * @modification 2014年04月23日 04:32:37
	 * @param czsUser
	 * @return
	 */
	boolean exists(Locale locale, CzsUser czsUser);

	List<Map<String, Object>> queryMgrBusiness(Locale locale, Date sDate, Date eDate, String... status);

	boolean businessHandle(Locale locale, Business business);
}

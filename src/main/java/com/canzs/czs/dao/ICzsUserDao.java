/**
 * ICzsUserDao.java
 */
package com.canzs.czs.dao;

import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.canzs.czs.pojo.entity.CzsUser;

/**
 * 【平台用户】持久化接口层.
 * 
 * @creation 2014年04月23日 04:32:37
 * @modification 2014年04月23日 04:32:37
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface ICzsUserDao {

	/**
	 * 查询【平台用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 04:32:37
	 * @modification 2014年04月23日 04:32:37
	 * @param locale
	 * @param czsUser
	 * @param start
	 * @param limit
	 * @return
	 */
	List<Map<String, Object>> query(Locale locale, CzsUser czsUser, Long start, Long limit);

	/**
	 * 查询总数查询【平台用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 04:32:37
	 * @modification 2014年04月23日 04:32:37
	 * @param locale
	 * @param czsUser
	 * @return
	 */
	long queryCount(Locale locale, CzsUser czsUser);

	List<Map<String, Object>> queryMgrBusiness(Locale locale, Date sDate, Date eDate, String... status);
	
}

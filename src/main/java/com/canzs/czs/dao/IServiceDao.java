/**
 * IServiceDao.java
 */
package com.canzs.czs.dao;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.canzs.czs.pojo.entity.Service;

/**
 * 【呼叫服务】持久化接口层.
 * 
 * @creation 2014年04月23日 08:28:44
 * @modification 2014年04月23日 08:28:44
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IServiceDao {

	/**
	 * 查询【呼叫服务】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 08:28:44
	 * @modification 2014年04月23日 08:28:44
	 * @param locale
	 * @param service
	 * @param start
	 * @param limit
	 * @return
	 */
	List<Map<String, Object>> query(Locale locale, Service service, Long start, Long limit);

	/**
	 * 查询总数查询【呼叫服务】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 08:28:44
	 * @modification 2014年04月23日 08:28:44
	 * @param locale
	 * @param service
	 * @return
	 */
	long queryCount(Locale locale, Service service);
	
}

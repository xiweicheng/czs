/**
 * IBusinessDao.java
 */
package com.sizheng.afl.dao;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.sizheng.afl.pojo.entity.Business;

/**
 * 【商家】持久化接口层.
 * 
 * @creation 2014年03月25日 02:46:32
 * @modification 2014年03月25日 02:46:32
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IBusinessDao {

	/**
	 * 查询【商家】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 02:46:32
	 * @modification 2014年03月25日 02:46:32
	 * @param locale
	 * @param business
	 * @param start
	 * @param limit
	 * @return
	 */
	List<Map<String, Object>> query(Locale locale, Business business, Long start, Long limit);

	/**
	 * 查询总数查询【商家】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 02:46:32
	 * @modification 2014年03月25日 02:46:32
	 * @param locale
	 * @param business
	 * @return
	 */
	long queryCount(Locale locale, Business business);
	
}

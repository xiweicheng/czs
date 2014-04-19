/**
 * IMenuBillDao.java
 */
package com.sizheng.afl.dao;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.sizheng.afl.pojo.entity.MenuBill;

/**
 * 【订单】持久化接口层.
 * 
 * @creation 2014年04月05日 05:02:44
 * @modification 2014年04月05日 05:02:44
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IMenuBillDao {

	/**
	 * 查询【订单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月05日 05:02:44
	 * @modification 2014年04月05日 05:02:44
	 * @param locale
	 * @param menuBill
	 * @param start
	 * @param limit
	 * @return
	 */
	List<Map<String, Object>> query(Locale locale, MenuBill menuBill, Long start, Long limit);

	/**
	 * 查询总数查询【订单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月05日 05:02:44
	 * @modification 2014年04月05日 05:02:44
	 * @param locale
	 * @param menuBill
	 * @return
	 */
	long queryCount(Locale locale, MenuBill menuBill);

	/**
	 * 集体订单查询.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月6日 下午12:28:24
	 * @modification 2014年4月6日 下午12:28:24
	 * @param locale
	 * @param menuBill
	 * @param object
	 * @param object2
	 * @return
	 */
	List<Map<String, Object>> queryGroup(Locale locale, MenuBill menuBill, Long start, Long limit);

	List<Map<String, Object>> query2(Locale locale, MenuBill menuBill, Long start, Long limit);

	List<Map<String, Object>> queryGroup2(Locale locale, MenuBill menuBill, Long start, Long limit);
	
}

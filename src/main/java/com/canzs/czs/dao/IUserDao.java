/**
 * IUserDao.java
 */
package com.canzs.czs.dao;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.canzs.czs.pojo.entity.User;

/**
 * 【用户】持久化接口层.
 * 
 * @creation 2014年03月28日 10:02:03
 * @modification 2014年03月28日 10:02:03
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IUserDao {

	/**
	 * 查询【用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月28日 10:02:03
	 * @modification 2014年03月28日 10:02:03
	 * @param locale
	 * @param user
	 * @param start
	 * @param limit
	 * @return
	 */
	List<Map<String, Object>> query(Locale locale, User user, Long start, Long limit);

	/**
	 * 查询总数查询【用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月28日 10:02:03
	 * @modification 2014年03月28日 10:02:03
	 * @param locale
	 * @param user
	 * @return
	 */
	long queryCount(Locale locale, User user);

	/**
	 * 查询顾客的消费菜单.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月4日 上午11:08:03
	 * @modification 2014年4月4日 上午11:08:03
	 * @param locale
	 * @param consumeCode
	 * @return
	 */
	List<Map<String, Object>> queryMenuBill(Locale locale, String consumeCode);

	List<Map<String, Object>> getInfo(Locale locale, String openId);

	List<Map<String, Object>> stowQuery(Locale locale, String openId, String businessId);

	String getBusinessId(Locale locale, String openId);

	Map<String, Object> getBusinessConsumer(Locale locale, String openId);

	List<Map<String, Object>> getStowBusiness(Locale locale, String consumerId);

}

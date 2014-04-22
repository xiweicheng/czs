/**
 * IMessageDao.java
 */
package com.sizheng.afl.dao;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.sizheng.afl.pojo.entity.Message;

/**
 * 【顾客消息】持久化接口层.
 * 
 * @creation 2014年04月22日 04:15:09
 * @modification 2014年04月22日 04:15:09
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IMessageDao {

	/**
	 * 查询【顾客消息】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 04:15:09
	 * @modification 2014年04月22日 04:15:09
	 * @param locale
	 * @param message
	 * @param start
	 * @param limit
	 * @return
	 */
	List<Map<String, Object>> query(Locale locale, Message message, Long start, Long limit);

	/**
	 * 查询总数查询【顾客消息】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 04:15:09
	 * @modification 2014年04月22日 04:15:09
	 * @param locale
	 * @param message
	 * @return
	 */
	long queryCount(Locale locale, Message message);
	
}

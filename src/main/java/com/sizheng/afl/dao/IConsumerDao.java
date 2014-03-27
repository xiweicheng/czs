/**
 * IConsumerDao.java
 */
package com.sizheng.afl.dao;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.sizheng.afl.pojo.model.Consumer;

/**
 * 【消费者】持久化接口层.
 * 
 * @creation 2014年03月27日 09:57:33
 * @modification 2014年03月27日 09:57:33
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IConsumerDao {

	/**
	 * 查询【消费者】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月27日 09:57:33
	 * @modification 2014年03月27日 09:57:33
	 * @param locale
	 * @param consumer
	 * @param start
	 * @param limit
	 * @return
	 */
	List<Map<String, Object>> query(Locale locale, Consumer consumer, Long start, Long limit);

	/**
	 * 查询总数查询【消费者】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月27日 09:57:33
	 * @modification 2014年03月27日 09:57:33
	 * @param locale
	 * @param consumer
	 * @return
	 */
	long queryCount(Locale locale, Consumer consumer);
	
}

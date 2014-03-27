/**
 * IConsumerService.java
 */
package com.sizheng.afl.service;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.sizheng.afl.base.IBaseService;
import com.sizheng.afl.pojo.model.Consumer;
import com.sizheng.afl.pojo.vo.PageResult;

/**
 * 【消费者】业务逻辑接口.
 * 
 * @creation 2014年03月27日 09:57:33
 * @modification 2014年03月27日 09:57:33
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IConsumerService extends IBaseService {

	/**
	 * 创建【消费者】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月27日 09:57:33
	 * @modification 2014年03月27日 09:57:33
	 * @param consumer
	 * @return
	 */
	boolean save(Locale locale, Consumer consumer);

	/**
	 * 删除【消费者】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月27日 09:57:33
	 * @modification 2014年03月27日 09:57:33
	 * @param consumer
	 * @return
	 */
	boolean delete(Locale locale, Consumer consumer);

	/**
	 * 获取【消费者】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月27日 09:57:33
	 * @modification 2014年03月27日 09:57:33
	 * @param consumer
	 * @return
	 */
	Consumer get(Locale locale, Consumer consumer);
	
	/**
	 * 更新【消费者】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月27日 09:57:33
	 * @modification 2014年03月27日 09:57:33
	 * @param consumer
	 * @return
	 */
	boolean update(Locale locale, Consumer consumer);
	
	/**
	 * 列举【消费者】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月27日 09:57:33
	 * @modification 2014年03月27日 09:57:33
	 * @param consumer
	 * @return
	 */
	List<Consumer> list(Locale locale);

	/**
	 * 查询【消费者】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月27日 09:57:33
	 * @modification 2014年03月27日 09:57:33
	 * @param consumer
	 * @return
	 */
	List<Map<String, Object>> query(Locale locale, Consumer consumer);

	/**
	 * 查询【消费者】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月27日 09:57:33
	 * @modification 2014年03月27日 09:57:33
	 * @param consumer
	 * @return
	 */
	PageResult paging(Locale locale, Consumer consumer, Long start, Long limit);

	/**
	 * 判断【消费者】是否存在.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月27日 09:57:33
	 * @modification 2014年03月27日 09:57:33
	 * @param consumer
	 * @return
	 */
	boolean exists(Locale locale, Consumer consumer);

	boolean bill(Locale locale, String openId, String consumeCode);
}

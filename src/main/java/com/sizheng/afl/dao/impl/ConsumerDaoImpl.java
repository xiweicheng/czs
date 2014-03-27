/**
 * ConsumerDaoImpl.java
 */
package com.sizheng.afl.dao.impl;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sizheng.afl.base.impl.BaseDaoImpl;
import com.sizheng.afl.dao.IConsumerDao;
import com.sizheng.afl.pojo.model.Consumer;

/**
 * 【消费者】持久化实现层.
 * 
 * @creation 2014年03月27日 09:57:33
 * @modification 2014年03月27日 09:57:33
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Repository
@Transactional
public class ConsumerDaoImpl extends BaseDaoImpl implements IConsumerDao {

	@Override
	public List<Map<String, Object>> query(Locale locale, Consumer consumer, Long start, Long limit) {
		
		// TODO
		
		return null;
	}

	@Override
	public long queryCount(Locale locale, Consumer consumer) {
	
		// TODO
	
		return 0L;
	}
	
}

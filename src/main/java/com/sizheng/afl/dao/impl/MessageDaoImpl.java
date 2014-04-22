/**
 * MessageDaoImpl.java
 */
package com.sizheng.afl.dao.impl;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sizheng.afl.base.impl.BaseDaoImpl;
import com.sizheng.afl.dao.IMessageDao;
import com.sizheng.afl.pojo.entity.Message;

/**
 * 【顾客消息】持久化实现层.
 * 
 * @creation 2014年04月22日 04:15:09
 * @modification 2014年04月22日 04:15:09
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Repository
@Transactional
public class MessageDaoImpl extends BaseDaoImpl implements IMessageDao {

	@Override
	public List<Map<String, Object>> query(Locale locale, Message message, Long start, Long limit) {
		
		// TODO
		
		return null;
	}

	@Override
	public long queryCount(Locale locale, Message message) {
	
		// TODO
	
		return 0L;
	}
	
}

/**
 * MessageServiceImpl.java
 */
package com.sizheng.afl.service.impl;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sizheng.afl.base.impl.BaseServiceImpl;
import com.sizheng.afl.component.ApiInvoker;
import com.sizheng.afl.dao.IMessageDao;
import com.sizheng.afl.pojo.entity.Message;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.service.IMessageService;

/**
 * 【顾客消息】业务逻辑实现.
 * 
 * @creation 2014年04月22日 04:15:09
 * @modification 2014年04月22日 04:15:09
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Service
@Transactional
public class MessageServiceImpl extends BaseServiceImpl implements IMessageService {

	private static Logger logger = Logger.getLogger(MessageServiceImpl.class);

	@Autowired
	IMessageDao messageDao;

	@Autowired
	ApiInvoker apiInvoker;

	@Override
	public boolean save(Locale locale, Message message) {

		logger.debug("[业务逻辑层]添加【顾客消息】");

		// TODO
		return true;
	}

	@Override
	public boolean delete(Locale locale, Message message) {

		logger.debug("[业务逻辑层]删除【顾客消息】");

		// TODO
		return true;
	}

	@Override
	public Message get(Locale locale, Message message) {

		logger.debug("[业务逻辑层]获取【顾客消息】");

		// TODO
		return null;
	}

	@Override
	public boolean update(Locale locale, Message message) {

		logger.debug("[业务逻辑层]更新【顾客消息】");

		// TODO
		return true;
	}

	@Override
	public List<Message> list(Locale locale) {

		logger.debug("[业务逻辑层]列举【顾客消息】");

		// TODO
		return null;
	}

	@Override
	public List<Message> query(Locale locale, Message message) {

		logger.debug("[业务逻辑层]查询【顾客消息】(不分页)");

		// TODO
		return null;
	}

	@Override
	public List<Map<String, Object>> queryMapList(Locale locale, Message message) {

		logger.debug("[业务逻辑层]查询MapList【顾客消息】(不分页)");

		// TODO
		return null;
	}

	@Override
	public PageResult paging(Locale locale, Message message, Long start, Long limit) {

		logger.debug("[业务逻辑层]查询【顾客消息】(分页)");

		PageResult pageResult = new PageResult();

		// TODO
		return pageResult;
	}

	@Override
	public boolean exists(Locale locale, Message message) {

		logger.debug("[业务逻辑层]判断【顾客消息】是否存在");

		// TODO
		return true;
	}

	@Override
	public boolean updateStatus(Locale locale, final Message message) {

		return hibernateTemplate.execute(new HibernateCallback<Boolean>() {

			@Override
			public Boolean doInHibernate(Session session) throws HibernateException, SQLException {

				return session.createQuery("update Message set status=? where id=?").setShort(0, message.getStatus())
						.setLong(1, message.getId()).executeUpdate() > 0;
			}
		});

	}

	@Override
	public Long queryCount(Locale locale, final Message message, final Date start, final Date end) {

		return hibernateTemplate.execute(new HibernateCallback<Long>() {

			@Override
			public Long doInHibernate(Session session) throws HibernateException, SQLException {
				return (Long) session
						.createQuery(
								"select count(*) from Message where (msgType='image' or msgType='text') and status=? and toOpenId=? and (dateTime between ? and ?)")
						.setShort(0, message.getStatus()).setString(1, message.getToOpenId()).setDate(2, start)
						.setDate(3, end).uniqueResult();
			}
		});
	}
}
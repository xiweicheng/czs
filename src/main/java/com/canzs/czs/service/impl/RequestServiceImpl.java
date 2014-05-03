/**
 * RequestServiceImpl.java
 */
package com.canzs.czs.service.impl;

import java.sql.SQLException;
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

import com.canzs.czs.base.impl.BaseServiceImpl;
import com.canzs.czs.component.ApiInvoker;
import com.canzs.czs.dao.IRequestDao;
import com.canzs.czs.pojo.entity.Request;
import com.canzs.czs.pojo.vo.PageResult;
import com.canzs.czs.service.IRequestService;

/**
 * 【顾客实时请求】业务逻辑实现.
 * 
 * @creation 2014年04月11日 03:18:24
 * @modification 2014年04月11日 03:18:24
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Service
@Transactional
public class RequestServiceImpl extends BaseServiceImpl implements IRequestService {

	private static Logger logger = Logger.getLogger(RequestServiceImpl.class);

	@Autowired
	IRequestDao requestDao;

	@Autowired
	ApiInvoker apiInvoker;

	@Override
	public boolean save(Locale locale, Request request) {

		logger.debug("[业务逻辑层]添加【顾客实时请求】");

		// TODO
		return true;
	}

	@Override
	public boolean delete(Locale locale, Request request) {

		logger.debug("[业务逻辑层]删除【顾客实时请求】");

		// TODO
		return true;
	}

	@Override
	public Request get(Locale locale, Request request) {

		logger.debug("[业务逻辑层]获取【顾客实时请求】");

		// TODO
		return null;
	}

	@Override
	public boolean update(Locale locale, Request request) {

		logger.debug("[业务逻辑层]更新【顾客实时请求】");

		// TODO
		return true;
	}

	@Override
	public List<Request> list(Locale locale) {

		logger.debug("[业务逻辑层]列举【顾客实时请求】");

		// TODO
		return null;
	}

	@Override
	public List<Map<String, Object>> query(Locale locale, Request request) {

		logger.debug("[业务逻辑层]查询【顾客实时请求】(不分页)");

		// TODO
		return null;
	}

	@Override
	public PageResult paging(Locale locale, Request request, Long start, Long limit) {

		logger.debug("[业务逻辑层]查询【顾客实时请求】(分页)");

		PageResult pageResult = new PageResult();

		// TODO
		return pageResult;
	}

	@Override
	public boolean exists(Locale locale, Request request) {

		logger.debug("[业务逻辑层]判断【顾客实时请求】是否存在");

		// TODO
		return true;
	}

	@Override
	public boolean updateStatus(final long id, final Short status) {

		return hibernateTemplate.execute(new HibernateCallback<Boolean>() {

			@Override
			public Boolean doInHibernate(Session session) throws HibernateException, SQLException {
				return session.createQuery("update Request set status=? where id=?").setShort(0, status).setLong(1, id)
						.executeUpdate() == 1;
			}

		});
	}

}
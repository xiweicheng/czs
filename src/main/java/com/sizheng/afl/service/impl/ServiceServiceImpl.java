/**
 * ServiceServiceImpl.java
 */
package com.sizheng.afl.service.impl;

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

import com.sizheng.afl.base.impl.BaseServiceImpl;
import com.sizheng.afl.component.ApiInvoker;
import com.sizheng.afl.dao.IServiceDao;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.service.IServiceService;

/**
 * 【呼叫服务】业务逻辑实现.
 * 
 * @creation 2014年04月23日 08:28:44
 * @modification 2014年04月23日 08:28:44
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Service
@Transactional
public class ServiceServiceImpl extends BaseServiceImpl implements IServiceService {

	private static Logger logger = Logger.getLogger(ServiceServiceImpl.class);

	@Autowired
	IServiceDao serviceDao;

	@Autowired
	ApiInvoker apiInvoker;

	@Override
	public boolean save(Locale locale, com.sizheng.afl.pojo.entity.Service service) {

		logger.debug("[业务逻辑层]添加【呼叫服务】");

		// TODO
		return true;
	}

	@Override
	public boolean delete(Locale locale, com.sizheng.afl.pojo.entity.Service service) {

		logger.debug("[业务逻辑层]删除【呼叫服务】");

		// TODO
		return true;
	}

	@Override
	public com.sizheng.afl.pojo.entity.Service get(Locale locale, com.sizheng.afl.pojo.entity.Service service) {

		logger.debug("[业务逻辑层]获取【呼叫服务】");

		// TODO
		return null;
	}

	@Override
	public boolean update(Locale locale, com.sizheng.afl.pojo.entity.Service service) {

		logger.debug("[业务逻辑层]更新【呼叫服务】");

		// TODO
		return true;
	}

	@Override
	public List<com.sizheng.afl.pojo.entity.Service> list(Locale locale) {

		logger.debug("[业务逻辑层]列举【呼叫服务】");

		// TODO
		return null;
	}

	@Override
	public List<com.sizheng.afl.pojo.entity.Service> query(Locale locale, com.sizheng.afl.pojo.entity.Service service) {

		logger.debug("[业务逻辑层]查询【呼叫服务】(不分页)");

		// TODO
		return null;
	}

	@Override
	public List<Map<String, Object>> queryMapList(Locale locale, com.sizheng.afl.pojo.entity.Service service) {

		logger.debug("[业务逻辑层]查询MapList【呼叫服务】(不分页)");

		// TODO
		return null;
	}

	@Override
	public PageResult paging(Locale locale, com.sizheng.afl.pojo.entity.Service service, Long start, Long limit) {

		logger.debug("[业务逻辑层]查询【呼叫服务】(分页)");

		PageResult pageResult = new PageResult();

		// TODO
		return pageResult;
	}

	@Override
	public boolean exists(Locale locale, com.sizheng.afl.pojo.entity.Service service) {

		logger.debug("[业务逻辑层]判断【呼叫服务】是否存在");

		// TODO
		return true;
	}

	@Override
	public boolean updateStatus(Locale locale, final com.sizheng.afl.pojo.entity.Service service) {

		return hibernateTemplate.execute(new HibernateCallback<Boolean>() {

			@Override
			public Boolean doInHibernate(Session session) throws HibernateException, SQLException {

				return session.createQuery("update Service set status=?,handler=? where id=?")
						.setShort(0, service.getStatus()).setString(1, service.getHandler())
						.setLong(2, service.getId()).executeUpdate() > 0;
			}
		});

	}

}
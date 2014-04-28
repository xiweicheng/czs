/**
 * CzsUserServiceImpl.java
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
import com.sizheng.afl.dao.ICzsUserDao;
import com.sizheng.afl.pojo.entity.Business;
import com.sizheng.afl.pojo.entity.CzsUser;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.service.ICzsUserService;

/**
 * 【平台用户】业务逻辑实现.
 * 
 * @creation 2014年04月23日 04:32:37
 * @modification 2014年04月23日 04:32:37
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Service
@Transactional
public class CzsUserServiceImpl extends BaseServiceImpl implements ICzsUserService {

	private static Logger logger = Logger.getLogger(CzsUserServiceImpl.class);

	@Autowired
	ICzsUserDao czsUserDao;

	@Autowired
	ApiInvoker apiInvoker;

	@Override
	public boolean save(Locale locale, CzsUser czsUser) {

		logger.debug("[业务逻辑层]添加【平台用户】");

		// TODO
		return true;
	}

	@Override
	public boolean delete(Locale locale, CzsUser czsUser) {

		logger.debug("[业务逻辑层]删除【平台用户】");

		// TODO
		return true;
	}

	@Override
	public CzsUser get(Locale locale, CzsUser czsUser) {

		logger.debug("[业务逻辑层]获取【平台用户】");

		return findOneByExample(czsUser, CzsUser.class);
	}

	@Override
	public boolean update(Locale locale, CzsUser czsUser) {

		logger.debug("[业务逻辑层]更新【平台用户】");

		// TODO
		return true;
	}

	@Override
	public List<CzsUser> list(Locale locale) {

		logger.debug("[业务逻辑层]列举【平台用户】");

		// TODO
		return null;
	}

	@Override
	public List<CzsUser> query(Locale locale, CzsUser czsUser) {

		logger.debug("[业务逻辑层]查询【平台用户】(不分页)");

		// TODO
		return null;
	}

	@Override
	public List<Map<String, Object>> queryMapList(Locale locale, CzsUser czsUser) {

		logger.debug("[业务逻辑层]查询MapList【平台用户】(不分页)");

		// TODO
		return null;
	}

	@Override
	public PageResult paging(Locale locale, CzsUser czsUser, Long start, Long limit) {

		logger.debug("[业务逻辑层]查询【平台用户】(分页)");

		PageResult pageResult = new PageResult();

		// TODO
		return pageResult;
	}

	@Override
	public boolean exists(Locale locale, CzsUser czsUser) {

		logger.debug("[业务逻辑层]判断【平台用户】是否存在");

		// TODO
		return true;
	}

	@Override
	public List<Map<String, Object>> queryMgrBusiness(Locale locale, Date sDate, Date eDate, String... status) {
		return czsUserDao.queryMgrBusiness(locale, sDate, eDate, status);
	}

	@Override
	public boolean businessHandle(Locale locale, final Business business) {

		return hibernateTemplate.execute(new HibernateCallback<Boolean>() {

			@Override
			public Boolean doInHibernate(Session session) throws HibernateException, SQLException {
				return session
						.createQuery(
								"update Business set status = ?,auditHandler=?,auditDateTime=?,days=?,qrcode_limit=? where id = ?")
						.setShort(0, business.getStatus()).setString(1, business.getAuditHandler())
						.setTimestamp(2, business.getAuditDateTime()).setLong(3, business.getDays())
						.setLong(4, business.getQrcodeLimit()).setLong(5, business.getId()).executeUpdate() > 0;
			}
		});
	}

}
/**
 * CzsUserServiceImpl.java
 */
package com.canzs.czs.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import com.canzs.czs.component.PropUtil;
import com.canzs.czs.dao.ICzsUserDao;
import com.canzs.czs.pojo.constant.SysConstant;
import com.canzs.czs.pojo.entity.Business;
import com.canzs.czs.pojo.entity.Comment;
import com.canzs.czs.pojo.entity.CzsUser;
import com.canzs.czs.pojo.entity.Log;
import com.canzs.czs.pojo.vo.PageResult;
import com.canzs.czs.service.ICzsUserService;
import com.canzs.czs.util.DateUtil;
import com.canzs.czs.util.NumberUtil;
import com.canzs.czs.util.StringUtil;

/**
 * 【平台用户】业务逻辑实现.
 * 
 * @creation 2014年04月23日 04:32:37
 * @modification 2014年04月23日 04:32:37
 * @company Canzs
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

	@Autowired
	PropUtil propUtil;

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
		List<Map<String, Object>> queryMgrBusiness = czsUserDao.queryMgrBusiness(locale, sDate, eDate, status);

		for (Map<String, Object> map : queryMgrBusiness) {
			map.put("diff", DateUtil.convert(NumberUtil.getLong(map, "sec_diff")));

			if (map.containsKey("sec_audit_diff")) {
				map.put("audit_diff", DateUtil.convert(NumberUtil.getLong(map, "sec_audit_diff")));
			}
			map.put("simple_introduce",
					StringUtil.html(StringUtil.limitLength(StringUtil.getNotNullString(map, "introduce"),
							propUtil.getContentLenLimit())));
		}

		return queryMgrBusiness;
	}

	@Override
	public boolean businessHandle(Locale locale, final Business business) {

		return hibernateTemplate.execute(new HibernateCallback<Boolean>() {

			@Override
			public Boolean doInHibernate(Session session) throws HibernateException, SQLException {
				return session
						.createQuery(
								"update Business set status = ?,auditHandler=?,auditDateTime=?,days=?,qrcode_limit=?,life_value=? where id = ?")
						.setShort(0, business.getStatus()).setString(1, business.getAuditHandler())
						.setTimestamp(2, business.getAuditDateTime()).setLong(3, business.getDays())
						.setLong(4, business.getQrcodeLimit()).setLong(5, business.getLifeValue())
						.setLong(6, business.getId()).executeUpdate() > 0;
			}
		});
	}

	@Override
	public List<Map<String, Object>> queryMgrUser(Locale locale, Date sDate, Date eDate, String... status) {
		List<Map<String, Object>> queryMgrUser = czsUserDao.queryMgrUser(locale, sDate, eDate, status);

		for (Map<String, Object> map : queryMgrUser) {
			map.put("diff", DateUtil.convert(NumberUtil.getLong(map, "sec_diff")));
		}

		return queryMgrUser;
	}

	@Override
	public boolean updateLife(Locale locale, String type, final String oldValue, final String newValue,
			final String id, String businessId, String handler) {

		boolean val = false;

		if (SysConstant.NUMBER_0.equals(type)) {// [life_value] update.
			val = hibernateTemplate.execute(new HibernateCallback<Boolean>() {

				@Override
				public Boolean doInHibernate(Session session) throws HibernateException, SQLException {
					return session.createQuery("update Business set lifeValue=? where id=? and lifeValue=?")
							.setLong(0, Long.valueOf(newValue)).setLong(1, Long.valueOf(id))
							.setLong(2, Long.valueOf(oldValue)).executeUpdate() > 0;
				}
			});
		} else if (SysConstant.NUMBER_1.equals(type)) {// [qrcode_limit] update.
			val = hibernateTemplate.execute(new HibernateCallback<Boolean>() {

				@Override
				public Boolean doInHibernate(Session session) throws HibernateException, SQLException {
					return session.createQuery("update Business set qrcodeLimit=? where id=? and qrcodeLimit=?")
							.setLong(0, Long.valueOf(newValue)).setLong(1, Long.valueOf(id))
							.setLong(2, Long.valueOf(oldValue)).executeUpdate() > 0;
				}
			});
		} else if (SysConstant.NUMBER_2.equals(type)) {// [days] update.
			val = hibernateTemplate.execute(new HibernateCallback<Boolean>() {

				@Override
				public Boolean doInHibernate(Session session) throws HibernateException, SQLException {
					return session.createQuery("update Business set days=? where id=? and days=?")
							.setLong(0, Long.valueOf(newValue)).setLong(1, Long.valueOf(id))
							.setLong(2, Long.valueOf(oldValue)).executeUpdate() > 0;
				}
			});
		}

		Log log = new Log();
		log.setDateTime(DateUtil.now());
		log.setDetail(StringUtil.replace("[商家充值]-类型:[{?1}]-oldValue:[{?2}]-newValue:[{?3}]", type, oldValue, newValue));
		log.setHandler(handler);
		log.setIsDelete(SysConstant.SHORT_FALSE);
		log.setObjectId(businessId);
		log.setStatus(val ? SysConstant.LOG_STATUS_SUCCEED : SysConstant.LOG_STATUS_FAIL);
		log.setType(SysConstant.LOG_TYPE_UPDATE_BUSINESS);

		hibernateTemplate.save(log);

		return val;
	}

	@Override
	public List<Map<String, Object>> queryMgrQrcode(Locale locale, Date sDate, Date eDate, String... status) {
		List<Map<String, Object>> mapList = czsUserDao.queryMgrQrcode(locale, sDate, eDate, status);

		for (Map<String, Object> map : mapList) {
			map.put("diff", DateUtil.convert(NumberUtil.getLong(map, "sec_diff")));
		}

		return mapList;
	}

	@Override
	public boolean submitComment(Locale locale, String openId, String content) {

		Comment comment = new Comment();
		comment.setContent(content);
		comment.setDateTime(DateUtil.now());
		comment.setIsDelete(SysConstant.SHORT_FALSE);
		comment.setOpenId(openId);
		comment.setStatus(SysConstant.COMMENT_STATUS_NEW);
		comment.setType(SysConstant.COMMENT_TYPE_PLATFORM);

		hibernateTemplate.save(comment);

		return true;
	}

	@Override
	public List<Map<String, Object>> queryCommentByOpenId(Locale locale, String openId) {

		List<Map<String, Object>> list = czsUserDao.queryCommentByOpenId(locale, openId);

		Map<String, Map<String, Object>> maps = new HashMap<String, Map<String, Object>>();

		for (Map<String, Object> map : list) {
			map.put("nice_time", DateUtil.toNiceTime(NumberUtil.getLong(map, "times") * 1000));

			maps.put(StringUtil.getNotNullString(map, "id"), map);
		}

		List<Map<String, Object>> newList = new ArrayList<>();

		for (Map<String, Object> map : list) {
			String pid = StringUtil.getNotNullString(map, "p_id");

			if (StringUtil.isNotEmpty(pid)) {

				List<Map<String, Object>> children = (List<Map<String, Object>>) maps.get(pid).get("children");

				if (children == null) {
					children = new ArrayList<Map<String, Object>>();
					maps.get(pid).put("children", children);
				}

				children.add(map);
			} else {
				newList.add(map);
			}
		}

		return newList;
	}

	@Override
	public boolean isCzsMgr(Locale locale, final String fromUserName) {

		logger.debug("[业务逻辑层]判断【平台用户】是否为管理者");

		return hibernateTemplate.execute(new HibernateCallback<Boolean>() {

			@Override
			public Boolean doInHibernate(Session session) throws HibernateException, SQLException {

				return (Long) session.createQuery("select count(*) from CzsUser where userName = ?")
						.setString(0, fromUserName).uniqueResult() > 0;
			}
		});
	}
}
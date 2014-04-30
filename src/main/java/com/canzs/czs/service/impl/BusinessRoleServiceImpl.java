/**
 * BusinessRoleServiceImpl.java
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
import com.canzs.czs.dao.IBusinessRoleDao;
import com.canzs.czs.pojo.constant.SysConstant;
import com.canzs.czs.pojo.entity.BusinessConsumer;
import com.canzs.czs.pojo.entity.BusinessRole;
import com.canzs.czs.pojo.entity.User;
import com.canzs.czs.pojo.vo.PageResult;
import com.canzs.czs.service.IBusinessRoleService;
import com.canzs.czs.util.DateUtil;

/**
 * 【商家角色管理】业务逻辑实现.
 * 
 * @creation 2014年04月22日 10:02:47
 * @modification 2014年04月22日 10:02:47
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Service
@Transactional
public class BusinessRoleServiceImpl extends BaseServiceImpl implements IBusinessRoleService {

	private static Logger logger = Logger.getLogger(BusinessRoleServiceImpl.class);

	@Autowired
	IBusinessRoleDao businessRoleDao;

	@Autowired
	ApiInvoker apiInvoker;

	@Override
	public boolean save(Locale locale, BusinessRole businessRole) {

		logger.debug("[业务逻辑层]添加【商家角色管理】");

		// TODO
		return true;
	}

	@Override
	public boolean delete(Locale locale, BusinessRole businessRole) {

		logger.debug("[业务逻辑层]删除【商家角色管理】");

		// TODO
		return true;
	}

	@Override
	public BusinessRole get(Locale locale, BusinessRole businessRole) {

		logger.debug("[业务逻辑层]获取【商家角色管理】");

		// TODO
		return null;
	}

	@Override
	public boolean update(Locale locale, BusinessRole businessRole) {

		logger.debug("[业务逻辑层]更新【商家角色管理】");

		// TODO
		return true;
	}

	@Override
	public List<BusinessRole> list(Locale locale) {

		logger.debug("[业务逻辑层]列举【商家角色管理】");

		// TODO
		return null;
	}

	@Override
	public List<BusinessRole> query(Locale locale, BusinessRole businessRole) {

		logger.debug("[业务逻辑层]查询【商家角色管理】(不分页)");

		return hibernateTemplate.findByExample(businessRole);
	}

	@Override
	public List<Map<String, Object>> queryMapList(Locale locale, BusinessRole businessRole) {

		logger.debug("[业务逻辑层]查询MapList【商家角色管理】(不分页)");

		// TODO
		return null;
	}

	@Override
	public PageResult paging(Locale locale, BusinessRole businessRole, Long start, Long limit) {

		logger.debug("[业务逻辑层]查询【商家角色管理】(分页)");

		PageResult pageResult = new PageResult();

		// TODO
		return pageResult;
	}

	@Override
	public boolean exists(Locale locale, BusinessRole businessRole) {

		logger.debug("[业务逻辑层]判断【商家角色管理】是否存在");

		// TODO
		return true;
	}

	@Override
	public boolean requestHandle(Locale locale, String[] ids, String status, String accepterId) {

		for (String id : ids) {
			BusinessConsumer businessConsumer = hibernateTemplate.get(BusinessConsumer.class, Long.parseLong(id));

			if (SysConstant.CONSUME_STATUS_REQ.equals(businessConsumer.getStatus())) {
				businessConsumer.setStatus(Short.parseShort(status));
				businessConsumer.setHandleDateTime(DateUtil.now());
				businessConsumer.setHandler(accepterId);

				if (SysConstant.CONSUME_STATUS_DISABLE.equals(Short.parseShort(status))) {
					businessConsumer.setConsumeCode(null);
					businessConsumer.setSceneId(null);
					businessConsumer.setStatus(SysConstant.CONSUME_STATUS_DISABLE);

					User user = new User();
					user.setUserName(businessConsumer.getConsumerId());

					User user2 = findOneByExample(user, User.class);

					if (user2 != null) {
						user2.setConsumeCode(null);
						hibernateTemplate.update(user2);
					} else {
						logger.error("用户信息不存在!");
					}
				}

				hibernateTemplate.update(businessConsumer);

			} else {
				throwRuntimeException("同意进入请求失败!");
			}
		}

		return true;
	}

	@Override
	public boolean serviceHandle(Locale locale, String[] ids, String status, String accepterId) {

		for (String id : ids) {

			com.canzs.czs.pojo.entity.Service service = hibernateTemplate.get(com.canzs.czs.pojo.entity.Service.class,
					Long.parseLong(id));

			if (SysConstant.SERVICE_STATUS_ONGOING.equals(service.getStatus())) {
				service.setStatus(Short.parseShort(status));
				service.setHandler(accepterId);
				service.setHandleDateTime(DateUtil.now());

				hibernateTemplate.update(service);

			} else {
				throwRuntimeException("接受顾客呼叫请求失败!");
			}
		}

		return true;
	}

	@Override
	public long countAllConsumer(Locale locale, final String businessId) {
		return hibernateTemplate.execute(new HibernateCallback<Long>() {

			@Override
			public Long doInHibernate(Session session) throws HibernateException, SQLException {
				Object object = session.createQuery("select count(*) from BusinessConsumer where businessId=?")
						.setString(0, businessId).uniqueResult();

				if (object instanceof Long) {
					return (Long) object;
				} else {
					if (object != null) {
						return Long.parseLong(String.valueOf(object));
					} else {
						return 0L;
					}
				}
			}
		});
	}

	@Override
	public long countTodayConsumer(Locale locale, final String businessId) {
		return hibernateTemplate.execute(new HibernateCallback<Long>() {

			@Override
			public Long doInHibernate(Session session) throws HibernateException, SQLException {
				Object object = session
						.createSQLQuery(
								"SELECT COUNT(*) AS cnt FROM `business_consumer` WHERE business_id = ? AND DATE(last_consume_time) = DATE(NOW());")
						.setString(0, businessId).uniqueResult();

				if (object instanceof Long) {
					return (Long) object;
				} else {
					if (object != null) {
						return Long.parseLong(String.valueOf(object));
					} else {
						return 0L;
					}
				}
			}
		});
	}

	@Override
	public long countTodayOngoingConsumer(Locale locale, final String businessId) {
		return hibernateTemplate.execute(new HibernateCallback<Long>() {

			@Override
			public Long doInHibernate(Session session) throws HibernateException, SQLException {
				Object object = session
						.createQuery("select count(*) from BusinessConsumer where status = 1 and businessId=?")
						.setString(0, businessId).uniqueResult();

				if (object instanceof Long) {
					return (Long) object;
				} else {
					if (object != null) {
						return Long.parseLong(String.valueOf(object));
					} else {
						return 0L;
					}
				}
			}
		});
	}

	@Override
	public long countAllMenuBill(Locale locale, final String businessId) {
		return hibernateTemplate.execute(new HibernateCallback<Long>() {

			@Override
			public Long doInHibernate(Session session) throws HibernateException, SQLException {
				Object object = session
						.createSQLQuery(
								"SELECT SUM(copies) AS total FROM menu_bill INNER JOIN menu ON menu_bill.menu_id = menu.id WHERE menu.`owner` = ? AND menu_bill.`status` = 3")
						.setString(0, businessId).uniqueResult();

				if (object instanceof Long) {
					return (Long) object;
				} else {
					if (object != null) {
						return Long.parseLong(String.valueOf(object));
					} else {
						return 0L;
					}
				}
			}
		});
	}

	@Override
	public long countTodayMenuBill(Locale locale, final String businessId) {
		return hibernateTemplate.execute(new HibernateCallback<Long>() {

			@Override
			public Long doInHibernate(Session session) throws HibernateException, SQLException {
				Object object = session
						.createSQLQuery(
								"SELECT SUM(copies) AS total FROM menu_bill INNER JOIN menu ON menu_bill.menu_id = menu.id WHERE menu.`owner` = ? AND menu_bill.`status` = 3 AND DATE(menu_bill.date_time) = DATE(NOW())")
						.setString(0, businessId).uniqueResult();

				if (object instanceof Long) {
					return (Long) object;
				} else {
					if (object != null) {
						return Long.parseLong(String.valueOf(object));
					} else {
						return 0L;
					}
				}
			}
		});
	}

	@Override
	public long countTodayWaitMenuBill(Locale locale, final String businessId) {
		return hibernateTemplate.execute(new HibernateCallback<Long>() {

			@Override
			public Long doInHibernate(Session session) throws HibernateException, SQLException {
				Object object = session
						.createSQLQuery(
								"SELECT SUM(copies) AS total FROM menu_bill INNER JOIN menu ON menu_bill.menu_id = menu.id WHERE menu.`owner` = ? AND menu_bill.`status` = 1 AND DATE(menu_bill.date_time) = DATE(NOW())")
						.setString(0, businessId).uniqueResult();

				if (object instanceof Long) {
					return (Long) object;
				} else {
					if (object != null) {
						return Long.parseLong(String.valueOf(object));
					} else {
						return 0L;
					}
				}
			}
		});
	}

	@Override
	public double countAllBillBill(Locale locale, final String businessId) {
		return hibernateTemplate.execute(new HibernateCallback<Double>() {

			@Override
			public Double doInHibernate(Session session) throws HibernateException, SQLException {
				Object object = session
						.createSQLQuery("SELECT SUM(amount) AS total FROM `bill` WHERE bill.business_id = ?")
						.setString(0, businessId).uniqueResult();

				if (object instanceof Long) {
					return (Double) object;
				} else {
					if (object != null) {
						return Double.parseDouble(String.valueOf(object));
					} else {
						return 0D;
					}
				}
			}
		});
	}

	@Override
	public double countTodayBill(Locale locale, final String businessId) {
		return hibernateTemplate.execute(new HibernateCallback<Double>() {

			@Override
			public Double doInHibernate(Session session) throws HibernateException, SQLException {
				Object object = session
						.createSQLQuery(
								"SELECT SUM(amount) AS total FROM `bill` WHERE bill.business_id = ? AND DATE(date_time) = DATE(NOW())")
						.setString(0, businessId).uniqueResult();

				if (object instanceof Long) {
					return (Double) object;
				} else {
					if (object != null) {
						return Double.parseDouble(String.valueOf(object));
					} else {
						return 0D;
					}
				}
			}
		});
	}

	@Override
	public double countYesterdayBill(Locale locale, final String businessId) {
		return hibernateTemplate.execute(new HibernateCallback<Double>() {

			@Override
			public Double doInHibernate(Session session) throws HibernateException, SQLException {
				Object object = session
						.createSQLQuery(
								"SELECT SUM(amount) FROM `bill` WHERE bill.business_id = ? AND DATE(date_time) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)")
						.setString(0, businessId).uniqueResult();

				if (object instanceof Long) {
					return (Double) object;
				} else {
					if (object != null) {
						return Double.parseDouble(String.valueOf(object));
					} else {
						return 0D;
					}
				}
			}
		});
	}

	@Override
	public long countAllMsg(Locale locale, final String businessId) {
		return hibernateTemplate.execute(new HibernateCallback<Long>() {

			@Override
			public Long doInHibernate(Session session) throws HibernateException, SQLException {
				Object object = session
						.createSQLQuery(
								"SELECT COUNT(*) AS cnt FROM `message` WHERE message.to_open_id = ? AND message.msg_type IN ('text', 'image')")
						.setString(0, businessId).uniqueResult();

				if (object instanceof Long) {
					return (Long) object;
				} else {
					if (object != null) {
						return Long.parseLong(String.valueOf(object));
					} else {
						return 0L;
					}
				}
			}
		});
	}

	@Override
	public long countNewMsg(Locale locale, final String businessId) {
		return hibernateTemplate.execute(new HibernateCallback<Long>() {

			@Override
			public Long doInHibernate(Session session) throws HibernateException, SQLException {
				Object object = session
						.createSQLQuery(
								"SELECT COUNT(*) AS cnt FROM `message` WHERE message.to_open_id = ? AND message.msg_type IN ('text', 'image') AND `status` = 0")
						.setString(0, businessId).uniqueResult();

				if (object instanceof Long) {
					return (Long) object;
				} else {
					if (object != null) {
						return Long.parseLong(String.valueOf(object));
					} else {
						return 0L;
					}
				}
			}
		});
	}

	@Override
	public long countStowMsg(Locale locale, final String businessId) {
		return hibernateTemplate.execute(new HibernateCallback<Long>() {

			@Override
			public Long doInHibernate(Session session) throws HibernateException, SQLException {
				Object object = session
						.createSQLQuery(
								"SELECT COUNT(*) AS cnt FROM `message` WHERE message.to_open_id = ? AND message.msg_type IN ('text', 'image') AND `status` = 2")
						.setString(0, businessId).uniqueResult();

				if (object instanceof Long) {
					return (Long) object;
				} else {
					if (object != null) {
						return Long.parseLong(String.valueOf(object));
					} else {
						return 0L;
					}
				}
			}
		});
	}

	@Override
	public long countAllService(Locale locale, final String businessId) {
		return hibernateTemplate.execute(new HibernateCallback<Long>() {

			@Override
			public Long doInHibernate(Session session) throws HibernateException, SQLException {
				Object object = session
						.createSQLQuery("SELECT COUNT(*) AS cnt FROM `service` WHERE service.business_id = ?")
						.setString(0, businessId).uniqueResult();

				if (object instanceof Long) {
					return (Long) object;
				} else {
					if (object != null) {
						return Long.parseLong(String.valueOf(object));
					} else {
						return 0L;
					}
				}
			}
		});
	}

	@Override
	public long countNewService(Locale locale, final String businessId) {
		return hibernateTemplate.execute(new HibernateCallback<Long>() {

			@Override
			public Long doInHibernate(Session session) throws HibernateException, SQLException {
				Object object = session
						.createSQLQuery(
								"SELECT COUNT(*) AS cnt FROM `service` WHERE service.business_id = ? AND DATE(date_time) = CURDATE() AND  `status` = 1")
						.setString(0, businessId).uniqueResult();

				if (object instanceof Long) {
					return (Long) object;
				} else {
					if (object != null) {
						return Long.parseLong(String.valueOf(object));
					} else {
						return 0L;
					}
				}
			}
		});
	}

	@Override
	public long countTodayService(Locale locale, final String businessId) {
		return hibernateTemplate.execute(new HibernateCallback<Long>() {

			@Override
			public Long doInHibernate(Session session) throws HibernateException, SQLException {
				Object object = session
						.createSQLQuery(
								"SELECT COUNT(*) AS cnt FROM `service` WHERE service.business_id = ? AND DATE(date_time) = CURDATE()")
						.setString(0, businessId).uniqueResult();

				if (object instanceof Long) {
					return (Long) object;
				} else {
					if (object != null) {
						return Long.parseLong(String.valueOf(object));
					} else {
						return 0L;
					}
				}
			}
		});
	}

}
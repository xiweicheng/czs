/**
 * BusinessRoleServiceImpl.java
 */
package com.sizheng.afl.service.impl;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sizheng.afl.base.impl.BaseServiceImpl;
import com.sizheng.afl.component.ApiInvoker;
import com.sizheng.afl.dao.IBusinessRoleDao;
import com.sizheng.afl.pojo.constant.SysConstant;
import com.sizheng.afl.pojo.entity.BusinessConsumer;
import com.sizheng.afl.pojo.entity.BusinessRole;
import com.sizheng.afl.pojo.entity.User;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.service.IBusinessRoleService;
import com.sizheng.afl.util.DateUtil;

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

			com.sizheng.afl.pojo.entity.Service service = hibernateTemplate.get(
					com.sizheng.afl.pojo.entity.Service.class, Long.parseLong(id));

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

}
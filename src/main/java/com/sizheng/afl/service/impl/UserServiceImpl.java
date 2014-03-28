/**
 * UserServiceImpl.java
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
import com.sizheng.afl.dao.IUserDao;
import com.sizheng.afl.pojo.constant.SysConstant;
import com.sizheng.afl.pojo.entity.BusinessConsumer;
import com.sizheng.afl.pojo.entity.User;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.service.IUserService;
import com.sizheng.afl.util.StringUtil;

/**
 * 【用户】业务逻辑实现.
 * 
 * @creation 2014年03月28日 10:02:03
 * @modification 2014年03月28日 10:02:03
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Service
@Transactional
public class UserServiceImpl extends BaseServiceImpl implements IUserService {

	private static Logger logger = Logger.getLogger(UserServiceImpl.class);

	@Autowired
	IUserDao userDao;

	@Autowired
	ApiInvoker apiInvoker;

	@Override
	public boolean save(Locale locale, User user) {
		
		logger.debug("[业务逻辑层]添加【用户】");
		
		// TODO
		return true;
	}

	@Override
	public boolean delete(Locale locale, User user) {
		
		logger.debug("[业务逻辑层]删除【用户】");
		
		// TODO
		return true;
	}

	@Override
	public User get(Locale locale, User user) {
		
		logger.debug("[业务逻辑层]获取【用户】");
		
		// TODO
		return null;
	}

	@Override
	public boolean update(Locale locale, User user) {
		
		logger.debug("[业务逻辑层]更新【用户】");
		
		// TODO
		return true;
	}
	
	@Override
	public List<User> list(Locale locale) {

		logger.debug("[业务逻辑层]列举【用户】");

		// TODO
		return null;
	}
	
	@Override
	public List<Map<String, Object>> query(Locale locale, User user) {

		logger.debug("[业务逻辑层]查询【用户】(不分页)");

		// TODO
		return null;
	}

	@Override
	public PageResult paging(Locale locale, User user, Long start, Long limit) {

		logger.debug("[业务逻辑层]查询【用户】(分页)");

		PageResult pageResult = new PageResult();

		// TODO
		return pageResult;
	}
	
	@Override
	public boolean exists(Locale locale, User user) {
		
		logger.debug("[业务逻辑层]判断【用户】是否存在");
		
		// TODO
		return true;
	}

	@Override
	public boolean bill(Locale locale, String openId, String consumeCode) {

		User user = new User();
		user.setUserName(openId);

		List list = hibernateTemplate.findByExample(user);

		if (list.size() > 0) {

			User user2 = (User) list.get(0);

			if (StringUtil.isEmpty(user2.getConsumeCode())) {
				return false;
			}

			user2.setConsumeCode(null);

			hibernateTemplate.update(user2);// 删除关联消费码

			BusinessConsumer businessConsumer = new BusinessConsumer();
			businessConsumer.setConsumeCode(consumeCode);
			businessConsumer.setConsumerId(openId);

			List list2 = hibernateTemplate.findByExample(businessConsumer);

			if (list2.size() > 0) {
				BusinessConsumer businessConsumer2 = (BusinessConsumer) list2.get(0);
				businessConsumer2.setStatus(SysConstant.CONSUME_STATUS_STOP);

				hibernateTemplate.update(businessConsumer2);

				return true;
			}
		}

		return false;
	}
	
}
/**
 * BusinessServiceImpl.java
 */
package com.sizheng.afl.service.impl;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sizheng.afl.base.impl.BaseServiceImpl;
import com.sizheng.afl.component.ApiInvoker;
import com.sizheng.afl.component.PropUtil;
import com.sizheng.afl.dao.IBusinessDao;
import com.sizheng.afl.pojo.model.Business;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.service.IBusinessService;
import com.sizheng.afl.service.IQrcodeService;

/**
 * 【商家】业务逻辑实现.
 * 
 * @creation 2014年03月25日 02:46:32
 * @modification 2014年03月25日 02:46:32
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Service
@Transactional
public class BusinessServiceImpl extends BaseServiceImpl implements IBusinessService {

	private static Logger logger = Logger.getLogger(BusinessServiceImpl.class);

	@Autowired
	IBusinessDao businessDao;

	@Autowired
	ApiInvoker apiInvoker;

	@Autowired
	PropUtil propUtil;

	@Autowired
	IQrcodeService qrcodeService;

	@Override
	public boolean save(Locale locale, Business business) {

		logger.debug("[业务逻辑层]添加【商家】");

		com.sizheng.afl.pojo.entity.Business business2 = new com.sizheng.afl.pojo.entity.Business();
		business2.setOpenId(business.getOpenId());
		business2.setIsDeleted((short) 0);
		business2.setQrcodeLimit(propUtil.getQrcodeBusinessMaxDefault());

		hibernateTemplate.save(business2);

		return true;
	}

	@Override
	public boolean delete(Locale locale, Business business) {

		logger.debug("[业务逻辑层]删除【商家】");

		// TODO
		return true;
	}

	@Override
	public Business get(Locale locale, Business business) {

		logger.debug("[业务逻辑层]获取【商家】");

		com.sizheng.afl.pojo.entity.Business business2 = new com.sizheng.afl.pojo.entity.Business();
		business2.setOpenId(business.getOpenId());
		List list = hibernateTemplate.findByExample(business2);

		if (list.size() > 0) {
			com.sizheng.afl.pojo.entity.Business business3 = (com.sizheng.afl.pojo.entity.Business) list.get(0);

			Business business4 = new Business();
			BeanUtils.copyProperties(business3, business4);

			return business4;
		} else {
			logger.debug("没有获取到商家信息:openid[" + business.getOpenId() + "]");
		}

		return null;
	}

	@Override
	public boolean update(Locale locale, Business business) {

		logger.debug("[业务逻辑层]更新【商家】");

		com.sizheng.afl.pojo.entity.Business business2 = new com.sizheng.afl.pojo.entity.Business();
		business2.setOpenId(business.getOpenId());

		List list = hibernateTemplate.findByExample(business2);

		if (list.size() > 0) {
			business2 = (com.sizheng.afl.pojo.entity.Business) list.get(0);
			BeanUtils.copyProperties(business, business2, "qrcodeLimit");
			hibernateTemplate.update(business2);
		} else {
			BeanUtils.copyProperties(business, business2);
			business2.setQrcodeLimit(propUtil.getQrcodeBusinessMaxDefault());
			business2.setIsDeleted((short) 0);

			hibernateTemplate.save(business2);
		}

		return true;
	}

	@Override
	public List<Business> list(Locale locale) {

		logger.debug("[业务逻辑层]列举【商家】");

		// TODO
		return null;
	}

	@Override
	public List<Map<String, Object>> query(Locale locale, Business business) {

		logger.debug("[业务逻辑层]查询【商家】(不分页)");

		// TODO
		return null;
	}

	@Override
	public PageResult paging(Locale locale, Business business, Long start, Long limit) {

		logger.debug("[业务逻辑层]查询【商家】(分页)");

		PageResult pageResult = new PageResult();

		// TODO
		return pageResult;
	}

	@Override
	public boolean exists(Locale locale, Business business) {

		logger.debug("[业务逻辑层]判断【商家】是否存在");

		com.sizheng.afl.pojo.entity.Business business2 = new com.sizheng.afl.pojo.entity.Business();
		business2.setOpenId(business.getOpenId());

		List list = hibernateTemplate.findByExample(business2);

		return list.size() > 0;

	}

	@Override
	public boolean isQrcodeLimited(Locale locale, String openId) {

		Business business = new Business();
		business.setOpenId(openId);

		return qrcodeService.queryByOpenId(locale, openId).size() >= get(locale, business).getQrcodeLimit();
	}

}
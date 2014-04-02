/**
 * ResourcesServiceImpl.java
 */
package com.sizheng.afl.service.impl;

import java.util.List;
import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sizheng.afl.base.impl.BaseServiceImpl;
import com.sizheng.afl.component.ApiInvoker;
import com.sizheng.afl.dao.IResourcesDao;
import com.sizheng.afl.pojo.entity.Resources;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.service.IResourcesService;

/**
 * 【资源】业务逻辑实现.
 * 
 * @creation 2014年03月29日 05:00:05
 * @modification 2014年03月29日 05:00:05
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Service
@Transactional
public class ResourcesServiceImpl extends BaseServiceImpl implements IResourcesService {

	private static Logger logger = Logger.getLogger(ResourcesServiceImpl.class);

	@Autowired
	IResourcesDao resourcesDao;

	@Autowired
	ApiInvoker apiInvoker;

	@Override
	public boolean save(Locale locale, Resources resources) {
		
		logger.debug("[业务逻辑层]添加【资源】");
		
		// TODO
		return true;
	}

	@Override
	public boolean delete(Locale locale, Resources resources) {
		
		logger.debug("[业务逻辑层]删除【资源】");
		
		hibernateTemplate.delete(resources);

		return true;
	}

	@Override
	public Resources get(Locale locale, Resources resources) {
		
		logger.debug("[业务逻辑层]获取【资源】");
		
		// TODO
		return null;
	}

	@Override
	public boolean update(Locale locale, Resources resources) {
		
		logger.debug("[业务逻辑层]更新【资源】");
		
		// TODO
		return true;
	}
	
	@Override
	public List<Resources> list(Locale locale) {

		logger.debug("[业务逻辑层]列举【资源】");

		// TODO
		return null;
	}
	
	@Override
	public List<Resources> query(Locale locale, Resources resources) {

		logger.debug("[业务逻辑层]查询【资源】(不分页)");

		return hibernateTemplate.findByExample(resources);
	}

	@Override
	public PageResult paging(Locale locale, Resources resources, Long start, Long limit) {

		logger.debug("[业务逻辑层]查询【资源】(分页)");

		PageResult pageResult = new PageResult();

		// TODO
		return pageResult;
	}
	
	@Override
	public boolean exists(Locale locale, Resources resources) {
		
		logger.debug("[业务逻辑层]判断【资源】是否存在");
		
		return hibernateTemplate.findByExample(resources).size() > 0;
	}
	
}
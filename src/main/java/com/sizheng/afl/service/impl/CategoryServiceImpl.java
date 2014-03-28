/**
 * CategoryServiceImpl.java
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
import com.sizheng.afl.dao.ICategoryDao;
import com.sizheng.afl.pojo.entity.Category;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.service.ICategoryService;

/**
 * 【分类】业务逻辑实现.
 * 
 * @creation 2014年03月26日 01:06:34
 * @modification 2014年03月26日 01:06:34
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Service
@Transactional
public class CategoryServiceImpl extends BaseServiceImpl implements ICategoryService {

	private static Logger logger = Logger.getLogger(CategoryServiceImpl.class);

	@Autowired
	ICategoryDao categoryDao;

	@Autowired
	ApiInvoker apiInvoker;

	@Override
	public boolean save(Locale locale, Category category) {
		
		logger.debug("[业务逻辑层]添加【分类】");
		
		// TODO
		return true;
	}

	@Override
	public boolean delete(Locale locale, Category category) {
		
		logger.debug("[业务逻辑层]删除【分类】");
		
		// TODO
		return true;
	}

	@Override
	public Category get(Locale locale, Category category) {
		
		logger.debug("[业务逻辑层]获取【分类】");
		
		// TODO
		return null;
	}

	@Override
	public boolean update(Locale locale, Category category) {
		
		logger.debug("[业务逻辑层]更新【分类】");
		
		// TODO
		return true;
	}
	
	@Override
	public List<Category> list(Locale locale) {

		logger.debug("[业务逻辑层]列举【分类】");

		// TODO
		return null;
	}
	
	@Override
	public List<Map<String, Object>> query(Locale locale, Category category) {

		logger.debug("[业务逻辑层]查询【分类】(不分页)");

		// TODO
		return null;
	}

	@Override
	public PageResult paging(Locale locale, Category category, Long start, Long limit) {

		logger.debug("[业务逻辑层]查询【分类】(分页)");

		PageResult pageResult = new PageResult();

		// TODO
		return pageResult;
	}
	
	@Override
	public boolean exists(Locale locale, Category category) {
		
		logger.debug("[业务逻辑层]判断【分类】是否存在");
		
		// TODO
		return true;
	}

	@Override
	public List<com.sizheng.afl.pojo.entity.Category> listByType(String type) {

		logger.debug("[业务逻辑层]通过类型查询【分类】");

		com.sizheng.afl.pojo.entity.Category category = new com.sizheng.afl.pojo.entity.Category();
		category.setType(type);
		category.setIsDeleted((short) 0);

		return hibernateTemplate.findByExample(category);
	}

	@Override
	public com.sizheng.afl.pojo.entity.Category getBycategoryId(Long categoryId) {

		logger.debug("[业务逻辑层]通过id查询【分类】");

		return hibernateTemplate.get(com.sizheng.afl.pojo.entity.Category.class, categoryId);
	}
}
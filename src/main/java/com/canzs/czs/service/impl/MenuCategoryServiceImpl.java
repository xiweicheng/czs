/**
 * MenuCategoryServiceImpl.java
 */
package com.canzs.czs.service.impl;

import java.util.List;
import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.canzs.czs.base.impl.BaseServiceImpl;
import com.canzs.czs.component.ApiInvoker;
import com.canzs.czs.dao.IMenuCategoryDao;
import com.canzs.czs.pojo.entity.MenuCategory;
import com.canzs.czs.pojo.vo.PageResult;
import com.canzs.czs.service.IMenuCategoryService;
import com.canzs.czs.util.DateUtil;

/**
 * 【菜单分类】业务逻辑实现.
 * 
 * @creation 2014年03月29日 05:09:48
 * @modification 2014年03月29日 05:09:48
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Service
@Transactional
public class MenuCategoryServiceImpl extends BaseServiceImpl implements IMenuCategoryService {

	private static Logger logger = Logger.getLogger(MenuCategoryServiceImpl.class);

	@Autowired
	IMenuCategoryDao menuCategoryDao;

	@Autowired
	ApiInvoker apiInvoker;

	@Override
	public boolean save(Locale locale, MenuCategory menuCategory) {
		
		logger.debug("[业务逻辑层]添加【菜单分类】");
		
		menuCategory.setDateTime(DateUtil.now());
		menuCategory.setIsDelete((short) 0);

		hibernateTemplate.save(menuCategory);

		return true;
	}

	@Override
	public boolean delete(Locale locale, MenuCategory menuCategory) {
		
		logger.debug("[业务逻辑层]删除【菜单分类】");
		
		// TODO
		return true;
	}

	@Override
	public MenuCategory get(Locale locale, MenuCategory menuCategory) {
		
		logger.debug("[业务逻辑层]获取【菜单分类】");
		
		// TODO
		return null;
	}

	@Override
	public boolean update(Locale locale, MenuCategory menuCategory) {
		
		logger.debug("[业务逻辑层]更新【菜单分类】");
		
		// TODO
		return true;
	}
	
	@Override
	public List<MenuCategory> list(Locale locale) {

		logger.debug("[业务逻辑层]列举【菜单分类】");

		// TODO
		return null;
	}
	
	@Override
	public List<MenuCategory> query(Locale locale, MenuCategory menuCategory) {

		logger.debug("[业务逻辑层]查询【菜单分类】(不分页)");

		return hibernateTemplate.findByExample(menuCategory);

	}

	@Override
	public PageResult paging(Locale locale, MenuCategory menuCategory, Long start, Long limit) {

		logger.debug("[业务逻辑层]查询【菜单分类】(分页)");

		PageResult pageResult = new PageResult();

		// TODO
		return pageResult;
	}
	
	@Override
	public boolean exists(Locale locale, MenuCategory menuCategory) {
		
		logger.debug("[业务逻辑层]判断【菜单分类】是否存在");
		
		return hibernateTemplate.findByExample(menuCategory).size() > 0;

	}
	
}
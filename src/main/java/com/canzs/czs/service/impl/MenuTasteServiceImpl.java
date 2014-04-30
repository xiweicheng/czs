/**
 * MenuTasteServiceImpl.java
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
import com.canzs.czs.dao.IMenuTasteDao;
import com.canzs.czs.pojo.entity.MenuTaste;
import com.canzs.czs.pojo.vo.PageResult;
import com.canzs.czs.service.IMenuTasteService;
import com.canzs.czs.util.DateUtil;

/**
 * 【菜单口味】业务逻辑实现.
 * 
 * @creation 2014年03月29日 09:50:42
 * @modification 2014年03月29日 09:50:42
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Service
@Transactional
public class MenuTasteServiceImpl extends BaseServiceImpl implements IMenuTasteService {

	private static Logger logger = Logger.getLogger(MenuTasteServiceImpl.class);

	@Autowired
	IMenuTasteDao menuTasteDao;

	@Autowired
	ApiInvoker apiInvoker;

	@Override
	public boolean save(Locale locale, MenuTaste menuTaste) {
		
		logger.debug("[业务逻辑层]添加【菜单口味】");
		
		menuTaste.setDateTime(DateUtil.now());
		menuTaste.setIsDelete((short) 0);

		hibernateTemplate.save(menuTaste);

		return true;
	}

	@Override
	public boolean delete(Locale locale, MenuTaste menuTaste) {
		
		logger.debug("[业务逻辑层]删除【菜单口味】");
		
		// TODO
		return true;
	}

	@Override
	public MenuTaste get(Locale locale, MenuTaste menuTaste) {
		
		logger.debug("[业务逻辑层]获取【菜单口味】");
		
		// TODO
		return null;
	}

	@Override
	public boolean update(Locale locale, MenuTaste menuTaste) {
		
		logger.debug("[业务逻辑层]更新【菜单口味】");
		
		// TODO
		return true;
	}
	
	@Override
	public List<MenuTaste> list(Locale locale) {

		logger.debug("[业务逻辑层]列举【菜单口味】");

		// TODO
		return null;
	}
	
	@Override
	public List<MenuTaste> query(Locale locale, MenuTaste menuTaste) {

		logger.debug("[业务逻辑层]查询【菜单口味】(不分页)");

		return hibernateTemplate.findByExample(menuTaste);
	}

	@Override
	public PageResult paging(Locale locale, MenuTaste menuTaste, Long start, Long limit) {

		logger.debug("[业务逻辑层]查询【菜单口味】(分页)");

		PageResult pageResult = new PageResult();

		// TODO
		return pageResult;
	}
	
	@Override
	public boolean exists(Locale locale, MenuTaste menuTaste) {
		
		logger.debug("[业务逻辑层]判断【菜单口味】是否存在");
		
		return hibernateTemplate.findByExample(menuTaste).size() > 0;
	}
	
}
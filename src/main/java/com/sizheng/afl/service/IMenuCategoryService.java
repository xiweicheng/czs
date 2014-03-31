/**
 * IMenuCategoryService.java
 */
package com.sizheng.afl.service;

import java.util.List;
import java.util.Locale;

import com.sizheng.afl.base.IBaseService;
import com.sizheng.afl.pojo.entity.MenuCategory;
import com.sizheng.afl.pojo.vo.PageResult;

/**
 * 【菜单分类】业务逻辑接口.
 * 
 * @creation 2014年03月29日 05:09:48
 * @modification 2014年03月29日 05:09:48
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IMenuCategoryService extends IBaseService {

	/**
	 * 创建【菜单分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:09:48
	 * @modification 2014年03月29日 05:09:48
	 * @param menuCategory
	 * @return
	 */
	boolean save(Locale locale, MenuCategory menuCategory);

	/**
	 * 删除【菜单分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:09:48
	 * @modification 2014年03月29日 05:09:48
	 * @param menuCategory
	 * @return
	 */
	boolean delete(Locale locale, MenuCategory menuCategory);

	/**
	 * 获取【菜单分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:09:48
	 * @modification 2014年03月29日 05:09:48
	 * @param menuCategory
	 * @return
	 */
	MenuCategory get(Locale locale, MenuCategory menuCategory);
	
	/**
	 * 更新【菜单分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:09:48
	 * @modification 2014年03月29日 05:09:48
	 * @param menuCategory
	 * @return
	 */
	boolean update(Locale locale, MenuCategory menuCategory);
	
	/**
	 * 列举【菜单分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:09:48
	 * @modification 2014年03月29日 05:09:48
	 * @param menuCategory
	 * @return
	 */
	List<MenuCategory> list(Locale locale);

	/**
	 * 查询【菜单分类】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:09:48
	 * @modification 2014年03月29日 05:09:48
	 * @param menuCategory
	 * @return
	 */
	List<MenuCategory> query(Locale locale, MenuCategory menuCategory);

	/**
	 * 查询【菜单分类】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:09:48
	 * @modification 2014年03月29日 05:09:48
	 * @param menuCategory
	 * @return
	 */
	PageResult paging(Locale locale, MenuCategory menuCategory, Long start, Long limit);

	/**
	 * 判断【菜单分类】是否存在.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:09:48
	 * @modification 2014年03月29日 05:09:48
	 * @param menuCategory
	 * @return
	 */
	boolean exists(Locale locale, MenuCategory menuCategory);
}

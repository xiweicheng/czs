/**
 * IMenuTasteService.java
 */
package com.sizheng.afl.service;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.sizheng.afl.base.IBaseService;
import com.sizheng.afl.pojo.entity.MenuTaste;
import com.sizheng.afl.pojo.vo.PageResult;

/**
 * 【菜单口味】业务逻辑接口.
 * 
 * @creation 2014年03月29日 09:50:42
 * @modification 2014年03月29日 09:50:42
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IMenuTasteService extends IBaseService {

	/**
	 * 创建【菜单口味】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 09:50:42
	 * @modification 2014年03月29日 09:50:42
	 * @param menuTaste
	 * @return
	 */
	boolean save(Locale locale, MenuTaste menuTaste);

	/**
	 * 删除【菜单口味】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 09:50:42
	 * @modification 2014年03月29日 09:50:42
	 * @param menuTaste
	 * @return
	 */
	boolean delete(Locale locale, MenuTaste menuTaste);

	/**
	 * 获取【菜单口味】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 09:50:42
	 * @modification 2014年03月29日 09:50:42
	 * @param menuTaste
	 * @return
	 */
	MenuTaste get(Locale locale, MenuTaste menuTaste);
	
	/**
	 * 更新【菜单口味】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 09:50:42
	 * @modification 2014年03月29日 09:50:42
	 * @param menuTaste
	 * @return
	 */
	boolean update(Locale locale, MenuTaste menuTaste);
	
	/**
	 * 列举【菜单口味】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 09:50:42
	 * @modification 2014年03月29日 09:50:42
	 * @param menuTaste
	 * @return
	 */
	List<MenuTaste> list(Locale locale);

	/**
	 * 查询【菜单口味】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 09:50:42
	 * @modification 2014年03月29日 09:50:42
	 * @param menuTaste
	 * @return
	 */
	List<MenuTaste> query(Locale locale, MenuTaste menuTaste);

	/**
	 * 查询【菜单口味】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 09:50:42
	 * @modification 2014年03月29日 09:50:42
	 * @param menuTaste
	 * @return
	 */
	PageResult paging(Locale locale, MenuTaste menuTaste, Long start, Long limit);

	/**
	 * 判断【菜单口味】是否存在.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 09:50:42
	 * @modification 2014年03月29日 09:50:42
	 * @param menuTaste
	 * @return
	 */
	boolean exists(Locale locale, MenuTaste menuTaste);
}

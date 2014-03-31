/**
 * IMenuService.java
 */
package com.sizheng.afl.service;

import java.util.List;
import java.util.Locale;

import org.springframework.web.multipart.MultipartFile;

import com.sizheng.afl.base.IBaseService;
import com.sizheng.afl.pojo.entity.Menu;
import com.sizheng.afl.pojo.vo.PageResult;

/**
 * 【菜单】业务逻辑接口.
 * 
 * @creation 2014年03月29日 08:37:31
 * @modification 2014年03月29日 08:37:31
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IMenuService extends IBaseService {

	/**
	 * 创建【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @param menu
	 * @return
	 */
	boolean save(Locale locale, Menu menu);

	/**
	 * 删除【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @param menu
	 * @return
	 */
	boolean delete(Locale locale, Menu menu);

	/**
	 * 获取【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @param menu
	 * @return
	 */
	Menu get(Locale locale, Menu menu);
	
	/**
	 * 更新【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @param menu
	 * @return
	 */
	boolean update(Locale locale, Menu menu);
	
	/**
	 * 列举【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @param menu
	 * @return
	 */
	List<Menu> list(Locale locale);

	/**
	 * 查询【菜单】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @param menu
	 * @return
	 */
	List<Menu> query(Locale locale, Menu menu);

	/**
	 * 查询【菜单】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @param menu
	 * @return
	 */
	PageResult paging(Locale locale, Menu menu, Long start, Long limit);

	/**
	 * 判断【菜单】是否存在.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @param menu
	 * @return
	 */
	boolean exists(Locale locale, Menu menu);

	/**
	 * 上传图片.
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月29日 下午4:14:41
	 * @modification 2014年3月29日 下午4:14:41
	 * @param calcServerBaseUrl
	 * @param realPath TODO
	 * @param imageFile
	 * @param locale
	 * @param openId TODO
	 * @return
	 */
	boolean upload(String calcServerBaseUrl, String realPath, MultipartFile imageFile, Locale locale, String openId);
}

/**
 * IResourcesService.java
 */
package com.canzs.czs.service;

import java.util.List;
import java.util.Locale;

import com.canzs.czs.base.IBaseService;
import com.canzs.czs.pojo.entity.Resources;
import com.canzs.czs.pojo.vo.PageResult;

/**
 * 【资源】业务逻辑接口.
 * 
 * @creation 2014年03月29日 05:00:05
 * @modification 2014年03月29日 05:00:05
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IResourcesService extends IBaseService {

	/**
	 * 创建【资源】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:00:05
	 * @modification 2014年03月29日 05:00:05
	 * @param resources
	 * @return
	 */
	boolean save(Locale locale, Resources resources);

	/**
	 * 删除【资源】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:00:05
	 * @modification 2014年03月29日 05:00:05
	 * @param resources
	 * @return
	 */
	boolean delete(Locale locale, Resources resources);

	/**
	 * 获取【资源】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:00:05
	 * @modification 2014年03月29日 05:00:05
	 * @param resources
	 * @return
	 */
	Resources get(Locale locale, Resources resources);
	
	/**
	 * 更新【资源】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:00:05
	 * @modification 2014年03月29日 05:00:05
	 * @param resources
	 * @return
	 */
	boolean update(Locale locale, Resources resources);
	
	/**
	 * 列举【资源】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:00:05
	 * @modification 2014年03月29日 05:00:05
	 * @param resources
	 * @return
	 */
	List<Resources> list(Locale locale);

	/**
	 * 查询【资源】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:00:05
	 * @modification 2014年03月29日 05:00:05
	 * @param resources
	 * @return
	 */
	List<Resources> query(Locale locale, Resources resources);

	/**
	 * 查询【资源】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:00:05
	 * @modification 2014年03月29日 05:00:05
	 * @param resources
	 * @return
	 */
	PageResult paging(Locale locale, Resources resources, Long start, Long limit);

	/**
	 * 判断【资源】是否存在.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:00:05
	 * @modification 2014年03月29日 05:00:05
	 * @param resources
	 * @return
	 */
	boolean exists(Locale locale, Resources resources);

	boolean isLimited(Locale locale, String openId);
}

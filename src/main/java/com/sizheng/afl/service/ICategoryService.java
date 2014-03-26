/**
 * ICategoryService.java
 */
package com.sizheng.afl.service;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.sizheng.afl.base.IBaseService;
import com.sizheng.afl.pojo.model.Category;
import com.sizheng.afl.pojo.vo.PageResult;

/**
 * 【分类】业务逻辑接口.
 * 
 * @creation 2014年03月26日 01:06:33
 * @modification 2014年03月26日 01:06:33
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface ICategoryService extends IBaseService {

	/**
	 * 创建【分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月26日 01:06:33
	 * @modification 2014年03月26日 01:06:33
	 * @param category
	 * @return
	 */
	boolean save(Locale locale, Category category);

	/**
	 * 删除【分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月26日 01:06:33
	 * @modification 2014年03月26日 01:06:33
	 * @param category
	 * @return
	 */
	boolean delete(Locale locale, Category category);

	/**
	 * 获取【分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月26日 01:06:33
	 * @modification 2014年03月26日 01:06:33
	 * @param category
	 * @return
	 */
	Category get(Locale locale, Category category);
	
	/**
	 * 更新【分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月26日 01:06:33
	 * @modification 2014年03月26日 01:06:33
	 * @param category
	 * @return
	 */
	boolean update(Locale locale, Category category);
	
	/**
	 * 列举【分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月26日 01:06:33
	 * @modification 2014年03月26日 01:06:33
	 * @param category
	 * @return
	 */
	List<Category> list(Locale locale);

	/**
	 * 查询【分类】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月26日 01:06:33
	 * @modification 2014年03月26日 01:06:33
	 * @param category
	 * @return
	 */
	List<Map<String, Object>> query(Locale locale, Category category);

	/**
	 * 查询【分类】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月26日 01:06:33
	 * @modification 2014年03月26日 01:06:33
	 * @param category
	 * @return
	 */
	PageResult paging(Locale locale, Category category, Long start, Long limit);

	/**
	 * 判断【分类】是否存在.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月26日 01:06:33
	 * @modification 2014年03月26日 01:06:33
	 * @param category
	 * @return
	 */
	boolean exists(Locale locale, Category category);

	List<com.sizheng.afl.pojo.entity.Category> listByType(String string);
}

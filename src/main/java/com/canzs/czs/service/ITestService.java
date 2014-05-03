/**
 * ITestService.java
 */
package com.canzs.czs.service;

import java.util.List;
import java.util.Locale;

import com.canzs.czs.base.IBaseService;
import com.canzs.czs.pojo.model.Test;
import com.canzs.czs.pojo.vo.PageResult;

/**
 * 【测试】业务逻辑接口.
 * 
 * @creation 2014年03月19日 02:07:25
 * @modification 2014年03月19日 02:07:25
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface ITestService extends IBaseService {

	/**
	 * 创建【测试】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月19日 02:07:25
	 * @modification 2014年03月19日 02:07:25
	 * @param test
	 * @return
	 */
	boolean save(Locale locale, Test test);

	/**
	 * 删除【测试】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月19日 02:07:25
	 * @modification 2014年03月19日 02:07:25
	 * @param test
	 * @return
	 */
	boolean delete(Locale locale, Test test);

	/**
	 * 获取【测试】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月19日 02:07:25
	 * @modification 2014年03月19日 02:07:25
	 * @param test
	 * @return
	 */
	Test get(Locale locale, Test test);
	
	/**
	 * 更新【测试】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月19日 02:07:25
	 * @modification 2014年03月19日 02:07:25
	 * @param test
	 * @return
	 */
	boolean update(Locale locale, Test test);
	
	/**
	 * 列举【测试】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月19日 02:07:25
	 * @modification 2014年03月19日 02:07:25
	 * @param test
	 * @return
	 */
	List<Test> list(Locale locale);

	/**
	 * 查询【测试】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月19日 02:07:25
	 * @modification 2014年03月19日 02:07:25
	 * @param test
	 * @return
	 */
	List<Test> query(Locale locale, Test test);

	/**
	 * 查询【测试】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月19日 02:07:25
	 * @modification 2014年03月19日 02:07:25
	 * @param test
	 * @return
	 */
	PageResult paging(Locale locale, Test test, Long start, Long limit);

	/**
	 * 判断【测试】是否存在.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月19日 02:07:25
	 * @modification 2014年03月19日 02:07:25
	 * @param test
	 * @return
	 */
	boolean exists(Locale locale, Test test);
}

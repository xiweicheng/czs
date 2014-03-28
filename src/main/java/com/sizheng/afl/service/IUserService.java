/**
 * IUserService.java
 */
package com.sizheng.afl.service;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.sizheng.afl.base.IBaseService;
import com.sizheng.afl.pojo.entity.User;
import com.sizheng.afl.pojo.vo.PageResult;

/**
 * 【用户】业务逻辑接口.
 * 
 * @creation 2014年03月28日 10:02:03
 * @modification 2014年03月28日 10:02:03
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IUserService extends IBaseService {

	/**
	 * 创建【用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月28日 10:02:03
	 * @modification 2014年03月28日 10:02:03
	 * @param user
	 * @return
	 */
	boolean save(Locale locale, User user);

	/**
	 * 删除【用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月28日 10:02:03
	 * @modification 2014年03月28日 10:02:03
	 * @param user
	 * @return
	 */
	boolean delete(Locale locale, User user);

	/**
	 * 获取【用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月28日 10:02:03
	 * @modification 2014年03月28日 10:02:03
	 * @param user
	 * @return
	 */
	User get(Locale locale, User user);
	
	/**
	 * 更新【用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月28日 10:02:03
	 * @modification 2014年03月28日 10:02:03
	 * @param user
	 * @return
	 */
	boolean update(Locale locale, User user);
	
	/**
	 * 列举【用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月28日 10:02:03
	 * @modification 2014年03月28日 10:02:03
	 * @param user
	 * @return
	 */
	List<User> list(Locale locale);

	/**
	 * 查询【用户】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月28日 10:02:03
	 * @modification 2014年03月28日 10:02:03
	 * @param user
	 * @return
	 */
	List<Map<String, Object>> query(Locale locale, User user);

	/**
	 * 查询【用户】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月28日 10:02:03
	 * @modification 2014年03月28日 10:02:03
	 * @param user
	 * @return
	 */
	PageResult paging(Locale locale, User user, Long start, Long limit);

	/**
	 * 判断【用户】是否存在.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月28日 10:02:03
	 * @modification 2014年03月28日 10:02:03
	 * @param user
	 * @return
	 */
	boolean exists(Locale locale, User user);

	boolean bill(Locale locale, String openId, String consumeCode);
}

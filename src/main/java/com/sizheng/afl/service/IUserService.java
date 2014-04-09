/**
 * IUserService.java
 */
package com.sizheng.afl.service;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.sizheng.afl.base.IBaseService;
import com.sizheng.afl.pojo.entity.BusinessConsumer;
import com.sizheng.afl.pojo.entity.Favorites;
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

	/**
	 * 结账
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月3日 下午9:54:19
	 * @modification 2014年4月3日 下午9:54:19
	 * @param locale
	 * @param openId
	 * @param consumeCode
	 * @return
	 */
	Double bill(Locale locale, String openId, String consumeCode);

	/**
	 * 获取顾客所在商家的ID.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月3日 下午9:47:41
	 * @modification 2014年4月3日 下午9:47:41
	 * @param locale
	 * @param openId
	 * @return
	 */
	String getBusiness(Locale locale, String openId);

	/**
	 * 申请结账.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 上午11:54:34
	 * @modification 2014年4月7日 上午11:54:34
	 * @param locale
	 * @param openId
	 * @param consumeCode
	 * @param type
	 * @return
	 */
	Boolean billReq(Locale locale, String openId, String consumeCode, String type);

	/**
	 * 收藏 赞不赞.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月9日 上午11:38:33
	 * @modification 2014年4月9日 上午11:38:33
	 * @param locale
	 * @param favorites
	 * @return
	 */
	boolean store(Locale locale, Favorites favorites);

	/**
	 * 获取收藏.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月9日 上午11:56:08
	 * @modification 2014年4月9日 上午11:56:08
	 * @param locale
	 * @param favorites
	 * @return
	 */
	List<Favorites> getFavorites(Locale locale, Favorites favorites);

	/**
	 * 
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月9日 下午9:46:53
	 * @modification 2014年4月9日 下午9:46:53
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	BusinessConsumer getBusinessConsumer(Locale locale, BusinessConsumer businessConsumer);

	/**
	 * 统计次数.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月9日 下午10:31:46
	 * @modification 2014年4月9日 下午10:31:46
	 * @param locale
	 * @param favorites
	 * @return
	 */
	long getCount(Locale locale, Favorites favorites);
}

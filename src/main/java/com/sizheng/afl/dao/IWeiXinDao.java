/**
 * IWeiXinDao.java
 */
package com.sizheng.afl.dao;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.sizheng.afl.pojo.model.WeiXin;
import com.sizheng.afl.pojo.model.WeiXinUserInfo;

/**
 * 【微信】持久化接口层.
 * 
 * @creation 2014年03月22日 01:02:21
 * @modification 2014年03月22日 01:02:21
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IWeiXinDao {

	/**
	 * 查询【微信】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月22日 01:02:21
	 * @modification 2014年03月22日 01:02:21
	 * @param locale
	 * @param weiXin
	 * @param start
	 * @param limit
	 * @return
	 */
	List<Map<String, Object>> query(Locale locale, WeiXin weiXin, Long start, Long limit);

	/**
	 * 查询总数查询【微信】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月22日 01:02:21
	 * @modification 2014年03月22日 01:02:21
	 * @param locale
	 * @param weiXin
	 * @return
	 */
	long queryCount(Locale locale, WeiXin weiXin);

	boolean saveSubscriber(String userName, String createTime);

	boolean deleteSubscriber(String userName, String createTime);

	boolean saveWeiXinUserInfo(WeiXinUserInfo userInfo);

}

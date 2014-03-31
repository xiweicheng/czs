/**
 * IResourcesDao.java
 */
package com.sizheng.afl.dao;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.sizheng.afl.pojo.entity.Resources;

/**
 * 【资源】持久化接口层.
 * 
 * @creation 2014年03月29日 05:00:05
 * @modification 2014年03月29日 05:00:05
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IResourcesDao {

	/**
	 * 查询【资源】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:00:05
	 * @modification 2014年03月29日 05:00:05
	 * @param locale
	 * @param resources
	 * @param start
	 * @param limit
	 * @return
	 */
	List<Map<String, Object>> query(Locale locale, Resources resources, Long start, Long limit);

	/**
	 * 查询总数查询【资源】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:00:05
	 * @modification 2014年03月29日 05:00:05
	 * @param locale
	 * @param resources
	 * @return
	 */
	long queryCount(Locale locale, Resources resources);
	
}

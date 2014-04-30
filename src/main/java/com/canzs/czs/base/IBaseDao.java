package com.canzs.czs.base;

import java.util.List;
import java.util.Map;

/**
 * 数据持久化接口.
 * 
 * @creation 2013年12月28日 下午9:18:41
 * @modification 2013年12月28日 下午9:18:41
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 *
 */
public interface IBaseDao {

	/**
	 * 查询并且将结果封装到List<Map<String, Object>>.
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public List<Map<String, Object>> getMapList(final String sql, final Object... params);

	/**
	 * 查询并且将结果封装到List<Map<String, Object>>.
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public List<Map<String, Object>> getMapList(StringBuffer sqlSb, final Object... params);

	/**
	 * 查询并且将结果封装到Map<String, Object>.
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public Map<String, Object> getMap(final String sql, final Object... params);

	/**
	 * 查询并且将结果封装到Map<String, Object>.
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public Map<String, Object> getMap(StringBuffer sqlSb, final Object... params);

	/**
	 * 查询单个值并且将结果封装到Object.
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public Object getObject(final String sql, final Object... params);

	/**
	 * 查询单个值并且将结果封装到Object.
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public Object getObject(StringBuffer sqlSb, final Object... params);

	/**
	 * 查询单个值并且将结果封装到String.
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public String getString(String sql, Object... params);

	/**
	 * 查询单个值并且将结果封装到String.
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public String getString(StringBuffer sqlSb, final Object... params);

	/**
	 * 查询单个值并且将结果封装到long.
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public Long getLong(String sql, Object... params);

	/**
	 * 查询单个值并且将结果封装到long.
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public Long getLong(StringBuffer sqlSb, final Object... params);

	/**
	 * 查询结果数.
	 * 
	 * @author xiweicheng
	 * @creation 2013年12月24日 下午2:04:29
	 * @modification 2013年12月24日 下午2:04:29
	 * @param sql
	 * @param params
	 * @return
	 */
	long getCount(String sql, Object... params);

	/**
	 * 查询结果数.
	 * 
	 * @author xiweicheng
	 * @creation 2013年12月2日 下午1:11:05
	 * @modification 2013年12月2日 下午1:11:05
	 * @param sqlSb
	 * @param params
	 * @return
	 */
	public long getCount(StringBuffer sqlSb, final Object... params);

	/**
	 * 查询单个值并且将结果封装到double.
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public Double getDouble(String sql, Object... params);

	/**
	 * 查询单个值并且将结果封装到double.
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public Double getDouble(StringBuffer sqlSb, final Object... params);

	/**
	 * 更新.
	 * 
	 * @author xiweicheng
	 * @creation 2013年11月27日 下午2:45:33
	 * @modification 2013年11月27日 下午2:45:33
	 * @param sql
	 * @param params
	 * @return
	 */
	int update(final String sql, final Object... params);

	/**
	 * 更新.
	 * 
	 * @author xiweicheng
	 * @creation 2013年11月27日 下午2:49:42
	 * @modification 2013年11月27日 下午2:49:42
	 * @param sqlSb
	 * @param params
	 * @return
	 */
	int update(StringBuffer sqlSb, Object... params);

	/**
	 * 批处理操作.
	 * 
	 * @author xiweicheng
	 * @creation 2013年12月27日 下午3:06:43
	 * @modification 2013年12月27日 下午3:06:43
	 * @param sqlSb
	 * @param params
	 * @return
	 */
	int batch(StringBuffer sqlSb, Object[][] params);

	/**
	 * 批处理操作.
	 * 
	 * @author xiweicheng
	 * @creation 2013年12月27日 下午3:06:43
	 * @modification 2013年12月27日 下午3:06:43
	 * @param sqlSb
	 * @param params
	 * @return
	 */
	int batch(final String sql, final Object[][] params);

	/**
	 * 批处理操作.
	 * 
	 * @author xiweicheng
	 * @creation 2013年12月27日 下午3:37:43
	 * @modification 2013年12月27日 下午3:37:43
	 * @param sql
	 * @param params
	 * @return
	 */
	int batch(final String sql, final List<List<Object>> params);

	/**
	 * 批处理操作.
	 * 
	 * @author xiweicheng
	 * @creation 2013年12月27日 下午3:38:13
	 * @modification 2013年12月27日 下午3:38:13
	 * @param sql
	 * @param params
	 * @return
	 */
	int batch(StringBuffer sqlSb, List<List<Object>> params);

	/**
	 * 判断存在.
	 * 
	 * @author xiweicheng
	 * @creation 2013年12月2日 下午1:13:52
	 * @modification 2013年12月2日 下午1:13:52
	 * @param sqlSb
	 * @param params
	 * @return
	 */
	boolean exists(final String sql, final Object... params);

	/**
	 * 判断存在.
	 * 
	 * @author xiweicheng
	 * @creation 2013年12月2日 下午1:13:52
	 * @modification 2013年12月2日 下午1:13:52
	 * @param sqlSb
	 * @param params
	 * @return
	 */
	boolean exists(StringBuffer sqlSb, Object... params);

}

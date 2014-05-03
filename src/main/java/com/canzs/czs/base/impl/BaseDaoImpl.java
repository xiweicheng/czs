/**
 * BaseDaoImpl.java
 */
package com.canzs.czs.base.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.jdbc.Work;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.canzs.czs.base.IBaseDao;
import com.canzs.czs.base.ex.DaoRuntimeException;
import com.canzs.czs.base.ex.ServiceRuntimeException;
import com.canzs.czs.component.MessageUtil;
import com.canzs.czs.pojo.constant.SysConstant;
import com.canzs.czs.util.JsonUtil;
import com.canzs.czs.util.NumberUtil;
import com.canzs.czs.util.SqlUtil;

/**
 * 数据持久化层的抽象基类.
 * 
 * @creation 2013年12月24日 上午11:11:50
 * @modification 2013年12月24日 上午11:11:50
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
public abstract class BaseDaoImpl implements IBaseDao {

	@Autowired
	protected HibernateTemplate hibernateTemplate;

	@Autowired
	protected JdbcTemplate jdbcTemplate;

	@Autowired
	protected MessageUtil messageUtil;

	private static Logger logger = Logger.getLogger(BaseDaoImpl.class);

	protected Session getSession() {
		return hibernateTemplate.getSessionFactory().getCurrentSession();
	}

	@Override
	public List<Map<String, Object>> getMapList(final String sql, final Object... params) {

		if (logger.isDebugEnabled()) {
			logger.debug(SqlUtil.toPrettySql(sql));
			logger.debug(SqlUtil.toJoinParams(params));
		}

		final List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();

		getSession().doWork(new Work() {

			@Override
			public void execute(Connection conn) throws SQLException {

				QueryRunner queryRunner = new QueryRunner();

				try {
					mapList.addAll(queryRunner.query(conn, sql, new MapListHandler(), params));
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		});

		if (logger.isDebugEnabled()) {
			logger.debug("多行[getMapList]数据:" + SysConstant.NEW_LINE + JsonUtil.toPrettyJson(JsonUtil.toJson(mapList)));
		}

		return mapList;
	}

	@Override
	public List<Map<String, Object>> getMapList(StringBuffer sqlSb, Object... params) {
		return getMapList(sqlSb.toString(), params);
	}

	@Override
	public Map<String, Object> getMap(final String sql, final Object... params) {

		if (logger.isDebugEnabled()) {
			logger.debug(SqlUtil.toPrettySql(sql));
			logger.debug(SqlUtil.toJoinParams(params));
		}

		final List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();

		getSession().doWork(new Work() {

			@Override
			public void execute(Connection conn) throws SQLException {

				QueryRunner queryRunner = new QueryRunner();

				try {
					mapList.add(queryRunner.query(conn, sql, new MapHandler(), params));
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		});

		Map<String, Object> map = null;

		if (mapList.size() > 0) {
			map = mapList.get(0);
		}

		if (map == null) {
			map = Collections.emptyMap();
		}


		if (logger.isDebugEnabled()) {
			logger.debug("单行[getMap]数据:" + SysConstant.NEW_LINE + JsonUtil.toPrettyJson(JsonUtil.toJson(map)));
		}

		return map;
	}

	@Override
	public Map<String, Object> getMap(StringBuffer sqlSb, Object... params) {
		return getMap(sqlSb.toString(), params);
	}

	@Override
	public Object getObject(final String sql, final Object... params) {

		if (logger.isDebugEnabled()) {
			logger.debug(SqlUtil.toPrettySql(sql));
			logger.debug(SqlUtil.toJoinParams(params));
		}

		final List<Object> mapList = new ArrayList<Object>();

		getSession().doWork(new Work() {

			@Override
			public void execute(Connection conn) throws SQLException {

				QueryRunner queryRunner = new QueryRunner();

				try {
					mapList.add(queryRunner.query(conn, sql, new ScalarHandler(), params));
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		});

		Object val = mapList.size() == 0 ? null : mapList.get(0);

		if (logger.isDebugEnabled()) {
			logger.debug("获取对象[getObject]单个值: " + String.valueOf(val));
		}

		return val;
	}

	@Override
	public Object getObject(StringBuffer sqlSb, Object... params) {
		return getObject(sqlSb.toString(), params);
	}

	@Override
	public String getString(String sql, Object... params) {

		Object object = getObject(sql, params);

		if (object == null) {
			return null;
		}

		if (object instanceof String) {
			return (String) object;
		} else {
			return object.toString();
		}
	}

	@Override
	public String getString(StringBuffer sqlSb, Object... params) {
		return getString(sqlSb.toString(), params);
	}

	@Override
	public Long getLong(String sql, Object... params) {

		Object object = getObject(sql, params);

		if (object == null) {
			return null;
		}

		if (object instanceof Long) {
			return (Long) object;
		} else {
			return NumberUtil.toLong(object);
		}
	}

	@Override
	public Long getLong(StringBuffer sqlSb, Object... params) {
		return getLong(sqlSb.toString(), params);
	}

	@Override
	public long getCount(String sql, Object... params) {

		Long cnt = getLong(sql, params);

		return cnt == null ? 0 : cnt.longValue();
	}

	@Override
	public long getCount(StringBuffer sqlSb, Object... params) {

		Long cnt = getCount(sqlSb.toString(), params);

		return cnt == null ? 0 : cnt.longValue();
	}

	@Override
	public Double getDouble(String sql, Object... params) {

		Object object = getObject(sql, params);

		if (object == null) {
			return null;
		}

		if (object instanceof Double) {
			return (Double) object;
		} else {
			return NumberUtil.toDouble(object);
		}
	}

	@Override
	public Double getDouble(StringBuffer sqlSb, Object... params) {
		return getDouble(sqlSb.toString(), params);
	}

	@Override
	public int update(final String sql, final Object... params) {

		if (logger.isDebugEnabled()) {
			logger.debug(SqlUtil.toPrettySql(sql));
			logger.debug(SqlUtil.toJoinParams(params));
		}

		final List<Integer> list = new ArrayList<Integer>();

		getSession().doWork(new Work() {

			@Override
			public void execute(Connection conn) throws SQLException {

				QueryRunner queryRunner = new QueryRunner();

				try {
					list.add(queryRunner.update(conn, sql, params));
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		});

		int cnt = list.size() > 0 ? list.get(0) : 0;

		if (logger.isDebugEnabled()) {
			logger.debug("更新[update]影响行数: " + cnt);
		}

		return cnt;
	}

	@Override
	public int update(StringBuffer sqlSb, Object... params) {
		return update(sqlSb.toString(), params);
	}

	@Override
	public boolean exists(String sql, Object... params) {
		return getCount(sql, params) > 0;
	}

	@Override
	public boolean exists(StringBuffer sqlSb, Object... params) {
		return exists(sqlSb.toString(), params);
	}

	@Override
	public int batch(StringBuffer sqlSb, Object[][] params) {
		return batch(sqlSb.toString(), params);
	}

	@Override
	public int batch(final String sql, final Object[][] params) {

		if (logger.isDebugEnabled()) {
			logger.debug(SqlUtil.toPrettySql(sql));
			logger.debug(SqlUtil.toJoinBatchParams(params));
		}

		final List<Integer> list = new ArrayList<Integer>();

		getSession().doWork(new Work() {

			@Override
			public void execute(Connection conn) throws SQLException {

				QueryRunner queryRunner = new QueryRunner();

				try {
					int[] batch = queryRunner.batch(conn, sql, params);
					int cnt = 0;

					if (batch != null) {
						for (int val : batch) {
							cnt += val;
						}
					}

					list.add(cnt);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		});

		int cnt = list.size() > 0 ? list.get(0) : 0;

		if (logger.isDebugEnabled()) {
			logger.debug("批处理[batch]影响行数: " + cnt);
		}

		return cnt;
	}

	@Override
	public int batch(final String sql, final List<List<Object>> params) {

		if (params != null && params.size() > 0 && params.get(0).size() > 0) {
			Object[][] objects = new Object[params.size()][params.get(0).size()];

			int i = 0;

			for (List<Object> objList : params) {
				objects[i++] = objList.toArray();
			}

			return batch(sql, objects);
		} else {
			return 0;
		}
	}

	@Override
	public int batch(StringBuffer sqlSb, List<List<Object>> params) {
		return batch(sqlSb.toString(), params);
	}

	/**
	 * 当为真时抛出运行时异常.
	 * 
	 * @author xiweicheng
	 * @creation 2013年12月30日 下午5:29:14
	 * @modification 2013年12月30日 下午5:29:14
	 * @param when
	 * @param exMsg
	 */
	protected void throwRuntimeExceptionWhenTrue(boolean when, String exMsg) {
		if (when) {
			throw new DaoRuntimeException(exMsg);
		}
	}

	/**
	 * 当为false时抛出运行时异常.
	 * 
	 * @author xiweicheng
	 * @creation 2013年12月30日 下午5:29:14
	 * @modification 2013年12月30日 下午5:29:14
	 * @param when
	 * @param exMsg
	 */
	protected void throwRuntimeExceptionWhenFalse(boolean when, String exMsg) {
		if (!when) {
			throw new ServiceRuntimeException(exMsg);
		}
	}

	/**
	 * 当Object为null时抛出运行时异常.
	 * 
	 * @author xiweicheng
	 * @creation 2013年12月30日 下午5:29:14
	 * @modification 2013年12月30日 下午5:29:14
	 * @param when
	 * @param exMsg
	 */
	protected void throwRuntimeExceptionWhenNull(Object object, String exMsg) {
		if (object == null) {
			throw new ServiceRuntimeException(exMsg);
		}
	}

	/**
	 * 抛出运行时异常.
	 * 
	 * @author xiweicheng
	 * @creation 2013年12月30日 下午5:29:14
	 * @modification 2013年12月30日 下午5:29:14
	 * @param exMsg
	 */
	protected void throwRuntimeException(String exMsg) {
		throw new ServiceRuntimeException(exMsg);
	}

}

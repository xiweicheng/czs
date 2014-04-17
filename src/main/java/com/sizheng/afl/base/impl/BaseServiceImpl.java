/**
 * BaseServiceImpl.java
 */
package com.sizheng.afl.base.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.sizheng.afl.base.IBaseService;
import com.sizheng.afl.base.ex.ServiceRuntimeException;
import com.sizheng.afl.component.MessageUtil;

/**
 * 业务逻辑层基类.
 * 
 * @creation 2013年12月24日 上午11:12:13
 * @modification 2013年12月24日 上午11:12:13
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public abstract class BaseServiceImpl implements IBaseService {

	@Autowired
	protected HibernateTemplate hibernateTemplate;

	@Autowired
	protected CommonDao commonDao;

	@Autowired
	protected MessageUtil messageUtil;

	@Override
	public Serializable save(Object entity) {
		return hibernateTemplate.save(entity);
	}

	@Override
	public void delete(Object entity) {
		hibernateTemplate.delete(entity);
	}

	@Override
	public void update(Object entity) {
		hibernateTemplate.update(entity);
	}

	@Override
	public <T> T get(Class<T> entityClass, Serializable id) {
		return hibernateTemplate.get(entityClass, id);
	}

	@Override
	public <T> T load(Class<T> entityClass, Serializable id) {
		return hibernateTemplate.load(entityClass, id);
	}

	@Override
	public List<?> load(Object exampleEntity) {
		return hibernateTemplate.findByExample(exampleEntity);
	}

	@Override
	public Object findOneByExample(Object example) {
		List<?> list = hibernateTemplate.findByExample(example);

		return list.size() > 0 ? list.get(0) : null;
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

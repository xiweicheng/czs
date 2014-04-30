/**
 * BaseService.java
 */
package com.canzs.czs.base;

import java.io.Serializable;
import java.util.List;

/**
 * 
 * 
 * @creation 2013年12月24日 上午11:09:51
 * @modification 2013年12月24日 上午11:09:51
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IBaseService {

	Serializable save(Object entity);

	void delete(Object entity);

	void update(Object entity);

	<T> T get(Class<T> entityClass, Serializable id);

	<T> T load(Class<T> entityClass, Serializable id);

	List<?> load(Object exampleEntity);

	Object findOneByExample(Object example);

	<T> T findOneByExample(Object example, Class<T> clazz);

}

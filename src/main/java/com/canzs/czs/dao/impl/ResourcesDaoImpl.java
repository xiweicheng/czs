/**
 * ResourcesDaoImpl.java
 */
package com.canzs.czs.dao.impl;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.canzs.czs.base.impl.BaseDaoImpl;
import com.canzs.czs.dao.IResourcesDao;
import com.canzs.czs.pojo.entity.Resources;

/**
 * 【资源】持久化实现层.
 * 
 * @creation 2014年03月29日 05:00:05
 * @modification 2014年03月29日 05:00:05
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Repository
@Transactional
public class ResourcesDaoImpl extends BaseDaoImpl implements IResourcesDao {

	@Override
	public List<Map<String, Object>> query(Locale locale, Resources resources, Long start, Long limit) {
		
		// TODO
		
		return null;
	}

	@Override
	public long queryCount(Locale locale, Resources resources) {
	
		// TODO
	
		return 0L;
	}
	
}

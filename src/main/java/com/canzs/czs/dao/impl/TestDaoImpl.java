/**
 * TestDaoImpl.java
 */
package com.canzs.czs.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.canzs.czs.base.impl.BaseDaoImpl;
import com.canzs.czs.dao.ITestDao;

/**
 * 【测试】持久化实现层.
 * 
 * @creation 2014年03月19日 02:07:25
 * @modification 2014年03月19日 02:07:25
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Repository
@Transactional
public class TestDaoImpl extends BaseDaoImpl implements ITestDao {
	
}

/**
 * TestDaoImpl.java
 */
package com.sizheng.afl.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sizheng.afl.base.impl.BaseDaoImpl;
import com.sizheng.afl.dao.ITestDao;

/**
 * 【测试】持久化实现层.
 * 
 * @creation 2014年03月19日 02:07:25
 * @modification 2014年03月19日 02:07:25
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Repository
@Transactional
public class TestDaoImpl extends BaseDaoImpl implements ITestDao {
	
}

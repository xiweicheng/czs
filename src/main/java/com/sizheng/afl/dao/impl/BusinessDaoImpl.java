/**
 * BusinessDaoImpl.java
 */
package com.sizheng.afl.dao.impl;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sizheng.afl.base.impl.BaseDaoImpl;
import com.sizheng.afl.dao.IBusinessDao;
import com.sizheng.afl.pojo.entity.Business;

/**
 * 【商家】持久化实现层.
 * 
 * @creation 2014年03月25日 02:46:32
 * @modification 2014年03月25日 02:46:32
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Repository
@Transactional
public class BusinessDaoImpl extends BaseDaoImpl implements IBusinessDao {

	@Override
	public List<Map<String, Object>> query(Locale locale, Business business, Long start, Long limit) {

		// TODO

		return null;
	}

	@Override
	public long queryCount(Locale locale, Business business) {

		// TODO

		return 0L;
	}

	@Override
	public List<Map<String, Object>> listCustomer(Locale locale, Business business) {

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("SELECT\n");
		sqlSb.append("	business_consumer.consumer_id,\n");
		sqlSb.append("	business_consumer.consume_times,\n");
		sqlSb.append("	business_consumer.last_consume_time,\n");
		sqlSb.append("	business_consumer.scene_id,\n");
		sqlSb.append("	business_consumer.consume_code,\n");
		sqlSb.append("	business_consumer.`status`,\n");
		sqlSb.append("	subscriber.nickname,\n");
		sqlSb.append("	subscriber.sex,\n");
		sqlSb.append("	subscriber.headimgurl,\n");
		sqlSb.append("	subscriber.city,\n");
		sqlSb.append("	subscriber.country,\n");
		sqlSb.append("	subscriber.province,\n");
		sqlSb.append("	subscriber.`language`,\n");
		sqlSb.append("	qrcode.description\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	business_consumer\n");
		sqlSb.append("LEFT JOIN qrcode ON business_consumer.scene_id = qrcode.scene_id\n");
		sqlSb.append("LEFT JOIN subscriber ON business_consumer.consumer_id = subscriber.user_name\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	business_consumer.business_id = ?\n");

		return getMapList(sqlSb, business.getOpenId());
	}

}

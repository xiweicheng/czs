/**
 * UserDaoImpl.java
 */
package com.sizheng.afl.dao.impl;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sizheng.afl.base.impl.BaseDaoImpl;
import com.sizheng.afl.dao.IUserDao;
import com.sizheng.afl.pojo.entity.User;

/**
 * 【用户】持久化实现层.
 * 
 * @creation 2014年03月28日 10:02:03
 * @modification 2014年03月28日 10:02:03
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Repository
@Transactional
public class UserDaoImpl extends BaseDaoImpl implements IUserDao {

	@Override
	public List<Map<String, Object>> query(Locale locale, User user, Long start, Long limit) {

		// TODO

		return null;
	}

	@Override
	public long queryCount(Locale locale, User user) {

		// TODO

		return 0L;
	}

	@Override
	public List<Map<String, Object>> queryMenuBill(Locale locale, String consumeCode) {

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("SELECT\n");
		sqlSb.append("	menu_bill.id,\n");
		sqlSb.append("	menu_bill.menu_id,\n");
		sqlSb.append("	menu_bill.consume_code,\n");
		sqlSb.append("	menu_bill.date_time,\n");
		sqlSb.append("	menu.`name`,\n");
		sqlSb.append("	menu.price,\n");
		sqlSb.append("	menu.privilege\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	menu_bill\n");
		sqlSb.append("INNER JOIN menu ON menu_bill.menu_id = menu.id\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	menu_bill.consume_code = ?\n");
		sqlSb.append("AND menu_bill.`status` = 1\n");

		return getMapList(sqlSb, consumeCode);
	}

	@Override
	public List<Map<String, Object>> getInfo(Locale locale, String openId) {

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("SELECT\n");
		sqlSb.append("	qrcode.description,\n");
		sqlSb.append("	subscriber.nickname,\n");
		sqlSb.append("	IF(subscriber.sex = 1, '男', IF(subscriber.sex = 2, '女', '未知')) as sex,\n");
		sqlSb.append("	subscriber.city,\n");
		sqlSb.append("	subscriber.country,\n");
		sqlSb.append("	subscriber.province,\n");
		sqlSb.append("	subscriber.headimgurl,\n");
		sqlSb.append("	business_consumer.consume_times,\n");
		sqlSb.append("	DATE_FORMAT(business_consumer.last_consume_time,  '%Y/%m/%d %H:%i:%s') as last_consume_time,\n");
		sqlSb.append("	business_consumer.scene_id,\n");
		sqlSb.append("	business_consumer.consume_code,\n");
		sqlSb.append("	business_consumer.`status`\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	`user`\n");
		sqlSb.append("INNER JOIN business_consumer ON `user`.consume_code = business_consumer.consume_code\n");
		sqlSb.append("INNER JOIN qrcode ON business_consumer.scene_id = qrcode.scene_id\n");
		sqlSb.append("LEFT JOIN subscriber ON `user`.user_name = subscriber.user_name\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	`user`.user_name = ?\n");

		return getMapList(sqlSb, openId);
	}

}

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
import com.sizheng.afl.pojo.entity.BusinessConsumer;
import com.sizheng.afl.util.NumberUtil;
import com.sizheng.afl.util.SqlUtil;

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
	public List<Map<String, Object>> listCustomer(Locale locale, Business business, String status) {

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

		sqlSb.append(SqlUtil.replaceIfNotEmpty("AND business_consumer.`status` = {?1}\n", status));

		return getMapList(sqlSb, business.getOpenId());
	}

	@Override
	public List<Map<String, Object>> queryGroupInfo(Locale locale, BusinessConsumer businessConsumer) {

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("SELECT\n");
		sqlSb.append("	business_consumer.consumer_id,\n");
		sqlSb.append("	business_consumer.consume_times,\n");
		sqlSb.append("	DATE_FORMAT(business_consumer.last_consume_time,  '%Y/%m/%d %H:%i:%s') as last_consume_time,\n");
		sqlSb.append("	business_consumer.consume_code,\n");
		sqlSb.append("	subscriber.nickname,\n");
		sqlSb.append("	IF(subscriber.sex = 1, '男', IF(subscriber.sex = 2, '女', '未知')) as sex,\n");
		sqlSb.append("	subscriber.city,\n");
		sqlSb.append("	subscriber.country,\n");
		sqlSb.append("	subscriber.province,\n");
		sqlSb.append("	subscriber.headimgurl\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	business_consumer\n");
		sqlSb.append("INNER JOIN subscriber ON business_consumer.consumer_id = subscriber.user_name\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	business_consumer.scene_id = ?\n");
		sqlSb.append("AND business_consumer.`status` In (1,3,4)\n");

		return getMapList(sqlSb, businessConsumer.getSceneId());
	}

	@Override
	public double getConsume(Locale locale, String consumeCode) {

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("SELECT\n");
		sqlSb.append("	menu_bill.copies,\n");
		sqlSb.append("	menu.price,\n");
		sqlSb.append("	menu.privilege\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	menu_bill\n");
		sqlSb.append("INNER JOIN menu ON menu_bill.menu_id = menu.id\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	menu_bill.consume_code = ?\n");
		sqlSb.append("AND menu_bill.`status` = 1\n");

		List<Map<String, Object>> mapList = getMapList(sqlSb, consumeCode);
		double val = 0;

		for (Map<String, Object> map : mapList) {
			Double price = NumberUtil.getDouble(map, "price");
			Double privilege = NumberUtil.getDouble(map, "privilege");
			Double copies = NumberUtil.getDouble(map, "copies");

			if (privilege != null) {
				if (privilege >= 1) {
					val += (price - privilege) * copies;
				} else {
					val += (price * privilege) * copies;
				}
			} else {
				val += (price) * copies;
			}
		}

		return val;
	}

	@Override
	public double getTotalConsume(Locale locale, String sceneId) {

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("SELECT\n");
		sqlSb.append("	menu_bill.copies,\n");
		sqlSb.append("	menu.price,\n");
		sqlSb.append("	menu.privilege\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	menu_bill\n");
		sqlSb.append("INNER JOIN menu ON menu_bill.menu_id = menu.id\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	menu_bill.consume_code IN (SELECT business_consumer.consume_code FROM `business_consumer` WHERE business_consumer.scene_id = ?)\n");
		sqlSb.append("AND menu_bill.`status` = 1\n");

		List<Map<String, Object>> mapList = getMapList(sqlSb, sceneId);
		double val = 0;

		for (Map<String, Object> map : mapList) {
			Double price = NumberUtil.getDouble(map, "price");
			Double privilege = NumberUtil.getDouble(map, "privilege");
			Double copies = NumberUtil.getDouble(map, "copies");

			if (privilege != null) {
				if (privilege >= 1) {
					val += (price - privilege) * copies;
				} else {
					val += (price * privilege) * copies;
				}
			} else {
				val += (price) * copies;
			}
		}

		return val;
	}

	@Override
	public long getGroupSize(Locale locale, String consumeCode) {

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("SELECT\n");
		sqlSb.append("	COUNT(*) AS cnt\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	business_consumer\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	scene_id = (\n");
		sqlSb.append("		SELECT\n");
		sqlSb.append("			business_consumer.scene_id\n");
		sqlSb.append("		FROM\n");
		sqlSb.append("			`business_consumer`\n");
		sqlSb.append("		WHERE\n");
		sqlSb.append("			business_consumer.consume_code = ?\n");
		sqlSb.append("	)\n");

		return getCount(sqlSb, consumeCode);
	}

	@Override
	public Map<String, Object> getConsumer(Locale locale, String openId) {

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("SELECT\n");
		sqlSb.append("	subscriber.id,\n");
		sqlSb.append("	subscriber.user_name,\n");
		sqlSb.append("	subscriber.nickname,\n");
		sqlSb.append("	IF(subscriber.sex = 1, '男', IF(subscriber.sex = 2, '女', '未知')) as sex,\n");
		sqlSb.append("	subscriber.city,\n");
		sqlSb.append("	subscriber.country,\n");
		sqlSb.append("	subscriber.province,\n");
		sqlSb.append("	subscriber.`language`,\n");
		sqlSb.append("	subscriber.headimgurl,\n");
		sqlSb.append("	business_consumer.consume_times,\n");
		sqlSb.append("	DATE_FORMAT(business_consumer.last_consume_time,  '%Y/%m/%d %H:%i:%s') as last_consume_time,\n");
		sqlSb.append("	business_consumer.`status`,\n");
		sqlSb.append("	business_consumer.consume_code,\n");
		sqlSb.append("	qrcode.description\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	subscriber\n");
		sqlSb.append("INNER JOIN business_consumer ON subscriber.user_name = business_consumer.consumer_id\n");
		sqlSb.append("INNER JOIN qrcode ON business_consumer.scene_id = qrcode.scene_id\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	subscriber.user_name = ?\n");

		return getMap(sqlSb, openId);
	}

	@Override
	public List<Map<String, Object>> queryRequest(Locale locale, String openId) {

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("SELECT\n");
		sqlSb.append("	request.id,\n");
		sqlSb.append("	request.`name`,\n");
		sqlSb.append("	request.consumer_id,\n");
		sqlSb.append("	request.business_id,\n");
		sqlSb.append("	request.consume_code,\n");
		sqlSb.append("	request.scene_id,\n");
		sqlSb.append("	request.type,\n");
		sqlSb.append("	DATE_FORMAT(request.date_time,'%Y/%m/%d %H:%i:%s') AS date_time,\n");
		sqlSb.append("	subscriber.nickname,\n");
		sqlSb.append("	IF (subscriber.sex = 1,'男',IF (subscriber.sex = 2,'女','未知')) AS sex,\n");
		sqlSb.append(" subscriber.headimgurl,\n");
		sqlSb.append(" request.`status`\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	request\n");
		sqlSb.append("LEFT JOIN subscriber ON request.consumer_id = subscriber.user_name\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	request.`status` = 1\n");
		sqlSb.append("AND request.is_delete = 0\n");
		sqlSb.append("AND request.business_id = ?\n");

		return getMapList(sqlSb, openId);
	}

}

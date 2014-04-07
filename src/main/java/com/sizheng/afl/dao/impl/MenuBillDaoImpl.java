/**
 * MenuBillDaoImpl.java
 */
package com.sizheng.afl.dao.impl;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sizheng.afl.base.impl.BaseDaoImpl;
import com.sizheng.afl.dao.IMenuBillDao;
import com.sizheng.afl.pojo.entity.MenuBill;

/**
 * 【订单】持久化实现层.
 * 
 * @creation 2014年04月05日 05:02:44
 * @modification 2014年04月05日 05:02:44
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Repository
@Transactional
public class MenuBillDaoImpl extends BaseDaoImpl implements IMenuBillDao {

	@Override
	public List<Map<String, Object>> query(Locale locale, MenuBill menuBill, Long start, Long limit) {

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("SELECT\n");
		sqlSb.append("	menu_bill.id,\n");
		sqlSb.append("	menu_bill.menu_id,\n");
		sqlSb.append("	menu_bill.date_time,\n");
		sqlSb.append("	menu_bill.status,\n");
		sqlSb.append("	menu_bill.copies,\n");
		sqlSb.append("	menu.`name`,\n");
		sqlSb.append("	menu.introduce,\n");
		sqlSb.append("	menu_category.`name` AS category,\n");
		sqlSb.append("	menu_taste.`name` AS taste,\n");
		sqlSb.append("	resources.path,\n");
		sqlSb.append("	menu.price,\n");
		sqlSb.append("	menu.privilege\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	menu_bill\n");
		sqlSb.append("INNER JOIN menu ON menu_bill.menu_id = menu.id\n");
		sqlSb.append("LEFT JOIN menu_category ON menu.category_id = menu_category.id\n");
		sqlSb.append("LEFT JOIN menu_taste ON menu.taste_id = menu_taste.id\n");
		sqlSb.append("LEFT JOIN resources ON menu.resource_id = resources.id\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	menu_bill.`status` = ?\n");
		sqlSb.append("AND menu_bill.consume_code = ?\n");

		return getMapList(sqlSb, menuBill.getStatus(), menuBill.getConsumeCode());
	}

	@Override
	public long queryCount(Locale locale, MenuBill menuBill) {

		// TODO

		return 0L;
	}

	@Override
	public List<Map<String, Object>> queryGroup(Locale locale, MenuBill menuBill, Long start, Long limit) {

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("SELECT\n");
		sqlSb.append("	menu_bill.id,\n");
		sqlSb.append("	menu_bill.menu_id,\n");
		sqlSb.append("	menu_bill.date_time,\n");
		sqlSb.append("	menu_bill.`status`,\n");
		sqlSb.append("	menu_bill.copies,\n");
		sqlSb.append("	menu_bill.consumer_id,\n");
		sqlSb.append("	menu_bill.consume_code,\n");
		sqlSb.append("	menu.`name`,\n");
		sqlSb.append("	menu.introduce,\n");
		sqlSb.append("	menu_category.`name` AS category,\n");
		sqlSb.append("	menu_taste.`name` AS taste,\n");
		sqlSb.append("	resources.path,\n");
		sqlSb.append("	menu.price,\n");
		sqlSb.append("	menu.privilege,\n");
		sqlSb.append("	subscriber.nickname\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	menu_bill\n");
		sqlSb.append("INNER JOIN menu ON menu_bill.menu_id = menu.id\n");
		sqlSb.append("LEFT JOIN menu_category ON menu.category_id = menu_category.id\n");
		sqlSb.append("LEFT JOIN menu_taste ON menu.taste_id = menu_taste.id\n");
		sqlSb.append("LEFT JOIN resources ON menu.resource_id = resources.id\n");
		sqlSb.append("LEFT JOIN subscriber ON subscriber.user_name = menu_bill.consumer_id\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	menu_bill.`status` = ?\n");
		sqlSb.append("AND menu_bill.consume_code IN (\n");
		sqlSb.append("	SELECT\n");
		sqlSb.append("		business_consumer.consume_code\n");
		sqlSb.append("	FROM\n");
		sqlSb.append("		business_consumer\n");
		sqlSb.append("	WHERE\n");
		sqlSb.append("		business_consumer.scene_id = (\n");
		sqlSb.append("			SELECT\n");
		sqlSb.append("				business_consumer.scene_id\n");
		sqlSb.append("			FROM\n");
		sqlSb.append("				`business_consumer`\n");
		sqlSb.append("			WHERE\n");
		sqlSb.append("				business_consumer.consume_code = ?\n");
		sqlSb.append("		)\n");
		sqlSb.append("	AND business_consumer.consume_code IS NOT NULL\n");
		sqlSb.append("	AND business_consumer.`status` = 1\n");
		sqlSb.append(")\n");

		return getMapList(sqlSb, menuBill.getStatus(), menuBill.getConsumeCode());
	}

}

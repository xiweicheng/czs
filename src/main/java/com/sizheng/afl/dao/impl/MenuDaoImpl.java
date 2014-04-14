/**
 * MenuDaoImpl.java
 */
package com.sizheng.afl.dao.impl;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sizheng.afl.base.impl.BaseDaoImpl;
import com.sizheng.afl.dao.IMenuDao;
import com.sizheng.afl.pojo.entity.Menu;
import com.sizheng.afl.util.SqlUtil;

/**
 * 【菜单】持久化实现层.
 * 
 * @creation 2014年03月29日 08:37:32
 * @modification 2014年03月29日 08:37:32
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Repository
@Transactional
public class MenuDaoImpl extends BaseDaoImpl implements IMenuDao {

	@Override
	public List<Map<String, Object>> query(Locale locale, Menu menu, String consumeCode, Long start, Long limit) {

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("SELECT\n");
		sqlSb.append("	menu.id,\n");
		sqlSb.append("	menu.date_time,\n");
		sqlSb.append("	menu.introduce,\n");
		sqlSb.append("	menu.is_delete,\n");
		sqlSb.append("	menu.`name`,\n");
		sqlSb.append("	menu.price,\n");
		sqlSb.append("	menu.privilege,\n");
		sqlSb.append("	menu_category.`name` AS category,\n");
		sqlSb.append("	menu_taste.`name` AS taste,\n");
		sqlSb.append("	resources.path,\n");
		sqlSb.append("	menu_bill.`status`,\n");
		sqlSb.append("	menu_bill.consumer_id,\n");
		sqlSb.append("	menu_bill.copies,\n");
		sqlSb.append("	menu_bill.consume_code,\n");
		sqlSb.append("	subscriber.nickname\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	menu\n");
		sqlSb.append("LEFT JOIN resources ON menu.resource_id = resources.id\n");
		sqlSb.append("LEFT JOIN menu_taste ON menu.taste_id = menu_taste.id\n");
		sqlSb.append("LEFT JOIN menu_category ON menu.category_id = menu_category.id\n");
		sqlSb.append("LEFT JOIN (\n");
		sqlSb.append("	SELECT\n");
		sqlSb.append("		*\n");
		sqlSb.append("	FROM\n");
		sqlSb.append("		menu_bill\n");
		sqlSb.append("	WHERE\n");
		sqlSb.append("		consume_code IN (\n");
		sqlSb.append("			SELECT\n");
		sqlSb.append("				business_consumer.consume_code\n");
		sqlSb.append("			FROM\n");
		sqlSb.append("				business_consumer\n");
		sqlSb.append("			WHERE\n");
		sqlSb.append("				business_consumer.scene_id = (\n");
		sqlSb.append("					SELECT\n");
		sqlSb.append("						business_consumer.scene_id\n");
		sqlSb.append("					FROM\n");
		sqlSb.append("						`business_consumer`\n");
		sqlSb.append("					WHERE\n");
		sqlSb.append("						business_consumer.consume_code = ?\n");
		sqlSb.append("				)\n");
		sqlSb.append("			AND business_consumer.consume_code IS NOT NULL\n");
		sqlSb.append("			AND business_consumer.`status` = 1\n");
		sqlSb.append("		)\n");
		sqlSb.append(") menu_bill ON menu.id = menu_bill.menu_id\n");
		sqlSb.append("LEFT JOIN subscriber ON subscriber.user_name = menu_bill.consumer_id\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	menu.`owner` = ?\n");
		sqlSb.append("AND menu.is_delete = 0\n");

		sqlSb.append(SqlUtil.replaceIfNotEmpty("AND menu.category_id = {?1}\n", menu.getCategoryId()));
		sqlSb.append(SqlUtil.replaceIfNotEmpty("AND menu.taste_id = {?1}\n", menu.getTasteId()));

		return getMapList(sqlSb, consumeCode, menu.getOwner());
	}

	@Override
	public long queryCount(Locale locale, Menu menu) {

		// TODO

		return 0L;
	}

	@Override
	public List<Map<String, Object>> queryBillList(Locale locale, Menu menu, Long start, Long limit) {

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("SELECT\n");
		sqlSb.append("	menu.id,\n");
		sqlSb.append("	menu.date_time,\n");
		sqlSb.append("	menu.introduce,\n");
		sqlSb.append("	menu.is_delete,\n");
		sqlSb.append("	menu.`name`,\n");
		sqlSb.append("	menu.price,\n");
		sqlSb.append("	menu.privilege,\n");
		sqlSb.append("	menu_category.`name` AS category,\n");
		sqlSb.append("	menu_taste.`name` AS taste,\n");
		sqlSb.append("	resources.path\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	menu\n");
		sqlSb.append("INNER JOIN resources ON menu.resource_id = resources.id\n");
		sqlSb.append("INNER JOIN menu_taste ON menu.taste_id = menu_taste.id\n");
		sqlSb.append("INNER JOIN menu_category ON menu.category_id = menu_category.id\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	menu.`owner` = ?\n");

		return getMapList(sqlSb, menu.getOwner());
	}

	@Override
	public List<Map<String, Object>> queryOrderMapList(Locale locale, Menu menu) {

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("SELECT\n");
		sqlSb.append("	menu_bill.id,\n");
		sqlSb.append("	menu_bill.menu_id,\n");
		sqlSb.append("	menu_bill.consumer_id,\n");
		sqlSb.append("	menu_bill.consume_code,\n");
		sqlSb.append("	DATE_FORMAT(menu_bill.date_time,  '%Y/%m/%d %H:%i:%s') as date_time,\n");
		sqlSb.append("	menu_bill.scene_id,\n");
		sqlSb.append("	menu_bill.copies,\n");
		sqlSb.append("	menu.`name`,\n");
		sqlSb.append("	subscriber.nickname,\n");
		sqlSb.append("	qrcode.description\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	menu_bill\n");
		sqlSb.append("INNER JOIN menu ON menu_bill.menu_id = menu.id\n");
		sqlSb.append("LEFT JOIN subscriber ON menu_bill.consumer_id = subscriber.user_name\n");
		sqlSb.append("INNER JOIN qrcode ON menu_bill.scene_id = qrcode.scene_id\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	menu_bill.`status` = 1\n");
		sqlSb.append("AND menu.`owner` = ?\n");
		sqlSb.append("ORDER BY\n");
		sqlSb.append("	menu_bill.date_time ASC\n");

		return getMapList(sqlSb, menu.getOwner());
	}

	@Override
	public List<Map<String, Object>> queryJoinBill(Locale locale, Menu menu) {

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("SELECT\n");
		sqlSb.append("	menu_bill.id,\n");
		sqlSb.append("	menu_bill.menu_id,\n");
		sqlSb.append("	menu_bill.consumer_id,\n");
		sqlSb.append("	menu_bill.consume_code,\n");
		sqlSb.append("	DATE_FORMAT(\n");
		sqlSb.append("		menu_bill.date_time,\n");
		sqlSb.append("		'%Y/%m/%d %H:%i:%s'\n");
		sqlSb.append("	) AS date_time,\n");
		sqlSb.append("	menu_bill.scene_id,\n");
		sqlSb.append("	menu_bill.copies,\n");
		sqlSb.append("	subscriber.nickname,\n");
		sqlSb.append("	qrcode.description,\n");
		sqlSb.append("	menu.`name`\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	menu_bill\n");
		sqlSb.append("INNER JOIN menu ON menu_bill.menu_id = menu.id\n");
		sqlSb.append("LEFT JOIN subscriber ON menu_bill.consumer_id = subscriber.user_name\n");
		sqlSb.append("INNER JOIN qrcode ON menu_bill.scene_id = qrcode.scene_id\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	menu.`owner` = ?\n");
		sqlSb.append("AND menu_bill.`status` = 1\n");
		sqlSb.append("AND menu_bill.menu_id = ?\n");
		sqlSb.append("ORDER BY\n");
		sqlSb.append("	menu_bill.date_time ASC\n");

		return getMapList(sqlSb, menu.getOwner(), menu.getId());
	}

}

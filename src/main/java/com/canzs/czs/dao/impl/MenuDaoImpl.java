/**
 * MenuDaoImpl.java
 */
package com.canzs.czs.dao.impl;

import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.canzs.czs.base.impl.BaseDaoImpl;
import com.canzs.czs.dao.IMenuDao;
import com.canzs.czs.pojo.constant.SysConstant;
import com.canzs.czs.pojo.entity.Menu;
import com.canzs.czs.util.DateUtil;
import com.canzs.czs.util.SqlUtil;
import com.canzs.czs.util.StringUtil;

/**
 * 【菜单】持久化实现层.
 * 
 * @creation 2014年03月29日 08:37:32
 * @modification 2014年03月29日 08:37:32
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Repository
@Transactional
public class MenuDaoImpl extends BaseDaoImpl implements IMenuDao {

	@Override
	public List<Map<String, Object>> query(Locale locale, Menu menu, String consumeCode, Long start, Long limit,
			String order, String consumerId) {

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("SELECT\n");
		sqlSb.append("	menu.id,\n");
		sqlSb.append("	menu.date_time,\n");
		sqlSb.append("	menu.introduce,\n");
		sqlSb.append("	menu.is_delete,\n");
		sqlSb.append("	menu.`name`,\n");
		sqlSb.append("	menu.price,\n");
		sqlSb.append("	menu.privilege,\n");
		sqlSb.append("	menu.order_times,\n");
		sqlSb.append("	menu.category_id,\n");
		sqlSb.append("	menu_category.`name` AS category,\n");
		sqlSb.append("	menu.taste_id,\n");
		sqlSb.append("	menu_taste.`name` AS taste,\n");
		sqlSb.append("	resources.path,\n");
		sqlSb.append("	resources.file_name,\n");
		sqlSb.append("	menu_bill.`status`,\n");
		sqlSb.append("	menu_bill.consumer_id,\n");
		sqlSb.append("	menu_bill.copies,\n");
		sqlSb.append("	menu_bill.consume_code,\n");
		sqlSb.append("	menu_bill.memo,\n");
		sqlSb.append("	favorites.is_delete AS fav_status,\n");
		sqlSb.append("	subscriber.nickname\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	menu\n");
		sqlSb.append("LEFT JOIN resources ON menu.resource_id = resources.id\n");
		sqlSb.append("LEFT JOIN menu_taste ON menu.taste_id = menu_taste.id\n");
		sqlSb.append("LEFT JOIN menu_category ON menu.category_id = menu_category.id\n");
		sqlSb.append("LEFT JOIN (\n");
		sqlSb.append("	SELECT\n");
		sqlSb.append("		menu_bill.*\n");
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
		sqlSb.append("LEFT JOIN favorites ON (menu.id = favorites.ref_id AND favorites.open_id = ?)\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	menu.`owner` = ?\n");
		sqlSb.append("AND menu.is_delete = 0\n");

		sqlSb.append(SqlUtil.replaceIfNotEmpty("AND menu.category_id = {?1}\n", menu.getCategoryId()));
		sqlSb.append(SqlUtil.replaceIfNotEmpty("AND menu.taste_id = {?1}\n", menu.getTasteId()));

		if (SysConstant.ORDER_PRICE_ASC.equals(order)) {
			sqlSb.append("ORDER BY menu.price ASC, menu.id ASC\n");
		} else if (SysConstant.ORDER_PRICE_DESC.equals(order)) {
			sqlSb.append("ORDER BY menu.price DESC, menu.id ASC\n");
		} else if (SysConstant.ORDER_LIKE.equals(order)) {
			sqlSb.append("ORDER BY menu.order_times DESC, menu.id ASC\n");
		} else {
			sqlSb.append("ORDER BY menu.category_id\n");
		}

		return getMapList(sqlSb, consumeCode, consumerId, menu.getOwner());
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
		sqlSb.append("	DATE_FORMAT(menu.date_time,  '%Y/%m/%d %H:%i:%s') as date_time,\n");
		sqlSb.append("	menu.introduce,\n");
		sqlSb.append("	menu.is_delete,\n");
		sqlSb.append("	menu.`name`,\n");
		sqlSb.append("	menu.price,\n");
		sqlSb.append("	menu.privilege,\n");
		sqlSb.append("	menu.order_times,\n");
		sqlSb.append("	menu_category.`name` AS category,\n");
		sqlSb.append("	menu_taste.`name` AS taste,\n");
		sqlSb.append("	resources.file_name,\n");
		sqlSb.append("	resources.path\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	menu\n");
		sqlSb.append("LEFT JOIN resources ON menu.resource_id = resources.id\n");
		sqlSb.append("LEFT JOIN menu_taste ON menu.taste_id = menu_taste.id\n");
		sqlSb.append("LEFT JOIN menu_category ON menu.category_id = menu_category.id\n");
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
		sqlSb.append("	menu_bill.memo,\n");
		sqlSb.append("	DATE_FORMAT(menu_bill.date_time,  '%Y/%m/%d %H:%i:%s') as date_time,\n");
		sqlSb.append("	TIMESTAMPDIFF(SECOND,menu_bill.date_time,NOW()) as sec_diff,\n");
		sqlSb.append("	menu_bill.scene_id,\n");
		sqlSb.append("	menu_bill.copies,\n");
		sqlSb.append("	menu.`name`,\n");
		sqlSb.append("	subscriber.nickname,\n");
		sqlSb.append("	subscriber.headimgurl,\n");
		sqlSb.append("	IF(subscriber.sex = 1, '男', IF(subscriber.sex = 2, '女', '未知')) as sex,\n");
		sqlSb.append("	qrcode.description\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	menu_bill\n");
		sqlSb.append("INNER JOIN menu ON menu_bill.menu_id = menu.id\n");
		sqlSb.append("LEFT JOIN subscriber ON menu_bill.consumer_id = subscriber.user_name\n");
		sqlSb.append("INNER JOIN qrcode ON menu_bill.scene_id = qrcode.scene_id\n");
		sqlSb.append("INNER JOIN user ON menu_bill.consume_code = user.consume_code\n");
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
		sqlSb.append("	menu_bill.memo,\n");
		sqlSb.append("	DATE_FORMAT(menu_bill.date_time,  '%Y/%m/%d %H:%i:%s') as date_time,\n");
		sqlSb.append("	TIMESTAMPDIFF(SECOND,menu_bill.date_time,NOW()) as sec_diff,\n");
		sqlSb.append("	menu_bill.scene_id,\n");
		sqlSb.append("	menu_bill.copies,\n");
		sqlSb.append("	subscriber.nickname,\n");
		sqlSb.append("	IF(subscriber.sex = 1, '男', IF(subscriber.sex = 2, '女', '未知')) as sex,\n");
		sqlSb.append("	subscriber.headimgurl,\n");
		sqlSb.append("	qrcode.description,\n");
		sqlSb.append("	menu.`name`\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	menu_bill\n");
		sqlSb.append("INNER JOIN menu ON menu_bill.menu_id = menu.id\n");
		sqlSb.append("LEFT JOIN subscriber ON menu_bill.consumer_id = subscriber.user_name\n");
		sqlSb.append("INNER JOIN qrcode ON menu_bill.scene_id = qrcode.scene_id\n");
		sqlSb.append("INNER JOIN user ON menu_bill.consume_code = user.consume_code\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	menu.`owner` = ?\n");
		sqlSb.append("AND menu_bill.`status` = 1\n");
		sqlSb.append("AND menu_bill.menu_id = ?\n");
		sqlSb.append("ORDER BY\n");
		sqlSb.append("	menu_bill.date_time ASC\n");

		return getMapList(sqlSb, menu.getOwner(), menu.getId());
	}

	@Override
	public boolean billSubmit(Locale locale, String openId) {

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("UPDATE menu_bill\n");
		sqlSb.append("SET `status` = 1\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	consume_code = (\n");
		sqlSb.append("		SELECT\n");
		sqlSb.append("			consume_code\n");
		sqlSb.append("		FROM\n");
		sqlSb.append("			`user`\n");
		sqlSb.append("		WHERE\n");
		sqlSb.append("			`user`.user_name = ?\n");
		sqlSb.append("	)\n");
		sqlSb.append("AND `status` = 0\n");

		return update(sqlSb, openId) > 0;
	}

	@Override
	public List<Map<String, Object>> queryHistoryMenuBill(Locale locale, String businessId, Date start, Date end,
			String... status) {

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("SELECT\n");
		sqlSb.append("	menu_bill.id,\n");
		sqlSb.append("	menu_bill.menu_id,\n");
		sqlSb.append("	menu_bill.consumer_id,\n");
		sqlSb.append("	menu_bill.consume_code,\n");
		sqlSb.append("	menu_bill.memo,\n");
		sqlSb.append("	DATE_FORMAT(menu_bill.date_time,  '%Y/%m/%d %H:%i:%s') as date_time,\n");
		sqlSb.append("	TIMESTAMPDIFF(SECOND,menu_bill.date_time,NOW()) as sec_diff,\n");
		sqlSb.append("	menu_bill.`status`,\n");
		sqlSb.append("	menu_bill.scene_id,\n");
		sqlSb.append("	menu_bill.copies,\n");
		sqlSb.append("	menu.`name`,\n");
		sqlSb.append("	subscriber.nickname,\n");
		sqlSb.append("	subscriber.headimgurl,\n");
		sqlSb.append("	IF(subscriber.sex = 1, '男', IF(subscriber.sex = 2, '女', '未知')) as sex,\n");
		sqlSb.append("	subscriber2.nickname AS accept_nickname,\n");
		sqlSb.append("	subscriber2.headimgurl AS accept_headimgurl,\n");
		sqlSb.append("	IF(subscriber2.sex = 1, '男', IF(subscriber2.sex = 2, '女', '未知')) as accept_sex,\n");
		sqlSb.append("	qrcode.description\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	menu_bill\n");
		sqlSb.append("INNER JOIN menu ON menu_bill.menu_id = menu.id\n");
		sqlSb.append("LEFT JOIN subscriber ON menu_bill.consumer_id = subscriber.user_name\n");
		sqlSb.append("LEFT JOIN subscriber AS subscriber2 ON menu_bill.accepter_id = subscriber2.user_name\n");
		sqlSb.append("INNER JOIN qrcode ON menu_bill.scene_id = qrcode.scene_id\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("    menu.`owner` = ?\n");

		if (start != null && end != null) {
			sqlSb.append(StringUtil.replace("AND (menu_bill.date_time between '{?1}' and '{?2}')\n",
					DateUtil.format(start, DateUtil.FORMAT1), DateUtil.format(end, DateUtil.FORMAT1)));
		}

		sqlSb.append(SqlUtil.replaceIfNotEmpty("AND menu_bill.`status` IN ({?1})\n", SqlUtil.joinAsIntIn(status)));
		sqlSb.append("ORDER BY\n");
		sqlSb.append("	date_time DESC\n");

		return getMapList(sqlSb, businessId);

	}

	@Override
	public List<Map<String, Object>> queryOrderHistoryMapList(Locale locale, String businessId, String openId) {

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("SELECT\n");
		sqlSb.append("	menu_bill.menu_id,\n");
		sqlSb.append("	menu_bill.consumer_id,\n");
		sqlSb.append("	menu_bill.consume_code,\n");
		sqlSb.append("	menu_bill.memo,\n");
		sqlSb.append("	DATE_FORMAT(\n");
		sqlSb.append("		menu_bill.date_time,\n");
		sqlSb.append("		'%Y/%m/%d %H:%i:%s'\n");
		sqlSb.append("	) AS date_time,\n");
		sqlSb.append("	TIMESTAMPDIFF(\n");
		sqlSb.append("		SECOND,\n");
		sqlSb.append("		menu_bill.date_time,\n");
		sqlSb.append("		NOW()\n");
		sqlSb.append("	) AS sec_diff,\n");
		sqlSb.append("	menu_bill.`status`,\n");
		sqlSb.append("	menu_bill.copies,\n");
		sqlSb.append("	subscriber.nickname,\n");
		sqlSb.append("	IF(subscriber.sex = 1, '男', IF(subscriber.sex = 2, '女', '未知')) as sex,\n");
		sqlSb.append("	subscriber.headimgurl,\n");
		sqlSb.append("	qrcode.description,\n");
		sqlSb.append("	menu_bill.id,\n");
		sqlSb.append("	menu.`name`,\n");
		sqlSb.append("	menu_bill.scene_id\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	menu_bill\n");
		sqlSb.append("INNER JOIN menu ON menu_bill.menu_id = menu.id\n");
		sqlSb.append("LEFT JOIN subscriber ON menu_bill.consumer_id = subscriber.user_name\n");
		sqlSb.append("INNER JOIN qrcode ON menu_bill.scene_id = qrcode.scene_id\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	menu_bill.accepter_id = ?\n");
		sqlSb.append("AND menu_bill.`status` = 3\n");
		sqlSb.append("AND menu.`owner` = ?\n");
		sqlSb.append("AND (\n");
		sqlSb.append("	TO_DAYS(NOW()) - TO_DAYS(menu_bill.date_time) <= 2\n");
		sqlSb.append(")\n");

		sqlSb.append("ORDER BY menu_bill.date_time DESC\n");

		return getMapList(sqlSb, openId, businessId);
	}

	@Override
	public Long queryBillCount(Locale locale, String businessId) {

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("SELECT\n");
		sqlSb.append("	COUNT(*)\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	menu_bill\n");
		sqlSb.append("INNER JOIN menu ON menu_bill.menu_id = menu.id\n");
		sqlSb.append("INNER JOIN `user` ON menu_bill.consume_code = `user`.consume_code\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	menu.`owner` = ?\n");
		sqlSb.append("AND menu_bill.`status` = 1\n");

		return getCount(sqlSb, businessId);
	}
}

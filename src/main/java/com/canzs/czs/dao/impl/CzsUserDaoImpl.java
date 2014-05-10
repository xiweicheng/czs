/**
 * CzsUserDaoImpl.java
 */
package com.canzs.czs.dao.impl;

import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.canzs.czs.base.impl.BaseDaoImpl;
import com.canzs.czs.dao.ICzsUserDao;
import com.canzs.czs.pojo.entity.CzsUser;
import com.canzs.czs.util.DateUtil;
import com.canzs.czs.util.SqlUtil;
import com.canzs.czs.util.StringUtil;

/**
 * 【平台用户】持久化实现层.
 * 
 * @creation 2014年04月23日 04:32:37
 * @modification 2014年04月23日 04:32:37
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Repository
@Transactional
public class CzsUserDaoImpl extends BaseDaoImpl implements ICzsUserDao {

	@Override
	public List<Map<String, Object>> query(Locale locale, CzsUser czsUser, Long start, Long limit) {

		// TODO

		return null;
	}

	@Override
	public long queryCount(Locale locale, CzsUser czsUser) {

		// TODO

		return 0L;
	}

	@Override
	public List<Map<String, Object>> queryMgrBusiness(Locale locale, Date sDate, Date eDate, String... status) {

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("SELECT\n");
		sqlSb.append("	business.id,\n");
		sqlSb.append("	business.open_id,\n");
		sqlSb.append("	business.is_deleted,\n");
		sqlSb.append("	business.`name`,\n");
		sqlSb.append("	business.address,\n");
		sqlSb.append("	business.mail,\n");
		sqlSb.append("	business.introduce,\n");
		sqlSb.append("	business.phone_number,\n");
		sqlSb.append("	business.qrcode_limit,\n");
		sqlSb.append("	business.is_mail_verify,\n");
		sqlSb.append("	business.is_phone_verify,\n");
		sqlSb.append("	business.`status`,\n");
		sqlSb.append("	business.days,\n");
		sqlSb.append("	business.life_value,\n");
		sqlSb.append("	DATE_FORMAT(\n");
		sqlSb.append("		business.date_time,\n");
		sqlSb.append("		'%Y/%m/%d %H:%i:%s'\n");
		sqlSb.append("	) AS date_time,\n");
		sqlSb.append("	UNIX_TIMESTAMP(business.date_time) AS times,\n");
		sqlSb.append("	TIMESTAMPDIFF(\n");
		sqlSb.append("		SECOND,\n");
		sqlSb.append("		business.date_time,\n");
		sqlSb.append("		NOW()\n");
		sqlSb.append("	) AS sec_diff,\n");
		sqlSb.append("	DATE_FORMAT(\n");
		sqlSb.append("		business.audit_date_time,\n");
		sqlSb.append("		'%Y/%m/%d %H:%i:%s'\n");
		sqlSb.append("	) AS audit_date_time,\n");
		sqlSb.append("	UNIX_TIMESTAMP(business.date_time) AS audit_times,\n");
		sqlSb.append("	TIMESTAMPDIFF(\n");
		sqlSb.append("		SECOND,\n");
		sqlSb.append("		business.audit_date_time,\n");
		sqlSb.append("		NOW()\n");
		sqlSb.append("	) AS sec_audit_diff,\n");
		sqlSb.append("	subscriber.nickname,\n");
		sqlSb.append("\n");
		sqlSb.append("IF (\n");
		sqlSb.append("	subscriber.sex = 1,\n");
		sqlSb.append("	'男',\n");
		sqlSb.append("\n");
		sqlSb.append("IF (\n");
		sqlSb.append("	subscriber.sex = 2,\n");
		sqlSb.append("	'女',\n");
		sqlSb.append("	'未知'\n");
		sqlSb.append(")\n");
		sqlSb.append(") AS sex,\n");
		sqlSb.append("	subscriber2.nickname as audit_nickname,\n");
		sqlSb.append("\n");
		sqlSb.append("IF (\n");
		sqlSb.append("	subscriber2.sex = 1,\n");
		sqlSb.append("	'男',\n");
		sqlSb.append("\n");
		sqlSb.append("IF (\n");
		sqlSb.append("	subscriber2.sex = 2,\n");
		sqlSb.append("	'女',\n");
		sqlSb.append("	'未知'\n");
		sqlSb.append(")\n");
		sqlSb.append(") AS audit_sex,\n");
		sqlSb.append(" subscriber2.headimgurl as audit_headimgurl,\n");
		sqlSb.append(" subscriber.country,\n");
		sqlSb.append(" subscriber.city,\n");
		sqlSb.append(" subscriber.province,\n");
		sqlSb.append(" subscriber.headimgurl\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	business\n");
		sqlSb.append("LEFT JOIN subscriber ON business.open_id = subscriber.user_name\n");
		sqlSb.append("LEFT JOIN subscriber as subscriber2 ON business.audit_handler = subscriber2.user_name\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	1 = 1\n");

		if (status != null && status.length > 0 && StringUtil.isNotEmpty(status[0])) {
			sqlSb.append(SqlUtil.replaceIfNotEmpty("AND business.`status` IN ({?1})\n", SqlUtil.joinAsIntIn2(status)));
		}

		if (sDate != null && eDate != null) {
			sqlSb.append(StringUtil.replace("AND (business.date_time between '{?1}' and '{?2}')\n",
					DateUtil.format(sDate, DateUtil.FORMAT1), DateUtil.format(eDate, DateUtil.FORMAT1)));
		}

		sqlSb.append("ORDER BY business.date_time DESC, business.audit_date_time DESC\n");

		return getMapList(sqlSb);
	}

	@Override
	public List<Map<String, Object>> queryMgrUser(Locale locale, Date sDate, Date eDate, String[] status) {

		// @formatter:off
		/**
		SELECT
			`user`.id,
			`user`.user_name,
			FROM_UNIXTIME(
				`user`.create_time,
				'%Y/%m/%d %H:%i:%s'
			) AS create_time,
			`user`.create_time AS _times,
			TIMESTAMPDIFF(
				SECOND,
				FROM_UNIXTIME(
					`user`.create_time,
					'%Y/%m/%d %H:%i:%s'
				),
				NOW()
			) AS sec_diff,
			`user`.is_deleted,
			`user`.times,
			`user`.latitude,
			`user`.longitude,
			`user`.precision_,
			`user`.consume_code,
			`user`.`status`,
			subscriber.nickname,

		IF (
			subscriber.sex = 1,
			'男',

		IF (
			subscriber.sex = 2,
			'女',
			'未知'
		)
		) AS sex,
		 subscriber.city,
		 subscriber.country,
		 subscriber.province,
		 subscriber.`language`,
		 subscriber.headimgurl
		FROM
			`user`
		LEFT JOIN subscriber ON `user`.user_name = subscriber.user_name
		ORDER BY
			create_time DESC**/
		// @formatter:on

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("SELECT\n");
		sqlSb.append("	`user`.id,\n");
		sqlSb.append("	`user`.user_name,\n");
		sqlSb.append("	FROM_UNIXTIME(\n");
		sqlSb.append("		`user`.create_time,\n");
		sqlSb.append("		'%Y/%m/%d %H:%i:%s'\n");
		sqlSb.append("	) AS create_time,\n");
		sqlSb.append("	`user`.create_time AS _times,\n");
		sqlSb.append("	TIMESTAMPDIFF(\n");
		sqlSb.append("		SECOND,\n");
		sqlSb.append("		FROM_UNIXTIME(\n");
		sqlSb.append("			`user`.create_time,\n");
		sqlSb.append("			'%Y/%m/%d %H:%i:%s'\n");
		sqlSb.append("		),\n");
		sqlSb.append("		NOW()\n");
		sqlSb.append("	) AS sec_diff,\n");
		sqlSb.append("	`user`.is_deleted,\n");
		sqlSb.append("	`user`.times,\n");
		sqlSb.append("	`user`.latitude,\n");
		sqlSb.append("	`user`.longitude,\n");
		sqlSb.append("	`user`.precision_,\n");
		sqlSb.append("	`user`.consume_code,\n");
		sqlSb.append("	`user`.`status`,\n");
		sqlSb.append("	subscriber.nickname,\n");
		sqlSb.append("\n");
		sqlSb.append("IF (\n");
		sqlSb.append("	subscriber.sex = 1,\n");
		sqlSb.append("	'男',\n");
		sqlSb.append("\n");
		sqlSb.append("IF (\n");
		sqlSb.append("	subscriber.sex = 2,\n");
		sqlSb.append("	'女',\n");
		sqlSb.append("	'未知'\n");
		sqlSb.append(")\n");
		sqlSb.append(") AS sex,\n");
		sqlSb.append(" subscriber.city,\n");
		sqlSb.append(" subscriber.country,\n");
		sqlSb.append(" subscriber.province,\n");
		sqlSb.append(" subscriber.`language`,\n");
		sqlSb.append(" subscriber.headimgurl\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	`user`\n");
		sqlSb.append("LEFT JOIN subscriber ON `user`.user_name = subscriber.user_name\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	1 = 1\n");

		if (status != null && status.length > 0 && StringUtil.isNotEmpty(status[0])) {
			sqlSb.append(SqlUtil.replaceIfNotEmpty("AND `user`.`status` IN ({?1})\n", SqlUtil.joinAsIntIn2(status)));
		}

		if (sDate != null && eDate != null) {
			sqlSb.append(StringUtil.replace("AND (`user`.create_time between '{?1}' and '{?2}')\n",
					sDate.getTime() / 1000, eDate.getTime() / 1000));
		}
		sqlSb.append("ORDER BY\n");
		sqlSb.append("	create_time DESC\n");

		return getMapList(sqlSb);
	}

	@Override
	public List<Map<String, Object>> queryMgrQrcode(Locale locale, Date sDate, Date eDate, String... status) {

		// @formatter:off
		/**
		SELECT
			qrcode.id,
			qrcode.open_id,
			qrcode.scene_id,
			qrcode.use_limit,
			qrcode.use_times,
			qrcode.category_id,
			qrcode.ticket,
			qrcode.url,
			qrcode.file_path,
			qrcode.type,
			qrcode.my_url,
			qrcode.description,
			DATE_FORMAT(
				qrcode.date_time,
				'%Y/%m/%d %H:%i:%s'
			) AS date_time,
			UNIX_TIMESTAMP(qrcode.date_time) AS times,
			TIMESTAMPDIFF(
				SECOND,
				qrcode.date_time,
				NOW()
			) AS sec_diff,
			qrcode.`status`,
			qrcode.is_delete,
			business.`name`,
			business.address,
			business.mail,
			business.introduce,
			business.phone_number,
			business.qrcode_limit,
			business.days,
			business.life_value,
			category.`name` AS category_name,
			category.`value`,
			category.type AS category_type
		FROM
			qrcode
		LEFT JOIN business ON qrcode.open_id = business.open_id
		LEFT JOIN category ON qrcode.category_id = category.id
		WHERE
			qrcode.`status` = 0
		ORDER BY
			qrcode.date_time DESC**/
		// @formatter:on

		StringBuffer sqlSb = new StringBuffer();
		sqlSb.append("SELECT\n");
		sqlSb.append("	qrcode.id,\n");
		sqlSb.append("	qrcode.open_id,\n");
		sqlSb.append("	qrcode.scene_id,\n");
		sqlSb.append("	qrcode.use_limit,\n");
		sqlSb.append("	qrcode.use_times,\n");
		sqlSb.append("	qrcode.category_id,\n");
		sqlSb.append("	qrcode.ticket,\n");
		sqlSb.append("	qrcode.url,\n");
		sqlSb.append("	qrcode.file_path,\n");
		sqlSb.append("	qrcode.type,\n");
		sqlSb.append("	qrcode.my_url,\n");
		sqlSb.append("	qrcode.description,\n");
		sqlSb.append("	DATE_FORMAT(\n");
		sqlSb.append("		qrcode.date_time,\n");
		sqlSb.append("		'%Y/%m/%d %H:%i:%s'\n");
		sqlSb.append("	) AS date_time,\n");
		sqlSb.append("	UNIX_TIMESTAMP(qrcode.date_time) AS times,\n");
		sqlSb.append("	TIMESTAMPDIFF(\n");
		sqlSb.append("		SECOND,\n");
		sqlSb.append("		qrcode.date_time,\n");
		sqlSb.append("		NOW()\n");
		sqlSb.append("	) AS sec_diff,\n");
		sqlSb.append("	qrcode.`status`,\n");
		sqlSb.append("	qrcode.is_delete,\n");
		sqlSb.append("	business.`name`,\n");
		sqlSb.append("	business.address,\n");
		sqlSb.append("	business.mail,\n");
		sqlSb.append("	business.introduce,\n");
		sqlSb.append("	business.phone_number,\n");
		sqlSb.append("	business.qrcode_limit,\n");
		sqlSb.append("	business.days,\n");
		sqlSb.append("	business.life_value,\n");
		sqlSb.append("	category.`name` AS category_name,\n");
		sqlSb.append("	category.`value`,\n");
		sqlSb.append("	category.type AS category_type\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	qrcode\n");
		sqlSb.append("LEFT JOIN business ON qrcode.open_id = business.open_id\n");
		sqlSb.append("LEFT JOIN category ON qrcode.category_id = category.id\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	1 = 1\n");

		if (status != null && status.length > 0) {
			sqlSb.append(SqlUtil.replaceIfNotEmpty("AND qrcode.`status` IN ({?1})\n", SqlUtil.joinAsIntIn2(status)));
		}

		if (sDate != null && eDate != null) {
			sqlSb.append(StringUtil.replace("AND (qrcode.date_time between '{?1}' and '{?2}')\n",
					DateUtil.format(sDate, DateUtil.FORMAT1), DateUtil.format(eDate, DateUtil.FORMAT1)));
		}

		sqlSb.append("ORDER BY\n");
		sqlSb.append("	qrcode.date_time DESC\n");

		return getMapList(sqlSb);
	}
}

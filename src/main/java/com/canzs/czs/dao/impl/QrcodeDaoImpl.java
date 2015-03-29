/**
 * QrcodeDaoImpl.java
 */
package com.canzs.czs.dao.impl;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.canzs.czs.base.impl.BaseDaoImpl;
import com.canzs.czs.dao.IQrcodeDao;
import com.canzs.czs.pojo.entity.Qrcode;

/**
 * 【二维码】持久化实现层.
 * 
 * @creation 2014年03月25日 05:57:01
 * @modification 2014年03月25日 05:57:01
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Repository
@Transactional
public class QrcodeDaoImpl extends BaseDaoImpl implements IQrcodeDao {

	@Override
	public List<Map<String, Object>> query(Locale locale, Qrcode qrcode, Long start, Long limit) {

		// TODO

		return null;
	}

	@Override
	public List<Map<String, Object>> listByOpenId(Locale locale, String openId) {

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
			category.`name`,
			category.`value`,
			category.is_deleted,
			category.type AS category_type
		FROM
			qrcode
		INNER JOIN category ON qrcode.category_id = category.id
		WHERE
			qrcode.is_delete = 0
		AND qrcode.open_id = 'okPUDtzjrogWsWdsI_Fz39VNbgBc'**/
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
		sqlSb.append("	category.`name`,\n");
		sqlSb.append("	category.`value`,\n");
		sqlSb.append("	category.is_deleted,\n");
		sqlSb.append("	category.type AS category_type\n");
		sqlSb.append("FROM\n");
		sqlSb.append("	qrcode\n");
		sqlSb.append("INNER JOIN category ON qrcode.category_id = category.id\n");
		sqlSb.append("WHERE\n");
		sqlSb.append("	qrcode.is_delete = 0\n");
		sqlSb.append("AND qrcode.open_id = ?\n");

		return getMapList(sqlSb, openId);
	}

	@Override
	public long queryCount(Locale locale, Qrcode qrcode) {

		// TODO

		return 0L;
	}

}

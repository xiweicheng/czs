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

}

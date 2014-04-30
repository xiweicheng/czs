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
 * @company Skycloud
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
	public long queryCount(Locale locale, Qrcode qrcode) {
	
		// TODO
	
		return 0L;
	}
	
}

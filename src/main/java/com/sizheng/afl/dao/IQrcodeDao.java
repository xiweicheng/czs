/**
 * IQrcodeDao.java
 */
package com.sizheng.afl.dao;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.sizheng.afl.pojo.entity.Qrcode;

/**
 * 【二维码】持久化接口层.
 * 
 * @creation 2014年03月25日 05:57:01
 * @modification 2014年03月25日 05:57:01
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IQrcodeDao {

	/**
	 * 查询【二维码】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 05:57:01
	 * @modification 2014年03月25日 05:57:01
	 * @param locale
	 * @param qrcode
	 * @param start
	 * @param limit
	 * @return
	 */
	List<Map<String, Object>> query(Locale locale, Qrcode qrcode, Long start, Long limit);

	/**
	 * 查询总数查询【二维码】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 05:57:01
	 * @modification 2014年03月25日 05:57:01
	 * @param locale
	 * @param qrcode
	 * @return
	 */
	long queryCount(Locale locale, Qrcode qrcode);
	
}

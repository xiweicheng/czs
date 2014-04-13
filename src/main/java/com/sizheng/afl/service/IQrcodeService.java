/**
 * IQrcodeService.java
 */
package com.sizheng.afl.service;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.sizheng.afl.base.IBaseService;
import com.sizheng.afl.pojo.entity.Qrcode;
import com.sizheng.afl.pojo.model.WeiXinQrcode;
import com.sizheng.afl.pojo.vo.PageResult;

/**
 * 【二维码】业务逻辑接口.
 * 
 * @creation 2014年03月25日 05:57:01
 * @modification 2014年03月25日 05:57:01
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IQrcodeService extends IBaseService {

	/**
	 * 创建【二维码】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 05:57:01
	 * @modification 2014年03月25日 05:57:01
	 * @param qrcode
	 * @return
	 */
	boolean save(Locale locale, Qrcode qrcode);

	/**
	 * 删除【二维码】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 05:57:01
	 * @modification 2014年03月25日 05:57:01
	 * @param qrcode
	 * @return
	 */
	boolean delete(Locale locale, Qrcode qrcode);

	/**
	 * 获取【二维码】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 05:57:01
	 * @modification 2014年03月25日 05:57:01
	 * @param qrcode
	 * @return
	 */
	com.sizheng.afl.pojo.entity.Qrcode get(Locale locale, com.sizheng.afl.pojo.entity.Qrcode qrcode);
	
	/**
	 * 更新【二维码】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 05:57:01
	 * @modification 2014年03月25日 05:57:01
	 * @param qrcode
	 * @return
	 */
	boolean update(Locale locale, Qrcode qrcode);
	
	/**
	 * 列举【二维码】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 05:57:01
	 * @modification 2014年03月25日 05:57:01
	 * @param openId TODO
	 * @param qrcode
	 * @return
	 */
	List<Qrcode> list(Locale locale, String openId);

	/**
	 * 查询【二维码】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 05:57:01
	 * @modification 2014年03月25日 05:57:01
	 * @param qrcode
	 * @return
	 */
	List<Map<String, Object>> query(Locale locale, Qrcode qrcode);

	/**
	 * 查询【二维码】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 05:57:01
	 * @modification 2014年03月25日 05:57:01
	 * @param qrcode
	 * @return
	 */
	PageResult paging(Locale locale, Qrcode qrcode, Long start, Long limit);

	/**
	 * 判断【二维码】是否存在.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 05:57:01
	 * @modification 2014年03月25日 05:57:01
	 * @param qrcode
	 * @return
	 */
	boolean exists(Locale locale, Qrcode qrcode);

	WeiXinQrcode create(Qrcode qrcode, String realPath, String serverBaseUrl);

	boolean sendMail(String filePath, String url, String ticket, String toAddr);

	List<com.sizheng.afl.pojo.entity.Qrcode> queryByOpenId(Locale locale, String openId);

	/**
	 * 取得二维码类型.
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月27日 下午1:25:33
	 * @modification 2014年3月27日 下午1:25:33
	 * @param sceneId
	 * @return
	 */
	String getQrCodeType(Locale locale, String sceneId);

	boolean sendMail(String filePath, String toAddr);

	boolean isExistsJSQrcode(Locale locale, Qrcode qrcode);
}

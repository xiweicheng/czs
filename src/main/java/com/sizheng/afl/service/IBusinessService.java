/**
 * IBusinessService.java
 */
package com.sizheng.afl.service;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.sizheng.afl.base.IBaseService;
import com.sizheng.afl.pojo.model.Business;
import com.sizheng.afl.pojo.model.WeiXinBaseMsg;
import com.sizheng.afl.pojo.vo.PageResult;

/**
 * 【商家】业务逻辑接口.
 * 
 * @creation 2014年03月25日 02:46:32
 * @modification 2014年03月25日 02:46:32
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IBusinessService extends IBaseService {

	/**
	 * 创建【商家】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 02:46:32
	 * @modification 2014年03月25日 02:46:32
	 * @param business
	 * @return
	 */
	boolean save(Locale locale, Business business);

	/**
	 * 删除【商家】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 02:46:32
	 * @modification 2014年03月25日 02:46:32
	 * @param business
	 * @return
	 */
	boolean delete(Locale locale, Business business);

	/**
	 * 获取【商家】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 02:46:32
	 * @modification 2014年03月25日 02:46:32
	 * @param business
	 * @return
	 */
	Business get(Locale locale, Business business);
	
	/**
	 * 更新【商家】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 02:46:32
	 * @modification 2014年03月25日 02:46:32
	 * @param business
	 * @return
	 */
	boolean update(Locale locale, Business business);
	
	/**
	 * 列举【商家】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 02:46:32
	 * @modification 2014年03月25日 02:46:32
	 * @param business
	 * @return
	 */
	List<Business> list(Locale locale);

	/**
	 * 查询【商家】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 02:46:32
	 * @modification 2014年03月25日 02:46:32
	 * @param business
	 * @return
	 */
	List<Map<String, Object>> query(Locale locale, Business business);

	/**
	 * 查询【商家】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 02:46:32
	 * @modification 2014年03月25日 02:46:32
	 * @param business
	 * @return
	 */
	PageResult paging(Locale locale, Business business, Long start, Long limit);

	/**
	 * 判断【商家】是否存在.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 02:46:32
	 * @modification 2014年03月25日 02:46:32
	 * @param business
	 * @return
	 */
	boolean exists(Locale locale, Business business);

	/**
	 * 二维码达到限制.
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月27日 上午11:18:33
	 * @modification 2014年3月27日 上午11:18:33
	 * @param locale
	 * @param openId
	 * @return
	 */
	boolean isQrcodeLimited(Locale locale, String openId);

	/**
	 * 添加食客.
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月27日 上午11:17:52
	 * @modification 2014年3月27日 上午11:17:52
	 * @param locale TODO
	 * @param bean
	 * @return
	 */
	String addConsumer(Locale locale, WeiXinBaseMsg bean);
}

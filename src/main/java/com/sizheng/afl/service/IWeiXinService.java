/**
 * IWeiXinService.java
 */
package com.sizheng.afl.service;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.sizheng.afl.base.IBaseService;
import com.sizheng.afl.pojo.model.WeiXin;
import com.sizheng.afl.pojo.model.WeiXinBaseMsg;
import com.sizheng.afl.pojo.model.WeiXinMsg;
import com.sizheng.afl.pojo.vo.PageResult;

/**
 * 【微信】业务逻辑接口.
 * 
 * @creation 2014年03月22日 01:00:03
 * @modification 2014年03月22日 01:00:03
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IWeiXinService extends IBaseService {

	/**
	 * 创建【微信】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月22日 01:00:03
	 * @modification 2014年03月22日 01:00:03
	 * @param weiXin
	 * @return
	 */
	boolean save(Locale locale, WeiXin weiXin);

	/**
	 * 删除【微信】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月22日 01:00:03
	 * @modification 2014年03月22日 01:00:03
	 * @param weiXin
	 * @return
	 */
	boolean delete(Locale locale, WeiXin weiXin);

	/**
	 * 获取【微信】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月22日 01:00:03
	 * @modification 2014年03月22日 01:00:03
	 * @param weiXin
	 * @return
	 */
	WeiXin get(Locale locale, WeiXin weiXin);
	
	/**
	 * 更新【微信】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月22日 01:00:03
	 * @modification 2014年03月22日 01:00:03
	 * @param weiXin
	 * @return
	 */
	boolean update(Locale locale, WeiXin weiXin);
	
	/**
	 * 列举【微信】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月22日 01:00:03
	 * @modification 2014年03月22日 01:00:03
	 * @param weiXin
	 * @return
	 */
	List<WeiXin> list(Locale locale);

	/**
	 * 查询【微信】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月22日 01:00:03
	 * @modification 2014年03月22日 01:00:03
	 * @param weiXin
	 * @return
	 */
	List<Map<String, Object>> query(Locale locale, WeiXin weiXin);

	/**
	 * 查询【微信】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月22日 01:00:03
	 * @modification 2014年03月22日 01:00:03
	 * @param weiXin
	 * @return
	 */
	PageResult paging(Locale locale, WeiXin weiXin, Long start, Long limit);

	/**
	 * 判断【微信】是否存在.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月22日 01:00:03
	 * @modification 2014年03月22日 01:00:03
	 * @param weiXin
	 * @return
	 */
	boolean exists(Locale locale, WeiXin weiXin);

	boolean subscribe(WeiXinBaseMsg bean, Locale locale);

	boolean unsubscribe(WeiXinBaseMsg bean, Locale locale);

	boolean click(WeiXinBaseMsg bean, Locale locale);

	boolean verifyFail(WeiXinMsg bean, Locale locale);

	boolean handleMsgTypeFail(WeiXinBaseMsg bean, Locale locale);

	boolean location(WeiXinBaseMsg bean, Locale locale);

	String getWebpageCodeUrl();
}

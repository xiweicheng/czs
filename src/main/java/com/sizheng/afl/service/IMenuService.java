/**
 * IMenuService.java
 */
package com.sizheng.afl.service;

import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.sizheng.afl.base.IBaseService;
import com.sizheng.afl.pojo.entity.Menu;
import com.sizheng.afl.pojo.entity.MenuBill;
import com.sizheng.afl.pojo.vo.PageResult;

/**
 * 【菜单】业务逻辑接口.
 * 
 * @creation 2014年03月29日 08:37:31
 * @modification 2014年03月29日 08:37:31
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IMenuService extends IBaseService {

	/**
	 * 创建【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @param menu
	 * @return
	 */
	boolean save(Locale locale, Menu menu);

	/**
	 * 删除【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @param menu
	 * @return
	 */
	boolean delete(Locale locale, Menu menu);

	/**
	 * 获取【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @param menu
	 * @return
	 */
	Menu get(Locale locale, Menu menu);
	
	/**
	 * 更新【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @param menu
	 * @return
	 */
	boolean update(Locale locale, Menu menu);
	
	/**
	 * 列举【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @param menu
	 * @return
	 */
	List<Menu> list(Locale locale);

	/**
	 * 查询【菜单】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @param menu
	 * @return
	 */
	List<Menu> query(Locale locale, Menu menu);

	/**
	 * 查询【菜单】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @param menu
	 * @return
	 */
	PageResult paging(Locale locale, Menu menu, Long start, Long limit);

	/**
	 * 判断【菜单】是否存在.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @param menu
	 * @return
	 */
	boolean exists(Locale locale, Menu menu);

	/**
	 * 上传图片.
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月29日 下午4:14:41
	 * @modification 2014年3月29日 下午4:14:41
	 * @param calcServerBaseUrl
	 * @param realPath TODO
	 * @param imageFile
	 * @param locale
	 * @param openId TODO
	 * @return
	 */
	boolean upload(String calcServerBaseUrl, String realPath, MultipartFile imageFile, Locale locale, String openId);

	/**
	 * 查询【菜单】封装成MapList.
	 * 
	 * @param locale
	 * @param menu
	 * @param consumeCode TODO
	 * @param order TODO
	 * @param consumerId TODO
	 * @return
	 */
	List<Map<String, Object>> queryMapList(Locale locale, Menu menu, String consumeCode, String order, String consumerId);

	/**
	 * 顾客下单
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月4日 上午10:07:48
	 * @modification 2014年4月4日 上午10:07:48
	 * @param locale
	 * @param menuBill
	 * @return
	 */
	boolean billDeal(Locale locale, MenuBill menuBill);

	/**
	 * 商家查询菜单列表.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月6日 下午7:07:39
	 * @modification 2014年4月6日 下午7:07:39
	 * @param locale
	 * @param menu
	 * @param object
	 * @return
	 */
	List<Map<String, Object>> queryBillMapList(Locale locale, Menu menu);

	/**
	 * 获取订单.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月13日 下午7:44:16
	 * @modification 2014年4月13日 下午7:44:16
	 * @param locale
	 * @param menu
	 * @return
	 */
	List<Map<String, Object>> queryOrderMapList(Locale locale, Menu menu);

	/**
	 * 处理顾客订单.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月13日 下午8:40:42
	 * @modification 2014年4月13日 下午8:40:42
	 * @param locale
	 * @param menuBill
	 * @return
	 */
	boolean acceptBill(Locale locale, MenuBill menuBill);

	/**
	 * 合并菜单查询
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月13日 下午10:21:18
	 * @modification 2014年4月13日 下午10:21:18
	 * @param locale
	 * @param menu
	 * @return
	 */
	List<Map<String, Object>> queryJoinBill(Locale locale, Menu menu);

	/**
	 * 顾客订单合并处理
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月13日 下午11:35:09
	 * @modification 2014年4月13日 下午11:35:09
	 * @param locale
	 * @param ids
	 * @param copies TODO
	 * @return
	 */
	boolean acceptBillJoin(Locale locale, String[] ids, Long[] copies);

	/**
	 * 订单提交处理.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月21日 下午12:44:12
	 * @modification 2014年4月21日 下午12:44:12
	 * @param locale
	 * @param openId
	 * @return
	 */
	boolean billSubmit(Locale locale, String openId);

	/**
	 * 查询历史账单
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月21日 下午12:44:02
	 * @modification 2014年4月21日 下午12:44:02
	 * @param locale
	 * @param businessId
	 * @param start
	 * @param end
	 * @param status
	 * @return
	 */
	List<Map<String, Object>> queryHistoryMenuBill(Locale locale, String businessId, Date start, Date end,
			String... status);
}

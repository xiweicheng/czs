/**
 * IMenuBillService.java
 */
package com.sizheng.afl.service;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.sizheng.afl.base.IBaseService;
import com.sizheng.afl.pojo.entity.MenuBill;
import com.sizheng.afl.pojo.vo.PageResult;

/**
 * 【订单】业务逻辑接口.
 * 
 * @creation 2014年04月05日 05:02:44
 * @modification 2014年04月05日 05:02:44
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IMenuBillService extends IBaseService {

	/**
	 * 创建【订单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月05日 05:02:44
	 * @modification 2014年04月05日 05:02:44
	 * @param menuBill
	 * @return
	 */
	boolean save(Locale locale, MenuBill menuBill);

	/**
	 * 删除【订单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月05日 05:02:44
	 * @modification 2014年04月05日 05:02:44
	 * @param menuBill
	 * @return
	 */
	boolean delete(Locale locale, MenuBill menuBill);

	/**
	 * 获取【订单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月05日 05:02:44
	 * @modification 2014年04月05日 05:02:44
	 * @param menuBill
	 * @return
	 */
	MenuBill get(Locale locale, MenuBill menuBill);
	
	/**
	 * 更新【订单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月05日 05:02:44
	 * @modification 2014年04月05日 05:02:44
	 * @param menuBill
	 * @return
	 */
	boolean update(Locale locale, MenuBill menuBill);
	
	/**
	 * 列举【订单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月05日 05:02:44
	 * @modification 2014年04月05日 05:02:44
	 * @param menuBill
	 * @return
	 */
	List<MenuBill> list(Locale locale);

	/**
	 * 查询【订单】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月05日 05:02:44
	 * @modification 2014年04月05日 05:02:44
	 * @param menuBill
	 * @return
	 */
	List<MenuBill> query(Locale locale, MenuBill menuBill);

	/**
	 * 查询【订单】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月05日 05:02:44
	 * @modification 2014年04月05日 05:02:44
	 * @param menuBill
	 * @return
	 */
	PageResult paging(Locale locale, MenuBill menuBill, Long start, Long limit);

	/**
	 * 判断【订单】是否存在.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月05日 05:02:44
	 * @modification 2014年04月05日 05:02:44
	 * @param menuBill
	 * @return
	 */
	boolean exists(Locale locale, MenuBill menuBill);

	/**
	 * 查询订单.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月5日 下午5:07:03
	 * @modification 2014年4月5日 下午5:07:03
	 * @param locale
	 * @param menuBill
	 * @return
	 */
	List<Map<String, Object>> query4MapList(Locale locale, MenuBill menuBill);

	/**
	 * 集体订单查询.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月6日 下午12:27:36
	 * @modification 2014年4月6日 下午12:27:36
	 * @param locale
	 * @param menuBill
	 * @return
	 */
	List<Map<String, Object>> query4GroupMapList(Locale locale, MenuBill menuBill);

	double[] getOwnTotalAndCopies(Locale locale, String openId);

	List<Map<String, Object>> query4MapList2(Locale locale, MenuBill menuBill);

	List<Map<String, Object>> query4GroupMapList2(Locale locale, MenuBill menuBill);

}

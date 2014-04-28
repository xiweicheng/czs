/**
 * IBusinessDao.java
 */
package com.sizheng.afl.dao;

import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.sizheng.afl.pojo.entity.Business;
import com.sizheng.afl.pojo.entity.BusinessConsumer;
import com.sizheng.afl.pojo.entity.BusinessRole;

/**
 * 【商家】持久化接口层.
 * 
 * @creation 2014年03月25日 02:46:32
 * @modification 2014年03月25日 02:46:32
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public interface IBusinessDao {

	/**
	 * 查询【商家】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 02:46:32
	 * @modification 2014年03月25日 02:46:32
	 * @param locale
	 * @param business
	 * @param start
	 * @param limit
	 * @return
	 */
	List<Map<String, Object>> query(Locale locale, Business business, Long start, Long limit);

	/**
	 * 查询总数查询【商家】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 02:46:32
	 * @modification 2014年03月25日 02:46:32
	 * @param locale
	 * @param business
	 * @return
	 */
	long queryCount(Locale locale, Business business);

	/**
	 * 查询列举消费用户.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月3日 下午5:04:00
	 * @modification 2014年4月3日 下午5:04:00
	 * @param locale
	 * @param business
	 * @param status TODO
	 * @return
	 */
	List<Map<String, Object>> listCustomer(Locale locale, Business business, String status, Boolean filterOver);

	/**
	 * 查询用户体信息.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月6日 下午10:29:15
	 * @modification 2014年4月6日 下午10:29:15
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	List<Map<String, Object>> queryGroupInfo(Locale locale, BusinessConsumer businessConsumer);

	/**
	 * 获取用户的消费额.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月6日 下午11:26:34
	 * @modification 2014年4月6日 下午11:26:34
	 * @param locale
	 * @param consumeCode
	 * @return
	 */
	double getConsume(Locale locale, String consumeCode);

	/**
	 * 获取用户体消费额.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月6日 下午11:36:30
	 * @modification 2014年4月6日 下午11:36:30
	 * @param locale
	 * @param sceneId
	 * @return
	 */
	double getTotalConsume(Locale locale, String sceneId);

	/**
	 * 获取消费体人数.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午3:10:02
	 * @modification 2014年4月7日 下午3:10:02
	 * @param locale
	 * @param consumeCode
	 * @return
	 */
	long getGroupSize(Locale locale, String consumeCode);

	Map<String, Object> getConsumer(Locale locale, String openId);

	List<Map<String, Object>> queryRequest(Locale locale, String openId);

	List<Map<String, Object>> listMgrRoles(Locale locale, BusinessRole businessRole);

	List<Map<String, Object>> menuGraph(Locale locale, String openId);

	List<Map<String, Object>> billDayGraph(Locale locale, String openId);

	List<Map<String, Object>> menuDayGraph(Locale locale, String openId, String menuId);

	List<Map<String, Object>> volumeDayGraph(String openId, String date);

	List<Map<String, Object>> serviceGraph(String openId);

	List<Map<String, Object>> serviceDayGraph(String openId, String date);

	List<Map<String, Object>> queryCustomerMsg(Locale locale, String openId, Date sDate, Date eDate, String... status);

	List<Map<String, Object>> queryCustomerService(Locale locale, String openId, Date sDate, Date eDate,
			String... status);

	List<Map<String, Object>> queryBillSett(Locale locale, String businessId, Date sDate, Date eDate, String... status);

	boolean billSettConfirm(Locale locale, String bussinessId, String settHandler, String... ids);

	List<Map<String, Object>> queryBillSettByDate(Locale locale, String sessionBusinessId, Long times);

	List<Map<String, Object>> consumerGraph(String businessId);

	List<Map<String, Object>> consumerDayGraph(String sessionBusinessId, String date);

	List<Map<String, Object>> queryBusinessConsumer(Locale locale, String businessId, String... status);

	List<Map<String, Object>> queryConsumerRequest(Locale locale, String businessId, String... status);
	
}

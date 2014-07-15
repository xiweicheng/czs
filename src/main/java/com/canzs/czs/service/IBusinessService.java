/**
 * IBusinessService.java
 */
package com.canzs.czs.service;

import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.canzs.czs.base.IBaseService;
import com.canzs.czs.pojo.entity.Business;
import com.canzs.czs.pojo.entity.BusinessConsumer;
import com.canzs.czs.pojo.entity.BusinessRole;
import com.canzs.czs.pojo.model.WeiXinBaseMsg;
import com.canzs.czs.pojo.vo.PageResult;

/**
 * 【商家】业务逻辑接口.
 * 
 * @creation 2014年03月25日 02:46:32
 * @modification 2014年03月25日 02:46:32
 * @company Canzs
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
	long qrcodeRemain(Locale locale, String openId);

	/**
	 * 添加食客.
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月27日 上午11:17:52
	 * @modification 2014年3月27日 上午11:17:52
	 * @param locale
	 *            TODO
	 * @param bean
	 * @return
	 */
	String addConsumer(Locale locale, WeiXinBaseMsg bean);

	/**
	 * 发送动态登录链接到邮箱
	 * 
	 * @author xiweicheng
	 * @creation 2014年3月28日 上午11:09:19
	 * @modification 2014年3月28日 上午11:09:19
	 * @param locale
	 * @param business
	 * @param serverBaseUrl
	 *            TODO
	 * @return
	 */
	String sendMail(Locale locale, Business business, String serverBaseUrl);

	/**
	 * 生成登录动态二维码.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月3日 下午1:41:31
	 * @modification 2014年4月3日 下午1:41:31
	 * @param locale
	 * @param business
	 * @return
	 */
	String createDynamicCode(Locale locale, Business business);

	/**
	 * 查询消费用户.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月3日 下午5:02:20
	 * @modification 2014年4月3日 下午5:02:20
	 * @param locale
	 * @param business
	 * @param status
	 *            TODO
	 * @return
	 */
	List<Map<String, Object>> listCustomer(Locale locale, Business business, String status, Boolean filterOver);

	/**
	 * 查询消费体信息.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月6日 下午10:27:22
	 * @modification 2014年4月6日 下午10:27:22
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	List<Map<String, Object>> queryGroupInfo(Locale locale, BusinessConsumer businessConsumer);

	/**
	 * 获取用户的消费额.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月6日 下午11:25:43
	 * @modification 2014年4月6日 下午11:25:43
	 * @param locale
	 * @param consumeCode
	 * @return
	 */
	double getConsume(Locale locale, String consumeCode);

	/**
	 * 获取用户体的消费额.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月6日 下午11:25:43
	 * @modification 2014年4月6日 下午11:25:43
	 * @param locale
	 * @param consumeCode
	 * @return
	 */
	double getTotalConsume(Locale locale, String sceneId);

	/**
	 * 获取消费金额.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 上午11:38:51
	 * @modification 2014年4月7日 上午11:38:51
	 * @param locale
	 * @param consumeCode
	 * @param ownOrGroup
	 * @return
	 */
	double getConsume(Locale locale, String consumeCode, String ownOrGroup);

	/**
	 * 结账确认处理.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午1:46:36
	 * @modification 2014年4月7日 下午1:46:36
	 * @param locale
	 * @param businessConsumer
	 * @param billHandler TODO
	 * @return
	 */
	Boolean checkout(Locale locale, BusinessConsumer businessConsumer, String billHandler);

	/**
	 * 获取集体人数.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午3:05:22
	 * @modification 2014年4月7日 下午3:05:22
	 * @param locale
	 * @param consumeCode
	 * @return
	 */
	long getGroupSize(Locale locale, String consumeCode);

	/**
	 * 获取顾客信息.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月8日 下午2:54:18
	 * @modification 2014年4月8日 下午2:54:18
	 * @param locale
	 * @param openId
	 * @return
	 */
	Map<String, Object> getConsumer(Locale locale, String openId);

	/**
	 * 同意或者禁止进入消费.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月8日 下午2:54:31
	 * @modification 2014年4月8日 下午2:54:31
	 * @param locale
	 * @param consumeCode
	 * @param equals
	 * @param handler TODO
	 * @return
	 */
	Boolean agreeOrDisagree(Locale locale, String consumeCode, boolean equals, String handler);

	/**
	 * 解禁顾客.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月8日 下午4:13:53
	 * @modification 2014年4月8日 下午4:13:53
	 * @param locale
	 * @param consumerId
	 * @param businessId
	 *            TODO
	 * @return
	 */
	Boolean enableConsumer(Locale locale, String consumerId, String businessId);

	/**
	 * 顾客实时请求查询.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月11日 下午3:02:14
	 * @modification 2014年4月11日 下午3:02:14
	 * @param locale
	 * @param openId
	 * @return
	 */
	List<Map<String, Object>> queryRequest(Locale locale, String openId);

	/**
	 * 商家添加员工角色.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月13日 下午12:31:41
	 * @modification 2014年4月13日 下午12:31:41
	 * @param locale
	 * @param bean
	 * @return
	 */
	String addRole(Locale locale, WeiXinBaseMsg bean);

	/**
	 * 获取商家的员工角色.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月13日 下午1:05:03
	 * @modification 2014年4月13日 下午1:05:03
	 * @param locale
	 * @param businessRole
	 * @return
	 */
	List<Map<String, Object>> listMgrRoles(Locale locale, BusinessRole businessRole);

	boolean setRole(Locale locale, BusinessRole businessRole);

	boolean deleteRole(Locale locale, BusinessRole businessRole);

	boolean acceptServiceReq(Locale locale, String id, String handler);

	Map<String, List<Object>> menuGraph(Locale locale, String openId);

	Map<String, List<Object>> volumeGraph(Locale locale, String openId, Date start, Date end);

	Map<String, List<Object>> menuDayGraph(Locale locale, String openId, String id, Date start, Date end);

	List<List<Object>> volumeDayGraph(Locale locale, String openId, String date);

	Map<String, List<Object>> serviceGraph(Locale locale, String openId, Date start, Date end);

	List<List<Object>> serviceDayGraph(Locale locale, String openId, String date);

	List<Map<String, Object>> queryCustomerMsg(Locale locale, String openId, Date sDate, Date eDate, String... status);

	List<Map<String, Object>> queryCustomerService(Locale locale, String openId, Date sDate, Date eDate,
			String... status);

	List<Map<String, Object>> queryBillSett(Locale locale, String sessionBusinessId, Date sDate, Date eDate,
			String... status);

	boolean billSettConfirm(Locale locale, String businessId, String settHandler, String... ids);

	List<Map<String, Object>> queryBillSettByDate(Locale locale, String sessionBusinessId, Long times);

	Map<String, List<Object>> consumerGraph(Locale locale, String openId, Date start, Date end);

	List<Map<String, Object>> consumerDayGraph(Locale locale, String sessionBusinessId, String date);

	void clearDynamicCodeAndLoginTimes(Locale locale, Business business);

	List<Map<String, Object>> queryBusinessConsumer(Locale locale, String businessId, String... status);

	List<Map<String, Object>> queryConsumerRequest(Locale locale, String businessId, String... status);

	List<Map<String, Object>> queryBusinessConsumerHistory(Locale locale, String businessId, String openId);

	List<Map<String, Object>> queryConsumerRequestHistory(Locale locale, String businessId, String openId);

	List<Map<String, Object>> getInfo(Locale locale, String sessionBusinessId);
}

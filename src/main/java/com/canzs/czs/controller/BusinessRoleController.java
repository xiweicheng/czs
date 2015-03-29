/**
 * BusinessRoleController.java
 */
package com.canzs.czs.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.canzs.czs.base.BaseController;
import com.canzs.czs.component.PropUtil;
import com.canzs.czs.component.WeiXinApiInvoker;
import com.canzs.czs.pojo.constant.SysConstant;
import com.canzs.czs.pojo.entity.BusinessRole;
import com.canzs.czs.pojo.entity.Menu;
import com.canzs.czs.pojo.entity.MenuBill;
import com.canzs.czs.pojo.vo.PageResult;
import com.canzs.czs.pojo.vo.ReqBody;
import com.canzs.czs.pojo.vo.ResultMsg;
import com.canzs.czs.service.IBusinessRoleService;
import com.canzs.czs.service.IBusinessService;
import com.canzs.czs.service.IMenuService;
import com.canzs.czs.util.DateUtil;
import com.canzs.czs.util.NumberUtil;
import com.canzs.czs.util.StringUtil;
import com.canzs.czs.util.ThreadUtil;

/**
 * 【商家角色管理】请求控制层.
 * 
 * @creation 2014年04月22日 10:02:47
 * @modification 2014年04月22日 10:02:47
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Controller
@RequestMapping(value = "businessRole")
public class BusinessRoleController extends BaseController {

	private static Logger logger = Logger.getLogger(BusinessRoleController.class);

	@Autowired
	IBusinessRoleService businessRoleService;

	@Autowired
	IMenuService menuService;

	@Autowired
	IBusinessService businessService;

	@Autowired
	WeiXinApiInvoker weiXinApiInvoker;

	@Autowired
	PropUtil propUtil;

	/**
	 * 添加【商家角色管理】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 10:02:47
	 * @modification 2014年04月22日 10:02:47
	 * @return
	 */
	// @RequestMapping("add")
	@ResponseBody
	public ResultMsg add(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody,
			@ModelAttribute BusinessRole businessRole, Locale locale, Model model) {

		logger.debug("添加【商家角色管理】");

		// TODO

		// BusinessRole businessRole = getParam(reqBody, BusinessRole.class);

		// 参数验证
		// Assert.notNull(businessRole.get);

		boolean saved = businessRoleService.save(locale, businessRole);

		// TODO null->ID
		return new ResultMsg(saved, reqBody.getId(), null);
	}

	/**
	 * 删除【商家角色管理】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 10:02:47
	 * @modification 2014年04月22日 10:02:47
	 * @return
	 */
	// @RequestMapping("delete")
	@ResponseBody
	public ResultMsg delete(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody,
			@ModelAttribute BusinessRole businessRole, Locale locale, Model model) {

		logger.debug("删除【商家角色管理】");

		// TODO

		// BusinessRole businessRole = getParam(reqBody, BusinessRole.class);

		// 参数验证
		// Assert.notNull(businessRole.get);

		boolean deleted = businessRoleService.delete(locale, businessRole);

		return new ResultMsg(deleted, reqBody.getId());
	}

	/**
	 * 获取【商家角色管理】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 10:02:47
	 * @modification 2014年04月22日 10:02:47
	 * @return
	 */
	// @RequestMapping("get")
	@ResponseBody
	public ResultMsg get(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody,
			@ModelAttribute BusinessRole businessRole, Locale locale, Model model) {

		logger.debug("获取【商家角色管理】");

		// TODO

		// BusinessRole businessRole = getParam(reqBody, BusinessRole.class);

		// 参数验证
		// Assert.notNull(businessRole.get);

		BusinessRole BusinessRoleResult = businessRoleService.get(locale, businessRole);

		return new ResultMsg(true, reqBody.getId(), BusinessRoleResult);
	}

	/**
	 * 更新【商家角色管理】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 10:02:47
	 * @modification 2014年04月22日 10:02:47
	 * @return
	 */
	// @RequestMapping("update")
	@ResponseBody
	public ResultMsg update(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody,
			@ModelAttribute BusinessRole businessRole, Locale locale, Model model) {

		logger.debug("更新【商家角色管理】");

		// TODO

		// BusinessRole businessRole = getParam(reqBody, BusinessRole.class);

		// 参数验证
		// Assert.notNull(businessRole.get);

		boolean updated = businessRoleService.update(locale, businessRole);

		return new ResultMsg(updated, reqBody.getId());
	}

	/**
	 * 列举【商家角色管理】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 10:02:47
	 * @modification 2014年04月22日 10:02:47
	 * @return
	 */
	// @RequestMapping("list")
	@ResponseBody
	public ResultMsg list(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody,
			@ModelAttribute BusinessRole businessRole, Locale locale, Model model) {

		logger.debug("列举【商家角色管理】");

		// TODO

		// BusinessRole businessRole = getParam(reqBody, BusinessRole.class);

		// 参数验证
		// Assert.notNull(businessRole.get);

		List<BusinessRole> businessRoleList = businessRoleService.list(locale);

		return new ResultMsg(reqBody.getId(), businessRoleList);
	}

	/**
	 * 查询【商家角色管理】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 10:02:47
	 * @modification 2014年04月22日 10:02:47
	 * @return
	 */
	// @RequestMapping("query")
	@ResponseBody
	public ResultMsg query(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody,
			@ModelAttribute BusinessRole businessRole, Locale locale, Model model) {

		logger.debug("查询【商家角色管理】");

		// TODO

		// BusinessRole businessRole = getParam(reqBody, BusinessRole.class);

		// 参数验证
		// Assert.notNull(businessRole.get);

		List<BusinessRole> businessRoleList = businessRoleService.query(locale, businessRole);

		return new ResultMsg(reqBody.getId(), businessRoleList);
	}

	/**
	 * 查询【商家角色管理】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 10:02:47
	 * @modification 2014年04月22日 10:02:47
	 * @return
	 */
	// @RequestMapping("paging")
	@ResponseBody
	public ResultMsg paging(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody,
			@ModelAttribute BusinessRole businessRole, Locale locale, Model model) {

		logger.debug("查询【商家角色管理】");

		// TODO

		// BusinessRole businessRole = getParam(reqBody, BusinessRole.class);

		// 参数验证
		Assert.notNull(reqBody.getStart());
		Assert.notNull(reqBody.getLimit());

		// Assert.notNull(businessRole.get);

		PageResult pageResult = businessRoleService
				.paging(locale, businessRole, reqBody.getStart(), reqBody.getLimit());

		return new ResultMsg(reqBody.getId(), pageResult.getList(), pageResult.getTotal());
	}

	/**
	 * 服务员登录.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午1:38:51
	 * @modification 2014年4月7日 下午1:38:51
	 * @param request
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	@RequestMapping("free/waiterLogin")
	public String waiterLogin(HttpServletRequest request, Locale locale, Model model,
			@RequestParam("openId") String openId, @RequestParam("businessId") String businessId) {

		logger.debug("服务员登录【商家】");

		BusinessRole businessRole = new BusinessRole();
		businessRole.setBusinessId(businessId);
		businessRole.setOpenId(openId);
		businessRole.setIsDelete(SysConstant.SHORT_FALSE);
		businessRole.setType(SysConstant.ROLE_TYPE_WAITER);

		List<BusinessRole> list = businessRoleService.query(locale, businessRole);

		if (list.size() == 0) {
			model.addAttribute("message", "您没有角色权限!");
			return "message";
		}

		List<Map<String, Object>> list2 = businessService.queryBusinessConsumer(locale, businessId, "5");

		for (Map<String, Object> map : list2) {
			map.put("diff", DateUtil.convert(NumberUtil.getLong(map, "sec_diff")));
		}

		model.addAttribute("listBusinessConsumer", list2);

		List<Map<String, Object>> list3 = businessService.queryConsumerRequest(locale, businessId, "1");

		for (Map<String, Object> map : list3) {
			map.put("diff", DateUtil.convert(NumberUtil.getLong(map, "sec_diff")));
		}

		model.addAttribute("listConsumerRequest", list3);

		return "business/waiter-login";
	}

	/**
	 * 服务员顾客请求.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午1:38:51
	 * @modification 2014年4月7日 下午1:38:51
	 * @param request
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	@RequestMapping("free/waiterRequest")
	public String waiterRequest(HttpServletRequest request, Locale locale, Model model,
			@RequestParam("openId") String openId, @RequestParam("businessId") String businessId) {

		logger.debug("服务员顾客请求【商家】");

		BusinessRole businessRole = new BusinessRole();
		businessRole.setBusinessId(businessId);
		businessRole.setOpenId(openId);
		businessRole.setIsDelete(SysConstant.SHORT_FALSE);
		businessRole.setType(SysConstant.ROLE_TYPE_WAITER);

		List<BusinessRole> list = businessRoleService.query(locale, businessRole);

		if (list.size() == 0) {
			model.addAttribute("message", "您没有角色权限!");
			return "message";
		}

		List<Map<String, Object>> list2 = businessService.queryConsumerRequest(locale, businessId, "1");

		for (Map<String, Object> map : list2) {
			map.put("diff", DateUtil.convert(NumberUtil.getLong(map, "sec_diff")));
		}

		model.addAttribute("list", list2);

		return "business/waiter-request";
	}

	/**
	 * 服务员检查顾客进入请求.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午1:38:51
	 * @modification 2014年4月7日 下午1:38:51
	 * @param request
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	@RequestMapping("free/checkRequest")
	@ResponseBody
	public ResultMsg checkRequest(HttpServletRequest request, Locale locale, Model model,
			@RequestParam("businessId") String businessId) {

		logger.debug("服务员检查顾客进入请求【商家】");

		List<Map<String, Object>> list2 = businessService.queryBusinessConsumer(locale, businessId, "5");
		List<Map<String, Object>> list3 = businessService.queryConsumerRequest(locale, businessId, "1");

		return new ResultMsg(true, list2.size() + list3.size());
	}

	/**
	 * 服务员检查顾客呼叫请求.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午1:38:51
	 * @modification 2014年4月7日 下午1:38:51
	 * @param request
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	@RequestMapping("free/checkService")
	@ResponseBody
	public ResultMsg checkService(HttpServletRequest request, Locale locale, Model model,
			@RequestParam("businessId") String businessId) {

		logger.debug("服务员检查顾客呼叫请求【商家】");

		List<Map<String, Object>> list2 = businessService.queryConsumerRequest(locale, businessId, "1");

		return new ResultMsg(true, list2.size());
	}

	/**
	 * 后厨登录.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午1:38:51
	 * @modification 2014年4月7日 下午1:38:51
	 * @param request
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	@RequestMapping("free/kitchenLogin")
	public String kitchenLogin(HttpServletRequest request, Locale locale, Model model,
			@RequestParam(value = "interval", required = false) String interval, @RequestParam("openId") String openId,
			@RequestParam("businessId") String businessId) {

		logger.debug("后厨登录【商家】");

		BusinessRole businessRole = new BusinessRole();
		businessRole.setBusinessId(businessId);
		businessRole.setOpenId(openId);
		businessRole.setIsDelete(SysConstant.SHORT_FALSE);
		businessRole.setType(SysConstant.ROLE_TYPE_COOK);

		List<BusinessRole> list = businessRoleService.query(locale, businessRole);

		if (list.size() == 0) {
			model.addAttribute("message", "您没有角色权限!");
			return "message";
		}

		Menu menu = new Menu();
		menu.setOwner(businessId);

		List<Map<String, Object>> mapList = menuService.queryOrderMapList(locale, menu);

		for (Map<String, Object> map : mapList) {
			long sec = NumberUtil.getLong(map, "sec_diff");
			String c = DateUtil.convert(sec);
			map.put("diff", c);
		}

		model.addAttribute("orderList", mapList);
		model.addAttribute("interval", interval);

		return "business/kitchen-login";
	}

	/**
	 * 后厨处理历史订单.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午1:38:51
	 * @modification 2014年4月7日 下午1:38:51
	 * @param request
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	@RequestMapping("free/kitchenHistory")
	public String kitchenHistory(HttpServletRequest request, Locale locale, Model model,
			@RequestParam(value = "interval", required = false) String interval, @RequestParam("openId") String openId,
			@RequestParam("businessId") String businessId) {

		logger.debug("后厨处理历史订单【商家】");

		List<Map<String, Object>> mapList = menuService.queryOrderHistoryMapList(locale, businessId, openId);

		for (Map<String, Object> map : mapList) {
			long sec = NumberUtil.getLong(map, "sec_diff");
			String c = DateUtil.convert(sec);
			map.put("diff", c);
		}

		model.addAttribute("orderList", mapList);
		model.addAttribute("interval", interval);

		return "business/kitchen-history";
	}

	/**
	 * 服务员处理历史订单.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午1:38:51
	 * @modification 2014年4月7日 下午1:38:51
	 * @param request
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	@RequestMapping("free/waiterHistory")
	public String waiterHistory(HttpServletRequest request, Locale locale, Model model,
			@RequestParam("openId") String openId, @RequestParam("businessId") String businessId) {

		logger.debug("服务员处理历史订单【商家】");

		List<Map<String, Object>> mapList = businessService.queryBusinessConsumerHistory(locale, businessId, openId);
		List<Map<String, Object>> mapList2 = businessService.queryConsumerRequestHistory(locale, businessId, openId);

		model.addAttribute("businessConsumerList", mapList);
		model.addAttribute("consumerRequestList", mapList2);

		return "business/waiter-history";
	}

	/**
	 * 前台登录.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午1:38:51
	 * @modification 2014年4月7日 下午1:38:51
	 * @param request
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	@RequestMapping("free/prosceniumLogin")
	public String prosceniumLogin(HttpServletRequest request, Locale locale, Model model,
			@RequestParam("openId") String openId, @RequestParam("businessId") String businessId) {

		logger.debug("前台登录【商家】");

		model.addAttribute("message", "前台登录");

		return "business/proscenium-login";
	}

	/**
	 * 店主登录.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午1:38:51
	 * @modification 2014年4月7日 下午1:38:51
	 * @param request
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	@RequestMapping("free/bossLogin")
	public String bossLogin(HttpServletRequest request, Locale locale, Model model,
			@RequestParam("openId") String openId, @RequestParam("businessId") String businessId) {

		logger.debug("店主登录【商家】");

		// 顾客数统计
		// 总计顾客数 今日顾客数 消费中顾客数
		long countAllConsumer = businessRoleService.countAllConsumer(locale, businessId);
		long countTodayConsumer = businessRoleService.countTodayConsumer(locale, businessId);
		long countTodayOngoingConsumer = businessRoleService.countTodayOngoingConsumer(locale, businessId);

		model.addAttribute("countAllConsumer", countAllConsumer);
		model.addAttribute("countTodayConsumer", countTodayConsumer);
		model.addAttribute("countTodayOngoingConsumer", countTodayOngoingConsumer);

		// 菜品点击统计
		long countAllMenuBill = businessRoleService.countAllMenuBill(locale, businessId);
		long countTodayMenuBill = businessRoleService.countTodayMenuBill(locale, businessId);
		long countTodayWaitMenuBill = businessRoleService.countTodayWaitMenuBill(locale, businessId);

		model.addAttribute("countAllMenuBill", countAllMenuBill);
		model.addAttribute("countTodayMenuBill", countTodayMenuBill);
		model.addAttribute("countTodayWaitMenuBill", countTodayWaitMenuBill);

		// 营业额统计
		double countAllBillBill = businessRoleService.countAllBillBill(locale, businessId);
		double countTodayBill = businessRoleService.countTodayBill(locale, businessId);
		double countYesterdayBill = businessRoleService.countYesterdayBill(locale, businessId);

		model.addAttribute("countAllBillBill", countAllBillBill);
		model.addAttribute("countTodayBill", countTodayBill);
		model.addAttribute("countYesterdayBill", countYesterdayBill);

		// 消息数统计
		long countAllMsg = businessRoleService.countAllMsg(locale, businessId);
		long countNewMsg = businessRoleService.countNewMsg(locale, businessId);
		long countStowMsg = businessRoleService.countStowMsg(locale, businessId);

		model.addAttribute("countAllMsg", countAllMsg);
		model.addAttribute("countNewMsg", countNewMsg);
		model.addAttribute("countStowMsg", countStowMsg);

		// 服务数统计
		long countAllService = businessRoleService.countAllService(locale, businessId);
		long countNewService = businessRoleService.countNewService(locale, businessId);
		long countTodayService = businessRoleService.countTodayService(locale, businessId);

		model.addAttribute("countAllService", countAllService);
		model.addAttribute("countNewService", countNewService);
		model.addAttribute("countTodayService", countTodayService);

		return "business/boss-login";

	}

	/**
	 * 顾客订单处理【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	@RequestMapping("free/accept")
	@ResponseBody
	public ResultMsg accept(HttpServletRequest request, Locale locale, @ModelAttribute MenuBill menuBill) {

		logger.debug("顾客订单处理【菜单】");

		Assert.notNull(menuBill.getId());
		Assert.notNull(menuBill.getCopies());
		Assert.notNull(menuBill.getAccepterId());

		boolean value = menuService.acceptBill(locale, menuBill);

		return new ResultMsg(value);
	}

	/**
	 * 顾客订单合并处理【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	@RequestMapping("free/acceptJoin")
	@ResponseBody
	public ResultMsg acceptJoin(HttpServletRequest request, Locale locale, @RequestParam("id") String[] ids,
			@RequestParam("copies") Long[] copies, @RequestParam("accepterId") String accepterId) {

		logger.debug("顾客订单处理【菜单】");

		boolean value = menuService.acceptBillJoin(locale, ids, copies, accepterId);

		return new ResultMsg(value);
	}

	/**
	 * 顾客进入请求处理【角色】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	@RequestMapping("free/requestHandle")
	@ResponseBody
	public ResultMsg requestHandle(HttpServletRequest request, Locale locale, @RequestParam("id") String[] ids,
			@RequestParam("status") String status, @RequestParam("accepterId") String accepterId,
			@RequestParam("consumerId") final String consumerId) {

		logger.debug("顾客进入请求处理【角色】");

		boolean value = businessRoleService.requestHandle(locale, ids, status, accepterId);

		if (value && SysConstant.CONSUME_STATUS_ONGOING.equals(Short.valueOf(status))) {// 发送菜单链接.

			ThreadUtil.exec(new Runnable() {
				public void run() {
					weiXinApiInvoker.sendServiceMsg(consumerId, StringUtil.replace(
							"请求确认通过!\n\n<a href='{?1}/menu/free/list4bill.do?openId={?2}'>[点击此]开始点菜</a>",
							propUtil.getRedirectUrl(), consumerId));
				}
			});
		}

		return new ResultMsg(value);
	}

	/**
	 * 顾客呼叫请求处理【角色】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	@RequestMapping("free/serviceHandle")
	@ResponseBody
	public ResultMsg serviceHandle(HttpServletRequest request, Locale locale, @RequestParam("id") String[] ids,
			@RequestParam("status") String status, @RequestParam("accepterId") String accepterId,
			@RequestParam("consumerId") final String consumerId) {

		logger.debug("顾客呼叫请求处理【角色】");

		boolean value = businessRoleService.serviceHandle(locale, ids, status, accepterId);

		if (value && SysConstant.SERVICE_STATUS_ACCEPT.equals(Short.valueOf(status))) {

			ThreadUtil.exec(new Runnable() {
				public void run() {
					weiXinApiInvoker.sendServiceMsg(consumerId, StringUtil.replace("您的呼叫服务已经被接受,请稍后..."));
				}
			});
		}

		return new ResultMsg(value);
	}

	/**
	 * 合并菜单查询【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	@RequestMapping("free/queryJoinBill")
	@ResponseBody
	public ResultMsg queryJoinBill(HttpServletRequest request, Locale locale, @ModelAttribute Menu menu) {

		logger.debug("合并菜单查询【菜单】");

		Assert.notNull(menu.getId());
		Assert.notNull(menu.getOwner());

		List<Map<String, Object>> list = menuService.queryJoinBill(locale, menu);

		for (Map<String, Object> map : list) {
			long sec = NumberUtil.getLong(map, "sec_diff");
			String c = DateUtil.convert(sec);
			map.put("diff", c);
		}

		return new ResultMsg(true, list);
	}

	/**
	 * 检测订单数量【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	@RequestMapping("free/checkBill")
	@ResponseBody
	public ResultMsg checkBill(HttpServletRequest request, Locale locale, @RequestParam("businessId") String businessId) {

		logger.debug("检测订单数量【菜单】");

		Long cnt = menuService.queryBillCount(locale, businessId);

		return new ResultMsg(true, cnt);
	}

}

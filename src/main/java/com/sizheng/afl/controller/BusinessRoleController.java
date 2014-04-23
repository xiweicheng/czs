/**
 * BusinessRoleController.java
 */
package com.sizheng.afl.controller;

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

import com.sizheng.afl.base.BaseController;
import com.sizheng.afl.pojo.constant.SysConstant;
import com.sizheng.afl.pojo.entity.BusinessRole;
import com.sizheng.afl.pojo.entity.Menu;
import com.sizheng.afl.pojo.entity.MenuBill;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.pojo.vo.ReqBody;
import com.sizheng.afl.pojo.vo.ResultMsg;
import com.sizheng.afl.service.IBusinessRoleService;
import com.sizheng.afl.service.IMenuService;
import com.sizheng.afl.util.DateUtil;
import com.sizheng.afl.util.NumberUtil;

/**
 * 【商家角色管理】请求控制层.
 * 
 * @creation 2014年04月22日 10:02:47
 * @modification 2014年04月22日 10:02:47
 * @company Skycloud
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

		model.addAttribute("message", "服务员登录");

		return "business/waiter-login";
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

		model.addAttribute("message", "店主登录");

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

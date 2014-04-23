/**
 * BusinessController.java
 */
package com.sizheng.afl.controller;

import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.sizheng.afl.component.PropUtil;
import com.sizheng.afl.component.WeiXinApiInvoker;
import com.sizheng.afl.pojo.constant.SysConstant;
import com.sizheng.afl.pojo.entity.Business;
import com.sizheng.afl.pojo.entity.BusinessConsumer;
import com.sizheng.afl.pojo.entity.BusinessRole;
import com.sizheng.afl.pojo.entity.Favorites;
import com.sizheng.afl.pojo.entity.Message;
import com.sizheng.afl.pojo.entity.Request;
import com.sizheng.afl.pojo.entity.Service;
import com.sizheng.afl.pojo.model.WeiXinAccessToken;
import com.sizheng.afl.pojo.vo.Msg;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.pojo.vo.ReqBody;
import com.sizheng.afl.pojo.vo.ResultMsg;
import com.sizheng.afl.service.IBusinessService;
import com.sizheng.afl.service.IMenuService;
import com.sizheng.afl.service.IMessageService;
import com.sizheng.afl.service.IRequestService;
import com.sizheng.afl.service.IServiceService;
import com.sizheng.afl.service.IUserService;
import com.sizheng.afl.util.DateUtil;
import com.sizheng.afl.util.EncoderUtil;
import com.sizheng.afl.util.NumberUtil;
import com.sizheng.afl.util.StringUtil;
import com.sizheng.afl.util.ThreadUtil;
import com.sizheng.afl.util.WebUtil;

/**
 * 【商家】请求控制层.
 * 
 * @creation 2014年03月25日 02:46:32
 * @modification 2014年03月25日 02:46:32
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Controller
@RequestMapping(value = "business")
public class BusinessController extends BaseController {

	private static Logger logger = Logger.getLogger(BusinessController.class);

	private static DecimalFormat format = new DecimalFormat("0.00");

	@Autowired
	IBusinessService businessService;

	@Autowired
	WeiXinApiInvoker weiXinApiInvoker;

	@Autowired
	PropUtil propUtil;

	@Autowired
	IUserService userService;

	@Autowired
	IMessageService messageService;

	@Autowired
	IRequestService requestService;

	@Autowired
	IMenuService menuService;

	@Autowired
	IServiceService serviceService;

	/**
	 * 添加【商家】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 02:46:32
	 * @modification 2014年03月25日 02:46:32
	 * @return
	 */
	@RequestMapping("add")
	public String add(HttpServletRequest request, Locale locale, Model model) {

		logger.debug("添加【商家】");

		WeiXinAccessToken accessToken = weiXinApiInvoker.getAccessToken(request.getParameter("code"));
		model.addAttribute("accessToken", accessToken);

		Business business = new Business();
		business.setOpenId(accessToken.getOpenid());

		if (businessService.exists(locale, business)) {
			return "business/exists";
		} else {
			if (businessService.save(locale, business)) {
				model.addAttribute("business", business);
				return "business/input";
			} else {
				model.addAttribute("message", "商家入驻失败!");
				return "result";
			}
		}
	}

	@RequestMapping("input")
	public String input(HttpServletRequest request, Locale locale, Model model, @RequestParam("openid") String openId) {

		logger.debug("信息输入【商家】");

		Business business = new Business();
		business.setOpenId(openId);
		Business business2 = businessService.get(locale, business);

		model.addAttribute("business", business2);

		return "business/input";
	}

	@RequestMapping("update")
	public String update(HttpServletRequest request, Locale locale, @ModelAttribute Business business, Model model) {

		logger.debug("信息输入【商家】");

		if (businessService.update(locale, business)) {
			return "forward:main.do";
		} else {
			model.addAttribute("message", "商家信息更新失败!");
			return "result";
		}
	}

	/**
	 * 删除【商家】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 02:46:32
	 * @modification 2014年03月25日 02:46:32
	 * @return
	 */
	// @RequestMapping("delete")
	@ResponseBody
	public ResultMsg delete(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("删除【商家】");

		// TODO

		Business business = getParam(reqBody, Business.class);

		// 参数验证
		// Assert.notNull(business.get);

		boolean deleted = businessService.delete(locale, business);

		return new ResultMsg(deleted, reqBody.getId());
	}

	/**
	 * 获取【商家】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 02:46:32
	 * @modification 2014年03月25日 02:46:32
	 * @return
	 */
	// @RequestMapping("get")
	@ResponseBody
	public ResultMsg get(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("获取【商家】");

		// TODO

		Business business = getParam(reqBody, Business.class);

		// 参数验证
		// Assert.notNull(business.get);

		Business getBusiness = businessService.get(locale, business);

		return new ResultMsg(true, reqBody.getId(), getBusiness);
	}

	/**
	 * 顾客列举【商家】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 02:46:32
	 * @modification 2014年03月25日 02:46:32
	 * @return
	 */
	@RequestMapping("list")
	public String list(HttpServletRequest request, Locale locale, Model model,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "interval", required = false) String interval,
			@RequestParam(value = "filterOver", required = false) Boolean filterOver,
			@RequestParam(value = "request", required = false) Boolean _request,
			@RequestParam(value = "refresh", required = false) Boolean refresh) {

		logger.debug("顾客列举【商家】");

		Business business = new Business();
		business.setOpenId(WebUtil.getSessionBusiness(request).getOpenId());

		List<Map<String, Object>> customerList = businessService.listCustomer(locale, business, status, filterOver);

		for (Map<String, Object> map : customerList) {
			long sec = NumberUtil.getLong(map, "sec_diff");
			String c = DateUtil.convert(sec);
			map.put("sec_diff", c);
		}

		List<Map<String, Object>> list = businessService.listCustomer(locale, business, null, null);

		int ongoing = 0;
		int disabled = 0;
		int requestOwn = 0;
		int requestGroup = 0;
		int requesting = 0;

		for (Map<String, Object> map : list) {
			if (SysConstant.NUM_1 == NumberUtil.getInteger(map, "status")) {
				ongoing++;
			} else if (SysConstant.NUM_2 == NumberUtil.getInteger(map, "status")) {
				disabled++;
			} else if (SysConstant.NUM_3 == NumberUtil.getInteger(map, "status")) {
				requestOwn++;
			} else if (SysConstant.NUM_4 == NumberUtil.getInteger(map, "status")) {
				requestGroup++;
			} else if (SysConstant.NUM_5 == NumberUtil.getInteger(map, "status")) {
				requesting++;
			}
		}

		model.addAttribute("customerList", customerList);
		model.addAttribute("status", status != null ? status : "");
		model.addAttribute("total", list.size());
		model.addAttribute("ongoing", ongoing);
		model.addAttribute("disabled", disabled);
		model.addAttribute("requestOwn", requestOwn);
		model.addAttribute("requestGroup", requestGroup);
		model.addAttribute("requesting", requesting);
		model.addAttribute("over", list.size() - ongoing - disabled - requestOwn - requestGroup - requesting);

		model.addAttribute("interval", interval);
		model.addAttribute("filterOver", (filterOver == null || !filterOver) ? "0" : "1");
		model.addAttribute("refresh", (refresh == null || !refresh) ? "0" : "1");
		model.addAttribute("request", (_request == null || !_request) ? "0" : "1");

		return "business/customer-list";
	}

	/**
	 * 查询【商家】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 02:46:32
	 * @modification 2014年03月25日 02:46:32
	 * @return
	 */
	// @RequestMapping("query")
	@ResponseBody
	public ResultMsg query(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("查询【商家】");

		// TODO

		Business business = getParam(reqBody, Business.class);

		// 参数验证
		// Assert.notNull(business.get);

		List<Map<String, Object>> businessList = businessService.query(locale, business);

		return new ResultMsg(reqBody.getId(), businessList);
	}

	/**
	 * 查询【商家】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 02:46:32
	 * @modification 2014年03月25日 02:46:32
	 * @return
	 */
	// @RequestMapping("paging")
	@ResponseBody
	public ResultMsg paging(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("查询【商家】");

		// TODO

		Business business = getParam(reqBody, Business.class);

		// 参数验证
		Assert.notNull(reqBody.getStart());
		Assert.notNull(reqBody.getLimit());

		// Assert.notNull(business.get);

		PageResult pageResult = businessService.paging(locale, business, reqBody.getStart(), reqBody.getLimit());

		return new ResultMsg(reqBody.getId(), pageResult.getList(), pageResult.getTotal());
	}

	@RequestMapping("free/info")
	public String info(HttpServletRequest request, Locale locale, Model model, @RequestParam("openId") String openId,
			@RequestParam("consumerId") String consumerId) {

		logger.debug("信息【商家】");

		Business business = new Business();
		business.setOpenId(openId);

		Business business2 = businessService.get(locale, business);

		model.addAttribute("business", business2);
		model.addAttribute("consumerId", consumerId);

		Favorites favorites = new Favorites();
		favorites.setOpenId(consumerId);
		favorites.setRefId(openId);

		List<Favorites> list = userService.getFavorites(locale, favorites);

		String storeStatus = "0";
		String likeStatus = "0";
		String dislikeStatus = "0";

		if (list.size() > 0) {
			for (Favorites favorites2 : list) {
				if (SysConstant.FAVORITES_TYPE_BUSINESS.equals(favorites2.getType())) {
					storeStatus = "1";
				} else if (SysConstant.FAVORITES_TYPE_BUSINESS_LIKE.equals(favorites2.getType())) {
					likeStatus = "1";
				} else if (SysConstant.FAVORITES_TYPE_BUSINESS_DISLIKE.equals(favorites2.getType())) {
					dislikeStatus = "1";
				}
			}
		}

		model.addAttribute("storeStatus", storeStatus);
		model.addAttribute("likeStatus", likeStatus);
		model.addAttribute("dislikeStatus", dislikeStatus);

		Favorites favorites2 = new Favorites();
		favorites2.setOpenId(consumerId);
		favorites2.setRefId(openId);
		favorites2.setIsDelete(SysConstant.SHORT_FALSE);
		favorites2.setType(SysConstant.FAVORITES_TYPE_BUSINESS);
		long storeCount = userService.getCount(locale, favorites2);

		favorites2.setType(SysConstant.FAVORITES_TYPE_BUSINESS_LIKE);
		long likeCount = userService.getCount(locale, favorites2);

		favorites2.setType(SysConstant.FAVORITES_TYPE_BUSINESS_DISLIKE);
		long dislikeCount = userService.getCount(locale, favorites2);

		model.addAttribute("storeCount", storeCount);
		model.addAttribute("likeCount", likeCount);
		model.addAttribute("dislikeCount", dislikeCount);

		return "business/info";

	}

	/**
	 * 登录。
	 * 
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @return
	 */
	@RequestMapping("login")
	public String login(HttpServletRequest request, Locale locale, Model model,
			@RequestParam(value = "openId", required = false) String openId) {

		logger.debug("商家登录输入【商家】");

		return "business/login";

	}

	/**
	 * 商家基本信息。
	 * 
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @return
	 */
	@RequestMapping("main")
	public String main(HttpServletRequest request, Locale locale, Model model) {

		logger.debug("商家基本信息【商家】");

		Business business = new Business();
		business.setOpenId(WebUtil.getSessionBusiness(request).getOpenId());

		Business business2 = businessService.get(locale, business);

		model.addAttribute("business", business2);

		return "business/main";

	}

	/**
	 * 商家登录验证。
	 * 
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @param dynamicCode
	 * @return
	 */
	@RequestMapping("verify")
	public String verify(HttpServletRequest request, Locale locale, Model model,
			@RequestParam(value = "openId", required = false) String openId,
			@RequestParam(value = "dynamicCode", required = false) String dynamicCode,
			@RequestParam(value = "userName", required = false) String userName,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "isPhone", required = false, defaultValue = "0") boolean isPhone) {

		logger.debug("商家登录验证【商家】");

		Business business2 = null;

		if (StringUtil.isNotEmpty(type) && SysConstant.NUMBER_1.equals(type)) {// 用户名密码登录

			Assert.notNull(userName);
			Assert.notNull(password);

			Business business = new Business();
			business.setMail(userName);
			business.setPassword(EncoderUtil.encodeBySHA1(password));

			business2 = businessService.get(locale, business);
		} else {

			Assert.notNull(openId);
			Assert.notNull(dynamicCode);

			Business business = new Business();
			business.setOpenId(openId);
			business.setDynamicCode(dynamicCode);

			business2 = businessService.get(locale, business);
		}

		if (business2 != null && StringUtil.isNotEmpty(business2.getOpenId())) {

			if (!isPhone && !SysConstant.SHORT_TRUE.equals(business2.getIsMailVerify())) {// 邮箱验证通过
				business2.setIsMailVerify(SysConstant.SHORT_TRUE);
				businessService.update(business2);
			}

			HttpSession session = request.getSession();
			session.setAttribute(SysConstant.SESSION_OBJECT, business2);

			return "forward:list.do?filterOver=1";
		} else {
			model.addAttribute("message", "登录失败!");

			return "error";
		}
	}

	/**
	 * 商家设置登陆密码。
	 * 
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @param dynamicCode
	 * @return
	 */
	@RequestMapping("newPassword")
	@ResponseBody
	public ResultMsg newPassword(HttpServletRequest request, Locale locale, @RequestParam("password") String password,
			@RequestParam("repeatPassword") String repeatPassword) {

		logger.debug("商家设置登陆密码【商家】");

		if (StringUtil.isEmpty(password)) {
			return new ResultMsg(false, new Msg(false, "密码不能为空!"));
		}

		if (!password.equals(repeatPassword)) {
			return new ResultMsg(false, new Msg(false, "两次密码输入不一致!"));
		}

		if (password.length() > 20) {
			return new ResultMsg(false, new Msg(false, "密码长度不能超过20位!"));
		}

		Business business = new Business();
		business.setOpenId(WebUtil.getSessionBusiness(request).getOpenId());

		Business business2 = businessService.get(locale, business);

		business2.setPassword(EncoderUtil.encodeBySHA1(password));

		businessService.update(business2);

		return new ResultMsg(true);

	}

	/**
	 * 商家更新登陆密码。
	 * 
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @param dynamicCode
	 * @return
	 */
	@RequestMapping("updatePassword")
	@ResponseBody
	public ResultMsg updatePassword(HttpServletRequest request, Locale locale,
			@RequestParam("oldPassword") String oldPassword, @RequestParam("password") String password,
			@RequestParam("repeatPassword") String repeatPassword) {

		logger.debug("商家更新登陆密码【商家】");

		if (StringUtil.isEmpty(oldPassword)) {
			return new ResultMsg(false, new Msg(false, "原密码不能为空!"));
		}

		if (StringUtil.isEmpty(password)) {
			return new ResultMsg(false, new Msg(false, "密码不能为空!"));
		}

		if (!password.equals(repeatPassword)) {
			return new ResultMsg(false, new Msg(false, "两次密码输入不一致!"));
		}

		if (password.length() > 20) {
			return new ResultMsg(false, new Msg(false, "密码长度不能超过20位!"));
		}

		Business business = new Business();
		business.setOpenId(WebUtil.getSessionBusiness(request).getOpenId());
		business.setPassword(EncoderUtil.encodeBySHA1(oldPassword));

		Business business2 = businessService.get(locale, business);

		if (business2 != null) {
			business2.setPassword(EncoderUtil.encodeBySHA1(password));
			businessService.update(business2);

			return new ResultMsg(true);
		} else {
			return new ResultMsg(false, new Msg(false, "原密码输入错误!"));
		}
	}

	/**
	 * 发送登录链接。
	 * 
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @return
	 */
	@RequestMapping("sendLink")
	public String sendLink(HttpServletRequest request, Locale locale, Model model, @RequestParam("openId") String openId) {

		logger.debug("发送登录链接【商家】");

		Business business = new Business();
		business.setOpenId(openId);

		Business business2 = businessService.get(locale, business);

		model.addAttribute("business", business2);

		return "business/sendLink";

	}

	/**
	 * 处理服务员接受呼叫服务。
	 * 
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @return
	 */
	@RequestMapping("free/acceptServiceReq")
	public String acceptServiceReq(HttpServletRequest request, Locale locale, Model model,
			@RequestParam("id") String id, @RequestParam("openId") String openId) {

		logger.debug("处理服务员接受呼叫服务【商家】");

		boolean val = businessService.acceptServiceReq(locale, id, openId);

		if (val) {
			model.addAttribute("message", "接受呼叫请求成功!");
		} else {
			model.addAttribute("message", "该请求已被他人接受,接受失败!");
		}

		return "message";

	}

	/**
	 * 商家角色分配。
	 * 
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @return
	 */
	@RequestMapping("roleMgr")
	public String roleMgr(HttpServletRequest request, Locale locale, Model model,
			@RequestParam(value = "type", required = false) Short type) {

		logger.debug("商家角色分配【商家】");

		BusinessRole businessRole = new BusinessRole();
		businessRole.setBusinessId(WebUtil.getSessionBusiness(request).getOpenId());
		businessRole.setType(type);

		List<Map<String, Object>> list = businessService.listMgrRoles(locale, businessRole);

		businessRole.setType(null);
		List<Map<String, Object>> listAll = businessService.listMgrRoles(locale, businessRole);

		int undetermined = 0;
		int boss = 0;
		int cook = 0;
		int waiter = 0;
		int proscenium = 0;

		for (Map<String, Object> map : listAll) {
			Short typeShort = Short.valueOf(StringUtil.getNotNullString(map, "type"));

			if (SysConstant.ROLE_TYPE_UNDETERMINED.equals(typeShort)) {
				undetermined++;
			} else if (SysConstant.ROLE_TYPE_BOSS.equals(typeShort)) {
				boss++;
			} else if (SysConstant.ROLE_TYPE_COOK.equals(typeShort)) {
				cook++;
			} else if (SysConstant.ROLE_TYPE_WAITER.equals(typeShort)) {
				waiter++;
			} else if (SysConstant.ROLE_TYPE_PROSCENIUM.equals(typeShort)) {
				proscenium++;
			}
		}

		model.addAttribute("roleList", list);
		model.addAttribute("type", type != null ? type : "");

		model.addAttribute("undetermined", undetermined);
		model.addAttribute("boss", boss);
		model.addAttribute("cook", cook);
		model.addAttribute("waiter", waiter);
		model.addAttribute("proscenium", proscenium);
		model.addAttribute("total", listAll.size());

		return "business/role-mgr";

	}

	/**
	 * 商家角色分配。
	 * 
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @return
	 */
	@RequestMapping("setRole")
	@ResponseBody
	public ResultMsg setRole(HttpServletRequest request, Locale locale, @ModelAttribute BusinessRole businessRole) {

		logger.debug("商家角色分配【商家】");

		Assert.notNull(businessRole.getId());
		Assert.notNull(businessRole.getType());

		return new ResultMsg(businessService.setRole(locale, businessRole));

	}

	/**
	 * 商家角色删除。
	 * 
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @return
	 */
	@RequestMapping("deleteRole")
	@ResponseBody
	public ResultMsg deleteRole(HttpServletRequest request, Locale locale, @ModelAttribute BusinessRole businessRole) {

		logger.debug("商家角色删除【商家】");

		Assert.notNull(businessRole.getId());

		return new ResultMsg(businessService.deleteRole(locale, businessRole));

	}

	/**
	 * 菜品统计。
	 * 
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @return
	 */
	@RequestMapping("menuStat")
	public String menuStat(HttpServletRequest request, Locale locale, Model model) {

		logger.debug("菜品统计【商家】");

		// model.addAttribute("message", "[菜品统计]页面建设中...");

		return "business/menu-graph";

	}

	/**
	 * 菜品统计。
	 * 
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @return
	 */
	@RequestMapping("menuGraph")
	@ResponseBody
	public ResultMsg menuGraph(HttpServletRequest request, Locale locale, Model model) {

		logger.debug("菜品统计【商家】");

		Map<String, List<Object>> map = businessService.menuGraph(locale, WebUtil.getSessionBusiness(request)
				.getOpenId());

		return new ResultMsg(true, map);

	}

	/**
	 * 菜品统计。
	 * 
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @return
	 */
	@RequestMapping("menuDayGraph")
	@ResponseBody
	public ResultMsg menuDayGraph(HttpServletRequest request, Locale locale, Model model, @RequestParam("id") String id) {

		logger.debug("菜品统计【商家】");

		Map<String, List<Object>> map = businessService.menuDayGraph(locale, WebUtil.getSessionBusiness(request)
				.getOpenId(), id);

		return new ResultMsg(true, map);

	}

	/**
	 * 营业额统计。
	 * 
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @return
	 */
	@RequestMapping("volumeGraph")
	@ResponseBody
	public ResultMsg volumeGraph(HttpServletRequest request, Locale locale, Model model) {

		logger.debug("营业额统计【商家】");

		Map<String, List<Object>> map = businessService.volumeGraph(locale, WebUtil.getSessionBusiness(request)
				.getOpenId());

		return new ResultMsg(true, map);

	}

	/**
	 * 营业额统计。
	 * 
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @return
	 */
	@RequestMapping("volumeDayGraph")
	@ResponseBody
	public ResultMsg volumeDayGraph(HttpServletRequest request, Locale locale, Model model,
			@RequestParam("date") String date) {

		logger.debug("营业额统计【商家】");

		List<List<Object>> list = businessService.volumeDayGraph(locale, WebUtil.getSessionBusiness(request)
				.getOpenId(), date);

		return new ResultMsg(true, list);

	}

	/**
	 * 服务统计。
	 * 
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @return
	 */
	@RequestMapping("serviceGraph")
	@ResponseBody
	public ResultMsg serviceGraph(HttpServletRequest request, Locale locale, Model model) {

		logger.debug("服务统计【商家】");

		Map<String, List<Object>> map = businessService.serviceGraph(locale, WebUtil.getSessionBusiness(request)
				.getOpenId());

		return new ResultMsg(true, map);

	}

	/**
	 * 服务统计。
	 * 
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @return
	 */
	@RequestMapping("serviceDayGraph")
	@ResponseBody
	public ResultMsg serviceDayGraph(HttpServletRequest request, Locale locale, Model model,
			@RequestParam("date") String date) {

		logger.debug("服务统计。【商家】");

		List<List<Object>> list = businessService.serviceDayGraph(locale, WebUtil.getSessionBusiness(request)
				.getOpenId(), date);

		return new ResultMsg(true, list);

	}

	/**
	 * 服务统计。
	 * 
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @return
	 */
	@RequestMapping("serviceStat")
	public String serviceStat(HttpServletRequest request, Locale locale, Model model) {

		logger.debug("服务统计【商家】");

		// model.addAttribute("message", "[服务统计]页面建设中...");

		return "business/service-graph";

	}

	/**
	 * 营业额统计。
	 * 
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @return
	 */
	@RequestMapping("volumeStat")
	public String volumeStat(HttpServletRequest request, Locale locale, Model model) {

		logger.debug("营业额统计【商家】");

		return "business/volume-graph";

	}

	/**
	 * 发送邮件。
	 * 
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @param mail
	 * @return
	 */
	@RequestMapping("sendMail")
	public String sendMail(HttpServletRequest request, Locale locale, Model model,
			@RequestParam("openId") String openId, @RequestParam("mail") String mail) {

		logger.debug("发送登录链接到邮箱【商家】");

		Business business = new Business();
		business.setOpenId(openId);
		business.setMail(mail);

		String serverBaseUrl = WebUtil.calcServerBaseUrl(request);

		String dynamicCode = businessService.sendMail(locale, business, serverBaseUrl);

		String loginUrl = StringUtil.replace("{?1}/business/login.do?openId={?2}", serverBaseUrl, openId);

		model.addAttribute("message", StringUtil.replace(
				"登录链接已经发到您的邮箱,请查收!<br/><br/>您的动态登录密码:{?1}<br/><br/><a href='{?2}'>也可点此登录</a>", dynamicCode, loginUrl));

		return "message";

	}

	@RequestMapping("groupInfo")
	@ResponseBody
	public ResultMsg groupInfo(HttpServletRequest request, Locale locale,
			@ModelAttribute BusinessConsumer businessConsumer) {

		logger.debug("顾客体信息【商家】");

		Assert.notNull(businessConsumer.getSceneId());

		List<Map<String, Object>> list = businessService.queryGroupInfo(locale, businessConsumer);

		for (Map<String, Object> map : list) {
			long sec = NumberUtil.getLong(map, "sec_diff");
			String c = DateUtil.convert(sec);
			map.put("sec_diff", c);
		}

		double totalConsume = 0;

		for (Map<String, Object> map : list) {
			String consumeCode = StringUtil.getNotNullString(map, "consume_code");

			double consume = businessService.getConsume(locale, consumeCode);
			map.put("consume", format.format(consume));
			totalConsume += consume;
		}

		ResultMsg resultMsg = new ResultMsg(true, list);
		resultMsg.setValues(Arrays.asList((Object) format.format(totalConsume)));

		return resultMsg;

	}

	/**
	 * 结账确认处理.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午1:38:51
	 * @modification 2014年4月7日 下午1:38:51
	 * @param request
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	@RequestMapping("checkout")
	@ResponseBody
	public ResultMsg checkout(HttpServletRequest request, Locale locale,
			@ModelAttribute final BusinessConsumer businessConsumer, @RequestParam("billTotal") Double billTotal) {

		logger.debug("顾客结账确认处理【商家】");

		Assert.notNull(businessConsumer.getSceneId());
		Assert.notNull(businessConsumer.getConsumeCode());
		Assert.notNull(businessConsumer.getStatus());
		Assert.notNull(businessConsumer.getConsumerId());

		double consume = 0;

		if (businessConsumer.getStatus() == 3) {
			consume = businessService.getConsume(locale, businessConsumer.getConsumeCode(), "own");
		} else if (businessConsumer.getStatus() == 4) {
			consume = businessService.getConsume(locale, businessConsumer.getConsumeCode(), "group");
		}

		if (consume != billTotal) {
			return new ResultMsg(false, new Msg(false, "结账金额不一致,请刷新数据后再操作!"));
		}

		Boolean value = businessService.checkout(locale, businessConsumer);

		if (value) {
			ThreadUtil.exec(new Runnable() {
				public void run() {
					weiXinApiInvoker.sendServiceMsg(businessConsumer.getConsumerId(),
							"结账成功!\n欢迎再次光顾!\n\n记得分享本店给自己的人脉圈哦!");
				}
			});

		}

		return new ResultMsg(value);

	}

	/**
	 * 查询消费金额处理.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午1:38:51
	 * @modification 2014年4月7日 下午1:38:51
	 * @param request
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	@RequestMapping("queryConsume")
	@ResponseBody
	public ResultMsg queryConsume(HttpServletRequest request, Locale locale,
			@ModelAttribute BusinessConsumer businessConsumer) {

		logger.debug("顾客结账确认处理【商家】");

		Assert.notNull(businessConsumer.getSceneId());
		Assert.notNull(businessConsumer.getConsumeCode());
		Assert.notNull(businessConsumer.getStatus());

		double value = 0;

		if (businessConsumer.getStatus() == 3) {
			value = businessService.getConsume(locale, businessConsumer.getConsumeCode(), "own");
		} else if (businessConsumer.getStatus() == 4) {
			value = businessService.getConsume(locale, businessConsumer.getConsumeCode(), "group");
		}

		return new ResultMsg(true, (Object) format.format(value));
	}

	/**
	 * 处理顾客进入店铺请求.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午1:38:51
	 * @modification 2014年4月7日 下午1:38:51
	 * @param request
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	@RequestMapping("free/joining")
	public String joining(HttpServletRequest request, Locale locale, Model model, @RequestParam("openId") String openId) {

		logger.debug("顾客进入店铺请求处理【商家】");

		Map<String, Object> consumer = businessService.getConsumer(locale, openId);

		if (!Integer.valueOf(SysConstant.CONSUME_STATUS_REQ).equals(NumberUtil.getInteger(consumer, "status"))) {
			model.addAttribute("message", "该操作已经失效,顾客不在[进入请求中]状态!");
			return "message";
		}

		model.addAttribute("consumer", consumer);

		return "business/joining";
	}

	/**
	 * 获取顾客信息.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午1:38:51
	 * @modification 2014年4月7日 下午1:38:51
	 * @param request
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	@RequestMapping("getConsumerInfo")
	@ResponseBody
	public ResultMsg getConsumerInfo(HttpServletRequest request, Locale locale, Model model,
			@RequestParam("openId") String openId) {

		logger.debug("获取顾客信息【商家】");

		Map<String, Object> consumer = businessService.getConsumer(locale, openId);

		return new ResultMsg(true, consumer);
	}

	/**
	 * 对顾客进入请求进行同意或者否定.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午1:38:51
	 * @modification 2014年4月7日 下午1:38:51
	 * @param request
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	@RequestMapping("free/reqHandle")
	public String reqHandle(HttpServletRequest request, Locale locale, Model model,
			@RequestParam("consumeCode") String consumeCode, @RequestParam("agree") String agree,
			@RequestParam("openId") String openId) {

		logger.debug("对顾客进入请求进行同意或者否定【商家】");

		Boolean val = businessService.agreeOrDisagree(locale, consumeCode, agree.equals("1"));

		if (val && agree.equals("1")) {
			weiXinApiInvoker.sendServiceMsg(openId, StringUtil.replace(
					"请求确认通过!\n\n<a href='{?1}/menu/free/list4bill.do?openId={?2}'>[点击此]开始点菜</a>",
					propUtil.getRedirectUrl(), openId));
		}

		model.addAttribute("message", val ? "处理成功!" : "处理失败!");

		return "message";
	}

	/**
	 * 对顾客进入请求进行同意或者否定.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午1:38:51
	 * @modification 2014年4月7日 下午1:38:51
	 * @param request
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	@RequestMapping("agreeAccess")
	@ResponseBody
	public ResultMsg agreeAccess(HttpServletRequest request, Locale locale, Model model,
			@RequestParam("consumeCode") String consumeCode, @RequestParam("status") String status,
			@RequestParam("openId") String openId) {

		logger.debug("对顾客进入请求进行同意或者否定【商家】");

		Boolean val = false;

		if (status.equals("0")) {// 解禁处理
			val = businessService.enableConsumer(locale, openId, WebUtil.getSessionBusiness(request).getOpenId());
		} else {// 同意进入或者禁止
			val = businessService.agreeOrDisagree(locale, consumeCode, status.equals("1"));
		}

		if (val && status.equals("1")) {
			weiXinApiInvoker.sendServiceMsg(openId, StringUtil.replace(
					"请求确认通过!\n\n<a href='{?1}/menu/free/list4bill.do?openId={?2}'>[点击此]开始点菜</a>",
					propUtil.getRedirectUrl(), openId));
		}

		return new ResultMsg(val.booleanValue());
	}

	/**
	 * 顾客实时请求查询.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午1:38:51
	 * @modification 2014年4月7日 下午1:38:51
	 * @param request
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	@RequestMapping("request")
	@ResponseBody
	public ResultMsg request(HttpServletRequest request, Locale locale) {

		logger.debug("顾客实时请求查询【商家】");

		List<Map<String, Object>> list = businessService.queryRequest(locale, WebUtil.getSessionBusiness(request)
				.getOpenId());

		return new ResultMsg(true, list);
	}

	/**
	 * 顾客实时请求知悉处理.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午1:38:51
	 * @modification 2014年4月7日 下午1:38:51
	 * @param request
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	@RequestMapping("requestHandle")
	@ResponseBody
	public ResultMsg requestHandle(HttpServletRequest request, Locale locale, @ModelAttribute Request request2) {

		logger.debug("顾客实时请求知悉处理【商家】");

		Assert.notNull(request2.getId());

		boolean val = requestService.updateStatus(request2.getId(), SysConstant.REQUEST_STATUS_STOP);

		return new ResultMsg(val);
	}

	/**
	 * 顾客消息处理.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午1:38:51
	 * @modification 2014年4月7日 下午1:38:51
	 * @param request
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	@RequestMapping("msgHandle")
	@ResponseBody
	public ResultMsg msgHandle(HttpServletRequest request, Locale locale, @ModelAttribute Message message) {

		logger.debug("顾客消息处理【商家】");

		Assert.notNull(message.getId());
		Assert.notNull(message.getStatus());

		boolean val = messageService.updateStatus(locale, message);

		return new ResultMsg(val);
	}

	/**
	 * 顾客服务处理.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午1:38:51
	 * @modification 2014年4月7日 下午1:38:51
	 * @param request
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	@RequestMapping("serviceHandle")
	@ResponseBody
	public ResultMsg serviceHandle(HttpServletRequest request, Locale locale, @ModelAttribute Service service) {

		logger.debug("顾客服务处理【商家】");

		Assert.notNull(service.getId());
		Assert.notNull(service.getStatus());

		service.setHandler(WebUtil.getSessionBusiness(request).getOpenId());

		boolean val = serviceService.updateStatus(locale, service);

		return new ResultMsg(val);
	}

	/**
	 * 顾客消息总数检测.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午1:38:51
	 * @modification 2014年4月7日 下午1:38:51
	 * @param request
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	@RequestMapping("checkMsg")
	@ResponseBody
	public ResultMsg checkMsg(HttpServletRequest request, Locale locale, @ModelAttribute Message message,
			@RequestParam(value = "start", required = false) String start,
			@RequestParam(value = "end", required = false) String end) {

		logger.debug("顾客消息总数检测【商家】");

		Date sDate = StringUtil.isNotEmpty(start) ? DateUtil.parse(start, DateUtil.FORMAT1) : new Date(DateUtil.now()
				.getTime() - 24 * 60 * 60 * 1000);
		Date eDate = StringUtil.isNotEmpty(end) ? DateUtil.parse(end, DateUtil.FORMAT1) : new Date(DateUtil.now()
				.getTime() + 24 * 60 * 60 * 1000);

		String[] status = message.getStatus() != null ? new String[] { message.getStatus().toString() } : new String[0];

		Long cnt = (long) businessService.queryCustomerMsg(locale, WebUtil.getSessionBusiness(request).getOpenId(),
				sDate, eDate, status).size();

		return new ResultMsg(true, cnt);
	}

	/**
	 * 顾客呼叫服务总数检测.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 下午1:38:51
	 * @modification 2014年4月7日 下午1:38:51
	 * @param request
	 * @param locale
	 * @param businessConsumer
	 * @return
	 */
	@RequestMapping("checkService")
	@ResponseBody
	public ResultMsg checkService(HttpServletRequest request, Locale locale, @RequestParam("status") String status,
			@RequestParam(value = "start", required = false) String start,
			@RequestParam(value = "end", required = false) String end) {

		logger.debug("顾客消息总数检测【商家】");

		Date sDate = StringUtil.isNotEmpty(start) ? DateUtil.parse(start, DateUtil.FORMAT1) : new Date(DateUtil.now()
				.getTime() - 24 * 60 * 60 * 1000);
		Date eDate = StringUtil.isNotEmpty(end) ? DateUtil.parse(end, DateUtil.FORMAT1) : new Date(DateUtil.now()
				.getTime() + 24 * 60 * 60 * 1000);

		String[] statusArr = status != null ? new String[] { status } : new String[0];

		Long cnt = (long) businessService.queryCustomerService(locale, WebUtil.getSessionBusiness(request).getOpenId(),
				sDate, eDate, statusArr).size();

		return new ResultMsg(true, cnt);
	}

	/**
	 * 顾客消息.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月9日 上午11:35:22
	 * @modification 2014年4月9日 上午11:35:22
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @return
	 */
	@RequestMapping("listMsg")
	public String listMsg(HttpServletRequest request, Locale locale, Model model,
			@RequestParam(value = "start", required = false) String start,
			@RequestParam(value = "end", required = false) String end,
			@RequestParam(value = "status", required = false) String[] status) {

		logger.debug("顾客消息【消费者】");

		Date sDate = StringUtil.isNotEmpty(start) ? DateUtil.parse(start, DateUtil.FORMAT1) : new Date(DateUtil.now()
				.getTime() - 24 * 60 * 60 * 1000);
		Date eDate = StringUtil.isNotEmpty(end) ? DateUtil.parse(end, DateUtil.FORMAT1) : new Date(DateUtil.now()
				.getTime() + 24 * 60 * 60 * 1000);

		model.addAttribute("start", sDate.getTime());
		model.addAttribute("end", eDate.getTime());

		List<Map<String, Object>> msgList = businessService.queryCustomerMsg(locale, WebUtil
				.getSessionBusiness(request).getOpenId(), sDate, eDate, status);

		List<Map<String, Object>> msgList2 = businessService.queryCustomerMsg(locale,
				WebUtil.getSessionBusiness(request).getOpenId(), sDate, eDate);

		long newCount = 0;
		long understanding = 0;
		long stow = 0;

		for (Map<String, Object> map : msgList2) {
			Short status2 = NumberUtil.getShort(map, "status");
			if (SysConstant.MESSAGE_STATUS_NEW.equals(status2)) {
				newCount++;
			} else if (SysConstant.MESSAGE_STATUS_UNDERSTANDING.equals(status2)) {
				understanding++;
			} else if (SysConstant.MESSAGE_STATUS_STOW.equals(status2)) {
				stow++;
			}
		}

		for (Map<String, Object> map : msgList) {
			map.put("diff", DateUtil.convert(NumberUtil.getLong(map, "sec_diff")));
			map.put("simple_content",
					StringUtil.limitLength(StringUtil.getNotNullString(map, "content"), propUtil.getContentLenLimit()));
		}

		model.addAttribute("msgList", msgList);
		model.addAttribute("status", (status != null && status.length > 0) ? status[0] : "");
		model.addAttribute("newCount", newCount);
		model.addAttribute("understanding", understanding);
		model.addAttribute("stow", stow);
		model.addAttribute("total", msgList2.size());

		return "business/customer-msg";
	}

	/**
	 * 顾客服务请求.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月9日 上午11:35:22
	 * @modification 2014年4月9日 上午11:35:22
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @return
	 */
	@RequestMapping("listService")
	public String listService(HttpServletRequest request, Locale locale, Model model,
			@RequestParam(value = "start", required = false) String start,
			@RequestParam(value = "end", required = false) String end,
			@RequestParam(value = "status", required = false) String[] status) {

		logger.debug("顾客服务请求【消费者】");

		Date sDate = StringUtil.isNotEmpty(start) ? DateUtil.parse(start, DateUtil.FORMAT1) : new Date(DateUtil.now()
				.getTime() - 24 * 60 * 60 * 1000);
		Date eDate = StringUtil.isNotEmpty(end) ? DateUtil.parse(end, DateUtil.FORMAT1) : new Date(DateUtil.now()
				.getTime() + 24 * 60 * 60 * 1000);

		model.addAttribute("start", sDate.getTime());
		model.addAttribute("end", eDate.getTime());

		List<Map<String, Object>> msgList = businessService.queryCustomerService(locale,
				WebUtil.getSessionBusiness(request).getOpenId(), sDate, eDate, status);

		List<Map<String, Object>> msgList2 = businessService.queryCustomerService(locale,
				WebUtil.getSessionBusiness(request).getOpenId(), sDate, eDate);

		long newCount = 0;
		long understanding = 0;

		for (Map<String, Object> map : msgList2) {
			Short status2 = NumberUtil.getShort(map, "status");
			if (SysConstant.SERVICE_STATUS_ONGOING.equals(status2)) {
				newCount++;
			} else if (SysConstant.SERVICE_STATUS_ACCEPT.equals(status2)) {
				understanding++;
			}
		}

		for (Map<String, Object> map : msgList) {
			map.put("diff", DateUtil.convert(NumberUtil.getLong(map, "sec_diff")));
		}

		model.addAttribute("msgList", msgList);
		model.addAttribute("status", (status != null && status.length > 0) ? status[0] : "");
		model.addAttribute("newCount", newCount);
		model.addAttribute("understanding", understanding);
		model.addAttribute("total", msgList2.size());

		return "business/customer-service";
	}
}

/**
 * BusinessController.java
 */
package com.sizheng.afl.controller;

import java.text.DecimalFormat;
import java.util.Arrays;
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
import com.sizheng.afl.pojo.model.WeiXinAccessToken;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.pojo.vo.ReqBody;
import com.sizheng.afl.pojo.vo.ResultMsg;
import com.sizheng.afl.service.IBusinessService;
import com.sizheng.afl.util.NumberUtil;
import com.sizheng.afl.util.StringUtil;
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
			@RequestParam(value = "interval", required = false) String interval) {

		logger.debug("顾客列举【商家】");

		Business business = new Business();
		business.setOpenId(WebUtil.getSessionBusiness(request).getOpenId());

		List<Map<String, Object>> customerList = businessService.listCustomer(locale, business, status);
		List<Map<String, Object>> list = businessService.listCustomer(locale, business, null);

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
		model.addAttribute("total", list.size());
		model.addAttribute("ongoing", ongoing);
		model.addAttribute("disabled", disabled);
		model.addAttribute("requestOwn", requestOwn);
		model.addAttribute("requestGroup", requestGroup);
		model.addAttribute("requesting", requesting);
		model.addAttribute("over", list.size() - ongoing - disabled - requestOwn - requestGroup - requesting);

		model.addAttribute("interval", interval);

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

	@RequestMapping("info")
	public String info(HttpServletRequest request, Locale locale, Model model, @RequestParam("openId") String openId) {

		logger.debug("信息【商家】");

		Business business = new Business();
		business.setOpenId(openId);

		Business business2 = businessService.get(locale, business);

		model.addAttribute("business", business2);

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
	public String login(HttpServletRequest request, Locale locale, Model model, @RequestParam("openId") String openId) {

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
	public String verify(HttpServletRequest request, Locale locale, Model model, @RequestParam("openId") String openId,
			@RequestParam("dynamicCode") String dynamicCode) {

		logger.debug("商家登录验证【商家】");

		Business business = new Business();
		business.setOpenId(openId);
		business.setDynamicCode(dynamicCode);

		Business business2 = businessService.get(locale, business);

		if (business2 != null && StringUtil.isNotEmpty(business2.getOpenId())) {
			// model.addAttribute("message", "登录成功!");

			HttpSession session = request.getSession();
			session.setAttribute(SysConstant.SESSION_BUSINESS, business2);

			model.addAttribute("business", business2);

			return "business/main";
		} else {
			model.addAttribute("message", "登录失败!");

			return "error";
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

		return "error";

	}

	@RequestMapping("groupInfo")
	@ResponseBody
	public ResultMsg groupInfo(HttpServletRequest request, Locale locale,
			@ModelAttribute BusinessConsumer businessConsumer) {

		logger.debug("顾客体信息【商家】");

		Assert.notNull(businessConsumer.getSceneId());

		List<Map<String, Object>> list = businessService.queryGroupInfo(locale, businessConsumer);

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
			@ModelAttribute BusinessConsumer businessConsumer) {

		logger.debug("顾客结账确认处理【商家】");

		Assert.notNull(businessConsumer.getSceneId());
		Assert.notNull(businessConsumer.getConsumeCode());
		Assert.notNull(businessConsumer.getStatus());
		Assert.notNull(businessConsumer.getConsumerId());

		Boolean value = businessService.checkout(locale, businessConsumer);

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

		if (!NumberUtil.getInteger(consumer, "status").equals(Integer.valueOf(SysConstant.CONSUME_STATUS_REQ))) {
			model.addAttribute("message", "顾客不在[进入请求中]状态!");
			return "message";
		}

		model.addAttribute("consumer", consumer);

		return "business/joining";
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
}

/**
 * BusinessController.java
 */
package com.sizheng.afl.controller;

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
import com.sizheng.afl.component.WeiXinApiInvoker;
import com.sizheng.afl.pojo.constant.SysConstant;
import com.sizheng.afl.pojo.entity.Business;
import com.sizheng.afl.pojo.model.WeiXinAccessToken;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.pojo.vo.ReqBody;
import com.sizheng.afl.pojo.vo.ResultMsg;
import com.sizheng.afl.service.IBusinessService;
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

	@Autowired
	IBusinessService businessService;

	@Autowired
	WeiXinApiInvoker weiXinApiInvoker;

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
			model.addAttribute("message", "商家信息更新成功!");
		} else {
			model.addAttribute("message", "商家信息更新失败!");
		}

		return "result";
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
	 * 更新【商家】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 02:46:32
	 * @modification 2014年03月25日 02:46:32
	 * @return
	 */
	// @RequestMapping("update")
	@ResponseBody
	public ResultMsg update(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("更新【商家】");

		// TODO

		Business business = getParam(reqBody, Business.class);

		// 参数验证
		// Assert.notNull(business.get);

		boolean updated = businessService.update(locale, business);

		return new ResultMsg(updated, reqBody.getId());
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
	public String list(HttpServletRequest request, Locale locale, Model model) {

		logger.debug("顾客列举【商家】");

		model.addAttribute("message", "网站建设中...");

		return "result";
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

			return "result";
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

		model.addAttribute("message", StringUtil.replace("您的动态登录密码:{?1}", dynamicCode));

		return "result";

	}

}

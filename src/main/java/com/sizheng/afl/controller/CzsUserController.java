/**
 * CzsUserController.java
 */
package com.sizheng.afl.controller;

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
import com.sizheng.afl.pojo.constant.SysConstant;
import com.sizheng.afl.pojo.entity.Business;
import com.sizheng.afl.pojo.entity.CzsUser;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.pojo.vo.ReqBody;
import com.sizheng.afl.pojo.vo.ResultMsg;
import com.sizheng.afl.service.ICzsUserService;
import com.sizheng.afl.util.DateUtil;
import com.sizheng.afl.util.EncoderUtil;
import com.sizheng.afl.util.NumberUtil;
import com.sizheng.afl.util.StringUtil;
import com.sizheng.afl.util.WebUtil;

/**
 * 【平台用户】请求控制层.
 * 
 * @creation 2014年04月23日 04:32:37
 * @modification 2014年04月23日 04:32:37
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Controller
@RequestMapping(value = "czs")
public class CzsUserController extends BaseController {

	private static Logger logger = Logger.getLogger(CzsUserController.class);

	@Autowired
	ICzsUserService czsUserService;

	@Autowired
	PropUtil propUtil;

	/**
	 * 添加【平台用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 04:32:37
	 * @modification 2014年04月23日 04:32:37
	 * @return
	 */
	// @RequestMapping("add")
	@ResponseBody
	public ResultMsg add(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody,
			@ModelAttribute CzsUser czsUser, Locale locale, Model model) {

		logger.debug("添加【平台用户】");

		// TODO

		// CzsUser czsUser = getParam(reqBody, CzsUser.class);

		// 参数验证
		// Assert.notNull(czsUser.get);

		boolean saved = czsUserService.save(locale, czsUser);

		// TODO null->ID
		return new ResultMsg(saved, reqBody.getId(), null);
	}

	/**
	 * 删除【平台用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 04:32:37
	 * @modification 2014年04月23日 04:32:37
	 * @return
	 */
	// @RequestMapping("delete")
	@ResponseBody
	public ResultMsg delete(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody,
			@ModelAttribute CzsUser czsUser, Locale locale, Model model) {

		logger.debug("删除【平台用户】");

		// TODO

		// CzsUser czsUser = getParam(reqBody, CzsUser.class);

		// 参数验证
		// Assert.notNull(czsUser.get);

		boolean deleted = czsUserService.delete(locale, czsUser);

		return new ResultMsg(deleted, reqBody.getId());
	}

	/**
	 * 获取【平台用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 04:32:37
	 * @modification 2014年04月23日 04:32:37
	 * @return
	 */
	// @RequestMapping("get")
	@ResponseBody
	public ResultMsg get(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody,
			@ModelAttribute CzsUser czsUser, Locale locale, Model model) {

		logger.debug("获取【平台用户】");

		// TODO

		// CzsUser czsUser = getParam(reqBody, CzsUser.class);

		// 参数验证
		// Assert.notNull(czsUser.get);

		CzsUser CzsUserResult = czsUserService.get(locale, czsUser);

		return new ResultMsg(true, reqBody.getId(), CzsUserResult);
	}

	/**
	 * 更新【平台用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 04:32:37
	 * @modification 2014年04月23日 04:32:37
	 * @return
	 */
	// @RequestMapping("update")
	@ResponseBody
	public ResultMsg update(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody,
			@ModelAttribute CzsUser czsUser, Locale locale, Model model) {

		logger.debug("更新【平台用户】");

		// TODO

		// CzsUser czsUser = getParam(reqBody, CzsUser.class);

		// 参数验证
		// Assert.notNull(czsUser.get);

		boolean updated = czsUserService.update(locale, czsUser);

		return new ResultMsg(updated, reqBody.getId());
	}

	/**
	 * 列举【平台用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 04:32:37
	 * @modification 2014年04月23日 04:32:37
	 * @return
	 */
	// @RequestMapping("list")
	@ResponseBody
	public ResultMsg list(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody,
			@ModelAttribute CzsUser czsUser, Locale locale, Model model) {

		logger.debug("列举【平台用户】");

		// TODO

		// CzsUser czsUser = getParam(reqBody, CzsUser.class);

		// 参数验证
		// Assert.notNull(czsUser.get);

		List<CzsUser> czsUserList = czsUserService.list(locale);

		return new ResultMsg(reqBody.getId(), czsUserList);
	}

	/**
	 * 查询【平台用户】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 04:32:37
	 * @modification 2014年04月23日 04:32:37
	 * @return
	 */
	// @RequestMapping("query")
	@ResponseBody
	public ResultMsg query(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody,
			@ModelAttribute CzsUser czsUser, Locale locale, Model model) {

		logger.debug("查询【平台用户】");

		// TODO

		// CzsUser czsUser = getParam(reqBody, CzsUser.class);

		// 参数验证
		// Assert.notNull(czsUser.get);

		List<CzsUser> czsUserList = czsUserService.query(locale, czsUser);

		return new ResultMsg(reqBody.getId(), czsUserList);
	}

	/**
	 * 查询【平台用户】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 04:32:37
	 * @modification 2014年04月23日 04:32:37
	 * @return
	 */
	// @RequestMapping("paging")
	@ResponseBody
	public ResultMsg paging(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody,
			@ModelAttribute CzsUser czsUser, Locale locale, Model model) {

		logger.debug("查询【平台用户】");

		// TODO

		// CzsUser czsUser = getParam(reqBody, CzsUser.class);

		// 参数验证
		Assert.notNull(reqBody.getStart());
		Assert.notNull(reqBody.getLimit());

		// Assert.notNull(czsUser.get);

		PageResult pageResult = czsUserService.paging(locale, czsUser, reqBody.getStart(), reqBody.getLimit());

		return new ResultMsg(reqBody.getId(), pageResult.getList(), pageResult.getTotal());
	}

	@RequestMapping("login")
	public String login(HttpServletRequest request, Locale locale, Model model) {

		logger.debug("平台登录【平台用户】");

		return "czs/login";
	}

	@RequestMapping("main")
	public String main(HttpServletRequest request, Locale locale, Model model) {

		logger.debug("平台主页【平台用户】");

		return "czs/main";
	}

	/**
	 * 商家管理
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月28日 上午10:16:03
	 * @modification 2014年4月28日 上午10:16:03
	 * @param request
	 * @param locale
	 * @param model
	 * @param start
	 * @param end
	 * @param status
	 * @return
	 */
	@RequestMapping("businessMgr")
	public String businessMgr(HttpServletRequest request, Locale locale, Model model,
			@RequestParam(value = "start", required = false) String start,
			@RequestParam(value = "end", required = false) String end,
			@RequestParam(value = "status", required = false) String[] status) {

		logger.debug("商家管理【平台用户】");

		Date sDate = StringUtil.isNotEmpty(start) ? DateUtil.parse(start, DateUtil.FORMAT1) : new Date(DateUtil.now()
				.getTime() - 30L * 24 * 60 * 60 * 1000);
		Date eDate = StringUtil.isNotEmpty(end) ? DateUtil.parse(end, DateUtil.FORMAT1) : new Date(DateUtil.now()
				.getTime() + 24L * 60 * 60 * 1000);

		model.addAttribute("start", sDate.getTime());
		model.addAttribute("end", eDate.getTime());

		List<Map<String, Object>> businessList = czsUserService.queryMgrBusiness(locale, sDate, eDate, status);
		List<Map<String, Object>> businessList2 = czsUserService.queryMgrBusiness(locale, sDate, eDate);

		for (Map<String, Object> map : businessList) {
			map.put("diff", DateUtil.convert(NumberUtil.getLong(map, "sec_diff")));
			if (map.containsKey("sec_audit_diff")) {
				map.put("audit_diff", DateUtil.convert(NumberUtil.getLong(map, "sec_audit_diff")));
			}
			map.put("simple_introduce",
					StringUtil.html(StringUtil.limitLength(StringUtil.getNotNullString(map, "introduce"),
							propUtil.getContentLenLimit())));
		}

		int newCount = 0;
		int understanding = 0;

		for (Map<String, Object> map : businessList2) {
			Short status2 = NumberUtil.getShort(map, "status");
			if (SysConstant.BUSINESS_STATUS_NEW.equals(status2)) {
				newCount++;
			} else if (SysConstant.BUSINESS_STATUS_UNDERSTANDING.equals(status2)) {
				understanding++;
			}
		}

		model.addAttribute("businessList", businessList);
		model.addAttribute("total", businessList2.size());
		model.addAttribute("newCount", newCount);
		model.addAttribute("understanding", understanding);
		model.addAttribute("status", (status != null && status.length > 0) ? status[0] : "");

		return "czs/business-mgr";
	}

	/**
	 * 平台登录验证。
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

		logger.debug("平台登录验证【平台用户】");

		CzsUser czsUser = null;

		if (StringUtil.isNotEmpty(type) && SysConstant.NUMBER_1.equals(type)) {// 用户名密码登录

			Assert.notNull(userName);
			Assert.notNull(password);

			CzsUser user = new CzsUser();
			user.setMail(userName);
			user.setPassword(EncoderUtil.encodeBySHA1(password));

			czsUser = czsUserService.get(locale, user);
		} else {

			Assert.notNull(openId);
			Assert.notNull(dynamicCode);

			Business business = new Business();
			business.setOpenId(openId);
			business.setDynamicCode(dynamicCode);

			CzsUser user = new CzsUser();
			user.setUserName(openId);
			user.setDynamicCode(dynamicCode);

			czsUser = czsUserService.get(locale, user);
		}

		if (czsUser != null && StringUtil.isNotEmpty(czsUser.getUserName())) {

			HttpSession session = request.getSession();
			session.setAttribute(SysConstant.SESSION_OBJECT, czsUser);

			return "forward:main.do";
		} else {
			model.addAttribute("message", "登录失败!");

			return "error";
		}
	}

	@RequestMapping("checkBusiness")
	@ResponseBody
	public ResultMsg checkBusiness(HttpServletRequest request, Locale locale,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "start", required = false) String start,
			@RequestParam(value = "end", required = false) String end) {

		logger.debug("顾客消息总数检测【商家】");

		Date sDate = StringUtil.isNotEmpty(start) ? DateUtil.parse(start, DateUtil.FORMAT1) : new Date(DateUtil.now()
				.getTime() - 30L * 24 * 60 * 60 * 1000);
		Date eDate = StringUtil.isNotEmpty(end) ? DateUtil.parse(end, DateUtil.FORMAT1) : new Date(DateUtil.now()
				.getTime() + 24L * 60 * 60 * 1000);

		String[] stsArr = status != null ? new String[] { status } : new String[0];

		Long cnt = (long) czsUserService.queryMgrBusiness(locale, sDate, eDate, stsArr).size();

		return new ResultMsg(true, cnt);
	}

	/**
	 * 商家入驻审核操作
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月28日 下午1:15:05
	 * @modification 2014年4月28日 下午1:15:05
	 * @param request
	 * @param business
	 * @return
	 */
	@RequestMapping("businessHandle")
	@ResponseBody
	public ResultMsg checkBusiness(HttpServletRequest request, Locale locale, @ModelAttribute Business business) {

		logger.debug("商家入驻审核操作【商家】");

		Assert.notNull(business.getId());
		Assert.notNull(business.getStatus());
		business.setAuditHandler(WebUtil.getSessionCzsUserId(request));
		business.setAuditDateTime(DateUtil.now());
		business.setDays(propUtil.getDaysBusinessMaxDefault());
		business.setQrcodeLimit(propUtil.getQrcodeBusinessMaxDefault());

		return new ResultMsg(czsUserService.businessHandle(locale, business));
	}

}

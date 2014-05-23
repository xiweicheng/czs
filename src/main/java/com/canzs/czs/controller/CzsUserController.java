/**
 * CzsUserController.java
 */
package com.canzs.czs.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.canzs.czs.base.BaseController;
import com.canzs.czs.component.PropUtil;
import com.canzs.czs.component.WeiXinApiInvoker;
import com.canzs.czs.pojo.constant.SysConstant;
import com.canzs.czs.pojo.entity.Business;
import com.canzs.czs.pojo.entity.CzsUser;
import com.canzs.czs.pojo.vo.ResultMsg;
import com.canzs.czs.service.ICzsUserService;
import com.canzs.czs.service.IUserService;
import com.canzs.czs.util.DateUtil;
import com.canzs.czs.util.EncoderUtil;
import com.canzs.czs.util.NumberUtil;
import com.canzs.czs.util.StringUtil;
import com.canzs.czs.util.ThreadUtil;
import com.canzs.czs.util.WebUtil;

/**
 * 【平台用户】请求控制层.
 * 
 * @creation 2014年04月23日 04:32:37
 * @modification 2014年04月23日 04:32:37
 * @company Canzs
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

	@Autowired
	WeiXinApiInvoker weiXinApiInvoker;

	@Autowired
	IUserService userService;

	@RequestMapping("login")
	public String login(HttpServletRequest request, Locale locale, Model model,
			@RequestParam(value = "openId", required = false) String openId) {

		logger.debug("平台登录【平台用户】");

		return "czs/login";
	}

	@RequestMapping("main")
	public String main(HttpServletRequest request, Locale locale, Model model) {

		logger.debug("平台主页【平台用户】");

		return "czs/main";
	}

	@RequestMapping("free/about")
	public String about(HttpServletRequest request, Locale locale, Model model,
			@RequestParam(value = "openId", required = false) String openId) {

		logger.debug("关于平台【平台用户】");

		return "czs/about";
	}

	@RequestMapping("free/join")
	public String join(HttpServletRequest request, Locale locale, Model model,
			@RequestParam(value = "openId", required = false) String openId) {

		logger.debug("加盟合作【平台用户】");

		return "czs/join";
	}

	@RequestMapping("free/comment")
	public String comment(HttpServletRequest request, Locale locale, Model model, @RequestParam("openId") String openId) {

		logger.debug("建议留言【平台用户】");

		List<Map<String, Object>> list = czsUserService.queryCommentByOpenId(locale, openId);

		model.addAttribute("list", list);

		return "czs/comment";
	}

	@RequestMapping("free/commentSubmit")
	@ResponseBody
	public ResultMsg commentSubmit(HttpServletRequest request, Locale locale, Model model,
			@RequestParam(value = "openId", required = false) String openId, @RequestParam("content") String content) {

		logger.debug("建议留言提交【平台用户】");

		if (StringUtil.isEmpty(openId)) {
			openId = WebUtil.getSessionBusinessId(request);
		}

		boolean val = czsUserService.submitComment(locale, openId, content);

		return new ResultMsg(val);
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
	 * 用户管理
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
	@RequestMapping("userMgr")
	public String userMgr(HttpServletRequest request, Locale locale, Model model,
			@RequestParam(value = "start", required = false) String start,
			@RequestParam(value = "end", required = false) String end,
			@RequestParam(value = "status", required = false) String[] status) {

		logger.debug("用户管理【平台用户】");

		Date sDate = StringUtil.isNotEmpty(start) ? DateUtil.parse(start, DateUtil.FORMAT1) : new Date(DateUtil.now()
				.getTime() - 30L * 24 * 60 * 60 * 1000);
		Date eDate = StringUtil.isNotEmpty(end) ? DateUtil.parse(end, DateUtil.FORMAT1) : new Date(DateUtil.now()
				.getTime() + 24L * 60 * 60 * 1000);

		model.addAttribute("start", sDate.getTime());
		model.addAttribute("end", eDate.getTime());

		List<Map<String, Object>> list = czsUserService.queryMgrUser(locale, sDate, eDate, status);
		List<Map<String, Object>> list2 = czsUserService.queryMgrUser(locale, sDate, eDate);

		int newCount = 0;
		int understanding = 0;

		model.addAttribute("userList", list);
		model.addAttribute("total", list2.size());
		model.addAttribute("newCount", newCount);
		model.addAttribute("understanding", understanding);
		model.addAttribute("status", (status != null && status.length > 0) ? status[0] : "");

		return "czs/user-mgr";
	}

	/**
	 * 二维码管理
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
	@RequestMapping("qrcodeMgr")
	public String qrcodeMgr(HttpServletRequest request, Locale locale, Model model,
			@RequestParam(value = "start", required = false) String start,
			@RequestParam(value = "end", required = false) String end,
			@RequestParam(value = "status", required = false) String[] status) {

		logger.debug("二维码管理【平台用户】");

		Date sDate = StringUtil.isNotEmpty(start) ? DateUtil.parse(start, DateUtil.FORMAT1) : new Date(DateUtil.now()
				.getTime() - 30L * 24 * 60 * 60 * 1000);
		Date eDate = StringUtil.isNotEmpty(end) ? DateUtil.parse(end, DateUtil.FORMAT1) : new Date(DateUtil.now()
				.getTime() + 24L * 60 * 60 * 1000);

		model.addAttribute("start", sDate.getTime());
		model.addAttribute("end", eDate.getTime());

		List<Map<String, Object>> list = czsUserService.queryMgrQrcode(locale, sDate, eDate, status);
		List<Map<String, Object>> list2 = czsUserService.queryMgrQrcode(locale, sDate, eDate);

		int newCount = 0;
		int understanding = 0;

		model.addAttribute("list", list);
		model.addAttribute("total", list2.size());
		model.addAttribute("newCount", newCount);
		model.addAttribute("understanding", understanding);
		model.addAttribute("status", (status != null && status.length > 0) ? status[0] : "");

		return "czs/qrcode-mgr";
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

			return "message";
		}
	}

	@RequestMapping("checkBusiness")
	@ResponseBody
	public ResultMsg checkBusiness(HttpServletRequest request, Locale locale,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "start", required = false) String start,
			@RequestParam(value = "end", required = false) String end) {

		logger.debug("顾客消息总数检测【平台用户】");

		Date sDate = StringUtil.isNotEmpty(start) ? DateUtil.parse(start, DateUtil.FORMAT1) : new Date(DateUtil.now()
				.getTime() - 30L * 24 * 60 * 60 * 1000);
		Date eDate = StringUtil.isNotEmpty(end) ? DateUtil.parse(end, DateUtil.FORMAT1) : new Date(DateUtil.now()
				.getTime() + 24L * 60 * 60 * 1000);

		String[] stsArr = status != null ? new String[] { status } : new String[0];

		Long cnt = (long) czsUserService.queryMgrBusiness(locale, sDate, eDate, stsArr).size();

		return new ResultMsg(true, cnt);
	}

	/**
	 * 刷新微信个人信息
	 * 
	 * @author xiweicheng
	 * @creation 2014年5月7日 下午8:28:42
	 * @modification 2014年5月7日 下午8:28:42
	 * @param request
	 * @param locale
	 * @param status
	 * @return
	 */
	@RequestMapping("refreshUserInfo")
	@ResponseBody
	public ResultMsg refreshUserInfo(HttpServletRequest request, Locale locale, @RequestParam("openId") String openId) {

		logger.debug("刷新微信个人信息【平台用户】");

		boolean val = userService.refreshWeixinUserInfo(locale, openId);

		return new ResultMsg(val);
	}

	/**
	 * 商家充值管理.
	 * 
	 * @author xiweicheng
	 * @creation 2014年5月8日 下午12:16:40
	 * @modification 2014年5月8日 下午12:16:40
	 * @param request
	 * @param locale
	 * @param type
	 * @param oldValue
	 * @param newValue
	 * @return
	 */
	@RequestMapping("updateLife")
	@ResponseBody
	public ResultMsg updateLife(HttpServletRequest request, Locale locale, @RequestParam("type") String type,
			@RequestParam("oldValue") String oldValue, @RequestParam("newValue") String newValue,
			@RequestParam("id") String id, @RequestParam("businessId") String businessId) {

		logger.debug("商家充值管理【平台用户】");

		boolean val = czsUserService.updateLife(locale, type, oldValue, newValue, id, businessId,
				WebUtil.getSessionCzsUserId(request));

		return new ResultMsg(val);
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
	public ResultMsg businessHandle(HttpServletRequest request, Locale locale, @ModelAttribute final Business business) {

		logger.debug("商家入驻审核操作【平台用户】");

		Assert.notNull(business.getId());
		Assert.notNull(business.getStatus());
		Assert.notNull(business.getOpenId());

		business.setAuditHandler(WebUtil.getSessionCzsUserId(request));
		business.setAuditDateTime(DateUtil.now());
		business.setDays(propUtil.getDaysBusinessMaxDefault());
		business.setQrcodeLimit(propUtil.getQrcodeBusinessMaxDefault());
		business.setLifeValue(Long.valueOf(0L));

		if (czsUserService.businessHandle(locale, business)) {

			ThreadUtil.exec(new Runnable() {
				public void run() {
					weiXinApiInvoker.sendServiceMsg(business.getOpenId(), "您的入驻请求已经通过,再次点击[申请入驻]即可获取系统登录链接!");
				}
			});

			return new ResultMsg(true);
		} else {
			return new ResultMsg(false);
		}
	}

}

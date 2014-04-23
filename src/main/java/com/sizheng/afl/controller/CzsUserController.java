/**
 * CzsUserController.java
 */
package com.sizheng.afl.controller;

import java.util.List;
import java.util.Locale;

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
import com.sizheng.afl.pojo.constant.SysConstant;
import com.sizheng.afl.pojo.entity.Business;
import com.sizheng.afl.pojo.entity.CzsUser;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.pojo.vo.ReqBody;
import com.sizheng.afl.pojo.vo.ResultMsg;
import com.sizheng.afl.service.ICzsUserService;
import com.sizheng.afl.util.EncoderUtil;
import com.sizheng.afl.util.StringUtil;

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

	@RequestMapping("free/login")
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
			session.setAttribute(SysConstant.SESSION_CZS, czsUser);

			return "forward:main.do";
		} else {
			model.addAttribute("message", "登录失败!");

			return "error";
		}
	}

}

/**
 * UserController.java
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sizheng.afl.base.BaseController;
import com.sizheng.afl.component.WeiXinApiInvoker;
import com.sizheng.afl.pojo.entity.User;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.pojo.vo.ReqBody;
import com.sizheng.afl.pojo.vo.ResultMsg;
import com.sizheng.afl.service.IUserService;
import com.sizheng.afl.util.StringUtil;

/**
 * 【用户】请求控制层.
 * 
 * @creation 2014年03月28日 10:02:03
 * @modification 2014年03月28日 10:02:03
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Controller
@RequestMapping(value = "user")
public class UserController extends BaseController {

	private static Logger logger = Logger.getLogger(UserController.class);

	@Autowired
	IUserService userService;

	@Autowired
	WeiXinApiInvoker weiXinApiInvoker;

	/**
	 * 添加【用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月28日 10:02:03
	 * @modification 2014年03月28日 10:02:03
	 * @return
	 */
	// @RequestMapping("add")
	@ResponseBody
	public ResultMsg add(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("添加【用户】");

		// TODO

		User user = getParam(reqBody, User.class);

		// 参数验证
		// Assert.notNull(user.get);

		boolean saved = userService.save(locale, user);

		// TODO null->ID
		return new ResultMsg(saved, reqBody.getId(), null);
	}

	/**
	 * 删除【用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月28日 10:02:03
	 * @modification 2014年03月28日 10:02:03
	 * @return
	 */
	// @RequestMapping("delete")
	@ResponseBody
	public ResultMsg delete(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("删除【用户】");

		// TODO

		User user = getParam(reqBody, User.class);

		// 参数验证
		// Assert.notNull(user.get);

		boolean deleted = userService.delete(locale, user);

		return new ResultMsg(deleted, reqBody.getId());
	}

	/**
	 * 获取【用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月28日 10:02:03
	 * @modification 2014年03月28日 10:02:03
	 * @return
	 */
	// @RequestMapping("get")
	@ResponseBody
	public ResultMsg get(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("获取【用户】");

		// TODO

		User user = getParam(reqBody, User.class);

		// 参数验证
		// Assert.notNull(user.get);

		User getUser = userService.get(locale, user);

		return new ResultMsg(true, reqBody.getId(), getUser);
	}

	/**
	 * 更新【用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月28日 10:02:03
	 * @modification 2014年03月28日 10:02:03
	 * @return
	 */
	// @RequestMapping("update")
	@ResponseBody
	public ResultMsg update(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("更新【用户】");

		// TODO

		User user = getParam(reqBody, User.class);

		// 参数验证
		// Assert.notNull(user.get);

		boolean updated = userService.update(locale, user);

		return new ResultMsg(updated, reqBody.getId());
	}

	/**
	 * 列举【用户】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月28日 10:02:03
	 * @modification 2014年03月28日 10:02:03
	 * @return
	 */
	// @RequestMapping("list")
	@ResponseBody
	public ResultMsg list(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("列举【用户】");

		// TODO

		// User user = getParam(reqBody, User.class);

		// 参数验证
		// Assert.notNull(user.get);

		List<User> userList = userService.list(locale);

		return new ResultMsg(reqBody.getId(), userList);
	}

	/**
	 * 查询【用户】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月28日 10:02:03
	 * @modification 2014年03月28日 10:02:03
	 * @return
	 */
	// @RequestMapping("query")
	@ResponseBody
	public ResultMsg query(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("查询【用户】");

		// TODO

		User user = getParam(reqBody, User.class);

		// 参数验证
		// Assert.notNull(user.get);

		List<Map<String, Object>> userList = userService.query(locale, user);

		return new ResultMsg(reqBody.getId(), userList);
	}

	/**
	 * 查询【用户】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月28日 10:02:03
	 * @modification 2014年03月28日 10:02:03
	 * @return
	 */
	// @RequestMapping("paging")
	@ResponseBody
	public ResultMsg paging(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("查询【用户】");

		// TODO

		User user = getParam(reqBody, User.class);

		// 参数验证
		Assert.notNull(reqBody.getStart());
		Assert.notNull(reqBody.getLimit());

		// Assert.notNull(user.get);

		PageResult pageResult = userService.paging(locale, user, reqBody.getStart(), reqBody.getLimit());

		return new ResultMsg(reqBody.getId(), pageResult.getList(), pageResult.getTotal());
	}

	@RequestMapping("bill")
	public String bill(HttpServletRequest request, Locale locale, Model model, @RequestParam("openId") String openId,
			@RequestParam("consumeCode") String consumeCode) {

		logger.debug("食客结账【消费者】");

		// TODO
		Double result = userService.bill(locale, openId, consumeCode);

		if (result != null) {
			model.addAttribute("message", "您的消费金额: " + result);
		} else {
			model.addAttribute("message", "您没有消费记录!");
		}

		return "message";

	}

	/**
	 * 顾客申请结账.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月7日 上午11:49:50
	 * @modification 2014年4月7日 上午11:49:50
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @param consumeCode
	 * @return
	 */
	@RequestMapping("free/billReq")
	public String billReq(HttpServletRequest request, Locale locale, Model model,
			@RequestParam("openId") String openId, @RequestParam("consumeCode") String consumeCode,
			@RequestParam("type") String type) {

		logger.debug("食客结账【消费者】");

		Boolean result = userService.billReq(locale, openId, consumeCode, type);

		String ss = StringUtil.replace("[{?1}]", "own".equals(type) ? "个人" : "集体");

		if (result) {
			// weiXinApiInvoker.sendServiceMsg(openId, "结账请求发送成功!");
			model.addAttribute("message", ss + "结账请求发送成功!");
		} else {
			model.addAttribute("message", ss + "结账请求发送失败!");
		}

		return "message";
	}

	@RequestMapping("record")
	public String record(HttpServletRequest request, Locale locale, Model model, @RequestParam("openId") String openId) {

		logger.debug("消费记录【消费者】");

		model.addAttribute("message", "[消费记录]页面建设中...");

		return "message";

	}

	@RequestMapping("call")
	public String call(HttpServletRequest request, Locale locale, Model model, @RequestParam("openId") String openId) {

		logger.debug("呼叫服务【消费者】");

		model.addAttribute("message", "[呼叫服务]页面建设中...");

		return "message";

	}

	@RequestMapping("list")
	public String list(HttpServletRequest request, Locale locale, Model model, @RequestParam("openId") String openId) {

		logger.debug("菜单一览【消费者】");

		model.addAttribute("message", "[菜单一览]页面建设中...");

		return "message";

	}

}

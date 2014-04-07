/**
 * MenuBillController.java
 */
package com.sizheng.afl.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sizheng.afl.base.BaseController;
import com.sizheng.afl.pojo.entity.MenuBill;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.pojo.vo.ReqBody;
import com.sizheng.afl.pojo.vo.ResultMsg;
import com.sizheng.afl.service.IMenuBillService;

/**
 * 【订单】请求控制层.
 * 
 * @creation 2014年04月05日 05:02:44
 * @modification 2014年04月05日 05:02:44
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Controller
@RequestMapping(value = "menuBill")
public class MenuBillController extends BaseController {

	private static Logger logger = Logger.getLogger(MenuBillController.class);

	@Autowired
	IMenuBillService menuBillService;

	/**
	 * 添加【订单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月05日 05:02:44
	 * @modification 2014年04月05日 05:02:44
	 * @return
	 */
	// @RequestMapping("add")
	@ResponseBody
	public ResultMsg add(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody, @ModelAttribute MenuBill menuBill, Locale locale, Model model) {
	
		logger.debug("添加【订单】");

		// TODO

		// MenuBill menuBill = getParam(reqBody, MenuBill.class);

		// 参数验证
		// Assert.notNull(menuBill.get);

		boolean saved = menuBillService.save(locale, menuBill);

		// TODO null->ID
		return new ResultMsg(saved, reqBody.getId(), null);
	}

	/**
	 * 删除【订单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月05日 05:02:44
	 * @modification 2014年04月05日 05:02:44
	 * @return
	 */
	// @RequestMapping("delete")
	@ResponseBody
	public ResultMsg delete(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody, @ModelAttribute MenuBill menuBill, Locale locale, Model model) {
	
		logger.debug("删除【订单】");

		// TODO

		// MenuBill menuBill = getParam(reqBody, MenuBill.class);

		// 参数验证
		// Assert.notNull(menuBill.get);

		boolean deleted = menuBillService.delete(locale, menuBill);

		return new ResultMsg(deleted, reqBody.getId());
	}

	/**
	 * 获取【订单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月05日 05:02:44
	 * @modification 2014年04月05日 05:02:44
	 * @return
	 */
	// @RequestMapping("get")
	@ResponseBody
	public ResultMsg get(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody, @ModelAttribute MenuBill menuBill, Locale locale, Model model) {
	
		logger.debug("获取【订单】");

		// TODO

		// MenuBill menuBill = getParam(reqBody, MenuBill.class);
		
		// 参数验证
		// Assert.notNull(menuBill.get);

		MenuBill MenuBillResult = menuBillService.get(locale, menuBill);

		return new ResultMsg(true, reqBody.getId(), MenuBillResult);
	}
	
	/**
	 * 更新【订单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月05日 05:02:44
	 * @modification 2014年04月05日 05:02:44
	 * @return
	 */
	// @RequestMapping("update")
	@ResponseBody
	public ResultMsg update(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody, @ModelAttribute MenuBill menuBill, Locale locale, Model model) {
	
		logger.debug("更新【订单】");

		// TODO

		// MenuBill menuBill = getParam(reqBody, MenuBill.class);
		
		// 参数验证
		// Assert.notNull(menuBill.get);

		boolean updated = menuBillService.update(locale, menuBill);

		return new ResultMsg(updated, reqBody.getId());
	}
	
	/**
	 * 列举【订单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月05日 05:02:44
	 * @modification 2014年04月05日 05:02:44
	 * @return
	 */
	// @RequestMapping("list")
	@ResponseBody
	public ResultMsg list(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody, @ModelAttribute MenuBill menuBill, Locale locale, Model model) {
	
		logger.debug("列举【订单】");

		// TODO

		// MenuBill menuBill = getParam(reqBody, MenuBill.class);
		
		// 参数验证
		// Assert.notNull(menuBill.get);

		List<MenuBill> menuBillList = menuBillService.list(locale);

		return new ResultMsg(reqBody.getId(), menuBillList);
	}
	
	/**
	 * 查询【订单】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月05日 05:02:44
	 * @modification 2014年04月05日 05:02:44
	 * @return
	 */
	// @RequestMapping("query")
	@ResponseBody
	public ResultMsg query(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody, @ModelAttribute MenuBill menuBill, Locale locale, Model model) {

		logger.debug("查询【订单】");

		// TODO

		// MenuBill menuBill = getParam(reqBody, MenuBill.class);

		// 参数验证
		// Assert.notNull(menuBill.get);

		List<MenuBill> menuBillList = menuBillService.query(locale, menuBill);

		return new ResultMsg(reqBody.getId(), menuBillList);
	}

	/**
	 * 查询【订单】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月05日 05:02:44
	 * @modification 2014年04月05日 05:02:44
	 * @return
	 */
	// @RequestMapping("paging")
	@ResponseBody
	public ResultMsg paging(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody, @ModelAttribute MenuBill menuBill, Locale locale, Model model) {

		logger.debug("查询【订单】");

		// TODO

		// MenuBill menuBill = getParam(reqBody, MenuBill.class);

		// 参数验证
		Assert.notNull(reqBody.getStart());
		Assert.notNull(reqBody.getLimit());
		
		// Assert.notNull(menuBill.get);

		PageResult pageResult = menuBillService.paging(locale, menuBill, reqBody.getStart(), reqBody.getLimit());

		return new ResultMsg(reqBody.getId(), pageResult.getList(), pageResult.getTotal());
	}
	
}

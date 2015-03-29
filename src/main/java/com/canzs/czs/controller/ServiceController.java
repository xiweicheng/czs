/**
 * ServiceController.java
 */
package com.canzs.czs.controller;

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

import com.canzs.czs.base.BaseController;
import com.canzs.czs.pojo.entity.Service;
import com.canzs.czs.pojo.vo.PageResult;
import com.canzs.czs.pojo.vo.ReqBody;
import com.canzs.czs.pojo.vo.ResultMsg;
import com.canzs.czs.service.IServiceService;

/**
 * 【呼叫服务】请求控制层.
 * 
 * @creation 2014年04月23日 08:28:44
 * @modification 2014年04月23日 08:28:44
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Controller
@RequestMapping(value = "service")
public class ServiceController extends BaseController {

	private static Logger logger = Logger.getLogger(ServiceController.class);

	@Autowired
	IServiceService serviceService;

	/**
	 * 添加【呼叫服务】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 08:28:44
	 * @modification 2014年04月23日 08:28:44
	 * @return
	 */
	// @RequestMapping("add")
	@ResponseBody
	public ResultMsg add(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody, @ModelAttribute Service service, Locale locale, Model model) {
	
		logger.debug("添加【呼叫服务】");

		// TODO

		// Service service = getParam(reqBody, Service.class);

		// 参数验证
		// Assert.notNull(service.get);

		boolean saved = serviceService.save(locale, service);

		// TODO null->ID
		return new ResultMsg(saved, reqBody.getId(), null);
	}

	/**
	 * 删除【呼叫服务】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 08:28:44
	 * @modification 2014年04月23日 08:28:44
	 * @return
	 */
	// @RequestMapping("delete")
	@ResponseBody
	public ResultMsg delete(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody, @ModelAttribute Service service, Locale locale, Model model) {
	
		logger.debug("删除【呼叫服务】");

		// TODO

		// Service service = getParam(reqBody, Service.class);

		// 参数验证
		// Assert.notNull(service.get);

		boolean deleted = serviceService.delete(locale, service);

		return new ResultMsg(deleted, reqBody.getId());
	}

	/**
	 * 获取【呼叫服务】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 08:28:44
	 * @modification 2014年04月23日 08:28:44
	 * @return
	 */
	// @RequestMapping("get")
	@ResponseBody
	public ResultMsg get(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody, @ModelAttribute Service service, Locale locale, Model model) {
	
		logger.debug("获取【呼叫服务】");

		// TODO

		// Service service = getParam(reqBody, Service.class);
		
		// 参数验证
		// Assert.notNull(service.get);

		Service ServiceResult = serviceService.get(locale, service);

		return new ResultMsg(true, reqBody.getId(), ServiceResult);
	}
	
	/**
	 * 更新【呼叫服务】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 08:28:44
	 * @modification 2014年04月23日 08:28:44
	 * @return
	 */
	// @RequestMapping("update")
	@ResponseBody
	public ResultMsg update(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody, @ModelAttribute Service service, Locale locale, Model model) {
	
		logger.debug("更新【呼叫服务】");

		// TODO

		// Service service = getParam(reqBody, Service.class);
		
		// 参数验证
		// Assert.notNull(service.get);

		boolean updated = serviceService.update(locale, service);

		return new ResultMsg(updated, reqBody.getId());
	}
	
	/**
	 * 列举【呼叫服务】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 08:28:44
	 * @modification 2014年04月23日 08:28:44
	 * @return
	 */
	// @RequestMapping("list")
	@ResponseBody
	public ResultMsg list(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody, @ModelAttribute Service service, Locale locale, Model model) {
	
		logger.debug("列举【呼叫服务】");

		// TODO

		// Service service = getParam(reqBody, Service.class);
		
		// 参数验证
		// Assert.notNull(service.get);

		List<Service> serviceList = serviceService.list(locale);

		return new ResultMsg(reqBody.getId(), serviceList);
	}
	
	/**
	 * 查询【呼叫服务】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 08:28:44
	 * @modification 2014年04月23日 08:28:44
	 * @return
	 */
	// @RequestMapping("query")
	@ResponseBody
	public ResultMsg query(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody, @ModelAttribute Service service, Locale locale, Model model) {

		logger.debug("查询【呼叫服务】");

		// TODO

		// Service service = getParam(reqBody, Service.class);

		// 参数验证
		// Assert.notNull(service.get);

		List<Service> serviceList = serviceService.query(locale, service);

		return new ResultMsg(reqBody.getId(), serviceList);
	}

	/**
	 * 查询【呼叫服务】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月23日 08:28:44
	 * @modification 2014年04月23日 08:28:44
	 * @return
	 */
	// @RequestMapping("paging")
	@ResponseBody
	public ResultMsg paging(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody, @ModelAttribute Service service, Locale locale, Model model) {

		logger.debug("查询【呼叫服务】");

		// TODO

		// Service service = getParam(reqBody, Service.class);

		// 参数验证
		Assert.notNull(reqBody.getStart());
		Assert.notNull(reqBody.getLimit());
		
		// Assert.notNull(service.get);

		PageResult pageResult = serviceService.paging(locale, service, reqBody.getStart(), reqBody.getLimit());

		return new ResultMsg(reqBody.getId(), pageResult.getList(), pageResult.getTotal());
	}
	
}

/**
 * RequestController.java
 */
package com.sizheng.afl.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sizheng.afl.base.BaseController;
import com.sizheng.afl.pojo.entity.Request;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.pojo.vo.ReqBody;
import com.sizheng.afl.pojo.vo.ResultMsg;
import com.sizheng.afl.service.IRequestService;

/**
 * 【顾客实时请求】请求控制层.
 * 
 * @creation 2014年04月11日 03:18:24
 * @modification 2014年04月11日 03:18:24
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Controller
@RequestMapping(value = "request")
public class RequestController extends BaseController {

	private static Logger logger = Logger.getLogger(RequestController.class);

	@Autowired
	IRequestService requestService;

	/**
	 * 添加【顾客实时请求】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月11日 03:18:24
	 * @modification 2014年04月11日 03:18:24
	 * @return
	 */
	// @RequestMapping("add")
	@ResponseBody
	public ResultMsg add(@RequestBody ReqBody reqBody, Locale locale) {
	
		logger.debug("添加【顾客实时请求】");

		// TODO

		Request request = getParam(reqBody, Request.class);

		// 参数验证
		// Assert.notNull(request.get);

		boolean saved = requestService.save(locale, request);

		// TODO null->ID
		return new ResultMsg(saved, reqBody.getId(), null);
	}

	/**
	 * 删除【顾客实时请求】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月11日 03:18:24
	 * @modification 2014年04月11日 03:18:24
	 * @return
	 */
	// @RequestMapping("delete")
	@ResponseBody
	public ResultMsg delete(@RequestBody ReqBody reqBody, Locale locale) {
	
		logger.debug("删除【顾客实时请求】");

		// TODO

		Request request = getParam(reqBody, Request.class);

		// 参数验证
		// Assert.notNull(request.get);

		boolean deleted = requestService.delete(locale, request);

		return new ResultMsg(deleted, reqBody.getId());
	}

	/**
	 * 获取【顾客实时请求】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月11日 03:18:24
	 * @modification 2014年04月11日 03:18:24
	 * @return
	 */
	// @RequestMapping("get")
	@ResponseBody
	public ResultMsg get(@RequestBody ReqBody reqBody, Locale locale) {
	
		logger.debug("获取【顾客实时请求】");

		// TODO

		Request request = getParam(reqBody, Request.class);
		
		// 参数验证
		// Assert.notNull(request.get);

		Request getRequest = requestService.get(locale, request);

		return new ResultMsg(true, reqBody.getId(), getRequest);
	}
	
	/**
	 * 更新【顾客实时请求】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月11日 03:18:24
	 * @modification 2014年04月11日 03:18:24
	 * @return
	 */
	// @RequestMapping("update")
	@ResponseBody
	public ResultMsg update(@RequestBody ReqBody reqBody, Locale locale) {
	
		logger.debug("更新【顾客实时请求】");

		// TODO

		Request request = getParam(reqBody, Request.class);
		
		// 参数验证
		// Assert.notNull(request.get);

		boolean updated = requestService.update(locale, request);

		return new ResultMsg(updated, reqBody.getId());
	}
	
	/**
	 * 列举【顾客实时请求】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月11日 03:18:24
	 * @modification 2014年04月11日 03:18:24
	 * @return
	 */
	// @RequestMapping("list")
	@ResponseBody
	public ResultMsg list(@RequestBody ReqBody reqBody, Locale locale) {
	
		logger.debug("列举【顾客实时请求】");

		// TODO

		// Request request = getParam(reqBody, Request.class);
		
		// 参数验证
		// Assert.notNull(request.get);

		List<Request> requestList = requestService.list(locale);

		return new ResultMsg(reqBody.getId(), requestList);
	}
	
	/**
	 * 查询【顾客实时请求】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月11日 03:18:24
	 * @modification 2014年04月11日 03:18:24
	 * @return
	 */
	// @RequestMapping("query")
	@ResponseBody
	public ResultMsg query(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("查询【顾客实时请求】");

		// TODO

		Request request = getParam(reqBody, Request.class);

		// 参数验证
		// Assert.notNull(request.get);

		List<Map<String, Object>> requestList = requestService.query(locale, request);

		return new ResultMsg(reqBody.getId(), requestList);
	}

	/**
	 * 查询【顾客实时请求】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月11日 03:18:24
	 * @modification 2014年04月11日 03:18:24
	 * @return
	 */
	// @RequestMapping("paging")
	@ResponseBody
	public ResultMsg paging(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("查询【顾客实时请求】");

		// TODO

		Request request = getParam(reqBody, Request.class);

		// 参数验证
		Assert.notNull(reqBody.getStart());
		Assert.notNull(reqBody.getLimit());
		
		// Assert.notNull(request.get);

		PageResult pageResult = requestService.paging(locale, request, reqBody.getStart(), reqBody.getLimit());

		return new ResultMsg(reqBody.getId(), pageResult.getList(), pageResult.getTotal());
	}
	
}

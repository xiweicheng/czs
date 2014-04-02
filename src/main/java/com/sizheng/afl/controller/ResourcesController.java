/**
 * ResourcesController.java
 */
package com.sizheng.afl.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sizheng.afl.base.BaseController;
import com.sizheng.afl.pojo.constant.SysConstant;
import com.sizheng.afl.pojo.entity.Resources;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.pojo.vo.ReqBody;
import com.sizheng.afl.pojo.vo.ResultMsg;
import com.sizheng.afl.service.IResourcesService;
import com.sizheng.afl.util.WebUtil;

/**
 * 【资源】请求控制层.
 * 
 * @creation 2014年03月29日 05:00:05
 * @modification 2014年03月29日 05:00:05
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Controller
@RequestMapping(value = "resources")
public class ResourcesController extends BaseController {

	private static Logger logger = Logger.getLogger(ResourcesController.class);

	@Autowired
	IResourcesService resourcesService;

	/**
	 * 添加【资源】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:00:05
	 * @modification 2014年03月29日 05:00:05
	 * @return
	 */
	// @RequestMapping("add")
	@ResponseBody
	public ResultMsg add(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("添加【资源】");

		// TODO

		Resources resources = getParam(reqBody, Resources.class);

		// 参数验证
		// Assert.notNull(resources.get);

		boolean saved = resourcesService.save(locale, resources);

		// TODO null->ID
		return new ResultMsg(saved, reqBody.getId(), null);
	}

	/**
	 * 删除【资源】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:00:05
	 * @modification 2014年03月29日 05:00:05
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public ResultMsg delete(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("删除【资源】");

		Resources resources = getParam(reqBody, Resources.class);
		// 参数验证
		Assert.notNull(resources.getId());

		boolean deleted = resourcesService.delete(locale, resources);

		return new ResultMsg(deleted, reqBody.getId());
	}

	/**
	 * 获取【资源】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:00:05
	 * @modification 2014年03月29日 05:00:05
	 * @return
	 */
	// @RequestMapping("get")
	@ResponseBody
	public ResultMsg get(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("获取【资源】");

		// TODO

		Resources resources = getParam(reqBody, Resources.class);

		// 参数验证
		// Assert.notNull(resources.get);

		Resources getResources = resourcesService.get(locale, resources);

		return new ResultMsg(true, reqBody.getId(), getResources);
	}

	/**
	 * 更新【资源】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:00:05
	 * @modification 2014年03月29日 05:00:05
	 * @return
	 */
	// @RequestMapping("update")
	@ResponseBody
	public ResultMsg update(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("更新【资源】");

		// TODO

		Resources resources = getParam(reqBody, Resources.class);

		// 参数验证
		// Assert.notNull(resources.get);

		boolean updated = resourcesService.update(locale, resources);

		return new ResultMsg(updated, reqBody.getId());
	}

	/**
	 * 列举【资源】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:00:05
	 * @modification 2014年03月29日 05:00:05
	 * @return
	 */
	@RequestMapping("list")
	@ResponseBody
	public ResultMsg list(HttpServletRequest request, Locale locale) {

		logger.debug("列举【资源】");

		Resources resources = new Resources();
		resources.setOwner(WebUtil.getSessionBusiness(request).getOpenId());
		resources.setIsDelete(SysConstant.SHORT_FALSE);

		List<Resources> resourcesList = resourcesService.query(locale, resources);

		return new ResultMsg(resourcesList);
	}

	/**
	 * 查询【资源】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:00:05
	 * @modification 2014年03月29日 05:00:05
	 * @return
	 */
	// @RequestMapping("query")
	@ResponseBody
	public ResultMsg query(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("查询【资源】");

		// TODO

		Resources resources = getParam(reqBody, Resources.class);

		// 参数验证
		// Assert.notNull(resources.get);

		List<Resources> resourcesList = resourcesService.query(locale, resources);

		return new ResultMsg(reqBody.getId(), resourcesList);
	}

	/**
	 * 查询【资源】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:00:05
	 * @modification 2014年03月29日 05:00:05
	 * @return
	 */
	// @RequestMapping("paging")
	@ResponseBody
	public ResultMsg paging(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("查询【资源】");

		// TODO

		Resources resources = getParam(reqBody, Resources.class);

		// 参数验证
		Assert.notNull(reqBody.getStart());
		Assert.notNull(reqBody.getLimit());

		// Assert.notNull(resources.get);

		PageResult pageResult = resourcesService.paging(locale, resources, reqBody.getStart(), reqBody.getLimit());

		return new ResultMsg(reqBody.getId(), pageResult.getList(), pageResult.getTotal());
	}

}

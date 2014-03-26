/**
 * CategoryController.java
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
import com.sizheng.afl.pojo.model.Category;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.pojo.vo.ReqBody;
import com.sizheng.afl.pojo.vo.ResultMsg;
import com.sizheng.afl.service.ICategoryService;

/**
 * 【分类】请求控制层.
 * 
 * @creation 2014年03月26日 01:06:34
 * @modification 2014年03月26日 01:06:34
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Controller
@RequestMapping(value = "category")
public class CategoryController extends BaseController {

	private static Logger logger = Logger.getLogger(CategoryController.class);

	@Autowired
	ICategoryService categoryService;

	/**
	 * 添加【分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月26日 01:06:34
	 * @modification 2014年03月26日 01:06:34
	 * @return
	 */
	// @RequestMapping("add")
	@ResponseBody
	public ResultMsg add(@RequestBody ReqBody reqBody, Locale locale) {
	
		logger.debug("添加【分类】");

		// TODO

		Category category = getParam(reqBody, Category.class);

		// 参数验证
		// Assert.notNull(category.get);

		boolean saved = categoryService.save(locale, category);

		// TODO null->ID
		return new ResultMsg(saved, reqBody.getId(), null);
	}

	/**
	 * 删除【分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月26日 01:06:34
	 * @modification 2014年03月26日 01:06:34
	 * @return
	 */
	// @RequestMapping("delete")
	@ResponseBody
	public ResultMsg delete(@RequestBody ReqBody reqBody, Locale locale) {
	
		logger.debug("删除【分类】");

		// TODO

		Category category = getParam(reqBody, Category.class);

		// 参数验证
		// Assert.notNull(category.get);

		boolean deleted = categoryService.delete(locale, category);

		return new ResultMsg(deleted, reqBody.getId());
	}

	/**
	 * 获取【分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月26日 01:06:34
	 * @modification 2014年03月26日 01:06:34
	 * @return
	 */
	// @RequestMapping("get")
	@ResponseBody
	public ResultMsg get(@RequestBody ReqBody reqBody, Locale locale) {
	
		logger.debug("获取【分类】");

		// TODO

		Category category = getParam(reqBody, Category.class);
		
		// 参数验证
		// Assert.notNull(category.get);

		Category getCategory = categoryService.get(locale, category);

		return new ResultMsg(true, reqBody.getId(), getCategory);
	}
	
	/**
	 * 更新【分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月26日 01:06:34
	 * @modification 2014年03月26日 01:06:34
	 * @return
	 */
	// @RequestMapping("update")
	@ResponseBody
	public ResultMsg update(@RequestBody ReqBody reqBody, Locale locale) {
	
		logger.debug("更新【分类】");

		// TODO

		Category category = getParam(reqBody, Category.class);
		
		// 参数验证
		// Assert.notNull(category.get);

		boolean updated = categoryService.update(locale, category);

		return new ResultMsg(updated, reqBody.getId());
	}
	
	/**
	 * 列举【分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月26日 01:06:34
	 * @modification 2014年03月26日 01:06:34
	 * @return
	 */
	// @RequestMapping("list")
	@ResponseBody
	public ResultMsg list(@RequestBody ReqBody reqBody, Locale locale) {
	
		logger.debug("列举【分类】");

		// TODO

		// Category category = getParam(reqBody, Category.class);
		
		// 参数验证
		// Assert.notNull(category.get);

		List<Category> categoryList = categoryService.list(locale);

		return new ResultMsg(reqBody.getId(), categoryList);
	}
	
	/**
	 * 查询【分类】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月26日 01:06:34
	 * @modification 2014年03月26日 01:06:34
	 * @return
	 */
	// @RequestMapping("query")
	@ResponseBody
	public ResultMsg query(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("查询【分类】");

		// TODO

		Category category = getParam(reqBody, Category.class);

		// 参数验证
		// Assert.notNull(category.get);

		List<Map<String, Object>> categoryList = categoryService.query(locale, category);

		return new ResultMsg(reqBody.getId(), categoryList);
	}

	/**
	 * 查询【分类】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月26日 01:06:34
	 * @modification 2014年03月26日 01:06:34
	 * @return
	 */
	// @RequestMapping("paging")
	@ResponseBody
	public ResultMsg paging(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("查询【分类】");

		// TODO

		Category category = getParam(reqBody, Category.class);

		// 参数验证
		Assert.notNull(reqBody.getStart());
		Assert.notNull(reqBody.getLimit());
		
		// Assert.notNull(category.get);

		PageResult pageResult = categoryService.paging(locale, category, reqBody.getStart(), reqBody.getLimit());

		return new ResultMsg(reqBody.getId(), pageResult.getList(), pageResult.getTotal());
	}
	
}

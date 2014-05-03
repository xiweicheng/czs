/**
 * MenuCategoryController.java
 */
package com.canzs.czs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.canzs.czs.base.BaseController;
import com.canzs.czs.pojo.entity.Business;
import com.canzs.czs.pojo.entity.MenuCategory;
import com.canzs.czs.pojo.vo.Msg;
import com.canzs.czs.pojo.vo.PageResult;
import com.canzs.czs.pojo.vo.ReqBody;
import com.canzs.czs.pojo.vo.ResultMsg;
import com.canzs.czs.service.IMenuCategoryService;
import com.canzs.czs.util.StringUtil;
import com.canzs.czs.util.WebUtil;

/**
 * 【菜单分类】请求控制层.
 * 
 * @creation 2014年03月29日 05:09:48
 * @modification 2014年03月29日 05:09:48
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Controller
@RequestMapping(value = "menuCategory")
public class MenuCategoryController extends BaseController {

	private static Logger logger = Logger.getLogger(MenuCategoryController.class);

	@Autowired
	IMenuCategoryService menuCategoryService;

	/**
	 * 添加【菜单分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:09:48
	 * @modification 2014年03月29日 05:09:48
	 * @return
	 */
	@RequestMapping("add")
	@ResponseBody
	public ResultMsg add(@ModelAttribute MenuCategory menuCategory, HttpServletRequest request, Locale locale) {

		logger.debug("添加【菜单分类】");

		if (StringUtil.isEmpty(menuCategory.getName())) {
			return new ResultMsg(false, new Msg(false, "分类不能为空!"));
		}

		Business business = WebUtil.getSessionBusiness(request);

		menuCategory.setOwner(business.getOpenId());

		if (menuCategoryService.exists(locale, menuCategory)) {
			return new ResultMsg(false, new Msg(false, "该分类已经存在!"));
		}

		if (menuCategoryService.save(locale, menuCategory)) {

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("name", menuCategory.getName());
			map.put("id", menuCategory.getId());

			return new ResultMsg(map);
		} else {
			return new ResultMsg(false, new Msg(false, "添加分类失败!"));
		}
	}

	/**
	 * 删除【菜单分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:09:48
	 * @modification 2014年03月29日 05:09:48
	 * @return
	 */
	// @RequestMapping("delete")
	@ResponseBody
	public ResultMsg delete(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("删除【菜单分类】");

		// TODO

		MenuCategory menuCategory = getParam(reqBody, MenuCategory.class);

		// 参数验证
		// Assert.notNull(menuCategory.get);

		boolean deleted = menuCategoryService.delete(locale, menuCategory);

		return new ResultMsg(deleted, reqBody.getId());
	}

	/**
	 * 获取【菜单分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:09:48
	 * @modification 2014年03月29日 05:09:48
	 * @return
	 */
	// @RequestMapping("get")
	@ResponseBody
	public ResultMsg get(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("获取【菜单分类】");

		// TODO

		MenuCategory menuCategory = getParam(reqBody, MenuCategory.class);

		// 参数验证
		// Assert.notNull(menuCategory.get);

		MenuCategory getMenuCategory = menuCategoryService.get(locale, menuCategory);

		return new ResultMsg(true, reqBody.getId(), getMenuCategory);
	}

	/**
	 * 更新【菜单分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:09:48
	 * @modification 2014年03月29日 05:09:48
	 * @return
	 */
	// @RequestMapping("update")
	@ResponseBody
	public ResultMsg update(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("更新【菜单分类】");

		// TODO

		MenuCategory menuCategory = getParam(reqBody, MenuCategory.class);

		// 参数验证
		// Assert.notNull(menuCategory.get);

		boolean updated = menuCategoryService.update(locale, menuCategory);

		return new ResultMsg(updated, reqBody.getId());
	}

	/**
	 * 列举【菜单分类】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:09:48
	 * @modification 2014年03月29日 05:09:48
	 * @return
	 */
	// @RequestMapping("list")
	@ResponseBody
	public ResultMsg list(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("列举【菜单分类】");

		// TODO

		// MenuCategory menuCategory = getParam(reqBody, MenuCategory.class);

		// 参数验证
		// Assert.notNull(menuCategory.get);

		List<MenuCategory> menuCategoryList = menuCategoryService.list(locale);

		return new ResultMsg(reqBody.getId(), menuCategoryList);
	}

	/**
	 * 查询【菜单分类】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:09:48
	 * @modification 2014年03月29日 05:09:48
	 * @return
	 */
	// @RequestMapping("query")
	@ResponseBody
	public ResultMsg query(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("查询【菜单分类】");

		// TODO

		MenuCategory menuCategory = getParam(reqBody, MenuCategory.class);

		// 参数验证
		// Assert.notNull(menuCategory.get);

		List<MenuCategory> menuCategoryList = menuCategoryService.query(locale, menuCategory);

		return new ResultMsg(reqBody.getId(), menuCategoryList);
	}

	/**
	 * 查询【菜单分类】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 05:09:48
	 * @modification 2014年03月29日 05:09:48
	 * @return
	 */
	// @RequestMapping("paging")
	@ResponseBody
	public ResultMsg paging(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("查询【菜单分类】");

		// TODO

		MenuCategory menuCategory = getParam(reqBody, MenuCategory.class);

		// 参数验证
		Assert.notNull(reqBody.getStart());
		Assert.notNull(reqBody.getLimit());

		// Assert.notNull(menuCategory.get);

		PageResult pageResult = menuCategoryService
				.paging(locale, menuCategory, reqBody.getStart(), reqBody.getLimit());

		return new ResultMsg(reqBody.getId(), pageResult.getList(), pageResult.getTotal());
	}

}

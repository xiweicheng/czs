/**
 * MenuTasteController.java
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
import com.canzs.czs.pojo.entity.MenuTaste;
import com.canzs.czs.pojo.vo.Msg;
import com.canzs.czs.pojo.vo.PageResult;
import com.canzs.czs.pojo.vo.ReqBody;
import com.canzs.czs.pojo.vo.ResultMsg;
import com.canzs.czs.service.IMenuTasteService;
import com.canzs.czs.util.StringUtil;
import com.canzs.czs.util.WebUtil;

/**
 * 【菜单口味】请求控制层.
 * 
 * @creation 2014年03月29日 09:50:42
 * @modification 2014年03月29日 09:50:42
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Controller
@RequestMapping(value = "menuTaste")
public class MenuTasteController extends BaseController {

	private static Logger logger = Logger.getLogger(MenuTasteController.class);

	@Autowired
	IMenuTasteService menuTasteService;

	/**
	 * 添加【菜单口味】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 09:50:42
	 * @modification 2014年03月29日 09:50:42
	 * @return
	 */
	@RequestMapping("add")
	@ResponseBody
	public ResultMsg add(HttpServletRequest request, @ModelAttribute MenuTaste menuTaste, Locale locale) {

		logger.debug("添加【菜单口味】");

		if (StringUtil.isEmpty(menuTaste.getName())) {
			return new ResultMsg(false, new Msg(false, "分类不能为空!"));
		}

		Business business = WebUtil.getSessionBusiness(request);

		menuTaste.setOwner(business.getOpenId());

		if (menuTasteService.exists(locale, menuTaste)) {
			return new ResultMsg(false, new Msg(false, "该分类已经存在!"));
		}

		if (menuTasteService.save(locale, menuTaste)) {

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("name", menuTaste.getName());
			map.put("id", menuTaste.getId());

			return new ResultMsg(map);
		} else {
			return new ResultMsg(false, new Msg(false, "添加分类失败!"));
		}
	}

	/**
	 * 删除【菜单口味】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 09:50:42
	 * @modification 2014年03月29日 09:50:42
	 * @return
	 */
	// @RequestMapping("delete")
	@ResponseBody
	public ResultMsg delete(HttpServletRequest request, @RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("删除【菜单口味】");

		// TODO

		MenuTaste menuTaste = getParam(reqBody, MenuTaste.class);

		// 参数验证
		// Assert.notNull(menuTaste.get);

		boolean deleted = menuTasteService.delete(locale, menuTaste);

		return new ResultMsg(deleted, reqBody.getId());
	}

	/**
	 * 获取【菜单口味】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 09:50:42
	 * @modification 2014年03月29日 09:50:42
	 * @return
	 */
	// @RequestMapping("get")
	@ResponseBody
	public ResultMsg get(HttpServletRequest request, @RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("获取【菜单口味】");

		// TODO

		MenuTaste menuTaste = getParam(reqBody, MenuTaste.class);

		// 参数验证
		// Assert.notNull(menuTaste.get);

		MenuTaste getMenuTaste = menuTasteService.get(locale, menuTaste);

		return new ResultMsg(true, reqBody.getId(), getMenuTaste);
	}

	/**
	 * 更新【菜单口味】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 09:50:42
	 * @modification 2014年03月29日 09:50:42
	 * @return
	 */
	// @RequestMapping("update")
	@ResponseBody
	public ResultMsg update(HttpServletRequest request, @RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("更新【菜单口味】");

		// TODO

		MenuTaste menuTaste = getParam(reqBody, MenuTaste.class);

		// 参数验证
		// Assert.notNull(menuTaste.get);

		boolean updated = menuTasteService.update(locale, menuTaste);

		return new ResultMsg(updated, reqBody.getId());
	}

	/**
	 * 列举【菜单口味】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 09:50:42
	 * @modification 2014年03月29日 09:50:42
	 * @return
	 */
	// @RequestMapping("list")
	@ResponseBody
	public ResultMsg list(HttpServletRequest request, @RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("列举【菜单口味】");

		// TODO

		// MenuTaste menuTaste = getParam(reqBody, MenuTaste.class);

		// 参数验证
		// Assert.notNull(menuTaste.get);

		List<MenuTaste> menuTasteList = menuTasteService.list(locale);

		return new ResultMsg(reqBody.getId(), menuTasteList);
	}

	/**
	 * 查询【菜单口味】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 09:50:42
	 * @modification 2014年03月29日 09:50:42
	 * @return
	 */
	// @RequestMapping("query")
	@ResponseBody
	public ResultMsg query(HttpServletRequest request, @RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("查询【菜单口味】");

		// TODO

		MenuTaste menuTaste = getParam(reqBody, MenuTaste.class);

		// 参数验证
		// Assert.notNull(menuTaste.get);

		List<MenuTaste> menuTasteList = menuTasteService.query(locale, menuTaste);

		return new ResultMsg(reqBody.getId(), menuTasteList);
	}

	/**
	 * 查询【菜单口味】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 09:50:42
	 * @modification 2014年03月29日 09:50:42
	 * @return
	 */
	// @RequestMapping("paging")
	@ResponseBody
	public ResultMsg paging(HttpServletRequest request, @RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("查询【菜单口味】");

		// TODO

		MenuTaste menuTaste = getParam(reqBody, MenuTaste.class);

		// 参数验证
		Assert.notNull(reqBody.getStart());
		Assert.notNull(reqBody.getLimit());

		// Assert.notNull(menuTaste.get);

		PageResult pageResult = menuTasteService.paging(locale, menuTaste, reqBody.getStart(), reqBody.getLimit());

		return new ResultMsg(reqBody.getId(), pageResult.getList(), pageResult.getTotal());
	}

}

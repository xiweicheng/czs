/**
 * MenuController.java
 */
package com.sizheng.afl.controller;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.multipart.MultipartFile;

import com.sizheng.afl.base.BaseController;
import com.sizheng.afl.pojo.constant.SysConstant;
import com.sizheng.afl.pojo.entity.BusinessConsumer;
import com.sizheng.afl.pojo.entity.Menu;
import com.sizheng.afl.pojo.entity.MenuBill;
import com.sizheng.afl.pojo.entity.MenuCategory;
import com.sizheng.afl.pojo.entity.MenuTaste;
import com.sizheng.afl.pojo.entity.Resources;
import com.sizheng.afl.pojo.entity.User;
import com.sizheng.afl.pojo.vo.Msg;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.pojo.vo.ReqBody;
import com.sizheng.afl.pojo.vo.ResultMsg;
import com.sizheng.afl.service.IMenuBillService;
import com.sizheng.afl.service.IMenuCategoryService;
import com.sizheng.afl.service.IMenuService;
import com.sizheng.afl.service.IMenuTasteService;
import com.sizheng.afl.service.IResourcesService;
import com.sizheng.afl.service.IUserService;
import com.sizheng.afl.util.DateUtil;
import com.sizheng.afl.util.NumberUtil;
import com.sizheng.afl.util.StringUtil;
import com.sizheng.afl.util.WebUtil;

/**
 * 【菜单】请求控制层.
 * 
 * @creation 2014年03月29日 08:37:31
 * @modification 2014年03月29日 08:37:31
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Controller
@RequestMapping(value = "menu")
public class MenuController extends BaseController {

	private static Logger logger = Logger.getLogger(MenuController.class);

	private static DecimalFormat format = new DecimalFormat("0.00");

	@Autowired
	IMenuService menuService;

	@Autowired
	IMenuCategoryService menuCategoryService;

	@Autowired
	IMenuTasteService menuTasteService;

	@Autowired
	IResourcesService resourcesService;

	@Autowired
	IUserService userService;

	@Autowired
	IMenuBillService menuBillService;

	/**
	 * 添加【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	@RequestMapping("input")
	public String input(HttpServletRequest request, Model model, Locale locale) {

		logger.debug("添加【菜单】");

		MenuCategory menuCategory = new MenuCategory();
		menuCategory.setOwner(WebUtil.getSessionBusiness(request).getOpenId());

		List<MenuCategory> list = menuCategoryService.query(locale, menuCategory);

		model.addAttribute("menuCategoryList", list);

		MenuTaste menuTaste = new MenuTaste();
		menuTaste.setOwner(WebUtil.getSessionBusiness(request).getOpenId());

		List<MenuTaste> list2 = menuTasteService.query(locale, menuTaste);

		model.addAttribute("menuTasteList", list2);

		return "menu/input";
	}

	/**
	 * 添加【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	@RequestMapping("add")
	@ResponseBody
	public ResultMsg add(HttpServletRequest request, Model model, Locale locale, @ModelAttribute Menu menu,
			@RequestParam(value = "_isDelete", required = false, defaultValue = "off") String isDelete) {

		logger.debug("添加【菜单】");

		Menu menu2 = new Menu();
		menu2.setOwner(WebUtil.getSessionBusiness(request).getOpenId());
		menu2.setName(menu.getName());
		menu2.setIsDelete(SysConstant.SHORT_FALSE);

		if (menuService.exists(locale, menu2)) {
			return new ResultMsg(false, new Msg(false, "该菜名已经存在!"));
		}

		menu.setOwner(WebUtil.getSessionBusiness(request).getOpenId());
		menu.setDateTime(DateUtil.now());
		menu.setIsDelete(SysConstant.CHECK_ON.equals(isDelete) ? SysConstant.SHORT_TRUE : SysConstant.SHORT_FALSE);

		if (menuService.save(locale, menu)) {
			return new ResultMsg(true);
		} else {
			return new ResultMsg(false, new Msg(false, "添加失败!"));
		}
	}

	/**
	 * 更新提交【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月2日 下午3:42:53
	 * @modification 2014年4月2日 下午3:42:53
	 * @param request
	 * @param model
	 * @param locale
	 * @param menu
	 * @param isDelete
	 * @return
	 */
	@RequestMapping("updateSubmit")
	@ResponseBody
	public ResultMsg updateSubmit(HttpServletRequest request, Model model, Locale locale, @ModelAttribute Menu menu,
			@RequestParam(value = "_isDelete", required = false, defaultValue = "off") String isDelete) {

		logger.debug("添加【菜单】");

		Menu menu2 = new Menu();
		menu2.setOwner(WebUtil.getSessionBusiness(request).getOpenId());
		menu2.setName(menu.getName());
		menu2.setIsDelete(SysConstant.SHORT_FALSE);

		List<Menu> menuList = menuService.query(locale, menu2);

		if (menuList.size() > 0 && !menuList.get(0).getId().equals(menu.getId())) {
			return new ResultMsg(false, new Msg(false, "该菜名已经存在!"));
		}

		menu.setOwner(WebUtil.getSessionBusiness(request).getOpenId());
		menu.setDateTime(DateUtil.now());
		menu.setIsDelete(SysConstant.CHECK_ON.equals(isDelete) ? SysConstant.SHORT_TRUE : SysConstant.SHORT_FALSE);

		if (menuService.update(locale, menu)) {
			return new ResultMsg(true);
		} else {
			return new ResultMsg(false, new Msg(false, "更新失败!"));
		}
	}

	/**
	 * 菜单图片【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	@RequestMapping("image")
	public String image(HttpServletRequest request, Model model, Locale locale) {

		logger.debug("菜单图片【菜单】");

		menuService.paging(locale, null, 0L, 50L);

		Resources resources = new Resources();
		resources.setOwner(WebUtil.getSessionBusiness(request).getOpenId());

		model.addAttribute("imageList", resourcesService.query(locale, resources));

		return "menu/image";
	}

	/**
	 * 菜单图片上传【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	@RequestMapping("upload")
	public void upload(HttpServletRequest request, HttpServletResponse response, Model model, Locale locale,
			@RequestParam("image_file") MultipartFile imageFile) {

		logger.debug("菜单图片上传【菜单】");

		if (menuService.upload(WebUtil.calcServerBaseUrl(request), WebUtil.getRealPath(request), imageFile, locale,
				WebUtil.getSessionBusiness(request).getOpenId())) {
			WebUtil.writeString(
					response,
					StringUtil.replace("<p>你的文件: [{?1}] 已经成功上传.</p><p>类型: {?2}</p><p>大小: {?3}</p>",
							imageFile.getOriginalFilename(), imageFile.getContentType(), imageFile.getSize()));
		} else {
			WebUtil.writeString(response, "文件上传失败!");
		}
	}

	/**
	 * 删除【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public ResultMsg delete(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("删除【菜单】");

		Menu menu = getParam(reqBody, Menu.class);

		// 参数验证
		Assert.notNull(menu.getId());

		boolean deleted = menuService.delete(locale, menu);

		return new ResultMsg(deleted, reqBody.getId());
	}

	/**
	 * 获取【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	// @RequestMapping("get")
	@ResponseBody
	public ResultMsg get(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("获取【菜单】");

		// TODO

		Menu menu = getParam(reqBody, Menu.class);

		// 参数验证
		// Assert.notNull(menu.get);

		Menu getMenu = menuService.get(locale, menu);

		return new ResultMsg(true, reqBody.getId(), getMenu);
	}

	/**
	 * 更新【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	@RequestMapping("update")
	public String update(HttpServletRequest request, @ModelAttribute Menu menu, Locale locale, Model model) {

		logger.debug("更新【菜单】");

		// 参数验证
		Assert.notNull(menu.getId());

		String openId = WebUtil.getSessionBusiness(request).getOpenId();

		// 菜单分类List获取
		MenuCategory menuCategory = new MenuCategory();
		menuCategory.setOwner(openId);
		menuCategory.setIsDelete(SysConstant.SHORT_FALSE);

		List<MenuCategory> menuCategoryList = menuCategoryService.query(locale, menuCategory);

		model.addAttribute("menuCategoryList", menuCategoryList);

		MenuTaste menuTaste = new MenuTaste();
		menuTaste.setOwner(openId);
		menuTaste.setIsDelete(SysConstant.SHORT_FALSE);

		// 菜单口味List获取
		List<MenuTaste> menuTasteList = menuTasteService.query(locale, menuTaste);

		model.addAttribute("menuTasteList", menuTasteList);

		// 菜单获取
		Menu menu2 = menuService.get(Menu.class, menu.getId());

		model.addAttribute("menu", menu2);

		if (StringUtil.isNotEmpty(menu2.getResourceId())) {
			// 菜单图片资源获取
			Resources resources = resourcesService.get(Resources.class, menu2.getResourceId());

			if (resources != null) {
				model.addAttribute("extra_imgPath", resources.getPath());
			}
		}

		return "menu/update";
	}

	/**
	 * 列举【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	@RequestMapping("list")
	public String list(HttpServletRequest request, Model model, Locale locale) {

		logger.debug("列举【菜单】");

		Menu menu = new Menu();
		menu.setOwner(WebUtil.getSessionBusiness(request).getOpenId());

		List<Map<String, Object>> mapList = menuService.queryBillMapList(locale, menu);

		model.addAttribute("menuList", mapList);

		return "menu/list";
	}

	/**
	 * 顾客点菜列举【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	@RequestMapping("free/list4bill")
	public String list4bill(HttpServletRequest request, Model model, Locale locale,
			@RequestParam("openId") String openId, @ModelAttribute Menu menu,
			@RequestParam(value = "mode", required = false) String mode) {

		logger.debug("顾客点菜列举【菜单】");

		String businessOpenId = userService.getBusiness(locale, openId);

		if (StringUtil.isEmpty(businessOpenId)) {
			model.addAttribute("message", "您不在扫描消费中...");
			return "message";
		}

		BusinessConsumer businessConsumer = new BusinessConsumer();
		businessConsumer.setBusinessId(businessOpenId);
		businessConsumer.setConsumerId(openId);

		BusinessConsumer businessConsumer2 = userService.getBusinessConsumer(locale, businessConsumer);

		if (businessConsumer2 == null || !SysConstant.CONSUME_STATUS_ONGOING.equals(businessConsumer2.getStatus())) {
			model.addAttribute("message", "您不在消费中...");
			return "message";
		}

		menu.setOwner(businessOpenId);

		model.addAttribute("selectedCategoryId", menu.getCategoryId() == null ? -1 : menu.getCategoryId());
		model.addAttribute("selectedTasteId", menu.getTasteId() == null ? -1 : menu.getTasteId());

		if (menu.getCategoryId() != null && menu.getCategoryId() == -1) {
			menu.setCategoryId(null);
		}

		if (menu.getTasteId() != null && menu.getTasteId() == -1) {
			menu.setTasteId(null);
		}

		User user = new User();
		user.setUserName(openId);

		User user2 = userService.get(locale, user);

		List<Map<String, Object>> mapList = menuService.queryMapList(locale, menu, user2.getConsumeCode());

		model.addAttribute("menuList", mapList);

		MenuCategory menuCategory = new MenuCategory();
		menuCategory.setOwner(businessOpenId);

		List<MenuCategory> categoryList = menuCategoryService.query(locale, menuCategory);

		model.addAttribute("categoryList", categoryList);

		MenuTaste menuTaste = new MenuTaste();
		menuTaste.setOwner(businessOpenId);

		List<MenuTaste> tasteList = menuTasteService.query(locale, menuTaste);

		model.addAttribute("tasteList", tasteList);

		model.addAttribute("openId", openId);
		model.addAttribute("mode", mode == null ? "off" : mode);

		return "menu/list-bill";
	}

	/**
	 * 顾客点菜列举【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	@RequestMapping("free/billDeal")
	@ResponseBody
	public ResultMsg billDeal(HttpServletRequest request, Model model, Locale locale, @ModelAttribute MenuBill menuBill) {

		logger.debug("顾客点菜【菜单】");

		Assert.notNull(menuBill.getConsumerId());

		boolean value = menuService.billDeal(locale, menuBill);

		return new ResultMsg(value);
	}

	/**
	 * 查询【菜单】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	// @RequestMapping("query")
	@ResponseBody
	public ResultMsg query(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("查询【菜单】");

		// TODO

		Menu menu = getParam(reqBody, Menu.class);

		// 参数验证
		// Assert.notNull(menu.get);

		List<Menu> menuList = menuService.query(locale, menu);

		for (Menu menu2 : menuList) {

		}

		return new ResultMsg(reqBody.getId(), menuList);
	}

	/**
	 * 查询【菜单】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	// @RequestMapping("paging")
	@ResponseBody
	public ResultMsg paging(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("查询【菜单】");

		// TODO

		Menu menu = getParam(reqBody, Menu.class);

		// 参数验证
		Assert.notNull(reqBody.getStart());
		Assert.notNull(reqBody.getLimit());

		// Assert.notNull(menu.get);

		PageResult pageResult = menuService.paging(locale, menu, reqBody.getStart(), reqBody.getLimit());

		return new ResultMsg(reqBody.getId(), pageResult.getList(), pageResult.getTotal());
	}

	/**
	 * 顾客订单查询【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	@RequestMapping("free/billQuery")
	public String billQuery(HttpServletRequest request, Locale locale, @ModelAttribute MenuBill menuBill, Model model) {

		logger.debug("顾客订单查询【菜单】");

		Assert.notNull(menuBill.getStatus());
		Assert.notNull(menuBill.getConsumerId());

		model.addAttribute("openId", menuBill.getConsumerId());

		User user = new User();
		user.setUserName(menuBill.getConsumerId());

		User user2 = userService.get(locale, user);

		if (user2 != null) {
			menuBill.setConsumeCode(user2.getConsumeCode());

			List<Map<String, Object>> list = menuBillService.query4MapList(locale, menuBill);

			double total = 0;

			for (Map<String, Object> map : list) {
				Double price = NumberUtil.getDouble(map, "price");
				Double privilege = NumberUtil.getDouble(map, "privilege");
				Integer copies = NumberUtil.getInteger(map, "copies");

				if (price != null) {
					if (privilege != null) {
						if (privilege >= 1) {
							total += ((price - privilege) * copies);
						} else {
							total += ((price * privilege) * copies);
						}
					} else {
						total += (price * copies);
					}
				}
			}

			model.addAttribute("billList", list);
			model.addAttribute("total", format.format(total));

			if (menuBill.getStatus() == 0) {
				model.addAttribute("title", "待定订单");
				model.addAttribute("type", "hold");
			} else if (menuBill.getStatus() == 1) {
				model.addAttribute("title", "已下订单");
				model.addAttribute("type", "confirm");
			} else if (menuBill.getStatus() == 2) {
				model.addAttribute("title", "退订订单");
				model.addAttribute("type", "debook");
			}

			return "menu/query-bill";
		} else {
			model.addAttribute("message", "消费信息不存在!");
			return "message";
		}
	}

	/**
	 * 集体顾客订单查询【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	@RequestMapping("free/billGroupQuery")
	public String billGroupQuery(HttpServletRequest request, Locale locale, @ModelAttribute MenuBill menuBill,
			Model model) {

		logger.debug("集体顾客订单查询【菜单】");

		Assert.notNull(menuBill.getStatus());
		Assert.notNull(menuBill.getConsumerId());

		model.addAttribute("openId", menuBill.getConsumerId());

		User user = new User();
		user.setUserName(menuBill.getConsumerId());

		User user2 = userService.get(locale, user);

		if (user2 != null) {
			menuBill.setConsumeCode(user2.getConsumeCode());

			List<Map<String, Object>> list = menuBillService.query4GroupMapList(locale, menuBill);

			double total = 0;

			for (Map<String, Object> map : list) {
				Double price = NumberUtil.getDouble(map, "price");
				Double privilege = NumberUtil.getDouble(map, "privilege");

				List<Map<String, Object>> maps = (List<Map<String, Object>>) map.get("menuBill");

				int copies = 0;

				for (Map<String, Object> map2 : maps) {
					copies += (NumberUtil.getInteger(map2, "copies"));
				}

				if (price != null) {
					if (privilege != null) {
						if (privilege >= 1) {
							total += ((price - privilege) * copies);
						} else {
							total += ((price * privilege) * copies);
						}
					} else {
						total += (price * copies);
					}
				}

			}

			model.addAttribute("billList", list);
			model.addAttribute("total", format.format(total));

			if (menuBill.getStatus() == 0) {
				model.addAttribute("title", "待定订单");
				model.addAttribute("type", "hold");
			} else if (menuBill.getStatus() == 1) {
				model.addAttribute("title", "已下订单");
				model.addAttribute("type", "confirm");
			} else if (menuBill.getStatus() == 2) {
				model.addAttribute("title", "退订订单");
				model.addAttribute("type", "debook");
			}

			return "menu/query-group-bill";
		} else {
			model.addAttribute("message", "消费信息不存在!");
			return "message";
		}
	}
}

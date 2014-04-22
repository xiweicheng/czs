/**
 * MenuController.java
 */
package com.sizheng.afl.controller;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Date;
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
import com.sizheng.afl.util.BeanUtil;
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
		menu.setOrderTimes(Long.valueOf(0));

		if (StringUtil.isEmpty(menu.getPrivilege())) {
			menu.setPrivilege(BigDecimal.ZERO);
		}

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

		Menu menu3 = menuService.get(Menu.class, menu.getId());

		if (menu3 != null) {
			BeanUtil.copyNotEmptyFields(menu, menu3);
		} else {
			return new ResultMsg(false, new Msg(false, "彩品或被删除,更新失败!"));
		}

		if (menuService.update(locale, menu3)) {
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
	@ResponseBody
	public ResultMsg upload(HttpServletRequest request, HttpServletResponse response, Model model, Locale locale,
			@RequestParam("image_file") MultipartFile imageFile) {

		logger.debug("菜单图片上传【菜单】");

		if (resourcesService.isLimited(locale, WebUtil.getSessionBusiness(request).getOpenId())) {
			return new ResultMsg(false, new Msg(false, "上传图片数量达到最大限制,文件上传失败!"));
		}

		if (menuService.upload(WebUtil.calcServerBaseUrl(request), WebUtil.getRealPath(request), imageFile, locale,
				WebUtil.getSessionBusiness(request).getOpenId())) {
			WebUtil.writeString(response, StringUtil.replace("文件:[{?1}]上传成功!", imageFile.getOriginalFilename()));
			return new ResultMsg(true);
		} else {
			return new ResultMsg(false, new Msg(false, StringUtil.replace("文件:[{?1}]上传失败!",
					imageFile.getOriginalFilename())));
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
				model.addAttribute("extra_imgFileName", resources.getFileName());
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
	 * 列举订单【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	@RequestMapping("orderList")
	public String orderList(HttpServletRequest request, Model model, Locale locale,
			@RequestParam(value = "interval", required = false) String interval) {

		logger.debug("列举订单【菜单】");

		Menu menu = new Menu();
		menu.setOwner(WebUtil.getSessionBusiness(request).getOpenId());

		List<Map<String, Object>> mapList = menuService.queryOrderMapList(locale, menu);

		for (Map<String, Object> map : mapList) {
			long sec = NumberUtil.getLong(map, "sec_diff");
			String c = DateUtil.convert(sec);
			map.put("sec_diff", c);
		}

		model.addAttribute("orderList", mapList);
		model.addAttribute("interval", interval);

		return "menu/order-list";
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
			@RequestParam(value = "mode", required = false) String mode,
			@RequestParam(value = "order", required = false) String order) {

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

		List<Map<String, Object>> mapList = menuService.queryMapList(locale, menu, user2.getConsumeCode(), order,
				openId);

		double total = 0;
		int count = 0;

		for (Map<String, Object> map : mapList) {
			double price = NumberUtil.getDouble(map, "price");
			Integer copies = NumberUtil.getInteger(map, "copies");

			if (copies != null) {

				if (SysConstant.MENU_BILL_STATUS_CONFIRM.equals(NumberUtil.getShort(map, "status"))) {
					total += (price * copies);
					count += copies;
				} else if (SysConstant.MENU_BILL_STATUS_ACCEPT.equals(NumberUtil.getShort(map, "status"))) {
					total += (price * copies);
					count += copies;
				} else if (SysConstant.MENU_BILL_STATUS_STOW.equals(NumberUtil.getShort(map, "status"))) {
					total += (price * copies);
					count += copies;
				}
			}
		}

		model.addAttribute("menuList", mapList);
		model.addAttribute("total", NumberUtil.format2Money(total));
		model.addAttribute("count", count);

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
		model.addAttribute("order", order == null ? "-1" : order);

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
	 * 顾客订单处理【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	@RequestMapping("accept")
	@ResponseBody
	public ResultMsg accept(HttpServletRequest request, Locale locale, @ModelAttribute MenuBill menuBill) {

		logger.debug("顾客订单处理【菜单】");

		Assert.notNull(menuBill.getId());
		Assert.notNull(menuBill.getCopies());

		boolean value = menuService.acceptBill(locale, menuBill);

		return new ResultMsg(value);
	}

	/**
	 * 顾客订单合并处理【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	@RequestMapping("acceptJoin")
	@ResponseBody
	public ResultMsg acceptJoin(HttpServletRequest request, Locale locale, @RequestParam("id") String[] ids,
			@RequestParam("copies") Long[] copies) {

		logger.debug("顾客订单处理【菜单】");

		boolean value = menuService.acceptBillJoin(locale, ids, copies);

		return new ResultMsg(value);
	}

	/**
	 * 合并菜单查询【菜单】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月29日 08:37:31
	 * @modification 2014年03月29日 08:37:31
	 * @return
	 */
	@RequestMapping("queryJoinBill")
	@ResponseBody
	public ResultMsg queryJoinBill(HttpServletRequest request, Locale locale, @ModelAttribute Menu menu) {

		logger.debug("合并菜单查询【菜单】");

		Assert.notNull(menu.getId());
		menu.setOwner(WebUtil.getSessionBusiness(request).getOpenId());

		List<Map<String, Object>> list = menuService.queryJoinBill(locale, menu);

		for (Map<String, Object> map : list) {
			long sec = NumberUtil.getLong(map, "sec_diff");
			String c = DateUtil.convert(sec);
			map.put("sec_diff", c);
		}

		return new ResultMsg(true, list);
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
	public String billQuery(HttpServletRequest request, Locale locale, @ModelAttribute MenuBill menuBill, Model model,
			@RequestParam("isOwn") Boolean isOwn, @RequestParam(value = "isShowImg", required = false) Boolean isShowImg) {

		logger.debug("顾客订单查询【菜单】");

		Assert.notNull(menuBill.getConsumerId());

		model.addAttribute("openId", menuBill.getConsumerId());

		User user = new User();
		user.setUserName(menuBill.getConsumerId());

		User user2 = userService.get(locale, user);

		if (user2 != null) {
			menuBill.setConsumeCode(user2.getConsumeCode());

			List<Map<String, Object>> list = isOwn ? menuBillService.query4MapList(locale, menuBill) : menuBillService
					.query4GroupMapList(locale, menuBill);

			double total = 0;
			int count = 0;
			int submitCount = 0;

			for (Map<String, Object> map : list) {
				Double price = NumberUtil.getDouble(map, "price");
				int copies = 0;

				if (isOwn) {
					copies = NumberUtil.getInteger(map, "copies");
					Short status = NumberUtil.getShort(map, "status");

					if (status != null && status.equals(SysConstant.MENU_BILL_STATUS_STOW)) {
						submitCount += copies;
					}
				} else {
					List<Map<String, Object>> maps = (List<Map<String, Object>>) map.get("menuBill");
					for (Map<String, Object> map2 : maps) {
						copies += (NumberUtil.getInteger(map2, "copies"));
					}
				}

				if (price != null) {
					total += (price * copies);
					count += copies;
				}
			}

			model.addAttribute("billList", list);
			model.addAttribute("total", format.format(total));
			model.addAttribute("count", count);
			model.addAttribute("submitCount", submitCount);
			model.addAttribute("isOwn", isOwn ? "1" : "0");
			model.addAttribute("isShowImg", (isShowImg == null || !isShowImg) ? "0" : "1");

			model.addAttribute("title", (isOwn ? "个人" : "集体") + "订单");

			return "menu/query-bill";
		} else {
			model.addAttribute("message", "消费信息不存在!");
			return "message";
		}
	}

	/**
	 * 提交订单.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月9日 上午11:35:22
	 * @modification 2014年4月9日 上午11:35:22
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @return
	 */
	@RequestMapping("free/billSubmit")
	public String billSubmit(HttpServletRequest request, Locale locale, Model model,
			@RequestParam("openId") String openId) {

		logger.debug("提交订单【消费者】");

		boolean val = menuService.billSubmit(locale, openId);

		if (val) {
			return StringUtil.replace("forward:billQuery.do?isOwn=1&status=1&consumerId={?1}", openId);
		} else {
			model.addAttribute("message", "提交订单失败!");
			return "error";
		}
	}

	/**
	 * 历史订单查询.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月9日 上午11:35:22
	 * @modification 2014年4月9日 上午11:35:22
	 * @param request
	 * @param locale
	 * @param model
	 * @param openId
	 * @return
	 */
	@RequestMapping("orderHistory")
	public String orderHistory(HttpServletRequest request, Locale locale, Model model,
			@RequestParam(value = "start", required = false) String start,
			@RequestParam(value = "end", required = false) String end,
			@RequestParam(value = "status", required = false) String[] status) {

		logger.debug("历史订单查询【消费者】");

		Date sDate = StringUtil.isNotEmpty(start) ? DateUtil.parse(start, DateUtil.FORMAT1) : new Date(DateUtil.now()
				.getTime() - 24 * 60 * 60 * 1000);
		Date eDate = StringUtil.isNotEmpty(end) ? DateUtil.parse(end, DateUtil.FORMAT1) : DateUtil.now();

		model.addAttribute("start", sDate.getTime());
		model.addAttribute("end", eDate.getTime());

		List<Map<String, Object>> historyMenuBillList = menuService.queryHistoryMenuBill(locale, WebUtil
				.getSessionBusiness(request).getOpenId(), sDate, eDate, status);

		List<Map<String, Object>> historyMenuBillList2 = menuService.queryHistoryMenuBill(locale, WebUtil
				.getSessionBusiness(request).getOpenId(), sDate, eDate);

		long accept = 0;
		long submited = 0;
		long submiting = 0;
		long debook = 0;
		for (Map<String, Object> map : historyMenuBillList2) {
			Short status2 = NumberUtil.getShort(map, "status");
			if (SysConstant.MENU_BILL_STATUS_CONFIRM.equals(status2)) {
				submited++;
			} else if (SysConstant.MENU_BILL_STATUS_ACCEPT.equals(status2)) {
				accept++;
			} else if (SysConstant.MENU_BILL_STATUS_DEBOOK.equals(status2)) {
				debook++;
			} else if (SysConstant.MENU_BILL_STATUS_STOW.equals(status2)) {
				submiting++;
			}
		}

		for (Map<String, Object> map : historyMenuBillList) {
			long sec = NumberUtil.getLong(map, "sec_diff");
			String c = DateUtil.convert(sec);
			map.put("sec_diff", c);
		}

		model.addAttribute("historyMenuBillList", historyMenuBillList);
		model.addAttribute("status", (status != null && status.length > 0) ? status[0] : "");
		model.addAttribute("accept", accept);
		model.addAttribute("submited", submited);
		model.addAttribute("submiting", submiting);
		model.addAttribute("debook", debook);
		model.addAttribute("total", historyMenuBillList2.size());

		return "menu/order-history";
	}
}

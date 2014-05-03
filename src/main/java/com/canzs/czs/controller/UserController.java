/**
 * UserController.java
 */
package com.canzs.czs.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import com.canzs.czs.base.BaseController;
import com.canzs.czs.component.WeiXinApiInvoker;
import com.canzs.czs.pojo.constant.SysConstant;
import com.canzs.czs.pojo.entity.BusinessConsumer;
import com.canzs.czs.pojo.entity.Favorites;
import com.canzs.czs.pojo.entity.MenuBill;
import com.canzs.czs.pojo.entity.User;
import com.canzs.czs.pojo.vo.PageResult;
import com.canzs.czs.pojo.vo.ReqBody;
import com.canzs.czs.pojo.vo.ResultMsg;
import com.canzs.czs.service.IBusinessService;
import com.canzs.czs.service.IMenuBillService;
import com.canzs.czs.service.IUserService;
import com.canzs.czs.util.DateUtil;
import com.canzs.czs.util.NumberUtil;
import com.canzs.czs.util.StringUtil;

/**
 * 【用户】请求控制层.
 * 
 * @creation 2014年03月28日 10:02:03
 * @modification 2014年03月28日 10:02:03
 * @company Canzs
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

	@Autowired
	IMenuBillService menuBillService;

	@Autowired
	IBusinessService businessService;

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
			model.addAttribute("message", ss + "结账请求发送成功,等待商家确认处理!");
		} else {
			model.addAttribute("message", "您已经不在[消费中]状态," + ss + "结账请求无法申请发送!");
		}

		return "message";
	}

	/**
	 * 顾客自助结账,当消费金额为零时.
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
	@RequestMapping("free/checkout")
	public String checkout(HttpServletRequest request, Locale locale, Model model,
			@RequestParam("openId") String openId, @RequestParam("consumeCode") String consumeCode) {

		logger.debug("顾客自助结账,当消费金额为零时【消费者】");

		double consume = businessService.getConsume(locale, consumeCode, "own");

		if (consume > 0) {
			model.addAttribute("message", "您存在消费记录,金额:<b>" + NumberUtil.format2Money(consume)
					+ "</b>元<br>无法通过此操作结束消费状态!");
		} else {
			BusinessConsumer businessConsumer = new BusinessConsumer();
			businessConsumer.setConsumerId(openId);
			businessConsumer.setConsumeCode(consumeCode);
			businessConsumer.setStatus(SysConstant.CONSUME_STATUS_OWN);

			if (businessService.checkout(locale, businessConsumer, openId)) {
				model.addAttribute("message", "操作成功,消费状态结束!");
			} else {
				model.addAttribute("message", "该操作已经失效,您已经不在[消费中]状态!");
			}
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

	/**
	 * 添加收藏 赞不攒.
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
	@RequestMapping("free/store")
	@ResponseBody
	public ResultMsg store(HttpServletRequest request, Locale locale, Model model, @ModelAttribute Favorites favorites) {

		logger.debug("添加收藏 赞不攒【消费者】");

		Assert.notNull(favorites.getOpenId());
		Assert.notNull(favorites.getRefId());
		Assert.notNull(favorites.getType());

		boolean val = userService.store(locale, favorites);

		return new ResultMsg(val);

	}

	/**
	 * 店铺收藏.
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
	@RequestMapping("free/businessStow")
	public String businessStow(HttpServletRequest request, Locale locale, Model model,
			@RequestParam("openId") String openId) {

		logger.debug("店铺收藏【消费者】");

		model.addAttribute("message", "[店铺收藏]页面建设中...");

		return "message";

	}

	/**
	 * 美食收藏.
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
	@RequestMapping("free/foodStow")
	@ResponseBody
	public ResultMsg foodStow(HttpServletRequest request, Locale locale, Model model,
			@ModelAttribute Favorites favorites) {

		logger.debug("美食收藏【消费者】");

		boolean val = userService.stowFood(locale, favorites);

		return new ResultMsg(val);

	}

	/**
	 * 美食收藏查询.
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
	@RequestMapping("free/stowQuery")
	public String stowQuery(HttpServletRequest request, Locale locale, Model model,
			@RequestParam("openId") String openId) {

		logger.debug("美食收藏查询【消费者】");

		String businessId = userService.getBusiness(locale, openId);

		List<Map<String, Object>> stowList = userService.stowQuery(locale, openId, businessId);

		double[] valArr = menuBillService.getOwnTotalAndCopies(locale, openId);

		model.addAttribute("stowList", stowList);
		model.addAttribute("openId", openId);
		model.addAttribute("total", NumberUtil.format2Money(valArr[0]));
		model.addAttribute("count", (int) valArr[1]);

		return "menu/menu-stow";

	}

	/**
	 * 消费详情.
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
	@RequestMapping("billDetail")
	@ResponseBody
	public ResultMsg billDetail(HttpServletRequest request, Locale locale, Model model,
			@ModelAttribute MenuBill menuBill, @RequestParam("type") String type) {

		logger.debug("消费详情【消费者】");

		Assert.notNull(menuBill.getConsumeCode());
		Assert.notNull(menuBill.getConsumerId());
		Assert.notNull(menuBill.getSceneId());

		menuBill.setStatus(SysConstant.MENU_BILL_STATUS_CONFIRM);

		List<Map<String, Object>> list = null;

		if (SysConstant.NUMBER_0.equals(type)) {
			list = menuBillService.query4MapList2(locale, menuBill);
		} else if (SysConstant.NUMBER_1.equals(type)) {
			list = menuBillService.query4GroupMapList2(locale, menuBill);
		} else {
			return new ResultMsg(false);
		}

		double total = 0;

		for (Map<String, Object> map : list) {

			map.put("diff", DateUtil.convert(NumberUtil.getLong(map, "sec_diff")));

			Double price = NumberUtil.getDouble(map, "price");

			int copies = 0;

			if (SysConstant.NUMBER_0.equals(type)) {
				copies = NumberUtil.getInteger(map, "copies");
			} else if (SysConstant.NUMBER_1.equals(type)) {
				List<Map<String, Object>> maps = (List<Map<String, Object>>) map.get("menuBill");
				for (Map<String, Object> map2 : maps) {
					map2.put("diff", DateUtil.convert(NumberUtil.getLong(map2, "sec_diff")));
					copies += (NumberUtil.getInteger(map2, "copies"));
				}
			}

			if (price != null) {
				total += (price * copies);
			}
		}

		ResultMsg resultMsg = new ResultMsg(true);
		resultMsg.setValues(list);
		resultMsg.setValue(NumberUtil.format2Money(total));

		return resultMsg;
	}

	/**
	 * 获取收藏商家.
	 * 
	 * @author xiweicheng
	 * @creation 2014年4月29日 上午11:53:16
	 * @modification 2014年4月29日 上午11:53:16
	 * @param request
	 * @param locale
	 * @param model
	 * @param consumerId
	 * @return
	 */
	@RequestMapping("free/getStowBusiness")
	public String getStowBusiness(HttpServletRequest request, Locale locale, Model model,
			@RequestParam("consumerId") String consumerId) {

		logger.debug("获取收藏商家【消费者】");

		List<Map<String, Object>> stowBusiness = userService.getStowBusiness(locale, consumerId);

		for (Map<String, Object> map : stowBusiness) {
			map.put("diff", DateUtil.convert(NumberUtil.getLong(map, "sec_diff")));
		}

		model.addAttribute("list", stowBusiness);

		return "customer/stow-business";
	}

}

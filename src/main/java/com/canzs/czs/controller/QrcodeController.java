/**
 * QrcodeController.java
 */
package com.canzs.czs.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
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
import com.canzs.czs.component.PropUtil;
import com.canzs.czs.pojo.constant.SysConstant;
import com.canzs.czs.pojo.entity.Business;
import com.canzs.czs.pojo.entity.Category;
import com.canzs.czs.pojo.entity.Qrcode;
import com.canzs.czs.pojo.model.WeiXinQrcode;
import com.canzs.czs.pojo.vo.Msg;
import com.canzs.czs.pojo.vo.PageResult;
import com.canzs.czs.pojo.vo.ReqBody;
import com.canzs.czs.pojo.vo.ResultMsg;
import com.canzs.czs.service.IBusinessService;
import com.canzs.czs.service.ICategoryService;
import com.canzs.czs.service.IQrcodeService;
import com.canzs.czs.util.StringUtil;
import com.canzs.czs.util.WebUtil;
import com.canzs.czs.util.ZipUtil;

/**
 * 【二维码】请求控制层.
 * 
 * @creation 2014年03月25日 05:57:01
 * @modification 2014年03月25日 05:57:01
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Controller
@RequestMapping(value = "qrcode")
public class QrcodeController extends BaseController {

	private static Logger logger = Logger.getLogger(QrcodeController.class);

	@Autowired
	IQrcodeService qrcodeService;

	@Autowired
	ICategoryService categoryService;

	@Autowired
	IBusinessService businessService;

	@Autowired
	PropUtil propUtil;

	/**
	 * 添加【二维码】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 05:57:01
	 * @modification 2014年03月25日 05:57:01
	 * @return
	 */
	// @RequestMapping("add")
	@ResponseBody
	public ResultMsg add(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("添加【二维码】");

		// TODO

		Qrcode qrcode = getParam(reqBody, Qrcode.class);

		// 参数验证
		// Assert.notNull(qrcode.get);

		boolean saved = qrcodeService.save(locale, qrcode);

		// TODO null->ID
		return new ResultMsg(saved, reqBody.getId(), null);
	}

	/**
	 * 删除【二维码】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 05:57:01
	 * @modification 2014年03月25日 05:57:01
	 * @return
	 */
	// @RequestMapping("delete")
	@ResponseBody
	public ResultMsg delete(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("删除【二维码】");

		// TODO

		Qrcode qrcode = getParam(reqBody, Qrcode.class);

		// 参数验证
		// Assert.notNull(qrcode.get);

		boolean deleted = qrcodeService.delete(locale, qrcode);

		return new ResultMsg(deleted, reqBody.getId());
	}

	/**
	 * 获取【二维码】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 05:57:01
	 * @modification 2014年03月25日 05:57:01
	 * @return
	 */
	// @RequestMapping("get")
	@ResponseBody
	public ResultMsg get(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("获取【二维码】");

		// TODO

		Qrcode qrcode = getParam(reqBody, Qrcode.class);

		// 参数验证
		// Assert.notNull(qrcode.get);

		// Qrcode getQrcode = qrcodeService.get(locale, qrcode);

		// return new ResultMsg(true, reqBody.getId(), getQrcode);

		return null;
	}

	/**
	 * 更新【二维码】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 05:57:01
	 * @modification 2014年03月25日 05:57:01
	 * @return
	 */
	@RequestMapping("update")
	@ResponseBody
	public ResultMsg update(HttpServletRequest request, Locale locale, @ModelAttribute Qrcode qrcode) {

		logger.debug("更新【二维码】");

		// 参数验证
		Assert.notNull(qrcode.getId());
		Assert.notNull(qrcode.getDescription());

		boolean updated = qrcodeService.update(locale, qrcode);

		return new ResultMsg(updated);
	}

	/**
	 * 增加二维码使用次数限制【二维码】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 05:57:01
	 * @modification 2014年03月25日 05:57:01
	 * @return
	 */
	@RequestMapping("addUseLimit")
	@ResponseBody
	public ResultMsg addUseLimit(HttpServletRequest request, Locale locale, @RequestParam("id") long id,
			@RequestParam("addVal") Long val) {

		logger.debug("增加二维码使用次数限制【二维码】");

		// 生产二维码餐豆值计算判断
		Business business = new Business();
		business.setOpenId(WebUtil.getSessionBusinessId(request));

		Business business2 = businessService.get((Locale) null, business);

		if (business2 == null) {
			return new ResultMsg(false, new Msg(false, "商家信息不存在!"));
		}

		long needLv = val * propUtil.getQrcodeOneLifeValue();

		if (needLv > business2.getLifeValue()) {
			return new ResultMsg(false, new Msg(false, StringUtil.replace("餐豆值不足,差[{?1}]餐豆值,请充值!",
					needLv - business2.getLifeValue())));
		}

		boolean result = qrcodeService.addUseLimit(locale, WebUtil.getSessionBusinessId(request), val, id);

		return new ResultMsg(result);
	}

	/**
	 * 列举【二维码】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 05:57:01
	 * @modification 2014年03月25日 05:57:01
	 * @return
	 */
	@RequestMapping("list")
	public String list(HttpServletRequest request, Locale locale, Model model) {

		logger.debug("列举【二维码】");

		List<Map<String, Object>> qrcodeList = qrcodeService
				.listByOpenId(locale, WebUtil.getSessionBusinessId(request));

		model.addAttribute("qrcodeList", qrcodeList);

		return "qrcode/list";
	}

	/**
	 * 查询【二维码】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 05:57:01
	 * @modification 2014年03月25日 05:57:01
	 * @return
	 */
	// @RequestMapping("query")
	@ResponseBody
	public ResultMsg query(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("查询【二维码】");

		// TODO

		Qrcode qrcode = getParam(reqBody, Qrcode.class);

		// 参数验证
		// Assert.notNull(qrcode.get);

		List<Map<String, Object>> qrcodeList = qrcodeService.query(locale, qrcode);

		return new ResultMsg(reqBody.getId(), qrcodeList);
	}

	/**
	 * 查询【二维码】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 05:57:01
	 * @modification 2014年03月25日 05:57:01
	 * @return
	 */
	// @RequestMapping("paging")
	@ResponseBody
	public ResultMsg paging(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("查询【二维码】");

		// TODO

		Qrcode qrcode = getParam(reqBody, Qrcode.class);

		// 参数验证
		Assert.notNull(reqBody.getStart());
		Assert.notNull(reqBody.getLimit());

		// Assert.notNull(qrcode.get);

		PageResult pageResult = qrcodeService.paging(locale, qrcode, reqBody.getStart(), reqBody.getLimit());

		return new ResultMsg(reqBody.getId(), pageResult.getList(), pageResult.getTotal());
	}

	@RequestMapping("input")
	public String input(HttpServletRequest request, Locale locale, Model model) {

		List<Category> list = categoryService.listByType("qrcode");
		model.addAttribute("categoryList", list);

		Business business = new Business();
		business.setOpenId(WebUtil.getSessionBusinessId(request));

		Business business2 = businessService.get(locale, business);

		if (business2 == null) {
			model.addAttribute("message", "商家信息不存在!");
			return "message";
		}

		model.addAttribute("business", business2);

		return "qrcode/input";
	}

	@RequestMapping("create")
	public String create(HttpServletRequest request, Locale locale, Model model, @ModelAttribute Qrcode qrcode,
			@RequestParam("description") String[] descriptions, @RequestParam("useTimes") Long[] useTimes) {

		if (StringUtil.isEmpty(qrcode.getOpenId())) {
			qrcode.setOpenId(WebUtil.getSessionBusinessId(request));
		}

		if (descriptions == null || descriptions.length == 0) {
			model.addAttribute("message", "二维码描述不能为空!");
			return "message";
		}

		if (useTimes == null || useTimes.length == 0) {
			model.addAttribute("message", "二维码授权使用次数不能为空!");
			return "message";
		}

		if (SysConstant.CATEGORY_ID_JS.equals(qrcode.getCategoryId())) {
			if (qrcodeService.isExistsJSQrcode(locale, qrcode)) {
				model.addAttribute("message", "[角色]类型二维码已经生成过了,请通过侧边菜单[二维码一览]查看!");
				return "message";
			}
		} else {

			int size = descriptions.length;

			long remain = businessService.qrcodeRemain(locale, qrcode.getOpenId());

			if (size > remain) {
				model.addAttribute("message", "您的二维码生成数量不足,还剩下" + remain + "个!");
				return "message";
			}
		}

		// 生产二维码餐豆值计算判断
		Business business = new Business();
		business.setOpenId(qrcode.getOpenId());

		Business business2 = businessService.get((Locale) null, business);

		if (business2 == null) {
			model.addAttribute("message", "商家信息不存在!");
			return "message";
		}

		long needLv = 0;

		for (int j = 0; j < useTimes.length; j++) {
			needLv += (useTimes[j] * propUtil.getQrcodeOneLifeValue());
		}

		if (needLv > business2.getLifeValue()) {
			model.addAttribute("message",
					StringUtil.replace("餐豆值不足,差[{?1}]餐豆值,请充值!", needLv - business2.getLifeValue()));
			return "message";
		}

		String realPath = request.getSession().getServletContext().getRealPath("/");

		logger.debug(realPath);

		List<WeiXinQrcode> list = new ArrayList<>();

		for (int j = 0; j < descriptions.length; j++) {
			Qrcode qrcode2 = new Qrcode();
			qrcode2.setOpenId(qrcode.getOpenId());
			qrcode2.setCategoryId(qrcode.getCategoryId());
			qrcode2.setDescription(descriptions[j]);
			qrcode2.setUseLimit(useTimes[j]);

			list.add(qrcodeService.create(qrcode2, realPath, WebUtil.calcServerBaseUrl(request)));
		}

		model.addAttribute("qrcodeList", list);
		model.addAttribute("openId", qrcode.getOpenId());

		model.addAttribute("business", business2);

		return "qrcode/create";
	}

	@RequestMapping("sendMail")
	public String sendMail(HttpServletRequest request, Locale locale, Model model) {

		String path = request.getParameter("filePath");
		String url = request.getParameter("url");
		String ticket = request.getParameter("ticket");
		String mail = request.getParameter("mail");

		if (qrcodeService.sendMail(WebUtil.getRealPath(request) + path, url, ticket, mail)) {
			model.addAttribute("message", "发送成功!");
		} else {
			model.addAttribute("message", "发送失败!");
		}

		return "message";
	}

	@RequestMapping("sendMailZip")
	public String sendMailZip(HttpServletRequest request, Locale locale, Model model) {

		String[] pathArr = request.getParameterValues("filePath");
		String mail = request.getParameter("mail");

		String realPath = WebUtil.getRealPath(request);

		for (int i = 0; i < pathArr.length; i++) {
			pathArr[i] = realPath + pathArr[i];
		}

		try {
			FileUtils.forceMkdir(new File(realPath + "resources/temp/"));
		} catch (IOException e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
		}

		String zipFilePath = realPath + "resources/temp/" + UUID.randomUUID().toString() + ".zip";

		ZipUtil.zip(new File(zipFilePath), pathArr);

		if (qrcodeService.sendMail(zipFilePath, mail)) {
			model.addAttribute("message", "发送成功!");
		} else {
			model.addAttribute("message", "发送失败!");
		}

		FileUtils.deleteQuietly(new File(zipFilePath));

		return "message";
	}

	@RequestMapping("buy")
	public String buy(HttpServletRequest request, Locale locale, Model model) {

		return "qrcode/buy";
	}

	@RequestMapping("download")
	public String download(HttpServletRequest request, Locale locale, Model model,
			@RequestParam(value = "openId", required = false) String openId) {

		openId = StringUtil.isEmpty(openId) ? WebUtil.getSessionBusiness(request).getOpenId() : openId;

		Business business = new Business();
		business.setOpenId(openId);

		Business business2 = businessService.get(locale, business);

		if (business2 == null) {
			model.addAttribute("message", "您还不是入驻商家,需要先商家入驻才能下载!");

			return "result";
		} else {

			// 判断二维码使用的数量
			List<Qrcode> list = qrcodeService.queryByOpenId(locale, openId);

			if (list.size() >= business2.getQrcodeLimit()) {
				model.addAttribute("message",
						StringUtil.replace("您可使用的二维码达到最大限制[{?1}],需要先购买!", business2.getQrcodeLimit()));

				return "result";
			}

			model.addAttribute("openId", openId);

			return "forward:/qrcode/input.do";
		}
	}
}

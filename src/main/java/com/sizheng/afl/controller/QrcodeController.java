/**
 * QrcodeController.java
 */
package com.sizheng.afl.controller;

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

import com.sizheng.afl.base.BaseController;
import com.sizheng.afl.pojo.entity.Business;
import com.sizheng.afl.pojo.entity.Category;
import com.sizheng.afl.pojo.entity.Qrcode;
import com.sizheng.afl.pojo.model.WeiXinQrcode;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.pojo.vo.ReqBody;
import com.sizheng.afl.pojo.vo.ResultMsg;
import com.sizheng.afl.service.IBusinessService;
import com.sizheng.afl.service.ICategoryService;
import com.sizheng.afl.service.IQrcodeService;
import com.sizheng.afl.util.StringUtil;
import com.sizheng.afl.util.WebUtil;

/**
 * 【二维码】请求控制层.
 * 
 * @creation 2014年03月25日 05:57:01
 * @modification 2014年03月25日 05:57:01
 * @company Skycloud
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
	// @RequestMapping("update")
	@ResponseBody
	public ResultMsg update(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("更新【二维码】");

		// TODO

		Qrcode qrcode = getParam(reqBody, Qrcode.class);

		// 参数验证
		// Assert.notNull(qrcode.get);

		boolean updated = qrcodeService.update(locale, qrcode);

		return new ResultMsg(updated, reqBody.getId());
	}

	/**
	 * 列举【二维码】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月25日 05:57:01
	 * @modification 2014年03月25日 05:57:01
	 * @return
	 */
	// @RequestMapping("list")
	@ResponseBody
	public ResultMsg list(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("列举【二维码】");

		// TODO

		// Qrcode qrcode = getParam(reqBody, Qrcode.class);

		// 参数验证
		// Assert.notNull(qrcode.get);

		List<Qrcode> qrcodeList = qrcodeService.list(locale);

		return new ResultMsg(reqBody.getId(), qrcodeList);
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

		return "qrcode/input2";
	}

	@RequestMapping("create")
	public String create(HttpServletRequest request, Locale locale, Model model, @ModelAttribute Qrcode qrcode) {

		if (StringUtil.isEmpty(qrcode.getOpenId())) {
			qrcode.setOpenId(WebUtil.getSessionBusiness(request).getOpenId());
		}

		// 二维码生成数量限制判断
		if (businessService.isQrcodeLimited(locale, qrcode.getOpenId())) {
			model.addAttribute("message", "二维码生成数量达到限制值!");
			return "result";
		}

		String realPath = request.getSession().getServletContext().getRealPath("/");

		logger.debug(realPath);

		WeiXinQrcode weiXinQrcode = qrcodeService.create(qrcode, realPath, WebUtil.calcServerBaseUrl(request));

		model.addAttribute("qrcode", weiXinQrcode);
		model.addAttribute("openId", qrcode.getOpenId());

		Business business = new Business();
		business.setOpenId(qrcode.getOpenId());

		Business business2 = businessService.get(locale, business);
		model.addAttribute("business", business2);

		return "qrcode/create2";
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

		return "result";
	}

	@RequestMapping("buy")
	public String buy(HttpServletRequest request, Locale locale, Model model) {

		model.addAttribute("message", "页面建设中...");

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

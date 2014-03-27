/**
 * ConsumerController.java
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sizheng.afl.base.BaseController;
import com.sizheng.afl.component.WeiXinApiInvoker;
import com.sizheng.afl.pojo.model.Consumer;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.pojo.vo.ReqBody;
import com.sizheng.afl.pojo.vo.ResultMsg;
import com.sizheng.afl.service.IConsumerService;

/**
 * 【消费者】请求控制层.
 * 
 * @creation 2014年03月27日 09:57:33
 * @modification 2014年03月27日 09:57:33
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Controller
@RequestMapping(value = "consumer")
public class ConsumerController extends BaseController {

	private static Logger logger = Logger.getLogger(ConsumerController.class);

	@Autowired
	IConsumerService consumerService;

	@Autowired
	WeiXinApiInvoker weiXinApiInvoker;

	/**
	 * 添加【消费者】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月27日 09:57:33
	 * @modification 2014年03月27日 09:57:33
	 * @return
	 */
	// @RequestMapping("add")
	@ResponseBody
	public ResultMsg add(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("添加【消费者】");

		// TODO

		Consumer consumer = getParam(reqBody, Consumer.class);

		// 参数验证
		// Assert.notNull(consumer.get);

		boolean saved = consumerService.save(locale, consumer);

		// TODO null->ID
		return new ResultMsg(saved, reqBody.getId(), null);
	}

	/**
	 * 删除【消费者】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月27日 09:57:33
	 * @modification 2014年03月27日 09:57:33
	 * @return
	 */
	// @RequestMapping("delete")
	@ResponseBody
	public ResultMsg delete(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("删除【消费者】");

		// TODO

		Consumer consumer = getParam(reqBody, Consumer.class);

		// 参数验证
		// Assert.notNull(consumer.get);

		boolean deleted = consumerService.delete(locale, consumer);

		return new ResultMsg(deleted, reqBody.getId());
	}

	/**
	 * 获取【消费者】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月27日 09:57:33
	 * @modification 2014年03月27日 09:57:33
	 * @return
	 */
	// @RequestMapping("get")
	@ResponseBody
	public ResultMsg get(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("获取【消费者】");

		// TODO

		Consumer consumer = getParam(reqBody, Consumer.class);

		// 参数验证
		// Assert.notNull(consumer.get);

		Consumer getConsumer = consumerService.get(locale, consumer);

		return new ResultMsg(true, reqBody.getId(), getConsumer);
	}

	/**
	 * 更新【消费者】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月27日 09:57:33
	 * @modification 2014年03月27日 09:57:33
	 * @return
	 */
	// @RequestMapping("update")
	@ResponseBody
	public ResultMsg update(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("更新【消费者】");

		// TODO

		Consumer consumer = getParam(reqBody, Consumer.class);

		// 参数验证
		// Assert.notNull(consumer.get);

		boolean updated = consumerService.update(locale, consumer);

		return new ResultMsg(updated, reqBody.getId());
	}

	/**
	 * 列举【消费者】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月27日 09:57:33
	 * @modification 2014年03月27日 09:57:33
	 * @return
	 */
	// @RequestMapping("list")
	@ResponseBody
	public ResultMsg list(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("列举【消费者】");

		// TODO

		// Consumer consumer = getParam(reqBody, Consumer.class);

		// 参数验证
		// Assert.notNull(consumer.get);

		List<Consumer> consumerList = consumerService.list(locale);

		return new ResultMsg(reqBody.getId(), consumerList);
	}

	/**
	 * 查询【消费者】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月27日 09:57:33
	 * @modification 2014年03月27日 09:57:33
	 * @return
	 */
	// @RequestMapping("query")
	@ResponseBody
	public ResultMsg query(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("查询【消费者】");

		// TODO

		Consumer consumer = getParam(reqBody, Consumer.class);

		// 参数验证
		// Assert.notNull(consumer.get);

		List<Map<String, Object>> consumerList = consumerService.query(locale, consumer);

		return new ResultMsg(reqBody.getId(), consumerList);
	}

	/**
	 * 查询【消费者】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月27日 09:57:33
	 * @modification 2014年03月27日 09:57:33
	 * @return
	 */
	// @RequestMapping("paging")
	@ResponseBody
	public ResultMsg paging(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("查询【消费者】");

		// TODO

		Consumer consumer = getParam(reqBody, Consumer.class);

		// 参数验证
		Assert.notNull(reqBody.getStart());
		Assert.notNull(reqBody.getLimit());

		// Assert.notNull(consumer.get);

		PageResult pageResult = consumerService.paging(locale, consumer, reqBody.getStart(), reqBody.getLimit());

		return new ResultMsg(reqBody.getId(), pageResult.getList(), pageResult.getTotal());
	}

	@RequestMapping("bill")
	public String bill(HttpServletRequest request, Locale locale, Model model, @RequestParam("openId") String openId,
			@RequestParam("consumeCode") String consumeCode) {

		logger.debug("食客结账【消费者】");

		// TODO
		boolean result = consumerService.bill(locale, openId, consumeCode);

		if (result) {
			model.addAttribute("message", "您的消费金额: 188");
		} else {
			model.addAttribute("message", "您没有消费记录!");
		}

		return "result";

	}

	@RequestMapping("record")
	public String record(HttpServletRequest request, Locale locale, Model model, @RequestParam("openId") String openId) {

		logger.debug("消费记录【消费者】");

		model.addAttribute("message", "[消费记录]页面建设中...");

		return "result";

	}

	@RequestMapping("call")
	public String call(HttpServletRequest request, Locale locale, Model model, @RequestParam("openId") String openId) {

		logger.debug("呼叫服务【消费者】");

		model.addAttribute("message", "[呼叫服务]页面建设中...");

		return "result";

	}

	@RequestMapping("list")
	public String list(HttpServletRequest request, Locale locale, Model model, @RequestParam("openId") String openId) {

		logger.debug("菜单一览【消费者】");

		model.addAttribute("message", "[菜单一览]页面建设中...");

		return "result";

	}

}

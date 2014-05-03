/**
 * MessageController.java
 */
package com.canzs.czs.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.canzs.czs.base.BaseController;
import com.canzs.czs.pojo.entity.Message;
import com.canzs.czs.pojo.vo.PageResult;
import com.canzs.czs.pojo.vo.ReqBody;
import com.canzs.czs.pojo.vo.ResultMsg;
import com.canzs.czs.service.IMessageService;

/**
 * 【顾客消息】请求控制层.
 * 
 * @creation 2014年04月22日 04:15:09
 * @modification 2014年04月22日 04:15:09
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Controller
@RequestMapping(value = "message")
public class MessageController extends BaseController {

	private static Logger logger = Logger.getLogger(MessageController.class);

	@Autowired
	IMessageService messageService;

	/**
	 * 添加【顾客消息】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 04:15:09
	 * @modification 2014年04月22日 04:15:09
	 * @return
	 */
	// @RequestMapping("add")
	@ResponseBody
	public ResultMsg add(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody, @ModelAttribute Message message, Locale locale, Model model) {
	
		logger.debug("添加【顾客消息】");

		// TODO

		// Message message = getParam(reqBody, Message.class);

		// 参数验证
		// Assert.notNull(message.get);

		boolean saved = messageService.save(locale, message);

		// TODO null->ID
		return new ResultMsg(saved, reqBody.getId(), null);
	}

	/**
	 * 删除【顾客消息】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 04:15:09
	 * @modification 2014年04月22日 04:15:09
	 * @return
	 */
	// @RequestMapping("delete")
	@ResponseBody
	public ResultMsg delete(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody, @ModelAttribute Message message, Locale locale, Model model) {
	
		logger.debug("删除【顾客消息】");

		// TODO

		// Message message = getParam(reqBody, Message.class);

		// 参数验证
		// Assert.notNull(message.get);

		boolean deleted = messageService.delete(locale, message);

		return new ResultMsg(deleted, reqBody.getId());
	}

	/**
	 * 获取【顾客消息】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 04:15:09
	 * @modification 2014年04月22日 04:15:09
	 * @return
	 */
	// @RequestMapping("get")
	@ResponseBody
	public ResultMsg get(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody, @ModelAttribute Message message, Locale locale, Model model) {
	
		logger.debug("获取【顾客消息】");

		// TODO

		// Message message = getParam(reqBody, Message.class);
		
		// 参数验证
		// Assert.notNull(message.get);

		Message MessageResult = messageService.get(locale, message);

		return new ResultMsg(true, reqBody.getId(), MessageResult);
	}
	
	/**
	 * 更新【顾客消息】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 04:15:09
	 * @modification 2014年04月22日 04:15:09
	 * @return
	 */
	// @RequestMapping("update")
	@ResponseBody
	public ResultMsg update(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody, @ModelAttribute Message message, Locale locale, Model model) {
	
		logger.debug("更新【顾客消息】");

		// TODO

		// Message message = getParam(reqBody, Message.class);
		
		// 参数验证
		// Assert.notNull(message.get);

		boolean updated = messageService.update(locale, message);

		return new ResultMsg(updated, reqBody.getId());
	}
	
	/**
	 * 列举【顾客消息】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 04:15:09
	 * @modification 2014年04月22日 04:15:09
	 * @return
	 */
	// @RequestMapping("list")
	@ResponseBody
	public ResultMsg list(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody, @ModelAttribute Message message, Locale locale, Model model) {
	
		logger.debug("列举【顾客消息】");

		// TODO

		// Message message = getParam(reqBody, Message.class);
		
		// 参数验证
		// Assert.notNull(message.get);

		List<Message> messageList = messageService.list(locale);

		return new ResultMsg(reqBody.getId(), messageList);
	}
	
	/**
	 * 查询【顾客消息】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 04:15:09
	 * @modification 2014年04月22日 04:15:09
	 * @return
	 */
	// @RequestMapping("query")
	@ResponseBody
	public ResultMsg query(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody, @ModelAttribute Message message, Locale locale, Model model) {

		logger.debug("查询【顾客消息】");

		// TODO

		// Message message = getParam(reqBody, Message.class);

		// 参数验证
		// Assert.notNull(message.get);

		List<Message> messageList = messageService.query(locale, message);

		return new ResultMsg(reqBody.getId(), messageList);
	}

	/**
	 * 查询【顾客消息】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年04月22日 04:15:09
	 * @modification 2014年04月22日 04:15:09
	 * @return
	 */
	// @RequestMapping("paging")
	@ResponseBody
	public ResultMsg paging(HttpServletRequest request, @RequestBody(required = false) ReqBody reqBody, @ModelAttribute Message message, Locale locale, Model model) {

		logger.debug("查询【顾客消息】");

		// TODO

		// Message message = getParam(reqBody, Message.class);

		// 参数验证
		Assert.notNull(reqBody.getStart());
		Assert.notNull(reqBody.getLimit());
		
		// Assert.notNull(message.get);

		PageResult pageResult = messageService.paging(locale, message, reqBody.getStart(), reqBody.getLimit());

		return new ResultMsg(reqBody.getId(), pageResult.getList(), pageResult.getTotal());
	}
	
}

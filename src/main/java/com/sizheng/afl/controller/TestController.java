/**
 * TestController.java
 */
package com.sizheng.afl.controller;

import java.util.List;
import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sizheng.afl.base.BaseController;
import com.sizheng.afl.pojo.model.Test;
import com.sizheng.afl.pojo.vo.PageResult;
import com.sizheng.afl.pojo.vo.ReqBody;
import com.sizheng.afl.pojo.vo.ResultMsg;
import com.sizheng.afl.service.ITestService;

/**
 * 【测试】请求控制层.
 * 
 * @creation 2014年03月19日 02:07:25
 * @modification 2014年03月19日 02:07:25
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Controller
@RequestMapping(value = "test")
public class TestController extends BaseController {

	private static Logger logger = Logger.getLogger(TestController.class);

	@Autowired
	ITestService testService;

	/**
	 * 添加【测试】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月19日 02:07:25
	 * @modification 2014年03月19日 02:07:25
	 * @return
	 */
	@RequestMapping("add")
	@ResponseBody
	public ResultMsg add(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("添加【测试】");

		// TODO

		Test test = getParam(reqBody, Test.class);

		// 参数验证
		// Assert.notNull(test.get);

		boolean saved = testService.save(locale, test);

		return new ResultMsg(saved, reqBody.getId());
	}

	/**
	 * 删除【测试】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月19日 02:07:25
	 * @modification 2014年03月19日 02:07:25
	 * @return
	 */
	// @RequestMapping("delete")
	@ResponseBody
	public ResultMsg delete(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("删除【测试】");

		// TODO

		Test test = getParam(reqBody, Test.class);

		// 参数验证
		// Assert.notNull(test.get);

		boolean deleted = testService.delete(locale, test);

		return new ResultMsg(deleted, reqBody.getId());
	}

	/**
	 * 获取【测试】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月19日 02:07:25
	 * @modification 2014年03月19日 02:07:25
	 * @return
	 */
	// @RequestMapping("get")
	@ResponseBody
	public ResultMsg get(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("获取【测试】");

		// TODO

		Test test = getParam(reqBody, Test.class);

		// 参数验证
		// Assert.notNull(test.get);

		Test getTest = testService.get(locale, test);

		return new ResultMsg(true, reqBody.getId(), getTest);
	}

	/**
	 * 更新【测试】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月19日 02:07:25
	 * @modification 2014年03月19日 02:07:25
	 * @return
	 */
	// @RequestMapping("update")
	@ResponseBody
	public ResultMsg update(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("更新【测试】");

		// TODO

		Test test = getParam(reqBody, Test.class);

		// 参数验证
		// Assert.notNull(test.get);

		boolean updated = testService.update(locale, test);

		return new ResultMsg(updated, reqBody.getId());
	}

	/**
	 * 列举【测试】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月19日 02:07:25
	 * @modification 2014年03月19日 02:07:25
	 * @return
	 */
	// @RequestMapping("list")
	@ResponseBody
	public ResultMsg list(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("列举【测试】");

		// TODO

		// Test test = getParam(reqBody, Test.class);

		// 参数验证
		// Assert.notNull(test.get);

		List<Test> testList = testService.list(locale);

		return new ResultMsg(reqBody.getId(), testList);
	}

	/**
	 * 查询【测试】(不分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月19日 02:07:25
	 * @modification 2014年03月19日 02:07:25
	 * @return
	 */
	// @RequestMapping("query")
	@ResponseBody
	public ResultMsg query(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("查询【测试】");

		// TODO

		Test test = getParam(reqBody, Test.class);

		// 参数验证
		// Assert.notNull(test.get);

		List<Test> testList = testService.query(locale, test);

		return new ResultMsg(reqBody.getId(), testList);
	}

	/**
	 * 查询【测试】(分页).
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月19日 02:07:25
	 * @modification 2014年03月19日 02:07:25
	 * @return
	 */
	// @RequestMapping("paging")
	@ResponseBody
	public ResultMsg paging(@RequestBody ReqBody reqBody, Locale locale) {

		logger.debug("查询【测试】");

		// TODO

		Test test = getParam(reqBody, Test.class);

		// 参数验证
		Assert.notNull(reqBody.getStart());
		Assert.notNull(reqBody.getLimit());

		// Assert.notNull(test.get);

		PageResult pageResult = testService.paging(locale, test, reqBody.getStart(), reqBody.getLimit());

		return new ResultMsg(reqBody.getId(), pageResult.getList(), pageResult.getTotal());
	}

	@RequestMapping(value = "form", consumes = "application/x-www-form-urlencoded")
	@ResponseBody
	public ResultMsg form(@ModelAttribute Test test, Locale locale) {

		logger.debug("查询【测试】");

		// TODO

		// 参数验证

		return new ResultMsg();
	}

	@RequestMapping(value = "respBody", consumes = "application/x-www-form-urlencoded")
	@ResponseBody
	public String respBody(@ModelAttribute Test test, Locale locale) {

		logger.debug("查询【测试】");

		// TODO

		// 参数验证

		return test.getDescription();
	}

}

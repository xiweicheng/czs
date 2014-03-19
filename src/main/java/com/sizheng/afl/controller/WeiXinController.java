/**
 * WeiXinController.java
 */
package com.sizheng.afl.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sizheng.afl.base.BaseController;
import com.sizheng.afl.pojo.constant.SysConstant;
import com.sizheng.afl.pojo.model.Token;
import com.sizheng.afl.util.EncoderUtil;
import com.sizheng.afl.util.StringUtil;

/**
 * 【微信】请求控制层.
 * 
 * @creation 2014年03月19日 02:07:25
 * @modification 2014年03月19日 02:07:25
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
@Controller
@RequestMapping(value = "weiXin")
public class WeiXinController extends BaseController {

	private static Logger logger = Logger.getLogger(WeiXinController.class);

	/**
	 * 添加【测试】.
	 * 
	 * @author xiweicheng
	 * @creation 2014年03月19日 02:07:25
	 * @modification 2014年03月19日 02:07:25
	 * @return
	 */
	@RequestMapping("verify")
	@ResponseBody
	public Boolean verify(@ModelAttribute Token token, Locale locale) {

		logger.debug("添加【微信】");

		if(token != null){
			List<String> list = new ArrayList<>();
			list.add("xiweicheng");
			list.add(token.getTimestamp());
			list.add(token.getNonce());
			
			Collections.sort(list);
			
			String join = StringUtil.join(SysConstant.EMPTY, list);
			
			String encode = EncoderUtil.encode("SHA1", join);
			
			return encode.equals(token.getSignature());
		}

		return Boolean.FALSE;
	}

}

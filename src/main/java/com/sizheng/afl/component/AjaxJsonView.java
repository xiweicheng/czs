package com.sizheng.afl.component;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

import com.sizheng.afl.pojo.constant.SysConstant;
import com.sizheng.afl.util.JsonUtil;
import com.sizheng.afl.util.StringUtil;

@Component
public class AjaxJsonView extends AbstractView {

	private static Logger logger = Logger.getLogger(AjaxJsonView.class);

	@Override
	protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		// Set standard HTTP/1.1 no-cache headers.
		response.setHeader("Cache-Control", "no-store, max-age=0, no-cache, must-revalidate");

		// Set IE extended HTTP/1.1 no-cache headers.
		response.addHeader("Cache-Control", "post-check=0, pre-check=0");

		// Set standard HTTP/1.0 no-cache header.
		response.setHeader("Pragma", "no-cache");

		Object modelObject = map.get(SysConstant.MODEL_NAME_AJAX_JSON);
		String callback = request.getParameter("callback");

		if (StringUtil.isEmpty(callback)) {
			callback = StringUtil.toString(map.get(SysConstant.CALLBACK));
		}

		PrintWriter writer = response.getWriter();

		String backString = null;

		if (StringUtil.isNotEmpty(callback)) {
			backString = StringUtil.replace("{?1}({?2})", callback, JsonUtil.toJson(modelObject));
		} else {
			backString = JsonUtil.toJson(modelObject);
		}

		logger.debug(backString);

		writer.write(backString);
		writer.flush();
//		writer.close();
	}
}

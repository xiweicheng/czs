package com.canzs.czs.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.canzs.czs.pojo.constant.SysConstant;
import com.canzs.czs.pojo.vo.Msg;
import com.canzs.czs.pojo.vo.ResultMsg;
import com.canzs.czs.util.StringUtil;
import com.canzs.czs.util.WebUtil;

public class SessionInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		Object attribute = request.getSession().getAttribute(SysConstant.SESSION_OBJECT);

		if (attribute == null) {

			String requestURI = request.getRequestURI();

			if (StringUtil.isNotEmpty(request)) {

				if (requestURI.contains("/free/")) {
					return true;
				}

				if (requestURI.contains("/business/login.do")) {
					return true;
				}

				if (requestURI.contains("/business/verify.do")) {
					return true;
				}

				if (requestURI.contains("/czs/login.do")) {
					return true;
				}

				if (requestURI.contains("/czs/verify.do")) {
					return true;
				}

				if (requestURI.contains("/weixin/invoke.do")) {
					return true;
				}
			}

			String requestType = request.getHeader("X-Requested-With");

			if (StringUtil.isNotEmpty(requestType)) {// XMLHttpRequest
				WebUtil.writeResult(response, new ResultMsg(false, new Msg("1000", false, "会话过期,请重新登录!")));
			} else {

				if (requestURI.contains("czs/")) {
					response.sendRedirect("/czs/login.do");
				} else {
					response.sendRedirect("/business/login.do");
				}
			}

			return false;
		}

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}

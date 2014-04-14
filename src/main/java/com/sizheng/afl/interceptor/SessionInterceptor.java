package com.sizheng.afl.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.sizheng.afl.pojo.entity.Business;
import com.sizheng.afl.pojo.vo.Msg;
import com.sizheng.afl.pojo.vo.ResultMsg;
import com.sizheng.afl.util.StringUtil;
import com.sizheng.afl.util.WebUtil;

public class SessionInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		Business sessionBusiness = WebUtil.getSessionBusiness(request);

		if (sessionBusiness == null) {

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
			}

			String requestType = request.getHeader("X-Requested-With");

			if (StringUtil.isNotEmpty(requestType)) {// XMLHttpRequest
				WebUtil.writeResult(response, new ResultMsg(false, new Msg("1000", false, "会话过期,请重新登录!")));
			} else {
				response.sendRedirect("login.do");
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

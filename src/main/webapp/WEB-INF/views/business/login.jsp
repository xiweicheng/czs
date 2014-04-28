<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>商家登录</title>
<link href="../../../resources/semantic/css/semantic.min.css"
	rel="stylesheet" type="text/css">
<script src="../../../resources/js/lib/jquery-1.10.2.min.js"
	charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.min.js"
	charset="utf-8"></script>
</head>
<body>
	<div>
		<div style="height: 100px;"></div>
		<!-- 顶部填充 -->

		<c:if test="${! empty param.openId}">
			<div class="two item tabular ui menu">
				<a class="item active" data-tab="dynamicCodeLogin">动态码登录</a> <a
					class="item" data-tab="passwordLogin">密码登录</a>
			</div>
			<div class="main container">
				<div class="ui tab active" data-tab="dynamicCodeLogin">
					<!-- 登陆框 -->
					<form action="business/verify.do" method="post"
						class="czsDynamicCodeForm">
						<input type="hidden" name="openId" value="${param.openId}">
						<input type="hidden" name="type" value="0">
						<div class="ui form segment" style="width: 300px; margin: 0 auto;">
							<div class="field">
								<label>动态验证码</label>
								<div class="ui left labeled icon input">
									<input type="password" name="dynamicCode" value=""> <i
										class="lock icon"></i>
									<div class="ui corner label">
										<i class="icon asterisk"></i>
									</div>
								</div>
							</div>
							<div style="text-align: center;">
								<div class="ui blue submit button">登录</div>
							</div>
						</div>
					</form>
				</div>
				<div class="ui tab" data-tab="passwordLogin">
					<!-- 登陆框 -->
					<form action="business/verify.do" method="post">
						<input type="hidden" name="type" value="1">
						<div class="ui form segment" style="width: 300px; margin: 0 auto;">
							<div class="field">
								<label>用户名</label>
								<div class="ui left labeled icon input">
									<input type="text" placeholder="E-mail" name="userName">
									<i class="user icon"></i>
									<div class="ui corner label">
										<i class="icon asterisk"></i>
									</div>
								</div>
							</div>
							<div class="field">
								<label>密码</label>
								<div class="ui left labeled icon input">
									<input type="password" name="password"> <i
										class="lock icon"></i>
									<div class="ui corner label">
										<i class="icon asterisk"></i>
									</div>
								</div>
							</div>
							<div class="ui error message">
								<div class="header">We noticed some issues</div>
							</div>
							<div style="text-align: center;">
								<div class="ui blue submit button">登录</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</c:if>
		<c:if test="${empty param.openId}">
			<div class="one item tabular ui menu">
				<a class="item active" data-tab="passwordLogin">密码登录</a>
			</div>
			<div class="main container">
				<div class="ui tab active" data-tab="passwordLogin">
					<!-- 登陆框 -->
					<form action="business/verify.do" method="post">
						<input type="hidden" name="type" value="1">
						<div class="ui form segment" style="width: 300px; margin: 0 auto;">
							<div class="field">
								<label>用户名</label>
								<div class="ui left labeled icon input">
									<input type="text" placeholder="E-mail" name="userName">
									<i class="user icon"></i>
									<div class="ui corner label">
										<i class="icon asterisk"></i>
									</div>
								</div>
							</div>
							<div class="field">
								<label>密码</label>
								<div class="ui left labeled icon input">
									<input type="password" name="password"> <i
										class="lock icon"></i>
									<div class="ui corner label">
										<i class="icon asterisk"></i>
									</div>
								</div>
							</div>
							<div class="ui error message">
								<div class="header">We noticed some issues</div>
							</div>
							<div style="text-align: center;">
								<div class="ui blue submit button">登录</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</c:if>
	</div>
	<script type="text/javascript">
		jQuery(function($) {
			$('.ui.submit.button').click(function() {
				$(this).closest('form').submit();
			});

			$('.tabular.ui.menu > .item').click(function() {
				$('.ui.tab.active').removeClass('active');
				$('.tabular.ui.menu > .item.active').removeClass('active');
				$(this).addClass('active');
				$('div[data-tab="' + $(this).attr('data-tab') + '"]').addClass('active');
			});
		});
	</script>
</body>
</html>
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
<title>入驻说明</title>
<link href="../../../resources/semantic/css/semantic.min.css"
	rel="stylesheet" type="text/css">
<script src="../../../resources/js/lib/jquery-1.10.2.min.js"
	charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.min.js"
	charset="utf-8"></script>
</head>
<body>
	<div>
		<div style="height: 150px;"></div>
		<!-- 顶部填充 -->

		<!-- 登陆框 -->
		<form action="business/verify.do">
		<input type="hidden" name="openId" value="${param.openId}">
		<div class="ui form segment" style="width: 300px; margin: 0 auto;">
			<div class="field">
				<label>动态验证码</label>
				<div class="ui left labeled icon input">
					<input type="password" name="dynamicCode" value="240898"> <i
						class="lock icon"></i>
					<div class="ui corner label">
						<i class="icon asterisk"></i>
					</div>
				</div>
			</div>
			<div style="text-align:center;">
				<div class="ui blue submit button" id="submitBtn">登录</div>
			</div>
		</div>
		</form>
	</div>
	<script type="text/javascript">
		$('#submitBtn').click(function() {
			$('form').submit();
		});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>餐助手-结果提示</title>

<link href="../../../resources/semantic/css/semantic.min.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideToolbar');
		WeixinJSBridge.call('hideOptionMenu');
	});
</script>
</head>
<body style="margin: 0px; padding: 0px;">
	<!-- 侧边栏 -->
	<%@ include file="menu.jsp"%>

	<!-- header -->
	<%@ include file="header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">信息提示</h4>
	<div class="ui segment attached">
		<div class="ui message">
			<div class="header">详细信息</div>
			<p>${message}</p>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="footer.jsp"%>
</body>
</html>
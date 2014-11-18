<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<title>餐助手-二维码购买</title>
<link href="resources/semantic/css/semantic.min.css" rel="stylesheet" type="text/css">
<script src="resources/js/lib/jquery-2.0.2.min.js" charset="utf-8"></script>
<script src="resources/semantic/javascript/semantic.min.js" charset="utf-8"></script>
<script src="resources/js/lib/jquery.tmpl.min.js" charset="utf-8"></script>
<link href="resources/tinybox2/css/tinybox.min.css" rel="stylesheet" type="text/css">
<script src="resources/tinybox2/tinybox.min.js" charset="utf-8"></script>
<script type="text/javascript">
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideToolbar');
		WeixinJSBridge.call('hideOptionMenu');
	});
</script>
</head>
<body>

	<div>
		<!-- 侧边栏 -->
		<%@ include file="../menu.jsp"%>

		<!-- header -->
		<%@ include file="../header.jsp"%>

		<h4 class="ui top attached header" style="margin-top: 45px;">二维码购买</h4>


		<!-- footer -->
		<%@ include file="../footer.jsp"%>
	</div>

	<script type="text/javascript">
		jQuery(function($) {
			$('#menu-item-qrcode-buy').addClass('active');

		});
	</script>
</body>
</html>
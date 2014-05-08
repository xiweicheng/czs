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
<!-- <link href="../../../resources/semantic/css/semantic.min.css"
	rel="stylesheet" type="text/css"> -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>餐助手-消息提示</title>
<script type="text/javascript">
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideToolbar');
		WeixinJSBridge.call('hideOptionMenu');
	});
</script>
<style type="text/css">
div.ui.fixed.transparent.inverted.main.menu {
	-webkit-box-shadow: none;
	background-color: rgb(51, 51, 51);
	border-bottom-color: rgb(0, 0, 0);
	border-bottom-left-radius: 0px;
	border-bottom-right-radius: 0px;
	border-bottom-style: none;
	border-bottom-width: 0px;
	border-image-outset: 0px;
	border-image-repeat: stretch;
	border-image-slice: 100%;
	border-image-source: none;
	border-image-width: 1;
	border-left-color: rgb(0, 0, 0);
	border-left-style: none;
	border-left-width: 0px;
	border-right-color: rgb(0, 0, 0);
	border-right-style: none;
	border-right-width: 0px;
	border-top-color: rgb(0, 0, 0);
	border-top-left-radius: 0px;
	border-top-right-radius: 0px;
	border-top-style: none;
	border-top-width: 0px;
	box-shadow: none;
	display: block;
	font-size: 0px;
	font-weight: normal;
	height: 42px;
	margin-bottom: 0px;
	margin-left: 0px;
	margin-right: 0px;
	margin-top: 0px;
	position: fixed;
	top: 0px;
	z-index: 999;
	width: 100%;
}

div.title.item {
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	-webkit-transition-delay: 0s, 0s, 0s;
	-webkit-transition-duration: 0.2s, 0.2s, 0.2s;
	-webkit-transition-property: opacity, background, box-shadow;
	-webkit-transition-timing-function: ease, ease, ease;
	-webkit-user-select: none;
	border-bottom-left-radius: 0px;
	border-bottom-right-radius: 0px;
	border-top-color: rgba(0, 0, 0, 0);
	border-top-left-radius: 0px;
	border-top-right-radius: 0px;
	border-top-style: solid;
	border-top-width: 0px;
	box-sizing: border-box;
	color: rgb(255, 255, 255);
	display: inline-block;
	font-size: 16px;
	font-weight: normal;
	height: 42.53125px;
	line-height: 16px;
	padding-bottom: 13.279999732971191px;
	padding-left: 15.199999809265137px;
	padding-right: 15.199999809265137px;
	padding-top: 13.279999732971191px;
	position: relative;
	text-decoration: none;
	transition-delay: 0s, 0s, 0s;
	transition-duration: 0.2s, 0.2s, 0.2s;
	transition-property: opacity, background, box-shadow;
	transition-timing-function: ease, ease, ease;
	vertical-align: middle;
	width: 153.375px;
}

h4.ui.top.attached.header {
	-webkit-box-shadow: rgba(0, 0, 0, 0.0980392) 0px 0px 0px 1px;
	background-color: rgb(224, 224, 224);
	border-bottom-color: rgb(0, 0, 0);
	border-bottom-left-radius: 0px;
	border-bottom-right-radius: 0px;
	border-bottom-style: none;
	border-bottom-width: 0px;
	border-image-outset: 0px;
	border-image-repeat: stretch;
	border-image-slice: 100%;
	border-image-source: none;
	border-image-width: 1;
	border-left-color: rgb(0, 0, 0);
	border-left-style: none;
	border-left-width: 0px;
	border-right-color: rgb(0, 0, 0);
	border-right-style: none;
	border-right-width: 0px;
	border-top-color: rgb(0, 0, 0);
	border-top-left-radius: 5.5px;
	border-top-right-radius: 5.5px;
	border-top-style: none;
	border-top-width: 0px;
	box-shadow: rgba(0, 0, 0, 0.0980392) 0px 0px 0px 1px;
	display: block;
	font-size: 18px;
	font-weight: bold;
	height: 23px;
	line-height: 23px;
	margin-bottom: 0px;
	margin-left: 0px;
	margin-right: 0px;
	margin-top: 45px;
	padding-bottom: 8.800000190734863px;
	padding-left: 16px;
	padding-right: 16px;
	padding-top: 8.800000190734863px;
}

div.ui.segment.attached {
	-webkit-box-shadow: rgb(221, 221, 221) 0px 0px 0px 1px;
	background-color: rgb(255, 255, 255);
	border-bottom-left-radius: 0px;
	border-bottom-right-radius: 0px;
	border-top-left-radius: 0px;
	border-top-right-radius: 0px;
	bottom: -1px;
	box-shadow: rgb(221, 221, 221) 0px 0px 0px 1px;
	box-sizing: border-box;
	display: block;
	height: 116.796875px;
	margin-bottom: 0px;
	margin-left: 0px;
	margin-right: 0px;
	margin-top: 0px;
	padding-bottom: 16px;
	padding-left: 16px;
	padding-right: 16px;
	padding-top: 16px;
	position: relative;
	top: -1px;
}

div.ui.message {
	-webkit-transition-delay: 0s, 0s, 0s, 0s;
	-webkit-transition-duration: 0.1s, 0.1s, 0.1s, 0.1s;
	-webkit-transition-property: opacity, color, background, box-shadow;
	-webkit-transition-timing-function: ease, ease, ease, ease;
	background-color: rgb(239, 239, 239);
	border-bottom-left-radius: 5.1875px;
	border-bottom-right-radius: 5.1875px;
	border-top-left-radius: 5.1875px;
	border-top-right-radius: 5.1875px;
	box-sizing: border-box;
	color: rgba(0, 0, 0, 0.6);
	display: block;
	font-size: 16px;
	height: 84.796875px;
	line-height: 21px;
	margin-bottom: 0px;
	margin-left: 0px;
	margin-right: 0px;
	margin-top: 0px;
	min-height: 18px;
	padding-bottom: 16px;
	padding-left: 16px;
	padding-right: 16px;
	padding-top: 16px;
	position: relative;
	transition-delay: 0s, 0s, 0s, 0s;
	transition-duration: 0.1s, 0.1s, 0.1s, 0.1s;
	transition-property: opacity, color, background, box-shadow;
	transition-timing-function: ease, ease, ease, ease;
}

div.header {
	color: rgba(0, 0, 0, 0.6);
	display: block;
	font-size: 21px;
	font-weight: bold;
	height: 27px;
	line-height: 28px;
	margin-bottom: 0px;
	margin-left: 0px;
	margin-right: 0px;
	margin-top: 0px;
}

h4.ui.bottom.attached.header {
	-webkit-box-shadow: rgba(0, 0, 0, 0.0980392) 0px 0px 0px 1px;
	background-color: rgb(224, 224, 224);
	border-bottom-color: rgb(0, 0, 0);
	border-bottom-left-radius: 5.5px;
	border-bottom-right-radius: 5.5px;
	border-bottom-style: none;
	border-bottom-width: 0px;
	border-image-outset: 0px;
	border-image-repeat: stretch;
	border-image-slice: 100%;
	border-image-source: none;
	border-image-width: 1;
	border-left-color: rgb(0, 0, 0);
	border-left-style: none;
	border-left-width: 0px;
	border-right-color: rgb(0, 0, 0);
	border-right-style: none;
	border-right-width: 0px;
	border-top-color: rgb(0, 0, 0);
	border-top-left-radius: 0px;
	border-top-right-radius: 0px;
	border-top-style: none;
	border-top-width: 0px;
	box-shadow: rgba(0, 0, 0, 0.0980392) 0px 0px 0px 1px;
	display: block;
	font-size: 18px;
	font-weight: bold;
	height: 23px;
	line-height: 23px;
	margin-bottom: 0px;
	margin-left: 0px;
	margin-right: 0px;
	margin-top: 0px;
	padding-bottom: 8.800000190734863px;
	padding-left: 16px;
	padding-right: 16px;
	padding-top: 8.800000190734863px;
	text-align: center;
}
</style>
</head>
<body style="margin: 0px; padding: 0px;">

	<!-- header -->
	<div class="ui fixed transparent inverted main menu" style="top: 0px;">
		<div class="container">
			<div class="title item">
				<b>餐助手</b> 消息提示
			</div>
		</div>
	</div>

	<h4 class="ui top attached header" style="margin-top: 45px;">信息提示</h4>
	<div class="ui segment attached">
		<div class="ui message">
			<div class="header">详细信息</div>
			<p>${message}</p>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="footer.jsp"%>

	<script type="text/javascript">
		
	</script>
</body>
</html>
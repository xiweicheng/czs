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
<link href="../../../resources/semantic/css/semantic.min.css"
	rel="stylesheet" type="text/css">
<script src="../../../resources/js/lib/jquery-1.10.2.min.js"
	charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.js"
	charset="utf-8"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>餐助手-商家自助后台</title>
</head>
<body style="margin: 0px; padding: 0px;">

	<!-- header -->
	<div class="ui fixed transparent inverted main menu" style="top: 0px;">
		<div class="container">
			<!-- <a class="launch item"><i class="icon list layout"></i></a> -->
			<div class="title item">
				<b>餐助手</b> 商家自助管理后台
			</div>
		</div>
	</div>

	<h4 class="ui top attached header" style="margin-top: 45px;">信息提示</h4>
	<div class="ui segment attached">

		<div class="ui piled segment">
			<div class="ui label">
				<a class="detail" href="business/list.do?status=5"><i
					class="cart icon"></i> 收藏 </a>
			</div>
			<div class="ui label">
				<a class="detail"><i class="thumbs up icon"></i> 23</a>
			</div>
			<div class="ui label">
				<a class="detail"><i class="thumbs down icon"></i> 23</a>
			</div>
		</div>

		<div class="ui relaxed celled list">
			<div class="item">
				<i class="user outline icon"></i>
				<div class="content">
					<div class="header">店名</div>
					${business.name}
				</div>
			</div>
			<div class="item">
				<i class="home outline icon"></i>
				<div class="content">
					<div class="header">地址</div>
					${business.address}
				</div>
			</div>
			<div class="item">
				<i class="phone outline icon"></i>
				<div class="content">
					<div class="header">电话</div>
					${business.phoneNumber}
				</div>
			</div>
			<div class="item">
				<i class="mail outline icon"></i>
				<div class="content">
					<div class="header">E-mail</div>
					${business.mail}
				</div>
			</div>
			<div class="item">
				<i class="comment outline icon"></i>
				<div class="content">
					<div class="header">介绍</div>
					${business.introduce}
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<script type="text/javascript">
		jQuery(function($) {
		});
	</script>
</body>
</html>
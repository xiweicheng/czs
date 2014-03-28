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
<title>餐助手-商家自助后台</title>
<link href="../../../resources/semantic/css/semantic.min.css"
	rel="stylesheet" type="text/css">
<script src="../../../resources/js/lib/jquery-1.10.2.min.js"
	charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.min.js"
	charset="utf-8"></script>
</head>
<body style="margin: 0px; padding: 0px;">
	<!-- 侧边栏 -->
	<div class="ui sidebar">
		<div class="ui vertical menu">
			<div class="header item">
				<i class="user icon"></i> 我的信息
			</div>
			<a class="item"> 基本信息 </a> <a class="item"> 二维码 </a>
			<div class="header item">
				<i class="globe icon"></i> 菜单管理
			</div>
			<a class="item" href="menu/list.do"> 菜单一览 </a> <a class="item" href="menu/add.do"> 增加菜单 </a>
			<div class="header item">
				<i class="icon calendar"></i> 顾客管理
			</div>
			<a class="item"> 顾客一览 </a>
		</div>
	</div>

	<div class="ui fixed transparent inverted main menu" style="top: 0px;">
		<div class="container">
			<a class="launch item"><i class="icon list layout"></i> 侧边菜单</a>
			<div class="title item">
				<b>餐助手</b> 商家自助管理后台
			</div>
		</div>
	</div>

	<h4 class="ui top attached header" style="margin-top: 45px;">基本信息</h4>
	<div class="ui segment attached">
		
	</div>
	<h4 class="ui bottom attached header">版权所有-餐助手</h4>

	<script type="text/javascript">
		
		jQuery(function($) {
			$('.ui.sidebar').sidebar('toggle');
			
			$('.launch.item').click(function(){
				$('.ui.sidebar').sidebar("toggle");
			});
		});
	</script>
</body>
</html>
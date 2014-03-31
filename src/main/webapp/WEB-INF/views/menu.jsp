<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>餐助手-menu</title>
</head>
<body style="margin: 0px; padding: 0px;">
	<!-- 侧边菜单栏 -->
	<div class="ui sidebar">
		<div class="ui vertical menu">
			<div class="header item">
				<i class="user icon"></i> 我的信息
			</div>
			<a class="item"> 基本信息 </a> <a class="item"> 二维码 </a>
			<div class="header item">
				<i class="globe icon"></i> 菜单管理
			</div>
			<a class="item" href="menu/list.do" id="menu-item-menu-list"> 菜单一览 </a> <a class="item"
				href="menu/input.do" id="menu-item-menu-input"> 菜单添加 </a>
				<a class="item"
				href="menu/image.do" id="menu-item-menu-image"> 菜单图片 </a>
			<div class="header item">
				<i class="icon calendar"></i> 顾客管理
			</div>
			<a class="item"> 顾客一览 </a>
		</div>
	</div>
</body>
</html>
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
	<div class="ui vertical menu thin sidebar">
		<div class="header item">
			<i class="icon list layout"></i>侧边测单
		</div>
		<div class="header item">
			<i class="cart icon"></i> 点菜筛选
		</div>
		<a class="item" href="menu/free/list4bill.do?openId=${openId}"
			id="menu-item-filter">我要点菜</a>
		<div class="header item">
			<i class="user icon"></i> 我的订单
		</div>
		<a class="item"
			href="menu/free/billQuery.do?status=1&consumerId=${openId}"
			id="menu-item-confirm-bill"> 已下订单</a> <a class="item"
			href="menu/free/billQuery.do?status=0&consumerId=${openId}"
			id="menu-item-hold-bill"> 待定订单</a> <a class="item"
			href="menu/free/billQuery.do?status=2&consumerId=${openId}"
			id="menu-item-debook-bill"> 退订订单</a>
		<div class="header item">
			<i class="users icon"></i> 集体订单
		</div>
		<a class="item"
			href="menu/free/billGroupQuery.do?status=1&consumerId=${openId}"
			id="menu-item-group-confirm-bill"> 已下订单</a> <a class="item"
			href="menu/free/billGroupQuery.do?status=0&consumerId=${openId}"
			id="menu-item-group-hold-bill"> 待定订单</a> <a class="item"
			href="menu/free/billGroupQuery.do?status=2&consumerId=${openId}"
			id="menu-item-group-debook-bill"> 退订订单</a>
	</div>

	<script type="text/javascript">
		jQuery(function($) {

			$('.ui.sidebar').sidebar({
				overlay : true
			});

			try {
				if (/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) {
					$('.ui.sidebar').sidebar("hide");
				} else {
					$('.ui.sidebar').sidebar('hide');
				}
			} catch (e) {
				$('.ui.sidebar').sidebar('hide');
			}
		});
	</script>
</body>
</html>
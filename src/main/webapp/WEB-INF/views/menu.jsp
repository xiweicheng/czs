<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body style="margin: 0px; padding: 0px;">
	<!-- sidebar -->
	<div class="ui left vertical menu thin sidebar">
		<div class="header item">
			<i class="icon list layout"></i>侧边测单
		</div>
		<div class="header item">
			<i class="user icon"></i> 商家管理
		</div>
		<a class="item" href="business/main.do" id="menu-item-business-main">
			基本信息 </a><a class="item" href="business/roleMgr.do"
			id="menu-item-business-role-mgr"> 角色分配 </a><a class="item"
			href="business/list.do?filterOver=1&request=1"
			id="menu-item-business-list">顾客一览 </a><a class="item"
			href="business/listMsg.do?status=0" id="menu-item-business-listMsg">顾客消息
		</a><a class="item" href="business/listService.do?status=1"
			id="menu-item-business-listService">服务请求 </a> <a class="item"
			href="business/billSett.do?status=0" id="menu-item-bill-sett">
			账目结算 </a>
		<div class="header item">
			<i class="cart icon"></i> 订单管理
		</div>
		<a class="item" href="menu/orderList.do" id="menu-item-order-list">
			订单一览 </a><a class="item" href="menu/orderHistory.do?status=3"
			id="menu-item-order-history"> 历史订单 </a>
		<div class="header item">
			<i class="book icon"></i> 菜品管理
		</div>
		<a class="item" href="menu/list.do#menu-item-menu-list"
			id="menu-item-menu-list"> 菜品一览 </a> <a class="item"
			href="menu/input.do#menu-item-menu-input" id="menu-item-menu-input">
			菜品添加 </a> <a class="item" href="menu/image.do#menu-item-menu-image"
			id="menu-item-menu-image"> 菜品图片 </a>
		<div class="header item">
			<i class="qr code icon"></i> 二维码
		</div>
		<!-- <a class="item" href="qrcode/buy.do#menu-item-qrcode-buy"
			id="menu-item-qrcode-buy"> 二维码购买</a -->
		> <a class="item" href="qrcode/download.do#menu-item-qrcode-main"
			id="menu-item-qrcode-main"> 二维码生成</a> <a class="item"
			href="qrcode/list.do#menu-item-qrcode-list"
			id="menu-item-qrcode-list"> 二维码一览</a>
		<div class="header item">
			<i class="dashboard icon"></i> 统计分析
		</div>
		<a class="item"
			href="business/menuStat.do#menu-item-business-menu-stat"
			id="menu-item-business-menu-stat"> 菜品统计 </a><a class="item"
			href="business/consumerStat.do#menu-item-business-consumer-stat"
			id="menu-item-business-consumer-stat"> 顾客统计 </a><a class="item"
			href="business/serviceStat.do#menu-item-business-service-stat"
			id="menu-item-business-service-stat"> 服务统计 </a> <a class="item"
			href="business/volumeStat.do#menu-item-business-volume-stat"
			id="menu-item-business-volume-stat"> 营业额统计 </a>
	</div>
	<script type="text/javascript">
		jQuery(function($) {

			$('.ui.left.sidebar').sidebar({
				overlay : true
			});

			try {
				if (/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) {
					$('.ui.left.sidebar').sidebar("hide");
				} else {
					$('.ui.left.sidebar').sidebar('hide');
				}
			} catch (e) {
				$('.ui.left.sidebar').sidebar('hide');
			}
		});
	</script>
</body>
</html>
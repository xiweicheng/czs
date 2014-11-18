<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- head common -->
<%@ include file="common.jsp"%>
<title>餐助手-平台服务</title>
<link href="resources/css/czs-about.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="resources/js/lib/unslider.min.js"></script>
</head>
<body style="margin: 0px; padding: 0px;">

	<div class="ui fixed transparent inverted menu">
		<div class="czs-header">
			<div class="title item">
				<a class="avatar" style="float: left;" href="czs/free/about.do?openId=" target="_blank"> <img
					class="circular ui image" style="width: 46px;" src="../../resources/img/canzs_128.png"></a>

				<div style="margin: 15px 0 10px 10px; float: left;">
					<b>餐助手</b>
				</div>
			</div>

			<div class="right menu">
				<div class="item" style="margin: 15px 0 10px 10px;">
					<a class="czs-a" href="czs/free/about.do?openId=">首页</a>
				</div>
				<div class="item" style="margin: 15px 0 10px 10px;">
					<a class="czs-a" href="czs/free/about.do?openId=">客户案例</a>
				</div>
				<div class="item" style="margin: 15px 0 10px 10px;">
					<a class="czs-a" href="czs/free/about.do?openId=">用户文档</a>
				</div>
				<div class="item" style="margin: 15px 0 10px 10px;">
					<a class="czs-a" href="czs/free/about.do?openId=">加入我们</a>
				</div>
			</div>
		</div>
	</div>

	<div class="czs main">
		<div class="unslider">
			<div class="banner">
				<ul>
					<li style="background-image: url(http://www.bootcss.com/p/unslider/img/sunset.jpg);"></li>

					<li style="background-image: url(http://www.bootcss.com/p/unslider/img/wood.jpg);"></li>

					<li style="background-image: url(http://www.bootcss.com/p/unslider/img/subway.jpg);"></li>

					<li style="background-image: url(http://www.bootcss.com/p/unslider/img/shop.jpg);"></li>
				</ul>
			</div>
		</div>
		<div class="dark stripe"></div>

	</div>

	<div class="czs center footer">
		<div class="ui horizontal list">
			<div class="item">餐助手 2014</div>
		</div>
	</div>


	<script type="text/javascript">
		$(function() {
			$('.banner').unslider({
				arrows : true,
				fluid : true,
				dots : true
			});
		});
	</script>

</body>
</html>
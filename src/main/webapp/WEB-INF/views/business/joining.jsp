<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script src="../../../resources/semantic/javascript/semantic.min.js"
	charset="utf-8"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>餐助手-商家服务</title>
</head>
<body style="margin: 0px; padding: 0px;">

	<!-- header -->
	<div class="ui fixed transparent inverted main menu" style="top: 0px;">
		<div class="container">
			<!-- <a class="launch item"><i class="icon list layout"></i></a> -->
			<div class="title item">
				<b>餐助手</b> 商家管理后台
			</div>
		</div>
	</div>

	<h4 class="ui top attached header" style="margin-top: 45px;">顾客一览</h4>
	<div class="ui segment attached">

		<div class="ui relaxed celled list">
			<div class="item">
				<i class="meh icon"></i>
				<div class="content">
					<div class="header">头像</div>
					<img class="ui avatar image" src="${consumer.headimgurl}/64">
				</div>
			</div>
			<div class="item">
				<i class="user icon"></i>
				<div class="content">
					<div class="header">名称</div>
					${consumer.nickname}
				</div>
			</div>
			<div class="item">
				<i
					class="<c:if test="${consumer.sex == '男'}">male</c:if>
				<c:if test="${consumer.sex == '女'}">female</c:if> icon"></i>
				<div class="content">
					<div class="header">性别</div>
					${consumer.sex}
				</div>
			</div>
			<div class="item">
				<i class="home icon"></i>
				<div class="content">
					<div class="header">地址</div>
					${consumer.country} ${consumer.province} ${consumer.city}
				</div>
			</div>
			<div class="item">
				<i class="unhide icon"></i>
				<div class="content">
					<div class="header">消费次数</div>
					${consumer.consume_times}
				</div>
			</div>
			<div class="item">
				<i class="calendar icon"></i>
				<div class="content">
					<div class="header">最后消费时间</div>
					${consumer.last_consume_time}
				</div>
			</div>
			<div class="item">
				<i class="help icon"></i>
				<div class="content">
					<div class="header">状态</div>
					<c:if test="${consumer.status == 0}">消费结束</c:if>
					<c:if test="${consumer.status == 1}">消费中</c:if>
					<c:if test="${consumer.status == 2}">消费禁止</c:if>
					<c:if test="${consumer.status == 3}">个人结账请求中</c:if>
					<c:if test="${consumer.status == 4}">集体结账请求中</c:if>
					<c:if test="${consumer.status == 5}">进入请求中</c:if>
				</div>
			</div>
			<div class="item">
				<i class="map marker icon"></i>
				<div class="content">
					<div class="header">位置</div>
					${consumer.description}
				</div>
			</div>
		</div>
		<div>
			<div>
				<form id="agree-form" action="business/free/reqHandle.do" method="post">
					<input type="hidden" name="agree" value="1"> <input
						type="hidden" name="consumeCode" value="${consumer.consume_code}">
					<input type="hidden" name="openId" value="${consumer.user_name}">
				</form>
				<form id="disagree-form" action="business/free/reqHandle.do" method="post">
					<input type="hidden" name="agree" value="0"> <input
						type="hidden" name="consumeCode" value="${consumer.consume_code}">
					<input type="hidden" name="openId" value="${consumer.user_name}">
				</form>
			</div>
			<div class="2 fluid ui buttons">
				<div class="ui button positive">确认通过</div>
				<div class="or"></div>
				<div class="ui button negative">禁止消费</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>


	<script type="text/javascript">
		jQuery(function($) {

			$('.ui.button.positive').click(function() {
				$('#agree-form').submit();
			});
			$('.ui.button.negative').click(function() {
				$('#disagree-form').submit();
			});
		});
	</script>
</body>
</html>
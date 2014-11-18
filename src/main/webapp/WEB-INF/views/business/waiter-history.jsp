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
<title>餐助手-商家服务</title>

<link href="resources/semantic/css/semantic.min.css" rel="stylesheet" type="text/css">

<script src="resources/js/lib/jquery-2.0.2.min.js" charset="utf-8"></script>
<script src="resources/semantic/javascript/semantic.min.js" charset="utf-8"></script>

<script type="text/javascript">
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideToolbar');
		WeixinJSBridge.call('hideOptionMenu');
	});
</script>
</head>
<body style="margin: 0px; padding: 0px;">

	<div class="ui dimmer">
		<div class="content" style="display: none;">
			<div class="center"></div>
		</div>
	</div>

	<h4 class="ui top attached header" style="margin-top: 0px;">
		顾客请求
		<div class="circular ui red label">
			<span id="orderCount-span">${fn:length(businessConsumerList) + fn:length(consumerRequestList)}</span>个
		</div>
		<div class="ui small button czsOpen" czs-status="0" style="position: absolute; top: 2px; right: 2px;">展开</div>
	</h4>
	<div class="ui segment attached" style="padding: 0px;">
		<table class="ui sortable table segment" style="display: table;">
			<thead>
				<tr>
					<th class="">顾客</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${businessConsumerList}" var="item">
					<tr id="item-tr-${item.id}" class="item-tr-${item.id}">
						<td class="">
							<div class="ui basic accordion" style="width: 100%; margin-bottom: 0px;">

								<div class="title" style="padding: 0px;">
									<i class="dropdown icon"></i>${item.nickname}(${item.description})[进入请求]
								</div>

								<div class="content">
									<div class="ui mini list">
										<div class="item">
											<i class="user outline icon"></i>
											<div class="content" style="padding-top: 0px; padding-bottom: 0px;">
												<div class="header">头像</div>
												<img class="ui avatar image" src="${item.headimgurl}/46">
											</div>
										</div>
										<div class="item">
											<c:if test="${item.sex == '男'}">
												<i class="male outline icon"></i>
											</c:if>
											<c:if test="${item.sex == '女'}">
												<i class="female outline icon"></i>
											</c:if>
											<div class="content" style="padding-top: 0px; padding-bottom: 0px;">
												<div class="header">性别</div>
												${item.sex}
											</div>
										</div>
										<div class="item">
											<i class="time outline icon"></i>
											<div class="content" style="padding-top: 0px; padding-bottom: 0px;">
												<div class="header">请求时间</div>
												${item.last_consume_time}(${item.diff})
											</div>
										</div>
										<div class="item">
											<i class="time outline icon"></i>
											<div class="content" style="padding-top: 0px; padding-bottom: 0px;">
												<div class="header">确认时间</div>
												${item.handle_date_time}(${item.handle_diff})
											</div>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
				<c:forEach items="${consumerRequestList}" var="item">
					<tr id="item-tr-${item.id}" class="item-tr-${item.id}">
						<td class="">
							<div class="ui basic accordion" style="width: 100%; margin-bottom: 0px;">

								<div class="title" style="padding: 0px;">
									<i class="dropdown icon"></i>${item.nickname}(${item.description})[呼叫请求]
								</div>

								<div class="content">
									<div class="ui mini list">
										<div class="item">
											<i class="user outline icon"></i>
											<div class="content" style="padding-top: 0px; padding-bottom: 0px;">
												<div class="header">头像</div>
												<img class="ui avatar image" src="${item.headimgurl}/46">
											</div>
										</div>
										<div class="item">
											<c:if test="${item.sex == '男'}">
												<i class="male outline icon"></i>
											</c:if>
											<c:if test="${item.sex == '女'}">
												<i class="female outline icon"></i>
											</c:if>
											<div class="content" style="padding-top: 0px; padding-bottom: 0px;">
												<div class="header">性别</div>
												${item.sex}
											</div>
										</div>
										<div class="item">
											<i class="time outline icon"></i>
											<div class="content" style="padding-top: 0px; padding-bottom: 0px;">
												<div class="header">请求时间</div>
												${item.date_time}(${item.diff})
											</div>
										</div>
										<div class="item">
											<i class="time outline icon"></i>
											<div class="content" style="padding-top: 0px; padding-bottom: 0px;">
												<div class="header">确认时间</div>
												${item.handle_date_time}(${item.handle_diff})
											</div>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div style="height: 44px;"></div>
	<!-- bottom header -->
	<div class="ui fixed bottom inverted fluid three item menu">
		<a class="item" href="businessRole/free/waiterLogin.do?openId=${param.openId}&businessId=${param.businessId}"><i
			class="icon align justify"></i>顾客确认 </a> <a class="item"
			href="businessRole/free/waiterHistory.do?openId=${param.openId}&businessId=${param.businessId}"><i
			class="icon heart"></i>确认历史</a>
	</div>

	<script type="text/javascript">
		jQuery(function($) {

			$('.ui.accordion').accordion();

			$('.ui.button.czsOpen').click(function() {
				if ($(this).attr('czs-status') == '0') {
					$(this).attr('czs-status', '1').addClass('green');
					$('.ui.accordion > .title').addClass('active');
					$('.ui.accordion > .content').addClass('active');
				} else {
					$(this).attr('czs-status', '0').removeClass('green');
					$('.ui.accordion > .title').removeClass('active');
					$('.ui.accordion > .content').removeClass('active');
				}
			});
		});
	</script>
</body>
</html>
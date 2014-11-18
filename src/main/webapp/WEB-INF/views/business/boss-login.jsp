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
<link href="resources/semantic/css/semantic.min.css" rel="stylesheet" type="text/css">
<script src="resources/js/lib/jquery-2.0.2.min.js" charset="utf-8"></script>
<script src="resources/semantic/javascript/semantic.min.js" charset="utf-8"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>餐助手-商家服务</title>
<script type="text/javascript">
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideToolbar');
		WeixinJSBridge.call('hideOptionMenu');
	});
</script>
</head>
<body style="margin: 0px; padding: 0px; background-color: black;">

	<div class="ui dimmer">
		<div class="content" style="display: none;">
			<div class="center"></div>
		</div>
	</div>

	<div>
		<div class="two column stackable ui grid">
			<div class="column">
				<div style="padding: 8px 0px;">
					<div class="ui labeled vertical fluid inverted icon menu">
						<a class="item">
							<div class="ui three column grid">
								<div class="column" style="text-align: center;">
									<div style="margin-bottom: 10px;">消费顾客数</div>
									<div>
										<i class="icon users"></i>${countTodayOngoingConsumer}
									</div>
								</div>
								<div class="column" style="text-align: center;">
									<div style="margin-bottom: 10px;">今日顾客数</div>
									<div>
										<i class="icon users"></i>${countTodayConsumer}
									</div>
								</div>
								<div class="column" style="text-align: center;">
									<div style="margin-bottom: 10px;">顾客总数</div>
									<div>
										<i class="icon users"></i>${countAllConsumer}
									</div>
								</div>
							</div>
						</a> <a class="item">
							<div class="ui three column grid">
								<div class="column" style="text-align: center;">
									<div style="margin-bottom: 10px;">待做菜品数</div>
									<div>
										<i class="icon cart"></i>${countTodayWaitMenuBill}
									</div>
								</div>
								<div class="column" style="text-align: center;">
									<div style="margin-bottom: 10px;">完成菜品数</div>
									<div>
										<i class="icon cart"></i>${countTodayMenuBill}
									</div>
								</div>
								<div class="column" style="text-align: center;">
									<div style="margin-bottom: 10px;">菜品总数</div>
									<div>
										<i class="icon cart"></i>${countAllMenuBill}
									</div>
								</div>
							</div>
						</a> <a class="item">
							<div class="ui three column grid">
								<div class="column" style="text-align: center;">
									<div style="margin-bottom: 10px;">今日营业额</div>
									<div>
										<i class="icon yen"></i>${countTodayBill}
									</div>
								</div>
								<div class="column" style="text-align: center;">
									<div style="margin-bottom: 10px;">昨日营业额</div>
									<div>
										<i class="icon yen"></i>${countYesterdayBill}
									</div>
								</div>
								<div class="column" style="text-align: center;">
									<div style="margin-bottom: 10px;">营业总额</div>
									<div>
										<i class="icon yen"></i>${countAllBillBill}
									</div>
								</div>
							</div>
						</a> <a class="item">
							<div class="ui three column grid">
								<div class="column" style="text-align: center;">
									<div style="margin-bottom: 10px;">新消息数</div>
									<div>
										<i class="icon comment"></i>${countNewMsg}
									</div>
								</div>
								<div class="column" style="text-align: center;">
									<div style="margin-bottom: 10px;">收藏消息数</div>
									<div>
										<i class="icon comment"></i>${countStowMsg}
									</div>
								</div>
								<div class="column" style="text-align: center;">
									<div style="margin-bottom: 10px;">消息总数</div>
									<div>
										<i class="icon comment"></i>${countAllMsg}
									</div>
								</div>
							</div>
						</a> <a class="item">
							<div class="ui three column grid">
								<div class="column" style="text-align: center;">
									<div style="margin-bottom: 10px;">新服务数</div>
									<div>
										<i class="icon bell"></i>${countNewService}
									</div>
								</div>
								<div class="column" style="text-align: center;">
									<div style="margin-bottom: 10px;">今日服务数</div>
									<div>
										<i class="icon bell"></i>${countTodayService}
									</div>
								</div>
								<div class="column" style="text-align: center;">
									<div style="margin-bottom: 10px;">服务总数</div>
									<div>
										<i class="icon bell"></i>${countAllService}
									</div>
								</div>
							</div>
						</a>
					</div>

				</div>
			</div>
		</div>

		<div style="height: 44px;"></div>

		<!-- bottom header -->
		<div class="ui fixed bottom inverted fluid three item menu">
			<a class="item" href="businessRole/free/bossLogin.do?openId=${param.openId}&businessId=${param.businessId}"><i
				class="icon dashboard"></i>营业状况 </a>
		</div>
	</div>
</body>
</html>
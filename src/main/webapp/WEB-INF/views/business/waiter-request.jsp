<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="../../../resources/semantic/css/semantic.min.css"
	rel="stylesheet" type="text/css">
<script src="../../../resources/js/lib/jquery-2.0.2.min.js"
	charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.min.js"
	charset="utf-8"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>餐助手-商家服务</title>
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
			<span id="orderCount-span">${fn:length(list)}</span>位
		</div>
	</h4>
	<div class="ui segment attached">
		<table class="ui sortable table segment" style="display: table;">
			<thead>
				<tr>
					<th class="">顾客</th>
					<th class="">位置</th>
					<th class="">类型</th>
					<th class="">状态</th>
					<th class="number">时间</th>
					<th class="number">距今</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="item">
					<tr id="item-tr-${item.id}" class="item-tr-${item.id}">
						<td class=""><img class="ui avatar image"
							src="${item.headimgurl}/64">${item.nickname}(${item.sex})</td>
						<td class="">${item.description}</td>
						<td class=""><c:if test="${item.type == '0'}">呼叫请求</c:if></td>
						<td class=""><c:if test="${item.status == '0'}">已接受</c:if> <c:if
								test="${item.status == '1'}">新请求<a class="ui label"
									onclick="serviceHandler('0', '${item.id}', '${item.consumer_id}')">接受</a>
							</c:if></td>
						<td class="" data-sort-value="${item.times}">${item.date_time}</td>
						<td class="" data-sort-value="${item.sec_diff}">${item.diff}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="ui small modal" id="confirm-ui-modal">
		<div class="header">确认提示</div>
		<div class="content">
			<div class="left">
				<i class="warning icon"></i>
			</div>
			<div class="right" style="font-size: 25px;">
				<p>确认接受该顾客的呼叫请求吗?</p>
			</div>
		</div>
		<div class="actions">
			<div class="two fluid ui buttons">
				<div class="ui negative labeled icon button">
					<i class="remove icon"></i> 取消
				</div>
				<div class="ui positive right labeled icon button">
					确认 <i class="checkmark icon"></i>
				</div>
			</div>
		</div>
	</div>

	<div style="height: 44px;"></div>
	<!-- bottom header -->
	<div class="ui fixed bottom inverted fluid three item menu">
		<a class="item"
			href="businessRole/free/waiterLogin.do?openId=${param.openId}&businessId=${param.businessId}"><i
			class="icon align justify"></i>顾客确认 </a> <a class="item"
			href="businessRole/free/waiterRequest.do?openId=${param.openId}&businessId=${param.businessId}"><i
			class="icon heart"></i>顾客请求</a>
	</div>

	<script type="text/javascript">
		var _status;
		var _id;
		var _consumer_id;
		function serviceHandler(status, id, consumer_id) {
			_status = status;
			_id = id;
			_consumer_id = consumer_id;

			$('#confirm-ui-modal').modal('show');
		}
		jQuery(function($) {
			$('#confirm-ui-modal').modal({
				onApprove : function() {
					$.post('businessRole/free/serviceHandle.do', {
						accepterId : '${param.openId}',
						consumerId : _consumer_id,
						status : _status,
						id : _id
					}, function(msg) {
						if (msg.succeed) {
							$('#item-tr-' + _id).remove();
						} else {
							alert("操作失败: " + msg.msg.detail);
						}
					});
				}
			});

			var _intervalRef = setInterval(function() {
				$.post('businessRole/free/checkService.do', {
					businessId : '${param.businessId}'
				}, function(msg) {
					if (msg.succeed) {
						if (!($('.ui.dimmer').dimmer('is active'))) {
							var cnt = Number($('#orderCount-span').text());
							if (cnt != msg.value) {
								window.location.reload();
							}
						}
					} else {
						clearInterval(_intervalRef);
						alert('操作失败 : ' + msg.msg.detail);
					}
				});
			}, 5 * 1000);
		});
	</script>
</body>
</html>
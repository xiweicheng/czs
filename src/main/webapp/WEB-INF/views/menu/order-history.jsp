<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>餐助手-商家服务</title>
<link href="../../../resources/semantic/css/semantic.min.css"
	rel="stylesheet" type="text/css">
<link href="../../../resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="../../../resources/datetimepicker/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" type="text/css">
<script src="../../../resources/js/lib/jquery-2.0.2.min.js"
	charset="utf-8"></script>
<script src="../../../resources/js/lib/jquery.tablesort.min.js"
	charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.min.js"
	charset="utf-8"></script>
<script
	src="../../../resources/datetimepicker/js/bootstrap-datetimepicker.min.js"
	charset="utf-8"></script>
<script
	src="../../../resources/datetimepicker/js/bootstrap-datetimepicker.pt-BR.js"
	charset="utf-8"></script>
<script src="../../../resources/bootstrap/js/bootstrap.min.js"
	charset="utf-8"></script>
<script type="text/javascript">
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideToolbar');
		WeixinJSBridge.call('hideOptionMenu');
	});
</script>
<script id="joinTrTpl" type="text/x-jquery-tmpl">
</script>
</head>
<body style="margin: 0px; padding: 0px;">

	<div class="ui dimmer czsMsg">
		<div class="content" style="display: none;">
			<div class="center">
				<div class="ui huge message">
					<span></span>
				</div>
			</div>
		</div>
	</div>

	<!-- 侧边栏 -->
	<%@ include file="../menu.jsp"%>

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">
		历史订单
		<div class="circular ui red label">${fn:length(historyMenuBillList)}个</div>
	</h4>
	<div class="ui segment attached">
		<div>
			<a class="ui purple label czsRequest czsStatus"
				href="menu/orderHistory.do?status=3"
				style="margin-top: 5px; margin-bottom: 5px;"> 已接受 ${accept} 人 </a> <a
				class="ui teal label czsRequestOwn czsStatus"
				href="menu/orderHistory.do?status=1"
				style="margin-top: 5px; margin-bottom: 5px;"> 已提交 ${submited} 人
			</a><a class="ui orange label czsRequestGroup czsStatus"
				href="menu/orderHistory.do?status=0"
				style="margin-top: 5px; margin-bottom: 5px;"> 待提交 ${submiting} 人</a>
			<a class="ui black label czsStatus"
				href="menu/orderHistory.do?status=2"
				style="margin-top: 5px; margin-bottom: 5px;"> 已退订 ${debook} 人 </a> <a
				class="ui red label czsStatus" href="menu/orderHistory.do"
				style="margin-top: 5px; margin-bottom: 5px;"> 全部 ${total} 人 </a> <a
				class="ui label">
				<div id="datetimepickerStart" class="input-append date"
					style="display: inline;">
					<input type="text"></input> <span class="add-on"> <i
						data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
					</span>
				</div>
			</a><a class="ui label">～</a><a class="ui label">
				<div id="datetimepickerEnd" class="input-append date"
					style="display: inline;">
					<input type="text"></input> <span class="add-on"> <i
						data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
					</span>
				</div>
			</a>
		</div>
		<table class="ui sortable table segment" style="display: table;">
			<thead>
				<tr>
					<th class="number">序号</th>
					<th class="">菜名</th>
					<th class="number">份数</th>
					<th class="">状态</th>
					<th class="">时间</th>
					<th class="">距今</th>
					<th class="">顾客</th>
					<th class="">位置</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${historyMenuBillList}" var="item" varStatus="sts">
					<tr id="item-tr-${item.id}" class="item-tr-${item.menu_id}">
						<td class="">${sts.index + 1}</td>
						<td class="">${item.name}</td>
						<td class="">${item.copies}</td>
						<td class=""><c:if test="${item.status==0}">待提交</c:if> <c:if
								test="${item.status==1}">已提交</c:if> <c:if
								test="${item.status==2}">已退订</c:if> <c:if
								test="${item.status==3}">已接受</c:if></td>
						<td class="">${item.date_time}</td>
						<td class="">${item.sec_diff}</td>
						<td class="">${item.nickname}</td>
						<td class="">${item.description}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<script type="text/javascript">
		jQuery(function($) {

			$('table').tablesort().data('tablesort');
			$('thead th.number').data('sortBy', function(th, td, sorter) {
				return parseInt(td.text(), 10);
			});

			$('#menu-item-order-history').addClass('active');

			$('#datetimepickerStart').datetimepicker({
				format : 'yyyy-dd-MM hh:mm:ss',
				language : 'pt-BR'
			});

			$('#datetimepickerEnd').datetimepicker({
				format : 'yyyy-dd-MM hh:mm:ss',
				language : 'pt-BR'
			});

			var pickerStart = $('#datetimepickerStart').data('datetimepicker');
			var pickerEnd = $('#datetimepickerEnd').data('datetimepicker');

			var startDate = new Date();
			startDate.setTime(startDate.getTime() - 24 * 60 * 60 * 1000);
			var endDate = new Date();

			pickerStart.setDate(startDate);
			pickerEnd.setDate(endDate);
		});
	</script>
</body>
</html>
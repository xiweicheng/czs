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
	src="../../../resources/datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"
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
		顾客消息
		<div class="circular ui red label">${fn:length(msgList)}个</div>
	</h4>
	<div class="ui segment attached">

		<div class="ui segment">
			<div class="">
				<a class="ui label">
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
			<div style="margin-top: 10px;">
				<a class="ui label" id="czsStatus-0" onclick="filterHandler('0')"
					style="margin-top: 5px; margin-bottom: 5px;"> 新消息 ${newCount} 个
				</a> <a class="ui label" id="czsStatus-1" onclick="filterHandler('1')"
					style="margin-top: 5px; margin-bottom: 5px;"> 已了解
					${understanding} 个 </a><a class="ui label" onclick="filterHandler('')"
					id="czsStatus-" style="margin-top: 5px; margin-bottom: 5px;">
					全部 ${total} 个 </a>
			</div>
		</div>
		<table class="ui sortable table segment" style="display: table;">
			<thead>
				<tr>
					<th class="number">序号</th>
					<th class="">头像</th>
					<th class="">姓名</th>
					<th class="">性别</th>
					<th class="">类型</th>
					<th class="">消息</th>
					<th class="">状态</th>
					<th class="">时间</th>
					<th class="">距今</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${msgList}" var="item" varStatus="sts">
					<tr id="item-tr-${item.id}" class="item-tr-${item.id}">
						<td class="">${sts.index + 1}</td>
						<td class=""><img class="ui avatar image"
							src="${item.headimgurl}/64"></td>
						<td class="">${item.nickname}</td>
						<td class="">${item.sex}</td>
						<td class=""><c:if test="${item.msg_type=='text'}">文本消息</c:if>
							<c:if test="${item.msg_type=='image'}">图片消息</c:if></td>
						<td class=""><c:if test="${item.msg_type=='text'}">${item.content}</c:if>
							<c:if test="${item.msg_type=='image'}">
								<a target="_blank" href="${item.pic_url}">图片链接</a>
							</c:if></td>
						<td class=""><c:if test="${item.status==0}">新消息</c:if> <c:if
								test="${item.status==1}">已了解</c:if></td>
						<td class="">${item.date_time}</td>
						<td class="">${item.sec_diff}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<script type="text/javascript">
		function filterHandler(status) {
			$('<form action="business/listMsg.do" method="post"></form>').append(
					$('<input type="hidden">').attr('name', 'status').attr('value', status)).append(
					$('<input type="hidden">').attr('name', 'start').attr('value',
							$('#datetimepickerStart > input').val()))
					.append(
							$('<input type="hidden">').attr('name', 'end').attr('value',
									$('#datetimepickerEnd > input').val())).submit();
		}

		jQuery(function($) {

			$('table').tablesort().data('tablesort');
			$('thead th.number').data('sortBy', function(th, td, sorter) {
				return parseInt(td.text(), 10);
			});

			$('#menu-item-business-listMsg').addClass('active');
			
			$('#czsStatus-' + '${status}').addClass('green');

			$('#datetimepickerStart').datetimepicker({
				format : 'yyyy-MM-dd hh:mm:ss',
				language : 'zh-CN'
			});

			$('#datetimepickerEnd').datetimepicker({
				format : 'yyyy-MM-dd hh:mm:ss',
				language : 'zh-CN'
			});

			var pickerStart = $('#datetimepickerStart').data('datetimepicker');
			var pickerEnd = $('#datetimepickerEnd').data('datetimepicker');

			var startDate = new Date();
			startDate.setTime(${start});
			var endDate = new Date();
			endDate.setTime(${end});

			pickerStart.setLocalDate(startDate);
			pickerEnd.setLocalDate(endDate);
		});
	</script>
</body>
</html>
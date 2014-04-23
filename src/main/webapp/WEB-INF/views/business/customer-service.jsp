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
<script src="../../../resources/bootstrap/js/bootstrap.min.js"
	charset="utf-8"></script>
<script
	src="../../../resources/datetimepicker/js/bootstrap-datetimepicker.min.js"
	charset="utf-8"></script>
<script
	src="../../../resources/datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"
	charset="utf-8"></script>
<script type="text/javascript">
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideToolbar');
		WeixinJSBridge.call('hideOptionMenu');
	});
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
		服务请求
		<div class="circular ui red label">
			<span id="msgCount-span">${fn:length(msgList)}</span>个
		</div>
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
				<a class="ui label" id="czsStatus-1" onclick="filterHandler('1')"
					style="margin-top: 5px; margin-bottom: 5px;"> 新请求 ${newCount} 个
				</a> <a class="ui label" id="czsStatus-0" onclick="filterHandler('0')"
					style="margin-top: 5px; margin-bottom: 5px;"> 已接受
					${understanding} 个 </a><a class="ui label" onclick="filterHandler('')"
					id="czsStatus-" style="margin-top: 5px; margin-bottom: 5px;">
					全部 ${total} 个 </a>
			</div>
		</div>
		<table class="ui sortable table segment" style="display: table;">
			<thead>
				<tr>
					<th class="number">序号</th>
					<th class="">呼叫者</th>
					<th class="">位置</th>
					<th class="">类型</th>
					<th class="">状态</th>
					<th class="">时间</th>
					<th class="number">距今</th>
					<th class="">接收者</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${msgList}" var="item" varStatus="sts">
					<tr id="item-tr-${item.id}" class="item-tr-${item.id}">
						<td class="">${sts.index + 1}</td>
						<td class="" data-sort-value="${item.nickname}"><img
							class="ui avatar image" src="${item.headimgurl}/64">${item.nickname}(${item.sex})</td>
						<td class="">${item.description}</td>
						<td class=""><c:if test="${item.type=='0'}">呼叫服务</c:if></td>
						<td class=""><c:if test="${item.status==0}">已接受</c:if> <c:if
								test="${item.status==1}">待接收<a class="ui green label"
									id="ui-label-accept-${item.id}"
									onclick="serviceHandler('0', '${item.id}')">接受</a>
							</c:if></td>
						<td class="">${item.date_time}</td>
						<td class="" data-sort-value="${item.sec_diff}">${item.diff}</td>
						<td class="" data-sort-value="${item.handler_name}"><img
							class="ui avatar image" src="${item.handler_headimgurl}/64">${item.handler_name}(${item.handler_sex})</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<script type="text/javascript">
		function filterHandler(status) {
			$('<form action="business/listService.do" method="post"></form>').append(
					$('<input type="hidden">').attr('name', 'status').attr('value', status)).append(
					$('<input type="hidden">').attr('name', 'start').attr('value',
							$('#datetimepickerStart > input').val()))
					.append(
							$('<input type="hidden">').attr('name', 'end').attr('value',
									$('#datetimepickerEnd > input').val())).submit();
		}

		function serviceHandler(status, id) {
			$.post('business/serviceHandle.do', {
				status : status,
				id : id
			}, function(msg) {
				if (msg.succeed) {
					$('#ui-label-accept-' + id).hide();
				} else {
					if (!!msg.msg && !!msg.msg.detail) {
						$('.ui.dimmer.czsMsg .center span').html('操作失败!<br/>失败信息:' + msg.msg.detail);
					} else {
						$('.ui.dimmer.czsMsg .center span').text('操作失败!');
					}
					$('.ui.dimmer.czsMsg > .content').show();
					$('.ui.dimmer.czsMsg').dimmer('show');
				}
			});
		}

		jQuery(function($) {

			$('.ui.dimmer.czsMsg').click(function() {
				$('.ui.dimmer.czsMsg > .content').hide();
			});

			$('table').tablesort().data('tablesort');
			$('thead th.number').data('sortBy', function(th, td, sorter) {
				return parseInt(td.text(), 10);
			});

			$('#menu-item-business-listService').addClass('active');

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
			startDate.setTime(Number('${start}'));
			var endDate = new Date();
			endDate.setTime(Number('${end}'));

			pickerStart.setLocalDate(startDate);
			pickerEnd.setLocalDate(endDate);

			setInterval(function() {
				$.post('business/checkService.do', {
					status : '${status}',
					start : $('#datetimepickerStart > input').val(),
					end : $('#datetimepickerEnd > input').val()
				}, function(msg) {
					if (msg.succeed) {
						if (!($('.ui.dimmer.czsMsg').dimmer('is active'))) {
							var cnt = Number($('#msgCount-span').text());
							if (cnt != msg.value) {
								filterHandler('${status}');
							}
						}
					} else {
						if (!!msg.msg && !!msg.msg.detail) {
							$('.ui.dimmer.czsMsg .center span').html('操作失败!<br/>失败信息:' + msg.msg.detail);
						} else {
							$('.ui.dimmer.czsMsg .center span').text('操作失败!');
						}
						$('.ui.dimmer.czsMsg > .content').show();
						$('.ui.dimmer.czsMsg').dimmer('show');
					}
				});
			}, 5 * 1000);
		});
	</script>
</body>
</html>
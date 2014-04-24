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
		账目结算
		<div class="circular ui red label">
			<span id="msgCount-span">${fn:length(billList)}</span>个
		</div>
	</h4>
	<div class="ui segment attached">
		<form action="business/billSettConfirm.do?status=${status}"
			method="post" id="bill-form">
			<div class="ui segment">
				<div class="">
					<a class="ui label">
						<div id="datetimepickerStart" class="input-append date"
							style="display: inline;">
							<input type="text" name="start"></input> <span class="add-on">
								<i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
							</span>
						</div>
					</a><a class="ui label">～</a><a class="ui label">
						<div id="datetimepickerEnd" class="input-append date"
							style="display: inline;">
							<input type="text" name="end"></input> <span class="add-on">
								<i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
							</span>
						</div>
					</a>
				</div>
				<div style="margin-top: 10px;">
					<a class="ui label" id="czsStatus-0" onclick="filterHandler('0')"
						style="margin-top: 5px; margin-bottom: 5px;"> 未结算 ${newCount}
						个 </a> <a class="ui label" id="czsStatus-1"
						onclick="filterHandler('1')"
						style="margin-top: 5px; margin-bottom: 5px;"> 已结算
						${understanding} 个 </a><a class="ui label" onclick="filterHandler('')"
						id="czsStatus-" style="margin-top: 5px; margin-bottom: 5px;">
						全部 ${total} 个 </a>

					<div class="ui label">
						<a class="ui huge label">选择<span id="sett-count-span"
							style="font-weight: bold; color: red;">${count}</span>份
						</a> <a class="ui huge label"> <i class="yen icon"></i><span
							id="sett-amount-span" style="font-weight: bold; color: red;">${amount}</span>
						</a>
						<c:if test="${count == 0}">
							<div class="ui green button czsConfirm" style="display: none;">结算</div>
						</c:if>
						<c:if test="${count > 0}">
							<div class="ui green button czsConfirm">结算</div>
						</c:if>

					</div>

				</div>
			</div>


			<table class="ui sortable table segment" style="display: table;">
				<thead>
					<tr>
						<th class="number">序号</th>
						<th class="" width="35px" style="width: 35px;"><div
								class="ui checkbox czsSelectAll">
								<input type="checkbox"><label
									style="width: 0px; padding-left: 0px;"></label>
							</div></th>
						<th class="">消费者</th>
						<th class="number">消费金额</th>
						<th class="">位置</th>
						<th class="">类型</th>
						<th class="">状态</th>
						<th class="">结账者</th>
						<th class="number">结账时间</th>
						<th class="">结算者</th>
						<th class="number">结算时间</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${billList}" var="item" varStatus="sts">
						<tr id="item-tr-${item.id}" class="item-tr-${item.id}">
							<td class="">${sts.index + 1}</td>
							<td class="" data-sort-value="1" width="35px"
								style="width: 35px;"><c:if test="${item.status==0}">
									<div class="ui checkbox czsItem" czs-value="${item.amount}">
										<input type="checkbox" name="id" value="${item.id}"
											checked="checked"><label
											style="width: 0px; padding-left: 0px;"></label>
									</div>
								</c:if></td>
							<td class="" data-sort-value="${item.nickname}"><img
								class="ui avatar image" src="${item.headimgurl}/64">${item.nickname}(${item.sex})</td>
							<td class="">${item.amount}</td>
							<td class="">${item.description}</td>
							<td class=""><c:if test="${item.type=='0'}">个人结账</c:if> <c:if
									test="${item.type=='1'}">集体结账</c:if></td>
							<td class=""><c:if test="${item.status==0}">未结算</c:if> <c:if
									test="${item.status==1}">已结算
							</c:if></td>
							<td class="" data-sort-value="${item.bill_nickname}"><c:if
									test="${! empty item.bill_nickname}">
									<img class="ui avatar image" src="${item.bill_headimgurl}/64">${item.bill_nickname}(${item.bill_sex})</c:if></td>
							<td class="spec-diff" data-sort-value="${item.sec_diff}"
								data-html="距今:${item.diff}">${item.date_time}</td>
							<td class="" data-sort-value="${item.sett_name}"><c:if
									test="${! empty item.sett_nickname}">
									<img class="ui avatar image" src="${item.sett_headimgurl}/64">${item.sett_nickname}(${item.sett_sex})</c:if></td>
							<td class="spec-diff" data-sort-value="${item.sec_sett_diff}"
								data-html="距今:${item.sett_diff}"><c:if
									test="${! empty item.sett_date_time}">${item.sett_date_time}</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<script type="text/javascript">
		function filterHandler(status) {
			$('<form action="business/billSett.do" method="post"></form>').append(
					$('<input type="hidden">').attr('name', 'status').attr('value', status)).append(
					$('<input type="hidden">').attr('name', 'start').attr('value',
							$('#datetimepickerStart > input').val()))
					.append(
							$('<input type="hidden">').attr('name', 'end').attr('value',
									$('#datetimepickerEnd > input').val())).submit();
		}

		function serviceHandler(status, id) {
			$.post('business/settHandle.do', {
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

			$('.ui.checkbox').checkbox();

			$('.spec-diff').popup();

			$('table').tablesort().data('tablesort');
			$('thead th.number').data('sortBy', function(th, td, sorter) {
				if (!!$(td).attr('data-sort-value')) {
					return parseInt($(td).attr('data-sort-value'), 10);
				}
				return parseInt(td.text(), 10);
			});

			$('#menu-item-bill-sett').addClass('active');

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

			$('.ui.button.czsConfirm').click(function() {
				$('#bill-form').submit();
			});

			$('.ui.checkbox.czsSelectAll').checkbox({
				onEnable : function() {
					$('.ui.checkbox.czsItem').checkbox('enable');
				},
				onDisable : function() {
					$('.ui.checkbox.czsItem').checkbox('disable');
				}
			});

			$('.ui.checkbox.czsItem').checkbox({
				onChange : function() {
					var amount = 0;
					var count = 0;

					$('.ui.checkbox.czsItem').each(function() {
						var chk = $(this).find('input');
						if (chk[0].checked) {
							count += 1;
							amount += (Number($(this).attr('czs-value')));
						}
					});

					$('#sett-count-span').text(count);
					$('#sett-amount-span').text(amount);

					if (count == 0) {
						$('.ui.button.czsConfirm').hide();
					} else {
						$('.ui.button.czsConfirm').show();
					}
				}
			});

		});
	</script>
</body>
</html>
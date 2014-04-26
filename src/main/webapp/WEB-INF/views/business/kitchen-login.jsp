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
<script src="../../../resources/js/lib/jquery.tmpl.min.js"
	charset="utf-8"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>餐助手-后厨服务</title>
<script type="text/javascript">
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideToolbar');
		WeixinJSBridge.call('hideOptionMenu');
	});
</script>
<script id="joinTrTpl" type="text/x-jquery-tmpl">
<tr id="item-tr-join-{{html id}}" class="item-tr-{{html menu_id}}">
<input type="hidden" name="id" value="{{html id}}">
<input type="hidden" name="copies" value="{{html copies}}">
	<td class="">{{html name}}({{html copies}}份)</td>
	<td class="">{{if memo}}<div class="ui red label">{{html memo}}</div>{{/if}}</td>
	<td class="">{{html date_time}}({{html diff}})</td>
	<td class="">{{html nickname}}({{html description}})</td>
	<td class=""><a class="ui purple label"
		onclick="acceptHandler('{{html id}}', '{{html menu_id}}', '1', '{{html copies}}')"
		href="javascript:void(0);">接受</a></td>
</tr>
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

	<h4 class="ui top attached header" style="margin-top: 0px;">
		订单一览
		<div class="circular ui red label">
			<span id="orderCount-span">${fn:length(orderList)}</span>份
		</div>
	</h4>
	<div class="ui segment attached">
		<table class="ui sortable table segment" style="display: table;">
			<thead>
				<tr>
					<th class="">菜名</th>
					<th class="">备注</th>
					<th class="">时间</th>
					<th class="">顾客</th>
					<th class="">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderList}" var="item">
					<tr id="item-tr-${item.id}" class="item-tr-${item.menu_id}">
						<td class="">${item.name}(${item.copies}份)</td>
						<td class=""><c:if test="${! empty item.memo}"><div class="ui red label">${item.memo}</div></c:if></td>
						<td class="number" data-sort-value="${item.sec_diff}">${item.date_time}(${item.diff})</td>
						<td class="">${item.nickname}(${item.description})</td>
						<td class=""><a class="ui purple label czsRequest"
							onclick="acceptHandler('${item.id}', '${item.menu_id}', '0', '${item.copies}')"
							href="javascript:void(0);">接受</a><a
							class="ui purple label czsRequest"
							onclick="acceptJoinHandler('${item.id}', '${item.menu_id}')"
							href="javascript:void(0);">合并接受</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


	<div class="ui small modal czsConfirm">
		<i class="close icon"></i>
		<div class="header">确认提示</div>
		<div class="content">
			<div class="left">
				<i class="warning icon"></i>
			</div>
			<div class="right" style="font-size: 25px;">
				<p>确认要接受吗?</p>
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


	<div class="ui modal czsBillJoin">
		<i class="close icon"></i>
		<div class="header">合并订单信息</div>
		<div class="content" style="padding: 1px;"
			id="czsGetConsumerInfo-content">
			<form id="join-form">
				<input type="hidden" name="accepterId" value="${param.openId}">
				<table class="ui sortable table segment" style="display: table;">
					<thead>
						<tr>
							<th class="">菜名</th>
							<th class="">备注</th>
							<th class="">时间</th>
							<th class="">顾客</th>
							<th class="">操作</th>
						</tr>
					</thead>
					<tbody id="join-tbody">
					</tbody>
				</table>
			</form>
		</div>
		<div class="actions">
			<div class="two fluid ui buttons">
				<div class="ui deny labeled icon button">
					<i class="remove icon"></i> 取消
				</div>
				<div class="ui approve right labeled icon button">
					确定 <i class="checkmark icon"></i>
				</div>
			</div>
		</div>
	</div>

	<div style="height: 44px;"></div>

	<!-- bottom header -->
	<div class="ui fixed bottom inverted fluid three item menu">
		<a class="item"
			href="businessRole/free/kitchenLogin.do?openId=${param.openId}&businessId=${param.businessId}"><i
			class="icon align justify"></i>订单一览 </a> <a class="item"
			href="businessRole/free/kitchenHistory.do?openId=${param.openId}&businessId=${param.businessId}"><i
			class="ok sign icon"></i>历史订单</a>
	</div>

	<script type="text/javascript">
		var _id;
		var _menu_id;
		var _interval;
		var _type;
		var _copies;

		function acceptHandler(id, menu_id, type, copies) {
			_id = id;
			_menu_id = menu_id;
			_type = type;
			_copies = copies;
			$('.ui.modal.czsConfirm').modal('show');
			$('.ui.modal.czsBillJoin').modal('hide');
		}

		function acceptJoinHandler(id, menu_id) {
			_id = id;
			_menu_id = menu_id;
			$.post('businessRole/free/queryJoinBill.do', {
				id : _menu_id,
				owner : '${param.businessId}'
			}, function(msg) {

				if (msg.succeed) {
					$('#joinTrTpl').tmpl(msg.value).appendTo($('#join-tbody').empty());
					var total = 0;
					$.each(msg.value, function(i, item) {
						total += item.copies;
					});
					$('.ui.modal.czsBillJoin > .header').text('合并订单信息 - 共' + total + '份');
					$('.ui.modal.czsBillJoin').modal('show');
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

			$('.ui.modal.czsConfirm').modal({
				closable : false,
				onApprove : function() {
					$.post('businessRole/free/accept.do', {
						id : _id,
						copies : _copies,
						accepterId : '${param.openId}'
					}, function(msg) {
						if (msg.succeed) {
							if (_type == '0') {
								$('#item-tr-' + _id).remove();
							} else if (_type == '1') {
								$('#item-tr-' + _id).remove();
								$('#item-tr-join-' + _id).remove();
							}
							return true;
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
			});

			$('.ui.modal.czsBillJoin').modal({
				closable : false,
				onApprove : function() {
					$.post('businessRole/free/acceptJoin.do', $('#join-form').serialize(), function(msg) {
						if (msg.succeed) {
							$('.item-tr-' + _menu_id).remove();
							return true;
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
			});

			setInterval(function() {
				$.post('businessRole/free/checkBill.do', {
					businessId : '${param.businessId}'
				}, function(msg) {
					if (msg.succeed) {
						if (!($('.ui.dimmer.czsMsg').dimmer('is active'))) {
							var cnt = Number($('#orderCount-span').text());
							if (cnt != msg.value) {
								window.location.reload();
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
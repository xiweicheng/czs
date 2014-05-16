<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>餐助手-商家服务</title>

<link href="../../../resources/semantic/css/semantic.min.css" rel="stylesheet" type="text/css">
<link href="../../../resources/colorbox/css/colorbox.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="../../../resources/js/lib/jquery-2.0.2.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../../../resources/js/lib/jquery.tablesort.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../../../resources/semantic/javascript/semantic.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../../../resources/js/lib/jquery.tmpl.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../../../resources/colorbox/js/jquery.colorbox-min.js" charset="utf-8"></script>

<script type="text/javascript">
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideToolbar');
		WeixinJSBridge.call('hideOptionMenu');
	});
</script>
<script id="joinTrTpl" type="text/x-jquery-tmpl">
<tr id="item-tr-join-{{html id}}" class="item-tr-join-{{html menu_id}}">
<input type="hidden" name="id" value="{{html id}}">
<input type="hidden" name="copies" value="{{html copies}}">
	<td class="">{{html name}}</td>
	<td class="">{{html copies}}</td>
	<td class="">{{if memo}}<div class="ui red label">{{html memo}}</div>{{/if}}</td>
	<td class="">{{html date_time}}</td>
	<td class="" data-sort-value="{{html sec_diff}}">{{html diff}}</td>
	<td class="">{{html nickname}}</td>
	<td class="">{{html description}}</td>
	<td class=""><a class="ui purple label"
		onclick="acceptHandler('{{html id}}', '{{html menu_id}}', '1', '{{html copies}}')"
		href="javascript:void(0);">接受</a></td>
</tr>
</script>
</head>
<body style="margin: 0px; padding: 0px;">

	<!-- message -->
	<div style="display: none;">
		<div id="succeed-msg">
			<div class="ui icon green message">
				<i class="info icon"></i>
				<div class="content">
					<div class="header">操作成功!</div>
				</div>
			</div>
		</div>
		<div id="fail-msg">
			<div class="ui icon red message">
				<i class="info icon"></i>
				<div class="content">
					<div class="header">操作失败!</div>
					<p></p>
				</div>
			</div>
		</div>
	</div>

	<!-- 侧边栏 -->
	<%@ include file="../menu.jsp"%>

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">
		订单一览 <a class="circular ui red label"> <span id="orderCount-span">${fn:length(orderList)}</span>份
		</a>
		<div class="ui green tiny button" onclick="window.location.reload();" style="margin-left: 20px;">手动刷新</div>
	</h4>
	<div class="ui segment attached">
		<table class="ui sortable table segment" style="display: table; font-size: 15px;">
			<thead>
				<tr>
					<th class="number">序号</th>
					<th class="">菜名</th>
					<th class="number">份数</th>
					<th class="">备注</th>
					<th class="">时间</th>
					<th class="number">距今</th>
					<th class="">顾客</th>
					<th class="">位置</th>
					<th class="">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderList}" var="item" varStatus="sts">
					<tr id="item-tr-${item.id}" class="item-tr-${item.menu_id}">
						<td class="">${sts.index + 1}</td>
						<td class="">${item.name}</td>
						<td class="">${item.copies}</td>
						<td class=""><c:if test="${! empty item.memo}">
								<div class="ui red label">${item.memo}</div>
							</c:if></td>
						<td class="">${item.date_time}</td>
						<td class="" data-sort-value="${item.sec_diff}">${item.diff}</td>
						<td class=""><img class="ui avatar image" src="${item.headimgurl}/64">${item.nickname}(${item.sex})</td>
						<td class="">${item.description}</td>
						<td class=""><a class="ui purple label czsRequest"
							onclick="acceptHandler('${item.id}', '${item.menu_id}', '0', '${item.copies}')" href="javascript:void(0);">接受</a><a
							class="ui purple label czsRequest" onclick="acceptJoinHandler('${item.id}', '${item.menu_id}')"
							href="javascript:void(0);">合并接受</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<div class="ui modal czsBillJoin">
		<i class="close icon"></i>
		<div class="header">合并订单信息</div>
		<div class="content" style="padding-top: 0px; padding-bottom: 0px;" id="czsGetConsumerInfo-content">
			<form id="join-form">
				<table class="ui sortable table segment" style="display: table; font-size: 15px;">
					<thead>
						<tr>
							<th class="">菜名</th>
							<th class="number">份数</th>
							<th class="">备注</th>
							<th class="">时间</th>
							<th class="number">距今</th>
							<th class="">顾客</th>
							<th class="">位置</th>
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

	<div class="ui small modal czsConfirm">
		<i class="close icon"></i>
		<div class="header">确认提示</div>
		<div class="content">
			<div class="left">
				<i class="warning icon"></i>
			</div>
			<div class="right" style="font-size: 30px;">
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
			$.post('menu/queryJoinBill.do', {
				id : _menu_id
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
					$('#fail-msg p').text(msg.msg.detail);
					$.colorbox({
						inline : true,
						href : '#fail-msg',
						onOpen : function() {
						},
						onClosed : function() {
						}
					});
				}

			});
		}

		jQuery(function($) {

			$('.ui.dimmer.czsMsg').click(function() {
				$('.ui.dimmer.czsMsg > .content').hide();
			});

			$('table').tablesort().data('tablesort');

			$('#menu-item-order-list').addClass('active');

			$('.ui.modal.czsConfirm').modal({
				onApprove : function() {
					$.post('menu/accept.do', {
						id : _id,
						copies : _copies
					}, function(msg) {
						if (msg.succeed) {
							if (_type == '0') {
								$('#item-tr-' + _id).remove();
							} else if (_type == '1') {
								$('#item-tr-' + _id).remove();
								$('#item-tr-join-' + _id).remove();
							}
							$('#orderCount-span').text(Number($('#orderCount-span').text()) - 1);
							return true;
						} else {
							$('#fail-msg p').text(msg.msg.detail);
							$.colorbox({
								inline : true,
								href : '#fail-msg',
								onOpen : function() {
								},
								onClosed : function() {
								}
							});
						}
					});
				}
			});

			$('.ui.modal.czsBillJoin').modal(
					{
						onApprove : function() {
							$.post('menu/acceptJoin.do', $('#join-form').serialize(), function(msg) {
								if (msg.succeed) {
									$('#orderCount-span').text(
											Number($('#orderCount-span').text())
													- Number($('.item-tr-' + _menu_id).size()));
									$('.item-tr-' + _menu_id).remove();
									$('.item-tr-join-' + _menu_id).remove();

									return true;
								} else {
									$('#fail-msg p').text(msg.msg.detail);
									$.colorbox({
										inline : true,
										href : '#fail-msg',
										onOpen : function() {
										},
										onClosed : function() {
										}
									});
								}
							});
						}
					});

			setInterval(function() {
				$.post('businessRole/free/checkBill.do', {
					businessId : '${businessId}'
				}, function(msg) {
					if (msg.succeed) {
						if ($('.ui.dimmer').dimmer('is active') == true) {
							return;
						}

						var cnt = Number($('#orderCount-span').text());
						if (cnt != msg.value) {
							window.location.reload();
						}
					} else {
						$('#fail-msg p').text(msg.msg.detail);
						$.colorbox({
							inline : true,
							href : '#fail-msg',
							onOpen : function() {
							},
							onClosed : function() {
							}
						});
					}
				});
			}, 5 * 1000);
		});
	</script>
</body>
</html>
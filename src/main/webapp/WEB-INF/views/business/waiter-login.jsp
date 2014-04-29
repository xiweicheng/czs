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
		顾客确认
		<div class="circular ui red label">
			<span id="orderCount-span">${fn:length(list)}</span>位
		</div>
		<div class="ui small button czsOpen" czs-status="0"
			style="position: absolute; top: 2px; right: 2px;">展开</div>
	</h4>
	<div class="ui segment attached" style="padding: 0px;">
		<table class="ui sortable table segment" style="display: table;">
			<thead>
				<tr>
					<th class="">顾客</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="item">
					<tr id="item-tr-${item.id}" class="item-tr-${item.id}">
						<td class="">
							<div style="float: right;">
								<a class="ui label" href="javascript:void(0);"
									onclick="requestHandler('1', '${item.id}', '${item.consumer_id}')">同意</a>
								<a class="ui label" href="javascript:void(0);"
									onclick="requestHandler('2', '${item.id}', '${item.consumer_id}')">禁止</a>
							</div>

							<div class="ui basic accordion"
								style="width: 100%; margin-bottom: 0px;">

								<div class="title" style="padding: 0px;">
									<i class="dropdown icon"></i>${item.nickname}(${item.description})
								</div>

								<div class="content">
									<div class="ui mini list">
										<div class="item">
											<i class="user outline icon"></i>
											<div class="content"
												style="padding-top: 0px; padding-bottom: 0px;">
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
											<div class="content"
												style="padding-top: 0px; padding-bottom: 0px;">
												<div class="header">性别</div>
												${item.sex}
											</div>
										</div>
										<div class="item">
											<i class="unhide outline icon"></i>
											<div class="content"
												style="padding-top: 0px; padding-bottom: 0px;">
												<div class="header">消费次数</div>
												${item.consume_times}
											</div>
										</div>
										<div class="item">
											<i class="time outline icon"></i>
											<div class="content"
												style="padding-top: 0px; padding-bottom: 0px;">
												<div class="header">时间</div>
												${item.last_consume_time}(${item.diff})
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

	<div class="ui small modal" id="confirm-ui-modal">
		<div class="header">确认提示</div>
		<div class="content">
			<div class="left">
				<i class="warning icon"></i>
			</div>
			<div class="right" style="font-size: 25px;">
				<p id="p-status-1" style="display: none;">确认同意该顾客进入吗?</p>
				<p id="p-status-2" style="display: none;">确认禁止该顾客进入吗?</p>
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
		function requestHandler(status, id, consumer_id) {
			_status = status;
			_id = id;
			_consumer_id = consumer_id;

			$('#p-status-1').hide();
			$('#p-status-2').hide();

			$('#p-status-' + status).show();

			$('#confirm-ui-modal').modal('show');
		}
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

			$('#confirm-ui-modal').modal({
				onApprove : function() {
					$.post('businessRole/free/requestHandle.do', {
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
				$.post('businessRole/free/checkRequest.do', {
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
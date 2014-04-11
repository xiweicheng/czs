<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script src="../../../resources/js/lib/jquery.tablesort.min.js"
	charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.js"
	charset="utf-8"></script>
<script src="../../../resources/js/lib/jquery.tmpl.min.js"
	charset="utf-8"></script>

<script id="userTrTpl" type="text/x-jquery-tmpl">
<tr>
	<td class="" style="color:red; font-weight: bold;">{{html consume}}</td>
	<td><img class="ui avatar image" src="{{html headimgurl}}"></td>
	<td class="">{{html nickname}}</td>
	<td class="">{{html sex}}</td>
	<td class="">{{html consume_times}}</td>
	<td class="">{{html last_consume_time}}</td>
</tr>
</script>
<script id="billDetailTpl" type="text/x-jquery-tmpl">
<div class="item" id="bill-detail-{{html menu_id}}"
	style="min-height: 0px;">
	<div class="image" style="display: none;">
		<img src="../../../{{html path}}">
		<!-- <a
		class="like ui corner label"> <i class="like icon"></i> -->
		</a>
	</div>
	<div class="content">
		<div class="name">{{html name}}</div>
		<p class="description" style="display: none;">{{html introduce}}</p>
		<div style="padding-bottom: 10px;">
			价格:{{html price}} | 优惠:{{if privilege>=1}}{{html privilege}}{{else}}{{html privilege*10}}折{{/if}}
		</div>
		<div>
			分类:{{html category}} | 口味:{{html taste}}
		</div>
		<div class="ui divider"></div>
		<div>
			{{if menuBill}}
				{{each menuBill}}
					{{html $value.nickname}}定了{{html $value.copies}}份!<br/>
				{{/each}}
			{{else}}
				您定了{{html copies}}份!<br/>
			{{/if}}
		</div>
	</div>
</div>
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>餐助手-商家自助后台</title>
</head>
<body style="margin: 0px; padding: 0px;">
	<!-- 侧边栏 -->
	<%@ include file="../menu.jsp"%>

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">顾客一览</h4>
	<div class="ui segment attached">

		<div>
			<div class="ui piled segment">
				<div class="ui toggle checkbox" id="refresh-ui-toggle-checkbox">
					<input type="checkbox" name="pet"> <label>定时刷新</label>
				</div>
				<div class="ui radio checkbox">
					<input type="radio" name="refresh" checked="checked"> <label>5s</label>
					<input type="hidden" value="5">
				</div>
				<div class="ui radio checkbox">
					<input type="radio" name="refresh"> <label>15s</label> <input
						type="hidden" value="15">
				</div>
				<div class="ui radio checkbox">
					<input type="radio" name="refresh"> <label>30s</label> <input
						type="hidden" value="30">
				</div>
				<div class="ui radio checkbox">
					<input type="radio" name="refresh"> <label>60s</label> <input
						type="hidden" value="60">
				</div>
			</div>
		</div>
		<div>
			<a class="ui purple label" href="business/list.do?status=5"
				style="margin-top: 10px;"> 进入请求中 ${requesting} 人 </a> <a
				class="ui teal label" href="business/list.do?status=3"
				style="margin-top: 10px;"> 个人结账申请 ${requestOwn} 人 </a><a
				class="ui orange label" href="business/list.do?status=4"
				style="margin-top: 10px;"> 集体结账申请 ${requestGroup} 人</a> <a
				class="ui black label" href="business/list.do?status=1"
				style="margin-top: 10px;"> 消费中 ${ongoing} 人 </a> <a
				class="ui red label" href="business/list.do?status=0"
				style="margin-top: 10px;"> 消费终止 ${over} 人 </a> <a
				class="ui green label" href="business/list.do?status=2"
				style="margin-top: 10px;"> 消费禁止 ${disabled} 人 </a><a
				class="ui blue label" href="business/list.do"
				style="margin-top: 10px;"> 总计 ${total} 人 </a>
		</div>
		<table class="ui sortable table segment" style="display: table;">
			<thead>
				<tr>
					<th class="">头像</th>
					<th class="">名称</th>
					<th class="">性别</th>
					<th class="">状态</th>
					<th class="">消费次数</th>
					<th class="sorted descending">最后消费时间</th>
					<th class="">位置描述</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${customerList}" var="item">
					<tr id="item-tr-${item.consumer_id}">
						<td><img class="ui avatar image" src="${item.headimgurl}"></td>
						<td class="">${item.nickname}<c:if
								test="${item.status=='1' || item.status=='3' || item.status=='4'}">
								<a class="ui teal label"
									onclick="billDetailHandler('${item.consume_code}', '${item.scene_id}', '${item.consumer_id}')">消费详情</a>
							</c:if></td>
						<td class=""><c:if test="${item.sex=='2'}">女</c:if> <c:if
								test="${item.sex=='1'}">男</c:if> <c:if test="${item.sex=='0'}">未知</c:if></td>
						<td class=""><c:if test="${item.status=='5'}">
								<i class="sign in icon"></i>进入请求中<a class="ui teal label"
									onclick="agreeOrDisagreeHandler('1', '${item.consume_code}', '${item.consumer_id}')">同意</a>
								<a class="ui orange label"
									onclick="agreeOrDisagreeHandler('2', '${item.consume_code}', '${item.consumer_id}')">禁止</a>
							</c:if> <c:if test="${item.status=='0'}">
								<i class="stop icon"></i>消费终止</c:if> <c:if test="${item.status=='1'}">
								<i class="play icon"></i>消费中<a class="ui teal label"
									onclick="checkoutHandler('3', '${item.consume_code}', '${item.scene_id}', '${item.consumer_id}')">个人结账</a>
								<a class="ui orange label"
									onclick="checkoutHandler('4', '${item.consume_code}', '${item.scene_id}', '${item.consumer_id}')">集体结账</a>
							</c:if> <c:if test="${item.status=='2'}">
								<i class="ban circle icon"></i>消费禁止<a class="ui teal label"
									onclick="agreeOrDisagreeHandler('0', '${item.consume_code}', '${item.consumer_id}')">解禁</a>
							</c:if> <c:if test="${item.status=='3'}">
								<i class="ban loading icon"></i>个人结账申请中<a class="ui red label"
									onclick="checkoutHandler('3', '${item.consume_code}', '${item.scene_id}', '${item.consumer_id}')">确认</a>
							</c:if> <c:if test="${item.status=='4'}">
								<i class="ban loading icon"></i>集体结账申请中<a class="ui red label"
									onclick="checkoutHandler('4', '${item.consume_code}', '${item.scene_id}', '${item.consumer_id}')">确认</a>
							</c:if></td>
						<td class="">${item.consume_times}</td>
						<td class=""><fmt:formatDate
								value="${item.last_consume_time}" pattern="yyyy/MM/dd hh:mm:ss" /></td>
						<td class=""><a
							<c:if test="${item.status == 1 || item.status == 3 || item.status == 4}">href="javascript:void(0);" onclick="groupInfoHander('${item.scene_id}', '${item.consume_code}', '${item.consumer_id}')"</c:if>>${item.description}</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>


	<!-- 集体信息展示modal -->
	<div class="ui modal" id="group-info-show-modal">
		<i class="close icon"></i>
		<div class="header">该桌信息</div>
		<div class="content" style="padding-top: 0px; padding-bottom: 0px;">
			<table class="ui sortable table segment" style="display: table;">
				<thead>
					<tr>
						<th class="">消费</th>
						<th class="">头像</th>
						<th class="">名称</th>
						<th class="">性别</th>
						<th class="">消费次数</th>
						<th class="sorted descending">最后消费时间</th>
					</tr>
				</thead>
				<tbody id="group-info-tbody">
				</tbody>
			</table>
			<div>
				<div class="ui label red" id="total-consume-ui-label"
					style="font-weight: bold;"></div>
				<a class="ui green button" id="group-checkout-ui-btn">结账</a>
			</div>
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

	<!-- 消费信息展示modal -->
	<div class="ui modal" id="bill-detail-modal">
		<i class="close icon"></i>
		<div class="header" id="bill-detail-header">消费详情</div>
		<div class="content">
			<div class="ui segment">
				<div class="ui toggle checkbox czzImage" style="margin-top:10px;">
					<input type="checkbox" name="mode" id="mode-ui-checkbox"> <label
						for="mode-ui-checkbox">图文模式</label>
				</div>
				<div class="ui toggle checkbox czzGroup" style="margin-top:10px;">
					<input type="checkbox" name="mode" id="group-ui-checkbox">
					<label for="group-ui-checkbox">集体消费</label>
				</div>
			</div>
			<div class="ui stackable items" id="bill-detail-ui-stackable-items"
				style="height: 350px; overflow: auto;"></div>
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

	<div class="ui modal" id="confirm-ui-modal">
		<div class="header">确认提示</div>
		<div class="content">
			<div class="left">
				<i class="warning icon"></i>
			</div>
			<div class="right">
				<p id="bill-total-p"></p>
				<p>确认要结账吗?</p>
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
		var _status;
		var _consume_code;
		var _scene_id;
		var _consumer_id;
		var _interval;

		function billDetailHandler(consume_code, scene_id, consumer_id) {
			_consume_code = consume_code;
			_scene_id = scene_id;
			_consumer_id = consumer_id;

			$.post('user/billDetail.do', {
				type : 0,
				consumeCode : consume_code,
				sceneId : scene_id,
				consumerId : consumer_id
			}, function(msg) {
				if (msg.succeed) {
					$('#billDetailTpl').tmpl(msg.values).appendTo($('#bill-detail-ui-stackable-items').empty());
					$('#bill-detail-header').text('消费详情-共' + msg.value + '元')
					$('#bill-detail-modal').modal('show');
				} else {
					alert('操作失败!')
				}
			});
		}

		function groupInfoHander(sceneId, consume_code, consumer_id) {
			_status = 4;
			_consume_code = consume_code;
			_scene_id = sceneId;
			_consumer_id = consumer_id;

			$.post('business/groupInfo.do', {
				sceneId : sceneId
			}, function(msg) {
				if (msg.succeed) {

					$("#userTrTpl").tmpl(msg.value).appendTo($("#group-info-tbody").empty());
					$('#total-consume-ui-label').text('总消费 ' + msg.values[0] + '元');
					$('#group-info-show-modal').modal('show');
				} else {
					alert(msg.msg.detail);
				}
			});
		}

		function agreeOrDisagreeHandler(status, consume_code, consumer_id) {
			$.post("business/agreeAccess.do", {
				status : status,
				consumeCode : consume_code,
				openId : consumer_id
			}, function(msg) {
				if (msg.succeed) {
					$('#item-tr-' + consumer_id).remove();
				} else {
					alert('处理失败!')
				}
			});
		}

		function checkoutHandler(status, consume_code, scene_id, consumer_id) {
			_status = status;
			_consume_code = consume_code;
			_scene_id = scene_id;
			_consumer_id = consumer_id;

			$.post("business/queryConsume.do", {
				status : _status,
				consumeCode : _consume_code,
				consumerId : _consumer_id,
				sceneId : _scene_id
			}, function(msg) {
				if (msg.succeed) {
					$('#bill-total-p').text('消费金额:' + msg.value);
					$('#confirm-ui-modal').modal('show');
				} else {
					alert('查询消费金额失败!');
				}
			});

		}

		jQuery(function($) {

			$('table').tablesort().data('tablesort');

			$('.ui.checkbox').checkbox();

			$('#menu-item-business-list').addClass('active');

			$('#group-info-show-modal').modal({
				closable : false,
			});

			$('#confirm-ui-modal').modal({
				closable : false,
				onApprove : function() {
					$.post('business/checkout.do', {
						status : _status,
						consumeCode : _consume_code,
						consumerId : _consumer_id,
						sceneId : _scene_id
					}, function(msg) {
						if (msg.succeed) {
							$('#item-tr-' + _consumer_id).remove();
							$('#group-info-show-modal').modal('hide');
							return true;
						} else {
							alert('结账失败!')
							return false;
						}
					});
				}
			});

			$('#group-checkout-ui-btn').click(function() {
				$('#bill-total-p').text($('#total-consume-ui-label').text());
				$('#confirm-ui-modal').modal('show');
			});

			$('.ui.radio.checkbox').hide();

			var _refreshInterval;

			$('#refresh-ui-toggle-checkbox').checkbox({
				onEnable : function() {

					$('.ui.radio.checkbox').show().each(function(item) {

						if ($(this).children('input[type="radio"]')[0].checked) {
							_interval = Number($(this).children('input[type="hidden"]').val());
						}
					});
					_refreshInterval = setInterval(function() {

						var search = window.location.search;
						var index = window.location.href.indexOf("interval=");
						if (index == -1) {
							if (search == '') {
								window.location = window.location + '?interval=' + _interval;
							} else {
								window.location = window.location + '&interval=' + _interval;
							}
						} else {
							window.location = (window.location.href).substr(0, index + 9) + _interval;
						}

					}, _interval * 1000);
				},
				onDisable : function() {
					clearInterval(_refreshInterval)
					$('.ui.radio.checkbox').hide();
				}
			});

			$('.ui.radio.checkbox').click(function() {
				$('#refresh-ui-toggle-checkbox').checkbox('toggle');
				$('#refresh-ui-toggle-checkbox').checkbox('toggle');
			});

			if ('${interval}' != '' && '${interval}' != '0') {

				$('.ui.radio.checkbox').each(function(item) {

					if ($(this).children('input[type="hidden"]').val() == '${interval}') {
						$(this).children('input[type="radio"]').attr("checked", "checked");
					}
				});

				$('#refresh-ui-toggle-checkbox').checkbox('enable');
			}

			$('.ui.toggle.checkbox.czzImage').checkbox({
				onEnable : function() {
					$('#bill-detail-ui-stackable-items').find('div[class="image"]').show();
				},
				onDisable : function() {
					$('#bill-detail-ui-stackable-items').find('div[class="image"]').hide();
				}
			});

			$('.ui.toggle.checkbox.czzGroup').checkbox(
					{
						onEnable : function() {
							$.post('user/billDetail.do', {
								type : 1,//集体消费查询
								consumeCode : _consume_code,
								sceneId : _scene_id,
								consumerId : _consumer_id
							}, function(msg) {
								if (msg.succeed) {
									$('#billDetailTpl').tmpl(msg.values).appendTo(
											$('#bill-detail-ui-stackable-items').empty());
									$('#bill-detail-header').text('消费详情-共' + msg.value + '元')
									
									if($('#mode-ui-checkbox')[0].checked){
										$('#bill-detail-ui-stackable-items').find('div[class="image"]').show();
									}
								} else {
									alert('操作失败!')
								}
							});
						},
						onDisable : function() {
							$.post('user/billDetail.do', {
								type : 0,//个人消费查询
								consumeCode : _consume_code,
								sceneId : _scene_id,
								consumerId : _consumer_id
							}, function(msg) {
								if (msg.succeed) {
									$('#billDetailTpl').tmpl(msg.values).appendTo(
											$('#bill-detail-ui-stackable-items').empty());
									$('#bill-detail-header').text('消费详情-共' + msg.value + '元');
									if($('#mode-ui-checkbox')[0].checked){
										$('#bill-detail-ui-stackable-items').find('div[class="image"]').show();
									}
								} else {
									alert('操作失败!')
								}
							});
						}
					});
		});
	</script>
</body>
</html>
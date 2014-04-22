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
<script src="../../../resources/js/lib/jquery-1.10.2.min.js"
	charset="utf-8"></script>
<script src="../../../resources/js/lib/jquery.tablesort.min.js"
	charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.min.js"
	charset="utf-8"></script>
<script src="../../../resources/js/lib/jquery.tmpl.min.js"
	charset="utf-8"></script>
<script src="../../../resources/js/lib/jquery.jqprint-0.3.js"
	charset="utf-8"></script>
<script type="text/javascript">
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideToolbar');
		WeixinJSBridge.call('hideOptionMenu');
	});
</script>
<script id="userTrTpl" type="text/x-jquery-tmpl">
<tr>
	<td class="" style="color:red; font-weight: bold;">{{html consume}}</td>
	<td><img class="ui avatar image" src="{{html headimgurl}}/64"></td>
	<td class="">{{html nickname}}</td>
	<td class="">{{html sex}}</td>
	<td class="">{{html consume_times}}</td>
	<td class="">{{html last_consume_time}}</td>
	<td class="">{{html sec_diff}}</td>
</tr>
</script>
<script id="menuItemPrintTpl" type="text/x-jquery-tmpl">
<div class="item">
	<div class="content">
		<div class="header">{{html name}} (￥{{html price}})</div>
			{{if menuBill}}
				{{each menuBill}}
					<span>{{html $value.nickname}}({{html $value.copies}}份)</span><br/>
				{{/each}}
			{{else}}
				<span>{{html nickname}}({{html copies}}份)</span>
			{{/if}}
	</div>
</div>
</script>
<script id="requestItemTpl" type="text/x-jquery-tmpl">
<div class="item" id="request-item-{{html id}}">
	<div class="right floated tiny teal ui button" onclick="requestHandler('{{html id}}')">知悉</div>
	<img class="ui avatar image"
		src="{{html headimgurl}}/64">
	<div class="content" onclick="refreshHandler('{{html id}}', '{{html type}}');">
		<div class="header">{{html nickname}}</div>
		{{html name}}
	</div>
</div>
</script>
<script id="billDetailTpl" type="text/x-jquery-tmpl">
<div class="item" id="bill-detail-{{html menu_id}}"
	style="min-height: 0px;">
	<div class="image" style="display: none;">
		<img src="" czz-src="../../../{{html path}}640/{{html file_name}}">
		<!-- <a
		class="like ui corner label"> <i class="like icon"></i> -->
		</a>
	</div>
	<div class="content">
		<div class="name">{{html name}}</div>
		<p class="description" style="display: none;">{{html introduce}}</p>
		<div style="margin-top:10px;">
			<div class="ui red label"><i class="yen icon"></i> {{html price}}</div>
			<div class="ui green label">{{html category}}</div>
			<div class="ui blue label">{{html taste}}</div>
		</div>
		<div class="ui divider"></div>
		<div>
			{{if menuBill}}
				{{each menuBill}}
					<div class="ui label" style="margin-top:5px; margin-bottom:5px;">{{html $value.nickname}}({{html $value.copies}})
					<div class="detail">
					{{if $value.status == '3'}}
						已接单
					{{else}}
						未接单
					{{/if}}
					</div>
					</div>
				{{/each}}
			{{else}}
				<div class="ui label" style="margin-top:5px; margin-bottom:5px;">{{html nickname}}({{html copies}})
					<div class="detail">
					{{if status == '3'}}
						已接单
					{{else}}
						未接单
					{{/if}}
					</div>
				</div>
			{{/if}}
		</div>
	</div>
</div>
</script>
<script id="consumerInfoTpl" type="text/x-jquery-tmpl">
<div class="ui relaxed celled list">
	<div class="item">
		<i class="meh icon"></i>
		<div class="content">
			<div class="header">头像</div>
			<img class="ui avatar image" src="{{html headimgurl}}/64">
		</div>
	</div>
	<div class="item">
		<i class="user icon"></i>
		<div class="content">
			<div class="header">名称</div>
			{{html nickname}}
		</div>
	</div>
	<div class="item">
		<i class="{{if sex == '男'}}male{{else}}female{{/if}} icon"></i>
		<div class="content">
			<div class="header">性别</div>
			{{html sex}}
		</div>
	</div>
	<div class="item">
		<i class="home icon"></i>
		<div class="content">
			<div class="header">地址</div>
			{{html country}} {{html province}} {{html city}}
		</div>
	</div>
	<div class="item">
		<i class="unhide icon"></i>
		<div class="content">
			<div class="header">消费次数</div>
			{{html consume_times}}
		</div>
	</div>
	<div class="item">
		<i class="calendar icon"></i>
		<div class="content">
			<div class="header">开始时间</div>
			{{html last_consume_time}}
		</div>
	</div>
	<div class="item">
		<i class="help icon"></i>
		<div class="content">
			<div class="header">状态</div>
			{{if status == 0}}消费终止{{else status == 1}}消费中{{else status == 2}}消费禁止{{else status == 3}}个人结账请求中{{else status == 4}}集体结账请求中{{else status == 5}}进入请求中{{/if}}
		</div>
	</div>
	{{if description}}
	<div class="item">
		<i class="map marker icon"></i>
		<div class="content">
			<div class="header">位置</div>
			{{html description}}
		</div>
	</div>
	{{/if}}
</div>
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

	<div class="ui right vertical sidebar">
		<h4 class="ui top attached header">顾客实时请求</h4>

		<div class="ui attached selection divided animated list czzRequest"
			style="margin-top: 5px;"></div>
	</div>

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">
		顾客一览
		<div class="circular ui red label">${fn:length(customerList)}人</div>
		<div class="ui toggle checkbox czsRefresh" style="margin-left: 20px;">
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

		<div class="ui toggle checkbox czsFilterOver"
			style="margin-left: 20px;">
			<input type="checkbox" name="filterOver"> <label>过滤终止状态</label>
		</div>
	</h4>
	<div class="ui segment attached">
		<div>
			<a class="ui label czsRequest czsStatus" id="czsStatus-5"
				onclick="filterHandler('5')"
				style="margin-top: 5px; margin-bottom: 5px;"> 进入请求中
				${requesting} 人 </a> <a class="ui label czsRequestOwn czsStatus"
				id="czsStatus-3" onclick="filterHandler('3')"
				style="margin-top: 5px; margin-bottom: 5px;"> 个人结账申请
				${requestOwn} 人 </a><a class="ui label czsRequestGroup czsStatus"
				id="czsStatus-4" onclick="filterHandler('4')"
				style="margin-top: 5px; margin-bottom: 5px;"> 集体结账申请
				${requestGroup} 人</a> <a class="ui label czsStatus" id="czsStatus-1"
				onclick="filterHandler('1')"
				style="margin-top: 5px; margin-bottom: 5px;"> 消费中 ${ongoing} 人 </a>
			<a class="ui label czsStatus" id="czsStatus-0"
				onclick="filterHandler('0')"
				style="margin-top: 5px; margin-bottom: 5px;"> 消费终止 ${over} 人 </a> <a
				class="ui label czsStatus" id="czsStatus-2"
				onclick="filterHandler('2')"
				style="margin-top: 5px; margin-bottom: 5px;"> 消费禁止 ${disabled} 人
			</a><a class="ui label total czsStatus" id="czsStatus-"
				onclick="filterHandler('')"
				style="margin-top: 5px; margin-bottom: 5px;"> 全部 ${total} 人 </a>
		</div>
		<table class="ui sortable table segment"
			style="display: table; font-size: 15px;">
			<thead>
				<tr>
					<th class="number">序号</th>
					<th class="">头像</th>
					<th class="">名称</th>
					<th class="">状态</th>
					<th class="sorted descending">开始时间</th>
					<th class="">距今</th>
					<th class="">位置描述</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${customerList}" var="item" varStatus="sts">
					<tr id="item-tr-${item.consumer_id}">
						<td>${sts.index + 1}</td>
						<td><img class="ui avatar image" src="${item.headimgurl}/64"></td>
						<td class=""><a href="javascript:void(0);"
							onclick="getConsumerInfoHandler('${item.consumer_id}')">${item.nickname}</a>
							<c:if
								test="${item.status=='1' || item.status=='3' || item.status=='4'}">
								<a class="ui teal label"
									onclick="billDetailHandler('${item.consume_code}', '${item.scene_id}', '${item.consumer_id}')">消费详情</a>
							</c:if></td>
						<%-- <td class=""><c:if test="${item.sex=='2'}">女</c:if> <c:if
								test="${item.sex=='1'}">男</c:if> <c:if test="${item.sex=='0'}">未知</c:if></td> --%>
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
						<%-- <td class="">${item.consume_times}</td> --%>
						<td class="">${item.last_consume_time}</td>
						<td class="">${item.sec_diff}</td>
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
						<th class="number">消费次数</th>
						<th class="sorted descending">最后消费时间</th>
						<th class="">距今</th>
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
		<div class="header">消费详情</div>
		<div class="content" style="padding-top: 20px;">
			<div class="ui segment">

				<div class="2 ui buttons">
					<div class="ui active button czsOwn">个人消费</div>
					<div class="ui button czsGroup">集体消费</div>
				</div>

				<div class="ui toggle checkbox czzImage"
					style="margin-top: 5px; margin-left: 20px;">
					<input type="checkbox" name="mode" id="mode-ui-checkbox"> <label
						for="">图文模式</label>
				</div>

				<div class="ui green vertical animated button czsPrint"
					style="float: right; margin-left: 20px;">
					<div class="hidden content">打印个人账单</div>
					<div class="visible content">
						<i class="print icon"></i>账单打印
					</div>
				</div>

				<div class="ui red animated fade button czsTakeBill"
					style="float: right;" czs-status="3">
					<div class="visible content">￥12.99</div>
					<div class="hidden content">个人结账</div>
				</div>
			</div>
			<div class="ui stackable items" id="bill-detail-ui-stackable-items"
				style="height: 300px; overflow: auto;"></div>
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
			<div class="right" style="font-size: 30px;">
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

	<div class="ui small modal czsGetConsumerInfo">
		<i class="close icon"></i>
		<div class="header">顾客信息</div>
		<div class="content" style="padding-top: 0px; padding-bottom: 0px;"
			id="czsGetConsumerInfo-content"></div>
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

	<!-- 消费账单打印 -->
	<div style="display: none;">
		<div id="bill-print-div">
			<div class="ui bulleted list menuList"></div>
			<div id="print-total-div"></div>
		</div>
	</div>

	<script type="text/javascript">
		var _status;
		var _consume_code;
		var _scene_id;
		var _consumer_id;
		var _interval;
		var _bill_total;

		var _filterOver = '${filterOver}';
		var _refresh = '${refresh}';
		var _request = '${request}';

		function filterHandler(status) {

			$('.ui.radio.checkbox').each(function(item) {
				if ($(this).children('input[type="radio"]')[0].checked) {
					_interval = Number($(this).children('input[type="hidden"]').val());
				}
			});

			$('<form action="business/list.do" method="post"></form>').append(
					$('<input type="hidden">').attr('name', 'status').attr('value', status)).append(
					$('<input type="hidden">').attr('name', 'filterOver').attr('value', _filterOver)).append(
					$('<input type="hidden">').attr('name', 'refresh').attr('value', _refresh)).append(
					$('<input type="hidden">').attr('name', 'request').attr('value', _request)).append(
					$('<input type="hidden">').attr('name', 'interval').attr('value', _interval)).submit();
		}

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
					$('#menuItemPrintTpl').tmpl(msg.values).appendTo($('.ui.list.menuList').empty());
					$('#print-total-div').text('总价: ￥' + msg.value);
					$('.ui.button.czsTakeBill > .visible.content').text('￥' + msg.value);
					$('#bill-detail-modal').modal('show');
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
					$('#total-consume-ui-label').html(
							'消费金额:<a class="ui huge red label"><i class="icon yen"></i>' + msg.values[0] + '</a>');
					$('#group-info-show-modal').modal('show');
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

		function agreeOrDisagreeHandler(status, consume_code, consumer_id) {
			$.post("business/agreeAccess.do", {
				status : status,
				consumeCode : consume_code,
				openId : consumer_id
			}, function(msg) {
				if (msg.succeed) {
					$('#item-tr-' + consumer_id).remove();
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
					_bill_total = msg.value;
					$('#bill-total-p').html(
							'消费金额:<a class="ui huge red label"><i class="icon yen"></i>' + msg.value + '</a>');
					$('#confirm-ui-modal').modal('show');
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

		function requestHandler(id) {
			$.post('business/requestHandle.do', {
				id : id
			}, function(msg) {
				if (msg.succeed) {
					$('#request-item-' + id).remove();
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

		function refreshHandler(id, type) {
			if (type == '0') {
				location.href = $('.ui.label.czsRequest').attr('href');
			} else if (type == '1') {
				location.href = $('.ui.label.czsRequestOwn').attr('href');
			} else if (type == '2') {
				location.href = $('.ui.label.czsRequestGroup').attr('href');
			}
		}

		function getConsumerInfoHandler(consumer_id) {
			$.post('business/getConsumerInfo.do', {
				openId : consumer_id
			}, function(msg) {
				if (msg.succeed) {
					$('#consumerInfoTpl').tmpl(msg.value)
							.appendTo($('.ui.modal.czsGetConsumerInfo > .content').empty());
					$('.ui.modal.czsGetConsumerInfo').modal('show');
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

			$('.ui.checkbox').checkbox();

			$('#czsStatus-' + '${status}').addClass('green');

			$('#menu-item-business-list').addClass('active');

			$('#group-info-show-modal').modal({
				closable : false
			});

			$('#bill-detail-modal').modal({
				closable : false
			});

			$('#confirm-ui-modal').modal({
				closable : false,
				onApprove : function() {
					$.post('business/checkout.do', {
						status : _status,
						consumeCode : _consume_code,
						consumerId : _consumer_id,
						sceneId : _scene_id,
						billTotal : _bill_total
					}, function(msg) {
						if (msg.succeed) {
							$('#item-tr-' + _consumer_id).remove();
							$('#group-info-show-modal').modal('hide');
							$('#bill-detail-modal').modal('hide');
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

			$('#group-checkout-ui-btn').click(function() {
				$('#bill-total-p').html($('#total-consume-ui-label').html());
				$('#confirm-ui-modal').modal('show');
			});

			$('.ui.radio.checkbox').hide();

			var _refreshInterval;

			$('.ui.checkbox.czsRefresh').checkbox({
				onEnable : function() {
					_refresh = '1';
					$('.ui.radio.checkbox').show().each(function(item) {
						if ($(this).children('input[type="radio"]')[0].checked) {
							_interval = Number($(this).children('input[type="hidden"]').val());
						}
					});
					_refreshInterval = setInterval(function() {
						filterHandler('${status}');
					}, _interval * 1000);
				},
				onDisable : function() {
					_refresh = '0';
					$('.ui.radio.checkbox').hide();
					clearInterval(_refreshInterval);
				}
			});

			$('.ui.radio.checkbox').click(function() {
				clearInterval(_refreshInterval);
				_refreshInterval = setInterval(function() {
					filterHandler('${status}');
				}, _interval * 1000);
			});

			if ('${filterOver}' != '' && '${filterOver}' != '0') {
				$('.ui.checkbox.czsFilterOver').checkbox('enable');
			}

			if ('${refresh}' != '' && '${refresh}' != '0') {
				$('.ui.checkbox.czsRefresh').checkbox('enable');
			}

			$('.ui.checkbox.czsFilterOver').checkbox({
				onEnable : function() {
					_filterOver = '1';
				},
				onDisable : function() {
					_filterOver = '0';
				}
			});

			if ('${interval}' != '' && '${interval}' != '0') {

				$('.ui.radio.checkbox').each(function(item) {

					if ($(this).children('input[type="hidden"]').val() == '${interval}') {
						$(this).children('input[type="radio"]').attr("checked", "checked");
					}
				});
			}

			$('.ui.toggle.checkbox.czzImage').checkbox(
					{
						onEnable : function() {
							$('#bill-detail-ui-stackable-items').find('div[class="image"]').show().end().find('img')
									.each(function() {
										$(this).attr("src", $(this).attr('czz-src'));
									});
						},
						onDisable : function() {
							$('#bill-detail-ui-stackable-items').find('div[class="image"]').hide();
						}
					});

			$('.ui.button.czsOwn').click(
					function() {
						$('.ui.button.czsGroup').removeClass('active');
						$(this).addClass('active');

						$('.ui.button.czsPrint > .hidden.content').text('打印个人账单');
						$('.ui.button.czsTakeBill > .hidden.content').text('个人结账');
						$('.ui.button.czsTakeBill').attr('czs-status', '3');

						$.post('user/billDetail.do', {
							type : 0,//个人消费查询
							consumeCode : _consume_code,
							sceneId : _scene_id,
							consumerId : _consumer_id
						}, function(msg) {
							if (msg.succeed) {
								$('#billDetailTpl').tmpl(msg.values).appendTo(
										$('#bill-detail-ui-stackable-items').empty());

								$('#menuItemPrintTpl').tmpl(msg.values).appendTo($('.ui.list.menuList').empty());
								$('#print-total-div').text('总价: ￥' + msg.value);

								$('.ui.button.czsTakeBill > .visible.content').text('￥' + msg.value);
								if ($('#mode-ui-checkbox')[0].checked) {
									$('#bill-detail-ui-stackable-items').find('div[class="image"]').show().end().find(
											'img').each(function() {
										$(this).attr("src", $(this).attr('czz-src'));
									});
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
					});
			$('.ui.button.czsGroup').click(
					function() {
						$('.ui.button.czsOwn').removeClass('active');
						$(this).addClass('active');

						$('.ui.button.czsPrint > .hidden.content').text('打印集体账单');
						$('.ui.button.czsTakeBill > .hidden.content').text('集体结账');
						$('.ui.button.czsTakeBill').attr('czs-status', '4');

						$.post('user/billDetail.do', {
							type : 1,//集体消费查询
							consumeCode : _consume_code,
							sceneId : _scene_id,
							consumerId : _consumer_id
						}, function(msg) {
							if (msg.succeed) {
								$('#billDetailTpl').tmpl(msg.values).appendTo(
										$('#bill-detail-ui-stackable-items').empty());

								$('#menuItemPrintTpl').tmpl(msg.values).appendTo($('.ui.list.menuList').empty());
								$('#print-total-div').text('总价: ￥' + msg.value);

								$('.ui.button.czsTakeBill > .visible.content').text('￥' + msg.value);

								if ($('#mode-ui-checkbox')[0].checked) {
									$('#bill-detail-ui-stackable-items').find('div[class="image"]').show().end().find(
											'img').each(function() {
										$(this).attr("src", $(this).attr('czz-src'));
									});
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
					});

			var requestFunction = function() {
				$.post('business/request.do', {}, function(msg) {
					if (msg.succeed) {
						$('#requestItemTpl').tmpl(msg.value).appendTo($('.ui.list.czzRequest').empty());
					} else {
						if (msg.msg.id == '1000') {
							clearInterval(intervalRef);
							if (!!msg.msg && !!msg.msg.detail) {
								$('.ui.dimmer.czsMsg .center span').html('操作失败!<br/>失败信息:' + msg.msg.detail);
							} else {
								$('.ui.dimmer.czsMsg .center span').text('操作失败!');
							}
							$('.ui.dimmer.czsMsg > .content').show();
							$('.ui.dimmer.czsMsg').dimmer('show');
						}
					}
				}, 'json');
			};

			var intervalRef;

			try {
				if (/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) {
					$('.ui.right.sidebar').sidebar('hide');
					$('.container.czzTopMenu > .title.item').hide();
				} else {

					if ('${request}' != '' && '${request}' != '0') {
						$('.ui.right.sidebar').sidebar('show');
						requestFunction();
						intervalRef = setInterval(requestFunction, 5 * 1000);
					} else {
						$('.ui.right.sidebar').sidebar('hide');
					}
				}
			} catch (e) {
				$('.ui.right.sidebar').sidebar('show');
			}

			$('<a class="launch item czzRequest" style="float:right;"><i class="icon list layout"></i> 实时请求栏</a>')
					.appendTo('.container.czzTopMenu');

			$('.launch.item.czzRequest').click(function() {
				$('.ui.right.sidebar').sidebar('toggle');

				if ($('.ui.right.sidebar').sidebar('is open')) {
					_request = '1';
					requestFunction();
					intervalRef = setInterval(requestFunction, 5 * 1000);

					if (/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) {
						$('.ui.checkbox.czsRefresh > label').hide();
						$('.ui.checkbox.czsFilterOver > label').hide();
					}

				} else {
					_request = '0';
					clearInterval(intervalRef);
					if (/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) {
						$('.ui.checkbox.czsRefresh > label').show();
						$('.ui.checkbox.czsFilterOver > label').show();
					}
				}
			});

			$('.ui.button.czsPrint').click(function() {
				$('#bill-print-div').jqprint();
			});
			$('.ui.button.czsTakeBill').click(function() {
				checkoutHandler($(this).attr('czs-status'), _consume_code, _scene_id, _consumer_id);
			});

		});
	</script>
</body>
</html>
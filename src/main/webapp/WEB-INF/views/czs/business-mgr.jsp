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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>餐助手-平台服务</title>
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
<link href="../../../resources/tinybox2/css/tinybox.min.css"
	rel="stylesheet" type="text/css">
<script src="../../../resources/tinybox2/tinybox.min.js" charset="utf-8"></script>
<script type="text/javascript">
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideToolbar');
		WeixinJSBridge.call('hideOptionMenu');
	});
</script>
</head>
<body style="margin: 0px; padding: 0px;">

	<div class="ui dimmer czsMsg">
		<div class="content">
			<div class="center"></div>
		</div>
	</div>

	<div>
		<!-- 侧边栏 -->
		<%@ include file="menu.jsp"%>

		<!-- header -->
		<%@ include file="header.jsp"%>

		<h4 class="ui top attached header" style="margin-top: 45px;">
			商家管理
			<div class="circular ui red label">
				<span id="msgCount-span">${fn:length(businessList)}</span>个
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
					<a class="ui label" id="czsStatus-0" onclick="filterHandler('0')"
						style="margin-top: 5px; margin-bottom: 5px;"> 新入驻 ${newCount}
						个 </a> <a class="ui label" id="czsStatus-1"
						onclick="filterHandler('1')"
						style="margin-top: 5px; margin-bottom: 5px;"> 已验证
						${understanding} 个 </a><a class="ui label" onclick="filterHandler('')"
						id="czsStatus-" style="margin-top: 5px; margin-bottom: 5px;">
						全部 ${total} 个 </a>
				</div>
			</div>
			<div style="overflow: auto;">
				<table class="ui sortable table segment"
					style="display: table; width: 2000px;">
					<thead>
						<tr>
							<th class="number">序号</th>
							<th class="">状态</th>
							<th class="">入住者</th>
							<th class="">地址</th>
							<th class="number">入驻时间</th>
							<th class="number">入驻距今</th>
							<th class="number">二维码限制</th>
							<th class="">邮箱验证</th>
							<th class="">手机验证</th>
							<th class="">是否删除</th>
							<th class="number">授权天数</th>
							<th class="">审核者</th>
							<th class="number">审核时间</th>
							<th class="number">审核距今</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${businessList}" var="item" varStatus="sts">
							<tr id="item-tr-${item.id}" class="item-tr-${item.id}">
								<td class="">${sts.index + 1}</td>
								<td class=""><c:if test="${item.status=='0'}">申请中<a
											id="pass-btn-${item.id}" class="ui label"
											onclick="msgHandler('1', '${item.id}', '${item.open_id}')">确认通过</a>
									</c:if> <c:if test="${item.status=='1'}">已验证</c:if></td>
								<td data-sort-value="${item.nickname}">
									<div class="ui basic accordion"
										style="width: 200px; margin-bottom: 0px;">
										<div class="title" style="padding: 0px;">
											<i class="dropdown icon"></i> <img class="ui avatar image"
												src="${item.headimgurl}/64">${item.nickname}(${item.sex})
										</div>
										<div class="content">
											<div class="ui mini list">
												<div class="item">
													<i class="user outline icon"></i>
													<div class="content"
														style="padding-top: 0px; padding-bottom: 0px;">
														<div class="header">店名</div>
														${item.name}
													</div>
												</div>
												<div class="item">
													<i class="home outline icon"></i>
													<div class="content"
														style="padding-top: 0px; padding-bottom: 0px;">
														<div class="header">地址</div>
														${item.address}
													</div>
												</div>
												<div class="item">
													<i class="phone outline icon"></i>
													<div class="content"
														style="padding-top: 0px; padding-bottom: 0px;">
														<div class="header">电话</div>
														${item.phone_number}
													</div>
												</div>
												<div class="item">
													<i class="mail outline icon"></i>
													<div class="content"
														style="padding-top: 0px; padding-bottom: 0px;">
														<div class="header">E-mail</div>
														${item.mail}
													</div>
												</div>
												<div class="item">
													<i class="comment outline icon"></i>
													<div class="content"
														style="padding-top: 0px; padding-bottom: 0px;">
														<div class="header">介绍</div>
														<c:if test="${! empty item.introduce}">
															<span class="czsPopup" data-html="${item.introduce}">${item.simple_introduce}
															</span>
														</c:if>
													</div>
												</div>
											</div>
										</div>
									</div>
								</td>
								<td class="">${item.country}&nbsp;${item.province}&nbsp;${item.city}</td>
								<td class="" data-sort-value="${item.times}">${item.date_time}</td>
								<td class="" data-sort-value="${item.sec_diff}">${item.diff}</td>
								<td class="">${item.qrcode_limit}</td>
								<td class=""><c:if test="${item.is_mail_verify=='1'}">是</c:if></td>
								<td class=""><c:if test="${item.is_phone_verify=='1'}">是</c:if></td>
								<td class=""><c:if test="${item.is_deleted=='1'}">是</c:if></td>

								<td class="">${item.days}</td>
								<td class=""><c:if test="${! empty item.audit_nickname}">
										<img class="ui avatar image" src="${item.audit_headimgurl}/64">${item.audit_nickname}(${item.audit_sex})</c:if></td>

								<td class="" data-sort-value="${item.audit_times}">${item.audit_date_time}</td>
								<td class="" data-sort-value="${item.sec_audit_diff}">${item.audit_diff}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<!-- footer -->
		<%@ include file="footer.jsp"%>
	</div>

	<div class="ui small modal" id="confirm-ui-modal">
		<div class="header">确认提示</div>
		<div class="content">
			<div class="left">
				<i class="warning icon"></i>
			</div>
			<div class="right" style="font-size: 25px;">
				<p>确认审核通过吗?</p>
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
		var _id;
		var _businessId;
		function filterHandler(status) {
			$('<form action="czs/businessMgr.do" method="post"></form>').append(
					$('<input type="hidden">').attr('name', 'status').attr('value', status)).append(
					$('<input type="hidden">').attr('name', 'start').attr('value',
							$('#datetimepickerStart > input').val()))
					.append(
							$('<input type="hidden">').attr('name', 'end').attr('value',
									$('#datetimepickerEnd > input').val())).submit();
		}

		function msgHandler(status, id, businessId) {
			_status = status;
			_id = id;
			_businessId = businessId;
			$('#confirm-ui-modal').modal('show');
		}

		jQuery(function($) {

			$('.czsPopup').popup({
				inline : true
			});

			$('.ui.accordion').accordion();

			$('table').tablesort().data('tablesort');

			$('thead th.number').data('sortBy', function(th, td, sorter) {
				if (!!$(td).attr('data-sort-value')) {
					return parseInt($(td).attr('data-sort-value'), 10);
				}
				return parseInt(td.text(), 10);
			});

			$('#menu-item-czs-business-mgr').addClass('active');

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
				$.post('czs/checkBusiness.do', {
					status : '${status}',
					start : $('#datetimepickerStart > input').val(),
					end : $('#datetimepickerEnd > input').val()
				}, function(msg) {
					if (msg.succeed) {
						if (!($('.ui.dimmer').dimmer('is active'))) {
							var cnt = Number($('#msgCount-span').text());
							if (cnt != msg.value) {
								filterHandler('${status}');
							}
						}
					} else {
						TINY.box.show({
							html : '操作失败!<br/>失败信息:' + msg.msg.detail,
							animate : false,
							close : false,
							boxid : 'error',
							topsplit : 3
						});
					}
				});
			}, 5 * 1000);

			$('#confirm-ui-modal').modal({
				onApprove : function() {
					$.post('czs/businessHandle.do', {
						status : _status,
						openId : _businessId,
						id : _id
					}, function(msg) {
						if (msg.succeed) {
							$('#pass-btn-' + _id).hide();
						} else {
							TINY.box.show({
								html : '操作失败!<br/>失败信息:' + msg.msg.detail,
								animate : false,
								close : false,
								boxid : 'error',
								topsplit : 3
							});
						}
					});
				}
			});
		});
	</script>
</body>
</html>
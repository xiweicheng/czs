<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>餐助手-平台服务</title>

<link href="../../../resources/semantic/css/semantic.min.css" rel="stylesheet" type="text/css">
<link href="../../../resources/tinybox2/css/tinybox.min.css" rel="stylesheet" type="text/css">
<link href="../../../resources/css/common.css" rel="stylesheet" type="text/css">
<link href="../../../resources/datetimepicker/css/jquery.simple-dtpicker.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="../../../resources/js/lib/jquery-2.0.2.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../../../resources/js/lib/jquery.tablesort.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../../../resources/semantic/javascript/semantic.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../../../resources/tinybox2/tinybox.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../../../resources/datetimepicker/js/jquery.simple-dtpicker.js" charset="utf-8"></script>
<script type="text/javascript" src="../../../resources/js/lib/date.format.js" charset="utf-8"></script>
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

		<!-- top spacer -->
		<div class="czs top spacer"></div>

		<h4 class="ui top bottom attached header">
			商家管理
			<div class="circular ui red label">
				<span id="msgCount-span">${fn:length(businessList)}</span>个
			</div>
		</h4>
		<div class="ui segment attached">

			<div class="ui segment">
				<div class="">
					<div class="ui icon input" id="datetimepickerStart">
						<input type="text" name="start" placeholder="开始日期" id="datepicker-start"><i class="calendar icon"
							onclick="$('#datepicker-start').handleDtpicker('show');"></i>
					</div>
					<div class="ui icon input" id="datetimepickerEnd">
						<input type="text" name="end" placeholder="结束日期" id="datepicker-end"><i class="calendar icon"
							onclick="$('#datepicker-end').handleDtpicker('show');"></i>
					</div>
				</div>
				<div style="margin-top: 10px;">
					<form action="czs/businessMgr.do" method="post" id="filter-form"></form>
					<a class="ui label" id="czsStatus-0" onclick="filterHandler('0')" style="margin-top: 5px; margin-bottom: 5px;">
						新入驻 ${newCount} 个 </a> <a class="ui label" id="czsStatus-1" onclick="filterHandler('1')"
						style="margin-top: 5px; margin-bottom: 5px;"> 已验证 ${understanding} 个 </a><a class="ui label"
						onclick="filterHandler('')" id="czsStatus-" style="margin-top: 5px; margin-bottom: 5px;"> 全部 ${total} 个 </a>
				</div>
			</div>
		</div>
		<div style="overflow: auto;">
			<table class="ui sortable table segment" style="display: table; width: 2000px; font-size: 15px;">
				<thead>
					<tr>
						<th class="number">序号</th>
						<th class="">操作</th>
						<th class="">状态</th>
						<th class="">入住者</th>
						<th class="">地址</th>
						<th class="number">入驻时间</th>
						<th class="number">入驻距今</th>
						<th class="number">餐豆值</th>
						<th class="number">二维码限制</th>
						<th class="number">授权天数</th>
						<th class="">邮箱验证</th>
						<th class="">手机验证</th>
						<th class="">是否删除</th>
						<th class="">审核者</th>
						<th class="number">审核时间</th>
						<th class="number">审核距今</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${businessList}" var="item" varStatus="sts">
						<tr id="item-tr-${item.id}" class="item-tr-${item.id}">
							<td class="">${sts.index + 1}</td>
							<td class=""><a class="ui label"
								onclick="lifeValueMgr('${item.id}', '${item.open_id}', '${item.life_value}', '${item.qrcode_limit}', '${item.days}');">充值</a></td>
							<td class=""><c:if test="${item.status=='0'}">申请中<a id="pass-btn-${item.id}" class="ui label"
										onclick="msgHandler('1', '${item.id}', '${item.open_id}')">确认通过</a>
								</c:if> <c:if test="${item.status=='1'}">已验证</c:if></td>
							<td data-sort-value="${item.nickname}">
								<div class="ui basic accordion" style="width: 200px; margin-bottom: 0px;">
									<div class="title" style="padding: 0px;">
										<i class="dropdown icon"></i> <img class="ui avatar image" src="${item.headimgurl}/64">${item.nickname}(${item.sex})
									</div>
									<div class="content">
										<div class="ui mini list">
											<div class="item">
												<i class="user outline icon"></i>
												<div class="content" style="padding-top: 0px; padding-bottom: 0px;">
													<div class="header">店名</div>
													${item.name}
												</div>
											</div>
											<div class="item">
												<i class="home outline icon"></i>
												<div class="content" style="padding-top: 0px; padding-bottom: 0px;">
													<div class="header">地址</div>
													${item.address}
												</div>
											</div>
											<div class="item">
												<i class="phone outline icon"></i>
												<div class="content" style="padding-top: 0px; padding-bottom: 0px;">
													<div class="header">电话</div>
													${item.phone_number}
												</div>
											</div>
											<div class="item">
												<i class="mail outline icon"></i>
												<div class="content" style="padding-top: 0px; padding-bottom: 0px;">
													<div class="header">E-mail</div>
													${item.mail}
												</div>
											</div>
											<div class="item">
												<i class="comment outline icon"></i>
												<div class="content" style="padding-top: 0px; padding-bottom: 0px;">
													<div class="header">介绍</div>
													<c:if test="${! empty item.introduce}">
														<span class="czsPopup" data-html="${item.introduce}">${item.simple_introduce} </span>
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
							<td class="">${item.life_value}</td>
							<td class="">${item.qrcode_limit}</td>
							<td class="">${item.days}</td>
							<td class=""><c:if test="${item.is_mail_verify=='1'}">是</c:if></td>
							<td class=""><c:if test="${item.is_phone_verify=='1'}">是</c:if></td>
							<td class=""><c:if test="${item.is_deleted=='1'}">是</c:if></td>

							<td class=""><c:if test="${! empty item.audit_nickname}">
									<img class="ui avatar image" src="${item.audit_headimgurl}/64">${item.audit_nickname}(${item.audit_sex})</c:if></td>

							<td class="" data-sort-value="${item.audit_times}">${item.audit_date_time}</td>
							<td class="" data-sort-value="${item.sec_audit_diff}">${item.audit_diff}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
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

	<div class="ui small modal czsConfirmUpdate">
		<div class="header">确认提示</div>
		<div class="content">
			<div class="left">
				<i class="warning icon"></i>
			</div>
			<div class="right" style="font-size: 25px;">
				<p>确认提交吗?</p>
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

	<div class="ui small modal czsLifeValue">
		<div class="header">商家充值</div>
		<div class="content">
			<div class="ui form">
				<div class="ui top attached segment">
					<div class="ui warning message">
						<div class="header">输入错误提示!</div>
						<ul class="list">
						</ul>
					</div>
					<div class="two fields">
						<div class="field">
							<label>餐豆值</label> <input id="life-value-input" readonly="readonly" type="text">
						</div>
						<div class="field">
							<label>餐豆充值</label>
							<div class="ui action input">
								<input type="text" placeholder="充值数" id="add-life-value-input">
								<div class="ui button czsAddLeftValue" onclick="updateValue('0');">充值</div>
							</div>
						</div>
					</div>
				</div>
				<div class="ui attached segment">
					<div class="two fields">
						<div class="field">
							<label>二维码限制数</label> <input id="qrcode-limit-input" readonly="readonly" type="text">
						</div>
						<div class="field">
							<label>二维码限制数修改</label>
							<div class="ui action input">
								<input type="text" placeholder="限制数" id="update-qrcode-limit-input">
								<div class="ui button czsUpdateQrcodeLimit" onclick="updateValue('1');">修改</div>
							</div>
						</div>
					</div>
				</div>
				<div class="ui bottom attached segment">
					<div class="two fields">
						<div class="field">
							<label>授权天数</label> <input id="days-input" readonly="readonly" type="text">
						</div>
						<div class="field">
							<label>授权天数修改</label>
							<div class="ui action input">
								<input type="text" placeholder="授权天数" id="update-days-input">
								<div class="ui button czsUpdateDays" onclick="updateValue('2');">修改</div>
							</div>
						</div>
					</div>
				</div>
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
		var _type;
		var _oldValue;
		var _newValue;
		function filterHandler(status) {
			$('#filter-form').append($('<input type="hidden">').attr('name', 'status').attr('value', status)).append(
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

		/* 
		用途：检查输入字符串是否符合正整数格式 
		输入：s：字符串 
		返回：如果通过验证返回true,否则返回false 
		 */
		function isNumber(s) {
			var regu = "^[0-9]+$";
			var re = new RegExp(regu);
			if (s.search(re) != -1) {
				return true;
			} else {
				return false;
			}
		}

		function updateValue(type) {
			$('.ui.warning.message').hide().find('ul').empty();
			_type = type;
			if (type == '0') {
				_oldValue = $('#life-value-input').val();
				var addVal = $('#add-life-value-input').val();
				if (!isNumber(addVal)) {
					$('.ui.warning.message').show().find('ul').append('<li><b>餐豆充值数</b>输入必须为数字!</li>');
					$('#add-life-value-input').val('');
					return;
				} else {
					_newValue = Number(_oldValue) + Number(addVal);
				}
			} else if (type == '1') {
				_oldValue = $('#qrcode-limit-input').val();
				var newVal = $('#update-qrcode-limit-input').val();
				if (!isNumber(newVal)) {
					$('.ui.warning.message').show().find('ul').append('<li><b>二维码限制数</b>输入必须为数字!</li>');
					$('#update-qrcode-limit-input').val('');
					return;
				} else {
					_newValue = Number(newVal);
				}
			} else if (type == '2') {
				_oldValue = $('#days-input').val();
				var newVal = $('#update-days-input').val();
				if (!isNumber(newVal)) {
					$('.ui.warning.message').show().find('ul').append('<li><b>授权天数</b>输入必须为数字!</li>');
					$('#update-days-input').val('');
					return;
				} else {
					_newValue = Number(newVal);
				}
			}

			$('.ui.modal.czsConfirmUpdate').modal('show');
			$('.ui.modal.czsLifeValue').modal('hide');
		}

		function lifeValueMgr(id, businessId, life_value, qrcode_limit, days) {
			_id = id;
			_businessId = businessId;
			$('#life-value-input').val(life_value);
			$('#qrcode-limit-input').val(qrcode_limit);
			$('#days-input').val(days);
			$('.ui.modal.czsLifeValue').modal('show');
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

			var startDate = new Date();
			startDate.setTime(Number('${start}'));
			var endDate = new Date();
			endDate.setTime(Number('${end}'));

			$('#datepicker-start').appendDtpicker({
				dateFormat : 'YYYY-MM-DD hh:mm:00',
				locale : 'cn',
				closeOnSelected : true,
				current : startDate.format('yyyy-MM-dd hh:mm')
			});
			$('#datepicker-end').appendDtpicker({
				dateFormat : 'YYYY-MM-DD hh:mm:00',
				locale : 'cn',
				closeOnSelected : true,
				current : endDate.format('yyyy-MM-dd hh:mm')
			});

			setInterval(function() {
				$.post('czs/checkBusiness.do', {
					status : '${status}',
					start : $('#datetimepickerStart > input').val(),
					end : $('#datetimepickerEnd > input').val()
				}, function(msg) {
					if (msg.succeed) {
						if ($('.ui.dimmer').dimmer('is active') == true) {
							return;
						}

						var cnt = Number($('#msgCount-span').text());
						if (cnt != msg.value) {
							filterHandler('${status}');
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

			$('.ui.modal.czsConfirmUpdate').modal({
				onApprove : function() {
					$.post('czs/updateLife.do', {
						type : _type,
						oldValue : _oldValue,
						newValue : _newValue,
						id : _id,
						businessId : _businessId
					}, function(msg) {
						if (msg.succeed) {
							window.location.reload();
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

			$('.ui.modal.czsLifeValue').modal({
				onApprove : function() {
				}
			});
		});
	</script>
</body>
</html>
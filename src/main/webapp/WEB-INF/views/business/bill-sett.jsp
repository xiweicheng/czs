<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- head common -->
<%@ include file="../common.jsp"%>
<title>餐助手-商家服务</title>

<script id="billTrTpl" type="text/x-jquery-tmpl">
<tr id="item-tr-{{html id}}" class="item-tr-{{html id}}">
	<td class="" data-sort-value="{{html nickname}}"><img
		class="ui avatar image" src="{{html headimgurl}}/64">{{html nickname}}({{html sex}})</td>
	<td class="">{{html amount}}</td>
	<td class="">{{html description}}</td>
	<td class="">{{if type == '0'}}个人结账{{else}}集体结账{{/if}}</td>
	<td class="" data-sort-value="{{html bill_nickname}}"><img class="ui avatar image" src="{{html bill_headimgurl}}/64">{{html bill_nickname}}({{html bill_sex}})</td>
	<td class="spec-diff2" data-sort-value="{{html sec_diff}}">{{html date_time}}({{html diff}})</td>
	<td class="" data-sort-value="{{html sett_name}}"><img class="ui avatar image" src="{{html sett_headimgurl}}/64">{{html sett_nickname}}({{html sett_sex}})</td>
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

	<!-- top spacer -->
	<div class="czs top spacer"></div>

	<h4 class="ui top bottom attached header">
		账目结算 <a class="circular ui red label"> <span id="msgCount-span">${fn:length(billList)}</span>个
		</a>
	</h4>
	<div class="ui segment attached">
		<form action="business/billSett.do" method="post" id="filter-form"></form>
		<form action="business/billSettConfirm.do?status=${status}" method="post" id="bill-form">
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

					<a class="ui label" id="czsStatus-0" onclick="filterHandler('0')" style="margin-top: 5px; margin-bottom: 5px;">
						未结算 ${newCount} 个 </a> <a class="ui label" id="czsStatus-1" onclick="filterHandler('1')"
						style="margin-top: 5px; margin-bottom: 5px;"> 已结算 ${understanding} 个 </a><a class="ui label"
						onclick="filterHandler('')" id="czsStatus-" style="margin-top: 5px; margin-bottom: 5px;"> 全部 ${total} 个 </a>

					<div class="ui label">
						<a class="ui huge label">选择<span id="sett-count-span" style="font-weight: bold; color: red;">${count}</span>份
						</a> <a class="ui huge label"> <i class="yen icon"></i><span id="sett-amount-span"
							style="font-weight: bold; color: red;">${amount}</span>
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
			<table class="ui sortable table segment" style="display: table; font-size: 15px;">
				<thead>
					<tr>
						<th class="number">序号</th>
						<th class="" width="35px" style="width: 35px;"><div class="ui checkbox czsSelectAll">
								<input type="checkbox" checked="checked"><label style="width: 0px; padding-left: 0px;"></label>
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
							<td class="" data-sort-value="1" width="35px" style="width: 35px;"><c:if test="${item.status==0}">
									<div class="ui checkbox czsItem" czs-value="${item.amount}">
										<input type="checkbox" name="id" value="${item.id}" checked="checked"><label
											style="width: 0px; padding-left: 0px;"></label>
									</div>
								</c:if></td>
							<td class="" data-sort-value="${item.nickname}"><img class="ui avatar image" src="${item.headimgurl}/64">${item.nickname}(${item.sex})</td>
							<td class="">${item.amount}</td>
							<td class="">${item.description}</td>
							<td class=""><c:if test="${item.type=='0'}">个人结账</c:if> <c:if test="${item.type=='1'}">集体结账</c:if></td>
							<td class=""><c:if test="${item.status==0}">未结算</c:if> <c:if test="${item.status==1}">已结算
							</c:if></td>
							<td class="" data-sort-value="${item.bill_nickname}"><c:if test="${! empty item.bill_nickname}">
									<img class="ui avatar image" src="${item.bill_headimgurl}/64">${item.bill_nickname}(${item.bill_sex})</c:if></td>
							<td class="spec-diff" data-sort-value="${item.sec_diff}" data-html="距今:${item.diff}">${item.date_time}</td>
							<td class="" data-sort-value="${item.sett_name}"><c:if test="${! empty item.sett_nickname}">
									<img class="ui avatar image" src="${item.sett_headimgurl}/64">${item.sett_nickname}(${item.sett_sex})</c:if></td>
							<td class="spec-diff" data-sort-value="${item.sec_sett_diff}" data-html="距今:${item.sett_diff}"><c:if
									test="${! empty item.sett_date_time}">
									<a class="ui label" style="text-decoration: underline;"
										onclick="queryByDateHandler('${item.sett_times}', '${item.sett_date_time}')">${item.sett_date_time}</a>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<div class="ui small modal czsConfirm">
		<div class="header">确认提示</div>
		<div class="content">
			<div class="left">
				<i class="warning icon"></i>
			</div>
			<div class="right" style="font-size: 30px;">
				<p>确认要结算吗?</p>
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

	<!-- 集体信息展示modal -->
	<div class="ui modal czsBillByDate">
		<i class="close icon"></i>
		<div class="header">结算详情</div>
		<div class="content" style="padding-top: 0px; padding-bottom: 0px;">
			<table class="ui sortable table segment" style="display: table; font-size: 15px;">
				<thead>
					<tr>
						<th class="">消费者</th>
						<th class="number">消费金额</th>
						<th class="">位置</th>
						<th class="">类型</th>
						<th class="">结账者</th>
						<th class="number">结账时间(距今)</th>
						<th class="">结算者</th>
					</tr>
				</thead>
				<tbody id="bill-info-tbody">
				</tbody>
			</table>
			<div class="ui segment">
				<div class="ui label">
					<a class="ui huge label"><span id="sett-count-span2" style="font-weight: bold; color: red;">${count}</span>份 </a> <a
						class="ui huge label"> <i class="yen icon"></i><span id="sett-amount-span2"
						style="font-weight: bold; color: red;">${amount}</span>
					</a>
				</div>
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

	<script type="text/javascript">
		function filterHandler(status) {
			$('#filter-form').append($('<input type="hidden">').attr('name', 'status').attr('value', status)).append(
					$('<input type="hidden">').attr('name', 'start').attr('value',
							$('#datetimepickerStart > input').val()))
					.append(
							$('<input type="hidden">').attr('name', 'end').attr('value',
									$('#datetimepickerEnd > input').val())).submit();
		}

		function queryByDateHandler(times, date_time) {
			$.post('business/billSettByDate.do', {
				times : times
			}, function(msg) {
				if (msg.succeed) {
					$('#billTrTpl').tmpl(msg.values).appendTo($('#bill-info-tbody').empty());
					$('#sett-count-span2').text(msg.total);
					$('#sett-amount-span2').text(msg.value);

					$('.ui.modal.czsBillByDate > .header').text('结算详情(' + date_time + ")");
					$('.ui.modal.czsBillByDate').modal('show');
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

		jQuery(function($) {

			$('.ui.modal.czsConfirm').modal('setting', {
				onApprove : function() {
					$('#bill-form').submit();
				}
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

			$('.ui.button.czsConfirm').click(function() {
				$('.ui.modal.czsConfirm').modal('show');
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
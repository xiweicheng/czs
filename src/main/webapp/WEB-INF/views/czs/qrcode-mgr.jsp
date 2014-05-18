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
<!-- head common -->
<%@ include file="common.jsp"%>
<title>餐助手-平台服务</title>
</head>
<body style="margin: 0px; padding: 0px;">

	<div>
		<!-- 侧边栏 -->
		<%@ include file="menu.jsp"%>

		<!-- header -->
		<%@ include file="header.jsp"%>
		<!-- top spacer -->
		<div class="czs top spacer"></div>

		<h4 class="ui top bottom attached header" style="">
			二维码管理
			<div class="circular ui red label">
				<span id="msgCount-span">${fn:length(list)}</span>个
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
					<form action="czs/qrcodeMgr.do" method="post" id="filter-form"></form>
					<a class="ui label" id="czsStatus-0" onclick="filterHandler('0')" style="margin-top: 5px; margin-bottom: 5px;">
						新创建 ${newCount} 个 </a> <a class="ui label" id="czsStatus-1" onclick="filterHandler('1')"
						style="margin-top: 5px; margin-bottom: 5px;"> 已验证 ${understanding} 个 </a><a class="ui label"
						onclick="filterHandler('')" id="czsStatus-" style="margin-top: 5px; margin-bottom: 5px;"> 全部 ${total} 个 </a>
				</div>
			</div>
			<div style="overflow: auto;">
				<table class="ui sortable table segment" style="display: table; font-size: 15px;">
					<thead>
						<tr>
							<th class="number">序号</th>
							<th class="">操作</th>
							<th class="number">ID</th>
							<th class="">描述</th>
							<th class="">类型</th>
							<th class="">使用/限制</th>
							<th class="">使用商家</th>
							<th class="number">创建时间</th>
							<th class="number">创建距今</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="item" varStatus="sts">
							<tr id="item-tr-${item.id}" class="item-tr-${item.id}">
								<td class="">${sts.index + 1}</td>
								<td class=""></td>
								<td class="">${item.scene_id}</td>
								<td class="">${item.description}</td>
								<td class="">${item.category_name}</td>
								<td class="">${item.use_times}/${item.use_limit}</td>
								<td class="">${item.name}</td>
								<td class="" data-sort-value="${item.times}">${item.date_time}</td>
								<td class="" data-sort-value="${item.sec_diff}">${item.diff}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<!-- footer -->
		<%@ include file="footer.jsp"%>
	</div>

	<div class="ui small modal czsConfirm">
		<div class="header">确认提示</div>
		<div class="content">
			<div class="left">
				<i class="warning icon"></i>
			</div>
			<div class="right" style="font-size: 25px;"></div>
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
		function filterHandler(status) {
			$('#filter-form').append($('<input type="hidden">').attr('name', 'status').attr('value', status)).append(
					$('<input type="hidden">').attr('name', 'start').attr('value',
							$('#datetimepickerStart > input').val()))
					.append(
							$('<input type="hidden">').attr('name', 'end').attr('value',
									$('#datetimepickerEnd > input').val())).submit();
		}

		jQuery(function($) {

			$('table').tablesort().data('tablesort');

			$('thead th.number').data('sortBy', function(th, td, sorter) {
				if (!!$(td).attr('data-sort-value')) {
					return parseInt($(td).attr('data-sort-value'), 10);
				}
				return parseInt(td.text(), 10);
			});

			$('#menu-item-czs-qrcode-mgr').addClass('active');

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

			$('.ui.modal.czsConfirm').modal('setting', {
				onApprove : function() {
				}
			});
		});
	</script>
</body>
</html>
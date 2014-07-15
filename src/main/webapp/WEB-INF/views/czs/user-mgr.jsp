<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			用户管理
			<div class="circular ui red label">
				<span id="msgCount-span">${fn:length(userList)}</span>个
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
					<form action="czs/userMgr.do" method="post" id="filter-form"></form>
					<a class="ui label" id="czsStatus-0" onclick="filterHandler('0')" style="margin-top: 5px; margin-bottom: 5px;">
						新入驻 ${newCount} 个 </a> <a class="ui label" id="czsStatus-1" onclick="filterHandler('1')"
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
							<th class="">用户</th>
							<th class="">地址</th>
							<th class="">消费状态</th>
							<th class="number">创建时间</th>
							<th class="number">创建距今</th>
							<th class="number">关注次数</th>
							<th class="">地理位置</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userList}" var="item" varStatus="sts">
							<tr id="item-tr-${item.id}" class="item-tr-${item.id}">
								<td class="">${sts.index + 1}</td>
								<td class=""><a class="ui label" onclick="refreshUserInfo('${item.user_name}');">刷新</a></td>
								<td data-sort-value="${item.nickname}"><img class="ui avatar image" src="${item.headimgurl}/64">${item.nickname}(${item.sex})
								</td>
								<td class="">${item.country}&nbsp;${item.province}&nbsp;${item.city}</td>
								<td class=""><c:if test="${! empty item.consume_code}">
										<div class="ui label czsPopup" data-content="消费码:${item.consume_code}">消费中</div>
									</c:if></td>
								<td class="" data-sort-value="${item._times}">${item.create_time}</td>
								<td class="" data-sort-value="${item.sec_diff}">${item.diff}</td>
								<td class="">${item.times}</td>
								<td class=""><c:if test="${! empty item.latitude}">
										<a class="ui label czsPopup" data-content="${item.latitude}&nbsp;${item.longitude}&nbsp;${item.precision_}"><i
											class="location icon"></i></a>
									</c:if></td>
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
		function refreshUserInfo(openId) {
			$.post('czs/refreshUserInfo.do', {
				openId : openId
			}, function(msg) {
				if (msg.succeed) {
					window.location.reload();
				} else {
					$.colorbox({
						html : '<h3 class="ui red header">操作失败!<br/>失败信息:' + msg.msg.detail + '</h3>'
					});
				}
			});
		}
		function filterHandler(status) {
			$('#filter-form').append($('<input type="hidden">').attr('name', 'status').attr('value', status)).append(
					$('<input type="hidden">').attr('name', 'start').attr('value',
							$('#datetimepickerStart > input').val()))
					.append(
							$('<input type="hidden">').attr('name', 'end').attr('value',
									$('#datetimepickerEnd > input').val())).submit();
		}

		jQuery(function($) {

			$('.czsPopup').popup({
				inline : true
			});

			$('table').tablesort().data('tablesort');

			$('thead th.number').data('sortBy', function(th, td, sorter) {
				if (!!$(td).attr('data-sort-value')) {
					return parseInt($(td).attr('data-sort-value'), 10);
				}
				return parseInt(td.text(), 10);
			});

			$('#menu-item-czs-user-mgr').addClass('active');

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

			$('#confirm-ui-modal').modal('setting', {
				onApprove : function() {
				}
			});
		});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- head common -->
<%@ include file="../common.jsp"%>
<title>餐助手-商家服务</title>
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
		顾客消息 <a class="circular ui red label"> <span id="msgCount-span">${fn:length(msgList)}</span>个
		</a>
	</h4>

	<div class="ui segment attached" style="min-height: 490px;">

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
				<form action="business/listMsg.do" method="post" id="filter-form"></form>
				<a class="ui label" id="czsStatus-0" onclick="filterHandler('0')" style="margin-top: 5px; margin-bottom: 5px;">
					新消息 ${newCount} 个 </a> <a class="ui label" id="czsStatus-1" onclick="filterHandler('1')"
					style="margin-top: 5px; margin-bottom: 5px;"> 已了解 ${understanding} 个 </a><a class="ui label" id="czsStatus-2"
					onclick="filterHandler('2')" style="margin-top: 5px; margin-bottom: 5px;"> 收藏消息 ${stow} 个 </a><a class="ui label"
					onclick="filterHandler('')" id="czsStatus-" style="margin-top: 5px; margin-bottom: 5px;"> 全部 ${total} 个 </a>
			</div>
		</div>

		<table class="ui sortable table segment" style="display: table;">
			<thead>
				<tr>
					<th class="number">序号</th>
					<th class="">顾客</th>
					<th class="">位置</th>
					<th class="">类型</th>
					<th class="">消息</th>
					<th class="">状态</th>
					<th class="">时间</th>
					<th class="number">距今</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${msgList}" var="item" varStatus="sts">
					<tr id="item-tr-${item.id}" class="item-tr-${item.id}">
						<td class="">${sts.index + 1}</td>
						<td class=""><img class="ui avatar image" src="${item.headimgurl}/64">${item.nickname}(${item.sex})</td>
						<td class="">${item.description}</td>
						<td class=""><c:if test="${item.msg_type=='text'}">文本消息</c:if> <c:if test="${item.msg_type=='image'}">图片消息</c:if></td>
						<td class=""><c:if test="${item.msg_type=='text'}">
								<a class="ui label czsMsgText" data-html="<p>${item.content}</p>">${item.simple_content}</a>
							</c:if> <c:if test="${item.msg_type=='image'}">
								<a class="ui label czsMsgImage"
									data-html="<img style='max-width:200px;max-height:200px;' src='${item.pic_url}'>"
									style="text-decoration: underline;" target="_blank" href="${item.pic_url}">图片链接</a>
							</c:if></td>
						<td class=""><c:if test="${item.status==0}">新消息<a class="ui label"
									onclick="msgHandler(this, '1', '${item.id}')">已读</a>
								<a class="ui label" onclick="msgHandler(this, '2', '${item.id}')">收藏</a>
							</c:if> <c:if test="${item.status==1}">已了解<a class="ui label" onclick="msgHandler(this, '2', '${item.id}')">收藏</a>
							</c:if> <c:if test="${item.status==2}">已收藏<a class="ui label" onclick="msgHandler(this, '1', '${item.id}')">移除</a>
							</c:if></td>
						<td class="">${item.date_time}</td>
						<td class="" data-sort-value="${item.sec_diff}">${item.diff}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<script type="text/javascript">
		function filterHandler(status) {
			$('#filter-form').append($('<input type="hidden">').attr('name', 'status').attr('value', status)).append(
					$('<input type="hidden">').attr('name', 'start').attr('value',
							$('#datetimepickerStart > input').val()))
					.append(
							$('<input type="hidden">').attr('name', 'end').attr('value',
									$('#datetimepickerEnd > input').val())).submit();
		}

		function msgHandler(_this, status, msgId) {
			$.post('business/msgHandle.do', {
				status : status,
				id : msgId
			}, function(msg) {
				if (msg.succeed) {
					$(_this).hide();
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

			$('.ui.label.czsMsgImage, .ui.label.czsMsgText').popup({
				inline : true
			});

			$('table').tablesort().data('tablesort');

			$('thead th.number').data('sortBy', function(th, td, sorter) {
				if (!!$(td).attr('data-sort-value')) {
					return parseInt($(td).attr('data-sort-value'), 10);
				}
				return parseInt(td.text(), 10);
			});

			$('#menu-item-business-listMsg').addClass('active');

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
				$.post('business/checkMsg.do', {
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
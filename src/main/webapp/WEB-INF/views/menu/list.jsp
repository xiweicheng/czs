<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- head common -->
<%@ include file="../common.jsp"%>
<title>餐助手-商家服务</title>
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

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">
		菜品一览
		<div class="circular ui red label">${fn:length(menuList)}个</div>
	</h4>

	<div class="ui segment attached" style="min-height: 490px; padding:0px;">
		<table class="ui sortable table segment" style="display: table;">
			<thead>
				<tr>
					<th class="number">序号</th>
					<th class="">菜名</th>
					<th class="number">价格</th>
					<th class="">图片</th>
					<th class="">介绍</th>
					<th class="">分类</th>
					<th class="">口味</th>
					<th class="">添加时间</th>
					<th class="number">被点次数</th>
					<th class="">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${menuList}" var="item" varStatus="sts">
					<tr id="menu-item-${item.id}">
						<td class="">${sts.index + 1}</td>
						<td class="">${item.name}</td>
						<td class="">${item.price}</td>
						<td class=""><c:if test="${! empty item.file_name}">
								<a class="ui label czsMenuImg" target="_blank" href="${item.path}640/${item.file_name}"
									data-html="<img style='width:200px;' src='${item.path}640/${item.file_name}'>">图片链接</a>
							</c:if></td>
						<td class=""><c:if test="${! empty item.introduce}">
								<a class="ui label czsMenuIntroduce" data-html="<p>${item.introduce}</p>">菜品介绍</a>
							</c:if></td>
						<td class="">${item.category}</td>
						<td class="">${item.taste}</td>
						<td class="">${item.date_time}</td>
						<td class="">${item.order_times}</td>
						<td class=""><a class="ui red label" href="javascript:void(0);" onclick="menuDeleteHandler('${item.id}');">删除</a>
							<a class="ui purple label" href="menu/update.do?id=${item.id}">修改</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<div class="ui basic modal" id="confirm-ui-modal">
		<div class="header">确认提示</div>
		<div class="content">
			<div class="left">
				<i class="warning icon"></i>
			</div>
			<div class="right">
				<p>确认要删除吗?</p>
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
		// 删除image id.
		var deleteMenuId;

		// 菜单删除
		function menuDeleteHandler(id) {
			deleteMenuId = id;
			$('#confirm-ui-modal').modal('show');
		}

		jQuery(function($) {

			$('table').tablesort().data('tablesort');
			$('thead th.number').data('sortBy', function(th, td, sorter) {
				if (!!$(td).attr('data-sort-value')) {
					return parseInt($(td).attr('data-sort-value'), 10);
				}
				return parseInt(td.text(), 10);
			});

			$('.ui.label.czsMenuImg, .ui.label.czsMenuIntroduce').popup({
				inline : true
			});

			$('.ui.dimmer.czsMsg').click(function() {
				$('.ui.dimmer.czsMsg > .content').hide();
			});

			$('#menu-item-menu-list').addClass('active');

			$('#confirm-ui-modal').modal('setting', {
				closable : false,
				onApprove : function() {
					$.ajax({
						type : "POST",
						url : 'menu/delete.do',
						contentType : 'application/json',
						processData : false,
						dataType : "json",
						data : JSON.stringify({
							params : {
								id : deleteMenuId
							}
						}),
						success : function(msg) {
							if (msg.succeed) {
								$('#menu-item-' + deleteMenuId).remove();
							} else {
								if (!!msg.msg && !!msg.msg.detail) {
									$('.ui.dimmer.czsMsg .center span').html('操作失败!<br/>失败信息:' + msg.msg.detail);
								} else {
									$('.ui.dimmer.czsMsg .center span').text('操作失败!');
								}
								$('.ui.dimmer.czsMsg > .content').show();
								$('.ui.dimmer.czsMsg').dimmer('show');
							}
						}
					});
				}
			});
		});
	</script>
</body>
</html>
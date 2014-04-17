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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>餐助手-商家服务</title>
<link href="../../../resources/semantic/css/semantic.min.css"
	rel="stylesheet" type="text/css">
<script src="../../../resources/js/lib/jquery-2.0.2.min.js"
	charset="utf-8"></script>
<script src="../../../resources/js/lib/jquery.tablesort.min.js"
	charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.min.js"
	charset="utf-8"></script>
<script type="text/javascript">
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideToolbar');
		WeixinJSBridge.call('hideOptionMenu');
	});
</script>
</head>
<body style="margin: 0px; padding: 0px;">
	<!-- 侧边栏 -->
	<%@ include file="../menu.jsp"%>

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">角色分配</h4>
	<div class="ui segment attached">
		<div>
			<a class="ui purple label" href="business/roleMgr.do?type=0"
				style="margin-top: 5px; margin-bottom: 5px;">等待分配
				${undetermined} 人 </a> <a class="ui teal label"
				href="business/roleMgr.do?type=1"
				style="margin-top: 5px; margin-bottom: 5px;"> 店主角色 ${boss} 人 </a><a
				class="ui orange label" href="business/roleMgr.do?type=2"
				style="margin-top: 5px; margin-bottom: 5px;"> 后厨角色 ${cook} 人</a> <a
				class="ui black label" href="business/roleMgr.do?type=3"
				style="margin-top: 5px; margin-bottom: 5px;"> 服务员角色 ${waiter} 人
			</a> <a class="ui red label" href="business/roleMgr.do?type=4"
				style="margin-top: 5px; margin-bottom: 5px;"> 前台角色 ${proscenium}
				人</a> </a><a class="ui blue label" href="business/roleMgr.do"
				style="margin-top: 5px; margin-bottom: 5px;"> 总计 ${total} 人 </a>
		</div>
		<table class="ui sortable table segment" style="display: table;">
			<thead>
				<tr>
					<th class="">头像</th>
					<th class="">名称</th>
					<th class="">性别</th>
					<th class="">地址</th>
					<th class="">角色</th>
					<th class="sorted descending">添加时间</th>
					<th class="">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${roleList}" var="item">
					<tr id="item-tr-${item.id}">
						<td><img class="ui avatar image" src="${item.headimgurl}/64"></td>
						<td class="">${item.nickname}</td>
						<td class="">${item.sex}</td>
						<td class="">${item.country}&nbsp;${item.province}&nbsp;${item.city}</td>
						<td class="">
							<div class="ui selection dropdown">
								<div class="text">选择角色</div>
								<i class="dropdown icon"></i> <input type="hidden"
									name="roleType" value="${item.type}-${item.id}"
									id="role-hidden-input-${item.id}">
								<div class="menu">
									<div class="item" data-value="0-${item.id}">等待分配</div>
									<div class="item" data-value="1-${item.id}">店主角色</div>
									<div class="item" data-value="2-${item.id}">后厨角色</div>
									<div class="item" data-value="3-${item.id}">服务员角色</div>
									<div class="item" data-value="4-${item.id}">前台角色</div>
								</div>
							</div>
						</td>
						<td class="">${item.date_time}</td>
						<td class=""><a class="ui red label"
							onclick="deleteRoleHandler('${item.id}')">删除</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<div class="ui modal czsDelete">
		<div class="header">确认提示</div>
		<div class="content">
			<div class="left">
				<i class="warning icon"></i>
			</div>
			<div class="right" style="font-size: 30px;">
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

	<script type="text/javascript">
		var _id;
		function deleteRoleHandler(id) {
			_id = id;
			$('.ui.modal.czsDelete').modal('show');
		}

		jQuery(function($) {

			$('table').tablesort().data('tablesort');

			$('#menu-item-business-role-mgr').addClass('active');

			$('.ui.dropdown').dropdown({
				onChange : function(value, text) {
					$.post('business/setRole.do', {
						id : value.split('-')[1],
						type : value.split('-')[0],
					}, function(msg) {
						if (msg.succeed) {
							//alert('设置成功!');
						} else {
							alert(msg.msg.detail);
						}
					});
				}
			});

			$('.ui.modal.czsDelete').modal({
				closable : false,
				onApprove : function() {
					$.post('business/deleteRole.do', {
						id : _id
					}, function(msg) {
						if (msg.succeed) {
							$('#item-tr-' + _id).remove();
							return true;
						} else {
							alert(msg.msg.detail);
						}
					});
				}
			});

		});
	</script>
</body>
</html>
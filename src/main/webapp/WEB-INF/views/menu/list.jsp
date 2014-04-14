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
<title>餐助手-商家服务</title>
<link href="../../../resources/semantic/css/semantic.min.css"
	rel="stylesheet" type="text/css">
<script src="../../../resources/js/lib/jquery-2.0.2.min.js"
	charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.min.js"
	charset="utf-8"></script>
</head>
<body style="margin: 0px; padding: 0px;">
	<!-- 侧边栏 -->
	<%@ include file="../menu.jsp"%>

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">菜品一览</h4>

	<div class="ui fluid accordion">

		<c:forEach items="${menuList}" var="item">
			<div class="title" id="menu-item-title-${item.id}">
				<i class="dropdown icon"></i> ${item.name}<a class="ui red label"
					style="float: right; margin-right: 10px;"
					href="javascript:void(0);"
					onclick="menuDeleteHandler('${item.id}');">删除</a> <a
					class="ui purple label" style="float: right; margin-right: 10px;"
					href="menu/update.do?id=${item.id}">修改</a>
			</div>
			<div class="content" id="menu-item-content-${item.id}">
				<img class="ui large image left floated" src="../../../${item.path}640/${item.file_name}">

				<div style="padding-bottom: 10px;">
					<b>分类:</b>${item.category}&nbsp;&nbsp;&nbsp;&nbsp;<b>口味:</b>${item.taste}
				</div>
				<div style="padding-bottom: 10px;">
					<b>价格:</b>${item.price}&nbsp;&nbsp;&nbsp;&nbsp;<b>优惠:</b>
					<c:choose>
						<c:when test="${item.privilege < 1}">
							<c:out value="${item.privilege * 10}"></c:out>折
						</c:when>
						<c:otherwise>
							${item.privilege}
						</c:otherwise>
					</c:choose>
				</div>
				<div style="padding-bottom: 10px;">
					<b>添加时间:</b>
					<fmt:formatDate value="${item.date_time}"
						pattern="yyyy/MM/dd hh:mm:ss" />
				</div>

				<p>
					<b>介绍:</b>${item.introduce}
				</p>
				<div style="clear: both;"></div>
			</div>
		</c:forEach>
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
			$('#menu-item-menu-list').addClass('active');
			$('.ui.accordion').accordion();

			$('#confirm-ui-modal').modal({
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
								$('#menu-item-title-' + deleteMenuId).remove();
								$('#menu-item-content-' + deleteMenuId).remove();
								return true;
							} else {
								alert('删除失败!')
								return false;
							}
						}
					});
				}
			});
		});
	</script>
</body>
</html>
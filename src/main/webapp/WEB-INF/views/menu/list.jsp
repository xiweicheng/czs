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
<title>餐助手-商家自助后台</title>
<link href="../../../resources/semantic/css/semantic.min.css"
	rel="stylesheet" type="text/css">
<link href="../../../resources/upload/css/main.css" rel="stylesheet"
	type="text/css">
<script src="../../../resources/js/lib/jquery-1.10.2.min.js"
	charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.min.js"
	charset="utf-8"></script>
<script src="../../../resources/upload/js/script.js" charset="utf-8"></script>
</head>
<body style="margin: 0px; padding: 0px;">
	<!-- 侧边栏 -->
	<%@ include file="../menu.jsp"%>

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">菜单一览</h4>

	<div class="ui fluid accordion">

		<c:forEach items="${menuList}" var="item">
			<div class="title" data-menu-id="${item.id}">
				<i class="dropdown icon"></i> ${item.name}
			</div>
			<div class="content">
				<img class="ui large image left floated"
					src="../../../${item.path}">

				<div>
					<b>分类:</b>${item.category}&nbsp;&nbsp;&nbsp;&nbsp;<b>口味:</b>${item.taste}&nbsp;&nbsp;&nbsp;&nbsp;<b>添加时间:</b>${item.date_time}
				</div>
				<div>
					<b>价格:</b>${item.price}&nbsp;&nbsp;&nbsp;&nbsp;<b>优惠:</b>${item.privilege}
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

	<script type="text/javascript">
		jQuery(function($) {
			$('#menu-item-menu-list').addClass('active');
			$('.ui.accordion').accordion("setting", {
				onOpen : function() {
					//alert("open...");
					$.post('menu/detail.do', {}, function() {
					});
				}
			});
		});
	</script>
</body>
</html>
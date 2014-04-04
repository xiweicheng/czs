<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<link href="../../../resources/semantic/css/semantic.min.css"
	rel="stylesheet" type="text/css">
<script src="../../../resources/js/lib/jquery-1.10.2.min.js"
	charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.js"
	charset="utf-8"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>餐助手-商家自助后台</title>
</head>
<body style="margin: 0px; padding: 0px;">

	<!-- header -->
	<div class="ui fixed transparent inverted main menu" style="top: 0px;">
		<div class="container">
			<!-- <a class="launch item"><i class="icon list layout"></i></a> -->
			<div class="title item">
				<b>餐助手</b> 商家自助管理后台
			</div>
		</div>
	</div>

	<h4 class="ui top attached header" style="margin-top: 45px;">菜单点菜</h4>
	<div class="ui segment attached">
		<div class="ui fluid accordion">

			<c:forEach items="${menuList}" var="item">
				<div class="title" id="menu-item-title-${item.id}">
					<i class="dropdown icon"></i> ${item.name}<a
						href="javascript:void(0);"
						onclick="billDealHandler('${item.id}', '${param.openId}', '0')"
						style="float: right; margin-right: 10px;">待定</a> <a
						href="javascript:void(0);"
						onclick="billDealHandler('${item.id}', '${param.openId}', '1')"
						style="float: right; margin-right: 10px;">定了</a>
				</div>
				<div class="content" id="menu-item-content-${item.id}">
					<img class="ui large image left floated"
						src="../../../${item.path}">

					<div style="padding-bottom: 10px;">
						<b>分类:</b>${item.category}&nbsp;&nbsp;&nbsp;&nbsp;<b>口味:</b>${item.taste}
					</div>
					<div style="padding-bottom: 10px;">
						<b>价格:</b>${item.price}&nbsp;&nbsp;&nbsp;&nbsp;<b>优惠:</b>${item.privilege}
					</div>
					<p>
						<b>介绍:</b>${item.introduce}
					</p>
					<div style="clear: both;"></div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<script type="text/javascript">
		function billDealHandler(menuId, consumerId, status) {
			$.post('menu/free/billDeal.do', {
				menuId : menuId,
				consumerId : consumerId,
				status : status
			}, function(msg) {
				if (msg.succeed) {
					alert('操作成功!')
				} else {
					alert('操作失败!')
				}
			});
		}
		jQuery(function($) {
			$('.ui.accordion').accordion();
		});
	</script>
</body>
</html>
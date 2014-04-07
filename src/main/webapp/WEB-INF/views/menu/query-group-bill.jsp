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

	<!-- 侧边栏 -->
	<%@ include file="../menu2.jsp"%>

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">${title} - 共<span style="color:red;">${total}</span>元</h4>
	<div class="ui segment attached">
		<div class="ui segment">
			<div class="ui toggle checkbox">
				<input type="checkbox" name="mode" id="mode-ui-checkbox"> <label
					for="check3">图文模式</label>
			</div>
		</div>
		<div class="ui stackable items" id="bill-group-query-ui-stackable-items">
			<c:forEach items="${billList}" var="item">
				<div class="item" id="bill-item-${item.menu_id}"
					style="min-height: 0px;">
					<div class="image" style="display: none;">
						<img src="../../../${item.path}">
						<!-- <a
							class="like ui corner label"> <i class="like icon"></i> -->
						</a>
					</div>
					<div class="content">
						<div class="name">${item.name}</div>
						<p class="description" style="display: none;">${item.introduce}</p>
						<div style="padding-bottom: 10px;">
							价格:${item.price} | 优惠:
							<c:if test="${item.privilege < 1}">${item.privilege * 10}折</c:if>
							<c:if test="${item.privilege >= 1}">${item.privilege}</c:if>
							<br /> 分类:${item.category} | 口味:${item.taste}
						</div>
						<div class="ui divider"></div>
						<div>
							<c:forEach items="${item.menuBill}" var="item2">
								<c:if test="${item2.status == 1}">[${item2.nickname}]定了${item2.copies}份!<br/></c:if>
								<c:if test="${item2.status == 0}">[${item2.nickname}]待定中!<br/></c:if>
								<c:if test="${item2.status == 2}">[${item2.nickname}]已退订!<br/></c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<script type="text/javascript">
		jQuery(function($) {
			$('#menu-item-group-${type}-bill').addClass('active');
		});
		
		$('.ui.checkbox').checkbox({
			onEnable : function() {
				$('#bill-group-query-ui-stackable-items').find('div[class="image"]').show();
			},
			onDisable : function() {
				$('#bill-group-query-ui-stackable-items').find('div[class="image"]').hide();
			}
		});
	</script>
</body>
</html>
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
<script src="../../../resources/js/lib/jquery-1.10.2.min.js"
	charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.min.js"
	charset="utf-8"></script>
<script src="../../../resources/js/lib/jquery.tmpl.min.js"
	charset="utf-8"></script>

<script id="imageItemTpl" type="text/x-jquery-tmpl">

</script>
</head>
<body style="margin: 0px; padding: 0px;">
	<!-- 侧边栏 -->
	<%@ include file="../menu.jsp"%>

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">二维码配置</h4>
	<a id="error-msg-anchor"></a>

	<div class="ui segment attached">
		<form action="qrcode/create.do" id="add-qrcode-form">
			<div class="ui warning form segment" id='add-menu-ui-form'>
				<div class="ui error message" id="add-menu-ui-message"></div>
				<div class="field">
					<label>说明</label> <input placeholder="输入说明" type="text"
						name="description">
				</div>
				<div class="field">
					<label>分类</label>
					<div class="ui fluid selection dropdown">
						<div class="text">选择...</div>
						<i class="dropdown icon"></i> <input type="hidden"
							name="categoryId">
						<div class="menu" id="category-menu-items">
							<c:forEach items="${categoryList}" var="item">
								<div class="item" data-value="${item.id}">${item.name }</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="ui blue submit button" id="add-menu-btn">添加</div>
			</div>
		</form>
	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<script type="text/javascript">
		jQuery(function($) {
			$('#menu-item-qrcode-main').addClass('active');

			$('.ui.dropdown').dropdown();

			$('#add-menu-ui-form').form({
				name : {
					identifier : 'description',
					rules : [ {
						type : 'empty',
						prompt : '请输入说明!'
					} ]
				},
				category : {
					identifier : 'categoryId',
					rules : [ {
						type : 'empty',
						prompt : '请选择分类!'
					} ]
				}
			});

			$('#add-menu-ui-form').form('setting', {
				onSuccess : function() {
					$('#add-qrcode-form').submit();
				},
				onFailure : function() {
					$("html,body").animate({
						scrollTop : $("#error-msg-anchor").offset().top
					}, 500);
				}
			});
		});
	</script>
</body>
</html>
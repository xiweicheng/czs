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
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
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

	<h4 class="ui top attached header" style="margin-top: 45px;">二维码配置</h4>
	<a id="error-msg-anchor"></a>

	<div class="ui segment attached">
		<form action="qrcode/create.do" id="add-qrcode-form" method="post">
			<div class="ui warning form segment" id='add-menu-ui-form'>
				<div class="ui error message" id="add-menu-ui-message"></div>
				<div class="two fields">
					<div class="field">
						<label>描述</label> <input placeholder="输入说明" type="text"
							name="description">
					</div>
					<div class="field">
						<div class="ui blue button czsAdd" onclick="addHandler(this);"
							style="margin-top: 20px;">添加</div>
						<div class="ui blue button czsDelete"
							style="display: none; margin-top: 20px;"
							onclick="deleteHandler(this);">删除</div>
					</div>
				</div>
				<div class="two fields">
					<div class="field">
						<label>分类</label>
						<div class="ui fluid selection dropdown">
							<div class="text">选择...</div>
							<i class="dropdown icon"></i> <input type="hidden"
								name="categoryId" value="1">
							<div class="menu" id="category-menu-items">
								<c:forEach items="${categoryList}" var="item">
									<div class="item" data-value="${item.id}">${item.name }</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="field"></div>
				</div>
				<div class="ui blue submit button" id="add-menu-btn">生成</div>
			</div>
		</form>
	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<script type="text/javascript">
		function addHandler(_this) {
			var twoFields = $(_this).parent().parent();
			twoFields.clone().insertAfter(twoFields).find('.czsDelete').show();
		}
		function deleteHandler(_this) {
			$(_this).parent().parent().remove();
		}

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
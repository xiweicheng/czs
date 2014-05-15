<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>餐助手-商家服务</title>

<link href="../../../resources/semantic/css/semantic.min.css" rel="stylesheet" type="text/css">
<link href="../../../resources/colorbox/css/colorbox.css" rel="stylesheet" type="text/css">

<script src="../../../resources/js/lib/jquery-2.0.2.min.js" charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.min.js" charset="utf-8"></script>
<script src="../../../resources/colorbox/js/jquery.colorbox-min.js" charset="utf-8"></script>
<script src="../../../resources/colorbox/i18n/jquery.colorbox-zh-CN.js" charset="utf-8"></script>
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

	<h4 class="ui top attached header" style="margin-top: 45px;">二维码发送</h4>
	<a id="error-msg-anchor"></a>

	<div class="ui segment attached">

		<div class="ui stackable items">
			<c:forEach items="${qrcodeList}" var="item">
				<div class="item" style="min-height: 0px;">
					<div class="image">
						<img src="../../../${item.path}">
					</div>
					<div class="content">
						<div class="name" style="text-align: center;">${item.description}</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<form id="add-qrcode-form">
			<c:forEach items="${qrcodeList}" var="item">
				<input type="hidden" name="filePath" value="${item.path}">
			</c:forEach>
			<div class="ui warning form segment" id='add-menu-ui-form'>
				<div class="ui error message" id="add-menu-ui-message"></div>
				<div class="field">
					<label>E-mail</label> <input placeholder="输入E-mail" type="text" name="mail" value="${business.mail}">
				</div>
				<div class="ui blue submit button" id="add-menu-btn">发送</div>
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
					identifier : 'mail',
					rules : [ {
						type : 'email',
						prompt : '请输入E-mail!'
					} ]
				}
			});

			$('#add-menu-ui-form').form('setting', {
				onSuccess : function() {
					$.post('qrcode/sendMailZip.do', $('#add-qrcode-form').serialize(), function(msg) {
						if (msg.succeed) {
							$.colorbox({
								html : '<h3 class="ui header">发送成功!</h3>'
							});
						} else {
							$.colorbox({
								html : '<h3 class="ui red header">发送失败!</h3>'
							});
						}
					});
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
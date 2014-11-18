<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<link href="resources/semantic/css/semantic.min.css" rel="stylesheet" type="text/css">

<script src="resources/js/lib/jquery-2.0.2.min.js" charset="utf-8"></script>
<script src="resources/semantic/javascript/semantic.min.js" charset="utf-8"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>餐助手-商家服务</title>
<script type="text/javascript">
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideToolbar');
		WeixinJSBridge.call('hideOptionMenu');
	});
</script>
</head>
<body style="margin: 0px; padding: 0px;">

	<div class="ui dimmer">
		<div class="content" style="display: none;">
			<div class="center"></div>
		</div>
	</div>

	<div>
		<h4 class="ui top attached header" style="margin-top: 0px;">商家信息完善</h4>
		<a id="error-msg-anchor"></a>

		<div class="ui segment attached">
			<form>
				<input type="hidden" name="openId" value="${business.openId}">
				<div class="ui warning form segment" style="margin-top: 0px;">
					<div class="ui error message"></div>
					<div class="field">
						<label>店名</label> <input placeholder="店名" type="text" name="name" value="${business.name}">
					</div>
					<div class="field">
						<label>地址</label> <input placeholder="地址" type="text" name="address" value="${business.address}">
					</div>
					<div class="field">
						<label>电话</label> <input placeholder="电话" type="text" name="phoneNumber" value="${business.phoneNumber}">
					</div>
					<div class="field">
						<label>E-mail</label> <input placeholder="E-mail" type="text" name="mail" value="${business.mail}"
							autocomplete="off">
					</div>
					<div class="field">
						<label>介绍</label>
						<textarea name="introduce">${business.introduce}</textarea>
					</div>
					<div class="field">
						<div style="text-align: center;">
							<div class="ui blue submit button">提交</div>
						</div>
					</div>
				</div>
			</form>
		</div>

		<!-- footer -->
		<%@ include file="../footer.jsp"%>
	</div>

	<script type="text/javascript">
		jQuery(function($) {

			$('.ui.form').form({
				name : {
					identifier : 'name',
					rules : [ {
						type : 'empty',
						prompt : '请输入店名!'
					} ]
				},
				address : {
					identifier : 'address',
					rules : [ {
						type : 'empty',
						prompt : '请输入地址!'
					} ]
				},
				phoneNumber : {
					identifier : 'phoneNumber',
					rules : [ {
						type : 'empty',
						prompt : '请输入电话!'
					} ]
				},
				mail : {
					identifier : 'mail',
					rules : [ {
						type : 'email',
						prompt : '请输入正确格式E-mail!'
					} ]
				}
			});

			$('.ui.form').form('setting', {
				onSuccess : function() {
					$.post('business/free/update2.do', $('form').serialize(), function(data) {
						if (data.succeed) {
							alert('操作成功!');
						} else {
							alert('操作失败!');
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
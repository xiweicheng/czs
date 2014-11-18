<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- head common -->
<%@ include file="../common.jsp"%>
<title>餐助手-商家服务</title>
</head>
<body style="margin: 0px; padding: 0px;">

	<!-- message -->
	<div style="display: none;">
		<div id="succeed-msg">
			<div class="ui icon green message">
				<i class="info icon"></i>
				<div class="content">
					<div class="header">操作成功!</div>
				</div>
			</div>
		</div>
		<div id="fail-msg">
			<div class="ui icon red message">
				<i class="info icon"></i>
				<div class="content">
					<div class="header">操作失败!</div>
					<p></p>
				</div>
			</div>
		</div>
	</div>

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
						<img src="${item.path}">
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
								inline : true,
								href : '#succeed-msg',
								onOpen : function() {
								},
								onClosed : function() {
								}
							});
						} else {
							$('#fail-msg p').text(msg.msg.detail);
							$.colorbox({
								inline : true,
								href : '#fail-msg',
								onOpen : function() {
								},
								onClosed : function() {
								}
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
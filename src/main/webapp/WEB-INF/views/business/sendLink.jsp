<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- head common -->
<%@ include file="../common.jsp"%>
<title>餐助手-商家服务</title>
</head>
<body style="margin: 0px; padding: 0px;">

	<!-- header -->
	<div class="ui fixed transparent inverted main menu" style="top: 0px;">
		<div class="container">
			<div class="title item">
				<b>餐助手</b> 商家自助管理后台
			</div>
		</div>
	</div>

	<h4 class="ui top attached header" style="margin-top: 45px;">登录链接发送</h4>
	<div class="ui segment attached">
		<form action="business/free/sendMail.do" id="send-mail-form" method="post">
			<input type="hidden" name="openId" value="${business.openId}">
			<div class="ui warning form segment" id='send-link-ui-form'>
				<div class="ui error message" id="add-menu-ui-message"></div>
				<div class="field">
					<label>E-mail</label> <input placeholder="E-mail" type="text" name="mail" value="${business.mail}">
				</div>
				<div class="ui blue submit button">发送到邮箱</div>
			</div>
		</form>
	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<script type="text/javascript">
		jQuery(function($) {

			$('#send-link-ui-form').form({
				mail : {
					identifier : 'mail',
					rules : [ {
						type : 'email',
						prompt : '请输入E-mail!'
					} ]
				}
			}).form('setting', {
				onSuccess : function() {
					$('#send-mail-form').submit();
				},
				onFailure : function() {
				}
			});
		});
	</script>
</body>
</html>
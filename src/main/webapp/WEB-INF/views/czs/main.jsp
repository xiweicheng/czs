<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- head common -->
<%@ include file="common.jsp"%>
<title>餐助手-平台服务</title>
</head>
<body style="margin: 0px; padding: 0px;">

	<div class="ui dimmer czsMsg">
		<div class="content" style="display: none;">
			<div class="center">
				<div class="ui huge message">
					<span></span>
				</div>
			</div>
		</div>
	</div>

	<!-- 侧边栏 -->
	<%@ include file="menu.jsp"%>

	<!-- header -->
	<%@ include file="header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">基本信息</h4>
	<div class="ui segment attached"></div>

	<!-- footer -->
	<%@ include file="footer.jsp"%>

	<script type="text/javascript">
		jQuery(function($) {

			$('.ui.dimmer.czsMsg').click(function() {
				$('.ui.dimmer.czsMsg > .content').hide();
			});

			$('#menu-item-czs-main').addClass('active');
		});
	</script>
</body>
</html>
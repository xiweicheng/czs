<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body style="margin: 0px; padding: 0px;">

	<!-- header -->
	<div class="ui fixed transparent inverted main menu" style="top: 0px;">
		<div class="container czzTopMenu" style="margin-left: 0px;">
			<a class="launch item"><i class="icon list layout"></i> 侧边菜单</a>
			<div class="title item">
				<b>餐助手</b> 商家管理后台
			</div>
		</div>
	</div>


	<script type="text/javascript">
		jQuery(function($) {
			$('.launch.item').click(function() {
				$('.ui.left.sidebar').sidebar("toggle");
			});
		});
	</script>
</body>
</html>
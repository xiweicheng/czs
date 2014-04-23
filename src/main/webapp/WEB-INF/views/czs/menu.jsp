<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body style="margin: 0px; padding: 0px;">
	<!-- sidebar -->
	<div class="ui left vertical menu thin sidebar">
		<div class="header item">
			<i class="icon list layout"></i>侧边测单
		</div>
		<div class="header item">
			<i class="user icon"></i> 平台管理
		</div>
		<a class="item" href="czs/main.do" id="menu-item-czs-main">
	</div>
	<script type="text/javascript">
		jQuery(function($) {

			$('.ui.left.sidebar').sidebar({
				overlay : true
			});

			try {
				if (/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) {
					$('.ui.left.sidebar').sidebar("hide");
				} else {
					$('.ui.left.sidebar').sidebar('hide');
				}
			} catch (e) {
				$('.ui.left.sidebar').sidebar('hide');
			}
		});
	</script>
</body>
</html>
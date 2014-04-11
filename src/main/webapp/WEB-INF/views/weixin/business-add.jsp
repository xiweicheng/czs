<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>入驻说明</title>
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.css" />
<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.js"></script>
<script type="text/javascript">
	jQuery(function($) {
		$('a').click(function() {
			window.location.href = $(this).attr('czs-url');
		});
	});
</script>
</head>
<body>
	<!-- Home -->
	<div data-role="page" id="v_business-add">
		<div id="v001_pageHeader" data-theme="a" data-role="header"
			data-position="fixed">
			<h1 id="v001_heading">餐助手</h1>
		</div>
		<div data-role="content">
			<h3>入驻为商家后,即可享受我们平台提供的便捷顾客与商家的优质桥梁服务!</h3>
			<div>
				<div>
					<a href="#" czs-url="${url}" data-role="button"> 确定入驻 </a>
				</div>
			</div>
		</div>
		<div data-theme="a" data-role="footer" data-position="fixed">
			<h3>餐助手-版权所有</h3>
		</div>
	</div>
</body>
</html> --%>
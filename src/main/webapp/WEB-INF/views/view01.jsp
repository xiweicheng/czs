<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>测试页面</title>
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.css" />
	<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.js"></script>
</head>
<body>
<div data-role="page">

	<div data-role="header">
		<h1>${title}</h1>
	</div><!-- /header -->

	<div data-role="content">	
		<p><a href='${webpageCodeGetUrl}'>${webpageCodeGetUrl}</a></p>		
	
	<ul data-role="listview" data-inset="true" data-filter="true">
		<li><a href="#">Acura</a></li>
		<li><a href="#">Audi</a></li>
		<li><a href="#">BMW</a></li>
		<li><a href="#">Cadillac</a></li>
		<li><a href="#">Ferrari</a></li>
		<li><a href="#">Java</a></li>
	</ul>
	</div><!-- /content -->

</div><!-- /page -->
</body>
</html>
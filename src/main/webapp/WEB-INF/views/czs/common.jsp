<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />

<link rel="shortcut icon" href="resources/img/canzs_128.png">

<link href="resources/semantic/css/semantic.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/common.css" rel="stylesheet" type="text/css">
<link href="resources/datetimepicker/css/jquery.simple-dtpicker.css" rel="stylesheet" type="text/css">
<link href="resources/colorbox/css/colorbox.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="resources/js/lib/jquery-2.0.2.min.js" charset="utf-8"></script>
<script type="text/javascript" src="resources/js/lib/jquery-migrate-1.2.1.min.js" charset="utf-8"></script>
<script type="text/javascript" src="resources/js/lib/jquery.tablesort.min.js" charset="utf-8"></script>
<script type="text/javascript" src="resources/semantic/javascript/semantic.min.js" charset="utf-8"></script>
<script type="text/javascript" src="resources/datetimepicker/js/jquery.simple-dtpicker.js" charset="utf-8"></script>
<script type="text/javascript" src="resources/js/lib/date.format.js" charset="utf-8"></script>
<script type="text/javascript" src="resources/js/lib/jquery.tmpl.min.js" charset="utf-8"></script>
<script type="text/javascript" src="resources/colorbox/js/jquery.colorbox-min.js" charset="utf-8"></script>

<script type="text/javascript">
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideToolbar');
		WeixinJSBridge.call('hideOptionMenu');
	});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		
	});
</script>
</head>
<body>
<div>code: ${param.code}</div>
<div>state: ${param.state}</div>
<br/>
<div>access_token: ${accessToken.access_token}</div>
<div>expires_in: ${accessToken.expires_in}</div>
<div>refresh_token: ${accessToken.refresh_token}</div>
<div>openid: ${accessToken.openid}</div>
<div>scope: ${accessToken.scope}</div>

</body>
</html>
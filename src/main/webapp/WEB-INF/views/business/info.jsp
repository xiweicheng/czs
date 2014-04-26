<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="../../../resources/semantic/css/semantic.min.css"
	rel="stylesheet" type="text/css">
<script src="../../../resources/js/lib/jquery-1.10.2.min.js"
	charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.min.js"
	charset="utf-8"></script>
<script type="text/javascript">
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideToolbar');
	});
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>餐助手-推荐商家信息</title>
</head>
<body style="margin: 0px; padding: 0px;">

	<h4 class="ui top attached header" style="margin-top: 0px;">商家信息</h4>
	<div class="ui segment attached">

		<div class="ui segment">

			<div class="ui red label" id="store-ui-label-0"
				<c:if test="${storeStatus != '0' }"> style="display: none" </c:if>
				onclick="storeHandler('0', '${business.openId}', '${consumerId}')">
				<a class="detail"><i class="cart icon"></i> 加入收藏</a>
			</div>

			<div class="ui red label" id="store-ui-label-6"
				<c:if test="${storeStatus != '1' }"> style="display: none" </c:if>
				onclick="storeHandler('6', '${business.openId}', '${consumerId}')">
				<a class="detail"><i class="cart icon"></i> 取消收藏 </a>
			</div>

			<c:if test="${dislikeStatus == '0' }">
				<div class="ui red label" id="store-ui-label-3"
					style="float: right; margin-left: 10px;"
					onclick="storeHandler('3', '${business.openId}', '${consumerId}')">
					<a class="detail"><i class="thumbs down icon"></i> <span>${dislikeCount}</span></a>
				</div>
			</c:if>
			<c:if test="${dislikeStatus == '1' }">
				<div class="ui label" id="store-ui-label-3"
					style="float: right; margin-left: 10px;">
					<a class="detail"><i class="thumbs down icon"></i> <span>${dislikeCount}</span></a>
				</div>
			</c:if>
			<c:if test="${likeStatus == '0' }">
				<div class="ui red label" id="store-ui-label-2"
					style="float: right;"
					onclick="storeHandler('2', '${business.openId}', '${consumerId}')">
					<a class="detail"><i class="thumbs up icon"></i> <span>${likeCount}</span></a>
				</div>
			</c:if>
			<c:if test="${likeStatus == '1' }">
				<div class="ui label" id="store-ui-label-2" style="float: right;">
					<a class="detail"><i class="thumbs up icon"></i> <span>${likeCount}</span></a>
				</div>
			</c:if>
		</div>

		<div class="ui relaxed celled list">
			<div class="item">
				<i class="user outline icon"></i>
				<div class="content">
					<div class="header">店名</div>
					${business.name}
				</div>
			</div>
			<div class="item">
				<i class="home outline icon"></i>
				<div class="content">
					<div class="header">地址</div>
					${business.address}
				</div>
			</div>
			<div class="item">
				<i class="phone outline icon"></i>
				<div class="content">
					<div class="header">电话</div>
					${business.phoneNumber}
				</div>
			</div>
			<div class="item">
				<i class="mail outline icon"></i>
				<div class="content">
					<div class="header">E-mail</div>
					${business.mail}
				</div>
			</div>
			<div class="item">
				<i class="comment outline icon"></i>
				<div class="content">
					<div class="header">介绍</div>
					${business.introduce}
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<script type="text/javascript">
		function storeHandler(type, businessId, consumerId) {
			$.post('user/free/store.do', {
				type : type,
				openId : consumerId,
				refId : businessId
			}, function(msg) {
				if (msg.succeed) {

					if (type == 0) {
						$('#store-ui-label-0').hide();
						$('#store-ui-label-6').show();
					} else if (type == 6) {
						$('#store-ui-label-6').hide();
						$('#store-ui-label-0').show();
					} else {
						$('#store-ui-label-' + type).removeClass('red');
						$('#store-ui-label-' + type).find('span').text(
								Number($('#store-ui-label-' + type).find('span').text()) + 1);
					}
				} else {
					alert('操作失败!');
				}
			});
		}

		jQuery(function($) {
		});
	</script>
</body>
</html>
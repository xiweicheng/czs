<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>餐助手-顾客服务</title>

<link href="../../../resources/semantic/css/semantic.min.css" rel="stylesheet" type="text/css">

<script src="../../../resources/js/lib/jquery-2.0.2.min.js" charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.min.js" charset="utf-8"></script>

<script type="text/javascript">
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideToolbar');
		WeixinJSBridge.call('hideOptionMenu');
	});
</script>
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

	<div>
		<h4 class="ui top attached header" style="margin-top: 0px;">
			收藏商家
			<div class="circular ui red label">${fn:length(list)}个</div>
			<div class="ui small button czsOpen" czs-status="0" style="position: absolute; top: 2px; right: 2px;">展开</div>
		</h4>
		<div class="ui segment attached" style="padding: 0px;">
			<table class="ui sortable table segment" style="display: table;">
				<thead>
					<tr>
						<th class="">店名</th>
						<th class="">电话</th>
						<th class="">地址</th>
						<th class="">介绍</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="item">
						<tr id="item-tr-${item.id}" class="item-tr-${item.id}">
							<td class="">
								<div class="ui basic accordion" style="width: 100%; margin-bottom: 0px;">
									<div class="title" style="padding: 0px;">
										<i class="dropdown icon"></i>${item.name}</div>
									<div class="content">
										<div class="ui mini list">
											<div class="item">
												<i class="user outline icon"></i>
												<div class="content" style="padding-top: 0px; padding-bottom: 0px;">
													<div class="header">店名</div>
													${item.name}
												</div>
											</div>
											<div class="item">
												<i class="home outline icon"></i>
												<div class="content" style="padding-top: 0px; padding-bottom: 0px;">
													<div class="header">地址</div>
													${item.address}
												</div>
											</div>
											<div class="item">
												<i class="phone outline icon"></i>
												<div class="content" style="padding-top: 0px; padding-bottom: 0px;">
													<div class="header">电话</div>
													${item.phone_number}
												</div>
											</div>
											<div class="item">
												<i class="comment outline icon"></i>
												<div class="content" style="padding-top: 0px; padding-bottom: 0px;">
													<div class="header">介绍</div>
													${item.introduce}
												</div>
											</div>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<script type="text/javascript">
		jQuery(function($) {
			$('.ui.accordion').accordion();

			$('.ui.button.czsOpen').click(function() {
				if ($(this).attr('czs-status') == '0') {
					$(this).attr('czs-status', '1').addClass('green');
					$('.ui.accordion > .title').addClass('active');
					$('.ui.accordion > .content').addClass('active');
				} else {
					$(this).attr('czs-status', '0').removeClass('green');
					$('.ui.accordion > .title').removeClass('active');
					$('.ui.accordion > .content').removeClass('active');
				}
			});
		});
	</script>
</body>
</html>
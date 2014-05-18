<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- head common -->
<%@ include file="../common.jsp"%>
<title>餐助手-顾客服务</title>
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

	<h4 class="ui top attached header" style="margin-top: 0px;">
		前台管理
		<div class="circular ui red label">个</div>
	</h4>
	<div class="ui segment attached" style="padding: 5px;">
		<div class="ui left aligned one column grid">
			<div class="row">
				<div class="column">
					<div class="ui vertical fluid menu czsMenuList"></div>
				</div>
			</div>
		</div>
	</div>

	<!-- 菜品添加弹出框 -->
	<div class="ui small modal czsAdd">
		<i class="close icon"></i>
		<div class="header">确认提示</div>
		<div class="content">
			<div class="ui message" style="text-align: center;">
				<div class="ui huge green label">
					<i class="cart icon"></i> <span id="czsCountSpan">1</span>
					<div class="detail">
						<i class="yen icon"></i><span id="czsTotalSpan">300.00</span>
					</div>
				</div>
			</div>
			<div class="2 fluid ui huge buttons">
				<div class="fluid ui button czsReduce">减一份</div>
				<div class="or"></div>
				<div class="fluid ui button czsAdd">加一份</div>
			</div>
		</div>
		<div class="actions">
			<div class="two fluid ui buttons">
				<div class="ui negative labeled icon button">
					<i class="remove icon"></i> 取消
				</div>
				<div class="ui positive right labeled icon button">
					确认 <i class="checkmark icon"></i>
				</div>
			</div>
		</div>
	</div>

	<div style="height: 44px;"></div>
	<!-- bottom header -->
	<div class="ui fixed bottom inverted fluid three item menu">
		<a class="item" href=""><i class="icon align justify"></i>顾客确认 </a> <a class="item" href=""><i class="icon heart"></i>顾客请求</a>
	</div>

	<script type="text/javascript">
		jQuery(function($) {

		});
	</script>
</body>
</html>
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>餐助手-商家自助后台</title>
</head>
<body style="margin: 0px; padding: 0px;">
	<!-- 侧边栏 -->
	<%@ include file="../menu.jsp"%>

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">基本信息</h4>
	<div class="ui segment attached">
		<div class="ui button" id="business-update-ui-btn">修改信息</div>
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


	<!-- 信息修改modal -->
	<div class="ui modal" id="business-update-modal">
		<i class="close icon"></i>
		<div class="header">信息修改</div>
		<div class="content" style="padding-top:0px; padding-bottom:0px;">
			<form action="business/update.do" id="business-update-form">
				<input type="hidden" name="openId" value="${business.openId}">
				<div class="ui warning form segment" id='business-update-ui-form'>
					<div class="ui error message" id="add-menu-ui-message"></div>
					<div class="field">
						<label>菜名</label> <input placeholder="店名" type="text" name="name"
							value="${business.name}">
					</div>
					<div class="field">
						<label>地址</label> <input placeholder="地址" type="text"
							name="address" value="${business.address}">
					</div>
					<div class="field">
						<label>电话</label> <input placeholder="电话" type="text"
							name="phoneNumber" value="${business.phoneNumber}">
					</div>
					<div class="field">
						<label>E-mail</label> <input placeholder="E-mail" type="text"
							name="mail" value="${business.mail}">
					</div>
					<div class="field">
						<label>介绍</label>
						<textarea name="introduce">${business.introduce}</textarea>
					</div>
					<!-- <div class="ui blue submit button" id="business-update-submit-btn">修改</div> -->
				</div>
			</form>
		</div>
		<div class="actions">
			<div class="two fluid ui buttons">
				<div class="ui deny labeled icon button">
					<i class="remove icon"></i> 取消
				</div>
				<div class="ui approve right labeled icon button">
					确定 <i class="checkmark icon"></i>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		jQuery(function($) {
			$('#menu-item-business-main').addClass('active');

			$('#business-update-modal').modal({
				closable : false,
				onDeny : function() {
					return true;
				},
				onApprove : function() {
					$('#business-update-form').submit();
				}
			}).modal('attach events', '#business-update-ui-btn', 'show');

			$('#business-update-ui-form').form({
				name : {
					identifier : 'name',
					rules : [ {
						type : 'empty',
						prompt : '请输入店名!'
					} ]
				},
				address : {
					identifier : 'address',
					rules : [ {
						type : 'empty',
						prompt : '请输入地址!'
					} ]
				},
				phoneNumber : {
					identifier : 'phoneNumber',
					rules : [ {
						type : 'empty',
						prompt : '请输入电话!'
					} ]
				},
				introduce : {
					identifier : 'introduce',
					rules : [ {
						type : 'empty',
						prompt : '请输入介绍!'
					} ]
				}
			});

			/* $('#business-update-ui-form').form('setting', {
				onSuccess : function() {
				},
				onFailure : function() {
				}
			}); */
		});
	</script>
</body>
</html>
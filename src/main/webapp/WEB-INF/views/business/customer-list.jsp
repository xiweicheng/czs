<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script src="../../../resources/js/lib/jquery.tablesort.min.js"
	charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.js"
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

	<h4 class="ui top attached header" style="margin-top: 45px;">顾客一览</h4>
	<div class="ui segment attached">
		<!-- <div class="ui button" id="business-update-ui-btn">修改信息</div> -->
		<table class="ui sortable table segment" style="display: table;">
			<thead>
				<tr>
					<th class="">头像</th>
					<th class="">名称</th>
					<th class="">性别</th>
					<th class="">状态</th>
					<th class="">消费次数</th>
					<th class="sorted descending">最后消费时间</th>
					<th class="">位置描述</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${customerList}" var="item">
					<tr>
						<td><img class="ui avatar image" src="${item.headimgurl}"></td>
						<td class="">${item.nickname}</td>
						<td class=""><c:if test="${item.sex=='2'}">女</c:if> <c:if
								test="${item.sex=='1'}">男</c:if> <c:if
								test="${item.sex=='0'}">未知</c:if></td>
						<td class=""><c:if test="${item.status=='0'}"><i class="stop icon"></i>消费终止</c:if> <c:if
								test="${item.status=='1'}"><i class="play icon"></i>消费中</c:if> <c:if
								test="${item.status=='2'}"><i class="ban circle icon"></i>消费禁止</c:if></td>
						<td class="">${item.consume_times}</td>
						<td class=""><fmt:formatDate
								value="${item.last_consume_time}" pattern="yyyy/MM/dd hh:mm:ss" /></td>
						<td class="">${item.description}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<th>消费中 ${ongoing} 人</th>
					<th>消费禁止 ${disabled} 人</th>
					<th>消费终止 ${over} 人</th>
					<th>总计 ${total} 人</th>
				</tr>
			</tfoot>
		</table>
	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>


	<%-- <!-- 信息修改modal -->
	<div class="ui modal" id="business-update-modal">
		<i class="close icon"></i>
		<div class="header">信息修改</div>
		<div class="content" style="padding-top: 0px; padding-bottom: 0px;">
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
	</div> --%>

	<script type="text/javascript">
		jQuery(function($) {

			$('table').tablesort().data('tablesort');

			$('#menu-item-business-list').addClass('active');

			/* $('#business-update-modal').modal({
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
			}); */

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
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>餐助手-商家服务</title>
<link href="../../../resources/semantic/css/semantic.min.css"
	rel="stylesheet" type="text/css">
<script src="../../../resources/js/lib/jquery-2.0.2.min.js"
	charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.min.js"
	charset="utf-8"></script>
</head>
<body style="margin: 0px; padding: 0px;">
	<!-- 侧边栏 -->
	<%@ include file="../menu.jsp"%>

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">二维码一览
		- 共${total}个</h4>
	<a id="error-msg-anchor"></a>

	<div class="ui segment attached">
		<div class="ui stackable items">
			<c:forEach items="${qrcodeList}" var="item">
				<div class="item" style="min-height: 0px;">
					<div class="image">
						<img src="../../../${item.filePath}">
					</div>
					<div class="content">
						<div class="name" style="text-align: center;"
							id="qrcode-desc-div-${item.id}">${item.description}</div>
						<div class="extra">使用次数:${item.useTimes}
							限制次数:${item.useLimit}</div>
						<div class="czsEditBtn" style="display: none; position: absolute; right:0px;">
							<div class="ui green button" onclick="editHander('${item.id}')">编辑描述</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<!-- 菜单口味modal -->
	<div class="ui small modal" id="edit-desc-modal">
		<i class="close icon"></i>
		<div class="header">编辑描述</div>
		<div class="content">
			<div class="ui form">
				<div class="field">
					<label>输入描述</label> <input type="text" id="desc-text">
				</div>
			</div>
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
		var _id;
		function editHander(id) {
			_id = id;
			$('#desc-text').val($('#qrcode-desc-div-' + _id).text());
			$('#edit-desc-modal').modal('show');
		}

		jQuery(function($) {
			$('#menu-item-qrcode-list').addClass('active');

			$('#edit-desc-modal').modal({
				closable : false,
				onDeny : function() {
					return true;
				},
				onApprove : function() {
					var desc = $('#desc-text').val();
					if (!desc) {// 不能为空
						return false;
					}
					$.post('qrcode/update.do', {
						id : _id,
						description : desc
					}, function(data) {
						if (data.succeed) {
							$('#qrcode-desc-div-' + _id).text(desc);
						} else {
							alert(data.msg.detail);
						}
					});
				}
			});

			$('.ui.stackable.items').children('.item').hover(function() {
				$(this).find('.czsEditBtn').show();
			}, function() {
				$(this).find('.czsEditBtn').hide();
			});
		});
	</script>
</body>
</html>
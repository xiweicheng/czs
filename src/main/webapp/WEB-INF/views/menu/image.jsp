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
<link href="../../../resources/upload/css/main.css" rel="stylesheet"
	type="text/css">
<script src="../../../resources/js/lib/jquery-2.0.2.min.js"
	charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.min.js"
	charset="utf-8"></script>
<script src="../../../resources/upload/js/script.js" charset="utf-8"></script>
</head>
<body style="margin: 0px; padding: 0px;">
	<!-- 侧边栏 -->
	<%@ include file="../menu.jsp"%>

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">菜品图片</h4>

	<div class="ui fluid accordion">
		<div class="title">
			<i class="dropdown icon"></i> 图片上传
		</div>
		<div class="content">
			<div id="container">
				<div class="upload_form_cont">
					<form id="upload_form" enctype="multipart/form-data" method="post"
						action="menu/upload.do">
						<div>
							<input type="file" name="image_file" id="image_file"
								onchange="fileSelected();" />
						</div>
						<div>
							<div style="float: left;">
								<div class="ui green button" onclick="startUploading()">上传</div>
								<div id="fileinfo">
									<div id="filename"></div>
									<div id="filesize"></div>
									<div id="filetype"></div>
									<div id="filedim"></div>
								</div>
							</div>
							<img id="preview" />
							<div style="clear: both;"></div>
						</div>

						<div id="error">你应该只选择有效的图像文件!</div>
						<div id="error2">在上传文件时发生了一个错误!</div>
						<div id="abort">上传已由用户或浏览器取消!</div>
						<div id="warnsize">你的文件是非常大的,我们不能接受,请选择更小的文件!</div>

						<div id="progress_info">
							<div id="progress"></div>
							<div id="progress_percent">&nbsp;</div>
							<div class="clear_both"></div>
							<div>
								<div id="speed">&nbsp;</div>
								<div id="remaining">&nbsp;</div>
								<div id="b_transfered">&nbsp;</div>
								<div class="clear_both"></div>
							</div>
							<div id="upload_response"></div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="active title">
			<i class="dropdown icon"></i> 图片一览
		</div>
		<div class="active content">
			<div class="ui stackable items">
				<c:forEach items="${imageList}" var="item">
					<div class="item" style="min-height: 0px;"
						id="image-item-${item.id}">
						<div class="image">
							<img src="../../../${item.path}640/${item.fileName}"> <a
								class="like ui corner label"
								onclick="deleteHandler('${item.id}');"> <i
								class="remove icon"></i>
							</a>
						</div>
						<div class="content" style="display: block;">
							<div class="meta">
								<fmt:formatDate value="${item.dateTime}" pattern="yyyy/MM/dd" />
							</div>
							<div class="name">${item.name }</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<div class="ui modal" id="confirm-ui-modal">
		<div class="header">确认提示</div>
		<div class="content">
			<div class="left">
				<i class="warning icon"></i>
			</div>
			<div class="right" style="font-size: 30px;">
				<p>确认要删除吗?</p>
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

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<script type="text/javascript">
		// 删除image id.
		var deleteImgId;
		// 删除选择图片
		function deleteHandler(id) {
			deleteImgId = id;
			$('#confirm-ui-modal').modal('show');
		}

		jQuery(function($) {
			$('#menu-item-menu-image').addClass('active');
			$('.ui.accordion').accordion();

			$('#confirm-ui-modal').modal({
				closable : false,
				onApprove : function() {
					$.ajax({
						type : "POST",
						url : 'resources/delete.do',
						contentType : 'application/json',
						processData : false,
						dataType : "json",
						data : JSON.stringify({
							params : {
								id : deleteImgId
							}
						}),
						success : function(msg) {
							if (msg.succeed) {
								$('#image-item-' + deleteImgId).remove();
								return true;
							} else {
								alert('删除失败!')
								return false;
							}
						}
					});
				}
			});
		});
	</script>
</body>
</html>
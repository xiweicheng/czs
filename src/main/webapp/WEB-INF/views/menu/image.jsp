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
<title>餐助手-商家自助后台</title>
<link href="../../../resources/semantic/css/semantic.min.css"
	rel="stylesheet" type="text/css">
<link href="../../../resources/upload/css/main.css" rel="stylesheet"
	type="text/css">
<script src="../../../resources/js/lib/jquery-1.10.2.min.js"
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

	<h4 class="ui top attached header" style="margin-top: 45px;">菜单图片</h4>

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
							<div>
								<input type="file" name="image_file" id="image_file"
									onchange="fileSelected();" />
							</div>
						</div>
						<div>
							<input id="upload_button" type="button" value="上传"
								onclick="startUploading()" />
						</div>
						<div id="fileinfo">
							<div id="filename"></div>
							<div id="filesize"></div>
							<div id="filetype"></div>
							<div id="filedim"></div>
						</div>
						<div id="error">You should select valid image files only!</div>
						<div id="error2">An error occurred while uploading the file</div>
						<div id="abort">The upload has been canceled by the user or
							the browser dropped the connection</div>
						<div id="warnsize">Your file is very big. We can't accept
							it. Please select more small file</div>

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

					<img id="preview" />
				</div>
			</div>
		</div>
		<div class="active title">
			<i class="dropdown icon"></i> 图片一览
		</div>
		<div class="active content">
			<div class="ui stackable items">
				<c:forEach items="${imageList}" var="item">
					<div class="item" style="min-height: 0px;" id="image-item-${item.id}">
						<div class="image">
							<img src="../../../${item.path}"> <a
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

	<div class="ui basic modal" id="confirm-ui-modal">
		<div class="header">确认提示</div>
		<div class="content">
			<div class="left">
				<i class="warning icon"></i>
			</div>
			<div class="right">
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
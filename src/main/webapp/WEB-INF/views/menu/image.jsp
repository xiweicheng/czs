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
<meta name="viewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>餐助手-商家服务</title>
<link href="../../../resources/semantic/css/semantic.min.css"
	rel="stylesheet" type="text/css">
<script src="../../../resources/js/lib/jquery-2.0.2.min.js"
	charset="utf-8"></script>
<script src="../../../resources/js/lib/jquery.html5uploader.min.js"
	charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.min.js"
	charset="utf-8"></script>
<script type="text/javascript">
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideToolbar');
		WeixinJSBridge.call('hideOptionMenu');
	});
</script>
</head>
<body style="margin: 0px; padding: 0px;">
	<!-- 侧边栏 -->
	<%@ include file="../menu.jsp"%>

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">菜品图片</h4>

	<div class="ui segment">
		<h2>图片上传</h2>
		<div class="ui message segment">
			<p><b>说明:</b>选择文件或者直接拖拽文件到当前页面上!</p>
		</div>
		<form enctype="multipart/form-data" method="post"
			action="menu/upload.do">
			<input type="file" name="image_file" id="image_file"
				style="font-size: 20px;" />
		</form>
	</div>

	<div class="ui segment">
		<h2>图片一览</h2>
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

	<div class="ui small modal" id="confirm-ui-modal">
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


	<div class="ui page dimmer upload">
		<div class="content">
			<div class="center">
				<div class="ui medium image">
					<img>
				</div>
				<div class="ui green striped progress">
					<div class="bar">文件上传中...</div>
				</div>
			</div>
		</div>
	</div>

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

			$('.ui.page.dimmer.upload').click(function() {
				window.location.reload();
			});

			$("body, #image_file").html5Uploader({
				name : "image_file",
				postUrl : "menu/upload.do",
				onClientLoadStart : function(e, file) {
					$('.ui.page.dimmer.upload').dimmer('show');
					var filter = /^(image\/bmp|image\/gif|image\/jpeg|image\/png|image\/tiff)$/i;
					if (!filter.test(file.type)) {
						$('.ui.progress > .bar').text('不是可识别的图片类型文件!');
					}
				},
				onClientLoad : function(e, file) {
					$('.ui.page.dimmer.upload img').attr('src', e.target.result);
				},
				onServerLoadStart : function(e, file) {
					$('.ui.progress > .bar').css('width', 0);
				},
				onServerProgress : function(e, file) {
					if (e.lengthComputable) {
						var percentComplete = (e.loaded / e.total) * 100;
						$('.ui.progress > .bar').css('width', percentComplete + '%');
					}
				},
				onServerLoad : function(e, file) {
					$('.ui.progress > .bar').css('width', '100%');
					$('.ui.progress > .bar').text('文件上传完毕!');
				},
				onServerError : function(e, file) {
					$('.ui.progress > .bar').text('');
				},
				onSuccess : function(e, file, msg) {
					var json = $.parseJSON(msg);
					if (json.succeed) {
						$('.ui.progress > .bar').text('文件上传完毕!');
					} else {
						$('.ui.progress > .bar').text(json.msg.detail);
					}
				}
			});
		});
	</script>
</body>
</html>
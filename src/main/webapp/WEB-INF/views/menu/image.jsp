<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- head common -->
<%@ include file="../common.jsp"%>
<title>餐助手-商家服务</title>

<script src="resources/js/lib/jquery.html5uploader.min.js" charset="utf-8"></script>
</head>
<body style="margin: 0px; padding: 0px;">

	<div class="ui dimmer czsUpload">
		<div class="content" style="display: none;">
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

	<!-- 侧边栏 -->
	<%@ include file="../menu.jsp"%>

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">菜品图片</h4>

	<div class="ui segment" style="overflow: hidden;">
		<h2>图片上传</h2>
		<div class="ui message segment">
			<p>
				<b>说明:</b>选择文件或者直接拖拽文件到当前页面上!
			</p>
		</div>
		<form enctype="multipart/form-data" method="post" action="menu/upload.do">
			<input type="file" name="image_file" id="image_file" style="font-size: 20px;" />
		</form>
	</div>

	<div class="ui segment">
		<h2>
			图片一览
			<div class="circular ui red label">${fn:length(imageList)}张</div>
		</h2>
		<div class="ui stackable items">
			<c:forEach items="${imageList}" var="item">
				<div class="item" style="min-height: 0px;" id="image-item-${item.id}">
					<div class="image">
						<img src="${item.path}640/${item.fileName}"> <a class="like ui corner label"
							onclick="deleteHandler('${item.id}');"> <i class="remove icon"></i>
						</a>
					</div>
					<div class="content" style="display: block;">
						<div class="meta">
							<fmt:formatDate value="${item.dateTime}" pattern="yyyy/MM/dd" />
						</div>
						<div class="name" id="image-name-${item.id}">${item.name }</div>
						<div class="czsEditBtn" style="display: none; position: absolute; right: 0px;">
							<div class="ui green button" onclick="editHander('${item.id}')">编辑描述</div>
						</div>
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

	<!-- 菜单口味modal -->
	<div class="ui small modal" id="edit-desc-modal">
		<i class="close icon"></i>
		<div class="header">编辑描述</div>
		<div class="content" style="padding: 8px;">
			<div class="ui form">
				<div class="field">
					<input type="text" id="desc-text">
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
			$('#desc-text').val($('#image-name-' + _id).text()).focus();
			$('#edit-desc-modal').modal('show');
		}

		// 删除选择图片
		function deleteHandler(id) {
			_id = id;
			$('#confirm-ui-modal').modal('show');
		}

		jQuery(function($) {
			$('#menu-item-menu-image').addClass('active');

			$('.ui.dimmer.czsUpload').dimmer({
				onHide : function() {
					$('.ui.dimmer.czsUpload > .content').hide();
				}
			});

			$('#edit-desc-modal').modal('setting', {
				onApprove : function() {
					var desc = $('#desc-text').val();
					if (!desc) {// 不能为空
						return false;
					}
					$.post('resources/update.do', {
						id : _id,
						name : desc
					}, function(data) {
						if (data.succeed) {
							$('#image-name-' + _id).text(desc);
						} else {
							TINY.box.show({
								html : '操作失败!<br/>失败信息:' + msg.msg.detail,
								animate : false,
								close : false,
								boxid : 'error',
								topsplit : 3
							});
						}
					});
				}
			});

			$('#confirm-ui-modal').modal('setting', {
				onApprove : function() {
					$.post('resources/delete.do', {
						id : _id
					}, function(msg) {
						if (msg.succeed) {
							$('#image-item-' + _id).remove();
						} else {
							$.colorbox({
								html : '<h3 class="ui red header">操作失败!<br/>失败信息:' + msg.msg.detail + '</h3>'
							});
						}
					});
				}
			});

			$("body, #image_file").html5Uploader({
				name : "image_file",
				postUrl : "menu/upload.do",
				onClientLoadStart : function(e, file) {
					$('.ui.dimmer.czsUpload > .content').show();
					$('.ui.dimmer.czsUpload').dimmer('show');

					$('.ui.dimmer.czsUpload').one("click", function() {
						window.location.reload();
					});
					var filter = /^(image\/bmp|image\/gif|image\/jpeg|image\/png|image\/tiff)$/i;
					if (!filter.test(file.type)) {
						$('.ui.progress > .bar').text('不是可识别的图片类型文件!');
					}
				},
				onClientLoad : function(e, file) {
					$('.ui.dimmer.czsUpload img').attr('src', e.target.result);
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

			$('.ui.stackable.items').children('.item').hover(function() {
				$(this).find('.czsEditBtn').show();
			}, function() {
				$(this).find('.czsEditBtn').hide();
			});
		});
	</script>
</body>
</html>
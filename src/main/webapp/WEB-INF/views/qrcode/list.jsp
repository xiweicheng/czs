<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- head common -->
<%@ include file="../common.jsp"%>
<title>餐助手-商家服务</title>
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

	<!-- 侧边栏 -->
	<%@ include file="../menu.jsp"%>

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">
		二维码一览
		<div class="circular ui red label">${fn:length(qrcodeList)}个</div>
	</h4>
	<a id="error-msg-anchor"></a>

	<div class="ui segment attached">
		<div class="ui stackable items">
			<c:forEach items="${qrcodeList}" var="item">
				<div class="item" style="min-height: 0px;">
					<div class="image">
						<img src="../../../${item.file_path}">
					</div>
					<div class="content">
						<div class="name" style="text-align: center;" id="qrcode-desc-div-${item.id}">${item.description}</div>
						<div class="extra">
							使用次数:${item.use_times} 限制次数:<span id="use-limit-span-${item.id}">${item.use_limit}</span>
						</div>
						<div class="meta">${item.name}</div>
						<div class="czsEditBtn" style="display: none; position: absolute; right: 0px;">
							<div class="ui small green button" onclick="editHander('${item.id}')">编辑描述</div>
						</div>
						<div class="czsLimitBtn" style="display: none; position: absolute; left: 0px;">
							<div class="ui small green button" onclick="limitHander('${item.id}')">增加限制次数</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<!-- 编辑描述modal -->
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

	<!-- 增加限制使用次数modal -->
	<div class="ui small modal" id="add-limit-modal">
		<i class="close icon"></i>
		<div class="header">增加二维码使用限制数</div>
		<div class="content">
			<div class="ui form">
				<div class="field">
					<label>输入增加限制数</label> <input type="text" id="limit-text" maxlength="10">
					<div style="margin-top: 10px;">
						<div class="ui red label">兑换率:一次/10餐豆值</div>
					</div>
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
		function limitHander(id) {
			_id = id;
			$('#add-limit-modal').modal('show');
		}

		jQuery(function($) {

			$('.ui.dimmer.czsMsg').click(function() {
				$('.ui.dimmer.czsMsg > .content').hide();
			});

			$('#menu-item-qrcode-list').addClass('active');

			$('#edit-desc-modal').modal('setting', {
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
							$.colorbox({
								html : '<h3 class="ui red header">操作失败!<br/>失败信息:' + msg.msg.detail + '</h3>'
							});
						}
					});
				}
			});
			$('#add-limit-modal').modal('setting', {
				onApprove : function() {
					var val = $('#limit-text').val();
					if (!val) {// 不能为空
						return false;
					}
					$.post('qrcode/addUseLimit.do', {
						id : _id,
						addVal : val
					}, function(data) {
						if (data.succeed) {
							$('#use-limit-span-' + _id).text(Number($('#use-limit-span-' + _id).text()) + Number(val));
							$.colorbox({
								html : '<h3>增加成功!</h3>'
							});
						} else {
							$.colorbox({
								html : '<h3 class="ui red header">操作失败!<br/>失败信息:' + msg.msg.detail + '</h3>'
							});
						}
					});
				}
			});

			$('.ui.stackable.items').children('.item').hover(function() {
				$(this).find('.czsEditBtn').show();
				$(this).find('.czsLimitBtn').show();
			}, function() {
				$(this).find('.czsEditBtn').hide();
				$(this).find('.czsLimitBtn').hide();
			});
		});
	</script>
</body>
</html>
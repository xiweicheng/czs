<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="ui fixed transparent inverted main menu" style="top: 0px;">
	<div class="" style="">
		<a class="launch item"><i class="icon list"></i></a>
		<div class="title item">
			<b>餐助手</b> 商家管理后台
		</div>
		<div class="right menu">
			<a class="czsPopup icon item czsComment" data-content="建议留言"> <i class="basic comment icon"></i>
			</a> <a class="czsPopup icon item czsHelp" data-content="帮助"> <i class="basic help icon"></i>
			</a>
		</div>
	</div>
</div>

<div class="ui small modal czsComment">
	<i class="close icon"></i>
	<div class="header">建议留言</div>
	<div class="content">
		<form class="ui reply form" id="czs-reply-form">
			<div class="field">
				<textarea id="comment-textarea" name="content"></textarea>
			</div>
		</form>
	</div>
	<div class="actions">
		<div class="two fluid ui buttons">
			<div class="ui deny labeled icon button">
				<i class="remove icon"></i> 取消
			</div>
			<div class="ui approve right labeled icon button czsComment">
				确定 <i class="checkmark icon"></i>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	jQuery(function($) {
		$('.launch.item').click(function() {
			$('.ui.left.sidebar').sidebar("toggle");
		});
		$('.ui.modal.czsComment').modal('setting', {
			onApprove : function() {
				if (!$('#comment-textarea').val()) {
					return false;
				}
				$.post('czs/free/commentSubmit.do', $('#czs-reply-form').serialize(), function(msg) {
					if (msg.succeed) {
						$('#comment-textarea').val('');
						$.colorbox({
							width : '400px',
							html : "<h2>操作成功!</h2>"
						});
					} else {
						alert("操作失败,失败信息:" + msg.msg.detail);
						$.colorbox({
							width : '400px',
							html : "<h2>操作失败!</h2><br/><p>" + msg.msg.detail + "</p>"
						});
					}
				}, 'json');
			}
		});

		$('.item.czsComment').click(function() {
			$('.ui.modal.czsComment').modal('show');
		});

		$('.item.czsHelp').click(function() {

		});
	});
</script>
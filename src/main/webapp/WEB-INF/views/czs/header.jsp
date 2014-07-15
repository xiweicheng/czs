<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<div class="ui fixed transparent inverted main menu" style="top: 0px;">
	<div class="">
		<a class="launch item"><i class="icon list layout"></i> 侧边菜单</a>
		<div class="title item">
			<b>餐助手</b> 平台管理后台
		</div>
	</div>
</div>

<script type="text/javascript">
	jQuery(function($) {
		$('.launch.item').click(function() {
			$('.ui.left.sidebar').sidebar("toggle");
		});
	});
</script>
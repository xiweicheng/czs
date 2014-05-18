<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- sidebar -->
<div class="ui left vertical menu thin sidebar">
	<!-- <div class="header item">
			<i class="icon list layout"></i>侧边测单
		</div> -->
	<div class="header item">
		<i class="user icon"></i> 平台管理
	</div>
	<a class="item" href="czs/main.do" id="menu-item-czs-main">基本信息</a> <a class="item" href="czs/businessMgr.do?status=0"
		id="menu-item-czs-business-mgr">商家一览</a> <a class="item" href="czs/userMgr.do" id="menu-item-czs-user-mgr">用户一览</a><a
		class="item" href="czs/qrcodeMgr.do" id="menu-item-czs-qrcode-mgr">二维码一览</a>
</div>
<script type="text/javascript">
	jQuery(function($) {

		$('.ui.left.sidebar').sidebar({
			overlay : true
		});

		try {
			if (/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) {
				$('.ui.left.sidebar').sidebar("hide");
			} else {
				$('.ui.left.sidebar').sidebar('hide');
			}
		} catch (e) {
			$('.ui.left.sidebar').sidebar('hide');
		}
	});
</script>
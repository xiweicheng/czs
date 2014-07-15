<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="ui left inverted vertical menu sidebar" style="max-width: 233px;">
	<div class="" style="padding: 20px 15px;">
		<div class="">
			<a class="avatar" style="float: left;" href="http://www.canzs.cn" target="_blank"> <img class="circular ui image"
				style="width: 52px;" src="../../resources/img/canzs_128.png"></a>

			<div style="float: left; font-size: 15px; padding-left: 10px; padding-top: 5px;">
				<div>
					<a class="" style="color: #1f90c8;" href="business/main.do" id="login-business-name-a"></a>
				</div>
				<div class="" style="margin-top: 10px; color: #FFF; cursor: pointer;">
					<a class="czsPopup" style="text-decoration: none; color: #FFF;" href="http://www.canzs.cn" target="_blank"
						data-content="主页" data-variation="small"> <i class="home icon"></i>
					</a> <a class="czsPopup" style="text-decoration: none; color: #FFF;" data-content="仪表盘" data-variation="small"> <i
						class="dashboard icon"></i>
					</a> <a class="czsPopup" style="text-decoration: none; color: #FFF;" data-content="充值" data-variation="small"> <i
						class="yen icon"></i>
					</a> <a class="czsPopup" style="text-decoration: none; color: #FFF;" href="business/logout.do" data-content="退出"
						data-variation="small"> <i class="off icon"></i>
					</a>
				</div>
			</div>
			<div style="clear: both;"></div>
		</div>
	</div>
	<div class="header item">
		<i class="user icon"></i> 商家管理
	</div>
	<a class="item" href="business/main.do" id="menu-item-business-main"> 基本信息 </a><a class="item"
		href="business/roleMgr.do" id="menu-item-business-role-mgr"> 角色分配 </a><a class="item"
		href="business/list.do?filterOver=1&request=0" id="menu-item-business-list">顾客一览 </a><a class="item"
		href="business/listMsg.do?status=0" id="menu-item-business-listMsg">顾客消息 </a><a class="item"
		href="business/listService.do?status=1" id="menu-item-business-listService">服务请求 </a> <a class="item"
		href="business/billSett.do?status=0" id="menu-item-bill-sett"> 账目结算 </a>
	<div class="header item">
		<i class="cart icon"></i> 订单管理
	</div>
	<a class="item" href="menu/orderList.do" id="menu-item-order-list"> 订单一览 </a><a class="item"
		href="menu/orderHistory.do?status=3" id="menu-item-order-history"> 历史订单 </a>
	<div class="header item">
		<i class="book icon"></i> 菜品管理
	</div>
	<a class="item" href="menu/list.do#menu-item-menu-list" id="menu-item-menu-list"> 菜品一览 </a> <a class="item"
		href="menu/input.do#menu-item-menu-input" id="menu-item-menu-input"> 菜品添加 </a> <a class="item"
		href="menu/image.do#menu-item-menu-image" id="menu-item-menu-image"> 菜品图片 </a>
	<div class="header item">
		<i class="qr code icon"></i> 二维码
	</div>
	<!-- <a class="item" href="qrcode/buy.do#menu-item-qrcode-buy"
			id="menu-item-qrcode-buy"> 二维码购买</a>  -->
	<a class="item" href="qrcode/download.do#menu-item-qrcode-main" id="menu-item-qrcode-main"> 二维码生成</a> <a class="item"
		href="qrcode/list.do#menu-item-qrcode-list" id="menu-item-qrcode-list"> 二维码一览</a>
	<div class="header item">
		<i class="dashboard icon"></i> 统计分析
	</div>
	<a class="item" href="business/menuStat.do#menu-item-business-menu-stat" id="menu-item-business-menu-stat"> 菜品统计 </a><a
		class="item" href="business/consumerStat.do#menu-item-business-consumer-stat" id="menu-item-business-consumer-stat">
		顾客统计 </a><a class="item" href="business/serviceStat.do#menu-item-business-service-stat"
		id="menu-item-business-service-stat"> 服务统计 </a> <a class="item"
		href="business/volumeStat.do#menu-item-business-volume-stat" id="menu-item-business-volume-stat"> 营业额统计 </a>
</div>

<script type="text/javascript">
	jQuery(function($) {

		$('.ui.left.sidebar').sidebar({
		//overlay : true
		});

		$('.czsPopup').popup({
			inline : true
		});

		try {
			if (/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) {
				$('.ui.left.sidebar').sidebar("hide");
			} else {
				$('.ui.left.sidebar').sidebar('show');
			}
		} catch (e) {
			$('.ui.left.sidebar').sidebar('hide');
		}

		$.post('business/getInfo.do', {}, function(msg) {
			if (msg.succeed) {
				$('#login-business-name-a').text(msg.value.nickname);
			}
		});
	});
</script>
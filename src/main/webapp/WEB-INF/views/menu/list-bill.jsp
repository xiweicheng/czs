<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<link href="../../../resources/semantic/css/semantic.min.css"
	rel="stylesheet" type="text/css">
<script src="../../../resources/js/lib/jquery-2.0.2.min.js"
	charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.min.js"
	charset="utf-8"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>餐助手-顾客服务</title>
<script type="text/javascript">
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideToolbar');
		WeixinJSBridge.call('hideOptionMenu');
	});
</script>
</head>
<body style="margin: 0px; padding: 0px;">

	<h4 class="ui top attached header" style="margin-top: 44px;">
		我的菜单
		<div class="ui toggle checkbox" style="margin-left: 10px;">
			<input type="checkbox" name="mode" id="mode-ui-checkbox"> <label
				for="">图文模式</label>
		</div>
	</h4>

	<!-- top header -->
	<div class="ui fixed top inverted fluid three item menu">
		<form action="menu/free/list4bill.do" id="filter-form" method="post">
			<input type="hidden" name="openId" value="${openId}">
			<div class="ui dropdown item czsCategory">
				<input type="hidden" name="categoryId"
					value="${selectedCategoryId }">
				<div class="default text">分类</div>
				<i class="dropdown icon"></i>
				<div class="menu">
					<div class="item" data-value="-1">全部</div>
					<c:forEach items="${categoryList }" var="item">
						<div class="item" data-value="${item.id }">${item.name }</div>
					</c:forEach>
				</div>
			</div>
			<div class="ui dropdown item czsTaste">
				<input type="hidden" name="tasteId" value="${selectedTasteId }">
				<div class="default text">口味</div>
				<i class="dropdown icon"></i>
				<div class="menu">
					<div class="item" data-value="-1">全部</div>
					<c:forEach items="${tasteList }" var="item">
						<div class="item" data-value="${item.id }">${item.name }</div>
					</c:forEach>
				</div>
			</div>
			<div class="ui dropdown item czsOrder">
				<input type="hidden" name="order" value="${order}">
				<div class="default text">排序</div>
				<i class="dropdown icon"></i>
				<div class="menu">
					<div class="item" data-value="-1">随机</div>
					<div class="item" data-value="1">价格升序</div>
					<div class="item" data-value="2">价格降序</div>
					<div class="item" data-value="3">点击人气</div>
				</div>
			</div>
		</form>
	</div>

	<div class="ui stackable items" id="bill-list-ui-stackable-items">
		<c:forEach items="${menuList}" var="item">
			<div class="item" style="min-height: 1px;">
				<div class="image" style="display: none" id="image-div-${item.id}">
					<img src="" czz-src="../../../${item.path}640/${item.file_name}">
					<c:if test="${item.status == 1}">
						<a class="like ui corner label"> <i class="checkmark icon"></i>
					</c:if>
					<c:if test="${item.status == 0}">
						<a class="like ui corner label"> <i class="heart empty icon"></i>
					</c:if>
					</a>
				</div>
				<div class="content">
					<div class="name">${item.name}
					<div class="ui label" onclick="imageHandler('${item.id}')"><i class="photo icon"></i></div>
						<div class="ui label" onclick="introduceHandler('${item.id}')"><i class="comment icon"></i></div>
					<div
							class="floating ui red circular label">${item.order_times}</div>
					</div>
					<p class="description" style="display: none;" id="introduce-p-${item.id}">${item.introduce}</p>
					<div style="margin-top: 10px; margin-bottom: 10px;">
						<div class="ui red label">
							<i class="yen icon"></i> ${item.price}
						</div>
						<div class="ui green label">${item.category}</div>
						<div class="ui blue label">${item.taste}</div>
					</div>
					<div class="2 fluid ui buttons">
						<div
							class="positive ui button <c:if test="${item.status == 1 || item.status == 3}">disabled</c:if>"
							id="confirm-ui-btn-${item.id}"
							<c:if test="${item.status != 1 && item.status != 3}">onclick="billAddDealHandler(this, '${item.id}', '${openId}', ${item.price}, '${item.name}')"</c:if>>
							<i class="checkmark icon"></i>定了
						</div>
						<div class="or"></div>
						<div
							class="negative ui button <c:if test="${item.status == 0 || item.status == 1 || item.status == 3}">disabled</c:if>"
							id="hold-ui-btn-${item.id}"
							<c:if test="${item.status != 0 && item.status != 1 && item.status != 3}">onclick="billDealHandler(this, '${item.id}', '${openId}')"</c:if>>
							<i class="heart empty icon"></i>收藏
						</div>
					</div>
					<div style="margin-top: 10px;" class="czsCopies">
						<c:forEach items="${item.menuBill}" var="item2">
							<c:if test="${item2.status == 1 || item2.status == 3}">
								<div class="ui label"
									style="margin-top: 5px; margin-bottom: 5px;">
									<c:if test="${item.consumer_id == item2.consumer_id}">自己</c:if>
									<c:if test="${item.consumer_id != item2.consumer_id}">${item2.nickname}</c:if>
									<div class="detail">${item2.copies}</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<div style="height: 44px;"></div>
	<!-- bottom header -->
	<div class="ui fixed bottom inverted fluid three item menu">
		<a class="item"
			href="menu/free/billQuery.do?status=1&isOwn=1&consumerId=${openId}"><i
			class="icon yen"></i><span id="bill-total-span">${total}</span></a> <a
			class="item" href="menu/free/list4bill.do?openId=${openId}"><i
			class="icon align justify"></i>商家菜单</a> <a class="item"
			href="menu/free/billQuery.do?status=0&isOwn=1&consumerId=${openId}"><i
			class="icon heart"></i>收藏菜品</a>
	</div>

	<div class="ui small modal czsAdd">
		<i class="close icon"></i>
		<div class="header">确认提示</div>
		<div class="content">
			<div class="ui message" style="text-align: center;">
				<a class="ui huge purple circular label"><i class="cart icon"></i>
					<span id="czsCountSpan">1</span></a><a
					class="ui huge red circular label"><i class="yen icon"></i>
					<span id="czsTotalSpan"></span></a>
			</div>
			<div class="2 fluid ui huge buttons">
				<div class="negative fluid ui button czsReduce">减一份</div>
				<div class="or"></div>
				<div class="positive fluid ui button czsAdd">加一份</div>
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

	<script type="text/javascript">
		var _menuId;
		var _consumerId;
		var _price;
		var _this;
		
		function imageHandler(id){
			$('#image-div-' + id + " > img").each(function(){
				$(this).attr('src', $(this).attr('czz-src'));
			});
			$('#image-div-' + id).toggle();
		}
		
		function introduceHandler(id){
			$('#introduce-p-' + id).toggle();
		}

		function format_number(pnumber, decimals) {
			if (isNaN(pnumber)) {
				return 0
			}
			if (pnumber == '') {
				return 0
			}

			var snum = new String(pnumber);
			var sec = snum.split('.');
			var whole = parseFloat(sec[0]);
			var result = '';

			if (sec.length > 1) {
				var dec = new String(sec[1]);
				dec = String(parseFloat(sec[1]) / Math.pow(10, (dec.length - decimals)));
				dec = String(whole + Math.round(parseFloat(dec)) / Math.pow(10, decimals));
				var dot = dec.indexOf('.');
				if (dot == -1) {
					dec += '.';
					dot = dec.indexOf('.');
				}
				while (dec.length <= dot + decimals) {
					dec += '0';
				}
				result = dec;
			} else {
				var dot;
				var dec = new String(whole);
				dec += '.';
				dot = dec.indexOf('.');
				while (dec.length <= dot + decimals) {
					dec += '0';
				}
				result = dec;
			}
			return result;
		}

		function billAddDealHandler(_this, menuId, consumerId, price, name) {
			if ($(_this).attr('class').indexOf('disabled') > -1) {
				return;
			}

			_menuId = menuId;
			_consumerId = consumerId;
			_price = price;
			_this = _this;

			$('.ui.modal.czsAdd > .header').text(name);
			$('#czsCountSpan').text(1);
			$('#czsTotalSpan').text(_price, 2);
			$('.ui.modal.czsAdd').modal('show');

		}

		function billDealHandler(_this, menuId, consumerId) {
			if ($(_this).attr('class').indexOf('disabled') > -1) {
				return;
			}

			$.post('menu/free/billDeal.do', {
				menuId : menuId,
				consumerId : consumerId,
				status : 0
			}, function(msg) {
				if (msg.succeed) {
					$('#hold-ui-btn-' + menuId).addClass('disabled');
				} else {
					alert('操作失败!')
				}
			});
		}
		jQuery(function($) {

			$('.ui.dropdown').dropdown({
				onChange : function(value, text) {
					$('#filter-form').submit();
				}
			});

			$('.ui.button.czsReduce').click(function() {
				var num = Number($('#czsCountSpan').text());
				if (num > 1) {
					$('#czsCountSpan').text(num - 1);
					$('#czsTotalSpan').text(format_number((num - 1) * _price, 2));
				}
			});
			$('.ui.button.czsAdd').click(function() {
				var num = Number($('#czsCountSpan').text()) + 1;
				$('#czsCountSpan').text(num);
				$('#czsTotalSpan').text(format_number(num * _price, 2));
			});

			$('.ui.modal.czsAdd').modal(
					{
						onApprove : function() {

							var copies = Number($('#czsCountSpan').text());
							$.post('menu/free/billDeal.do', {
								menuId : _menuId,
								consumerId : _consumerId,
								copies : copies,
								status : 1
							}, function(msg) {
								if (msg.succeed) {
									$('#confirm-ui-btn-' + _menuId).addClass('disabled');
									$('#hold-ui-btn-' + _menuId).addClass('disabled');
									$('#confirm-ui-btn-' + _menuId).parent().next().append(
											'<div class="ui label" style="margin-top: 5px; margin-bottom: 5px;">自己<div class="detail">'
													+ copies + '</div></div>');

									$('#bill-total-span').text(
											format_number(Number($('#bill-total-span').text()) + Number(_price)
													* copies, 2))

								} else {
									alert('操作失败!')
								}
							});
						}
					});

			$('.ui.checkbox').checkbox(
					{
						onEnable : function() {
							$('#bill-list-ui-stackable-items').find('div[class="image"]').show().end().find('img')
									.each(function() {
										$(this).attr('src', $(this).attr('czz-src'));
									});
						},
						onDisable : function() {
							$('#bill-list-ui-stackable-items').find('div[class="image"]').hide();
						}
					});

			(function() {
				if ('${mode}' == 'on') {
					$('#mode-ui-checkbox').attr('checked', "checked");
					$('#bill-list-ui-stackable-items').find('div[class="image"]').show().end().find('img').each(
							function() {
								$(this).attr('src', $(this).attr('czz-src'));
							});
				} else {
					$('#bill-list-ui-stackable-items').find('div[class="image"]').hide();
				}
			})();

		});
	</script>
</body>
</html>
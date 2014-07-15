<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>餐助手-顾客服务</title>

<link href="../../../resources/semantic/css/semantic.min.css" rel="stylesheet" type="text/css">
<link href="../../../resources/scrollup/css/themes/image.css" rel="stylesheet" type="text/css">

<script src="http://code.jquery.com/jquery-2.0.2.min.js" charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.min.js" charset="utf-8"></script>
<script src="../../../resources/scrollup/js/jquery.scrollUp.min.js" charset="utf-8"></script>

<script type="text/javascript">
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideToolbar');
		WeixinJSBridge.call('hideOptionMenu');
	});
</script>
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

	<!-- top title bar -->
	<h4 class="ui top attached header" style="margin-top: 44px;">
		商家菜单 <a class="circular ui red label"> <span id="menu-count-span">${fn:length(menuList)}</span>个
		</a>
		<div class="ui small buttons" style="position: absolute; right: 4px; top: 2px;">
			<div class="ui button czsSimple" czs-status="0">清爽模式</div>
		</div>
	</h4>

	<!-- top header -->
	<div id="top-header" class="ui fixed top inverted fluid three item menu">
		<form action="menu/free/list4bill.do" id="filter-form" method="post">
			<input type="hidden" name="openId" value="${param.openId}">
			<div class="ui dropdown item czsCategory">
				<input type="hidden" name="categoryId" id="category-id-input" value="${selectedCategoryId }">
				<div class="default text">分类</div>
				<i class="dropdown icon"></i>
				<div class="menu">
					<div class="item" data-value="-1">全部分类</div>
					<c:forEach items="${categoryList }" var="item">
						<div class="item" data-value="${item.id }">${item.name }</div>
					</c:forEach>
				</div>
			</div>
			<div class="ui dropdown item czsTaste">
				<input type="hidden" name="tasteId" id="taste-id-input" value="${selectedTasteId }">
				<div class="default text">口味</div>
				<i class="dropdown icon"></i>
				<div class="menu">
					<div class="item" data-value="-1">全部口味</div>
					<c:forEach items="${tasteList }" var="item">
						<div class="item" data-value="${item.id }">${item.name }</div>
					</c:forEach>
				</div>
			</div>
			<div class="ui dropdown item czsOrder">
				<input type="hidden" name="order"
					value='<c:if test="${! empty param.order}">${param.order}</c:if><c:if test="${empty param.order}">-1</c:if>'>
				<div class="default text">排序</div>
				<i class="dropdown icon"></i>
				<div class="menu">
					<div class="item" data-value="-1">默认排序</div>
					<div class="item" data-value="1">价格升序</div>
					<div class="item" data-value="2">价格降序</div>
					<div class="item" data-value="3">点击人气</div>
				</div>
			</div>
		</form>
	</div>

	<div class="ui segment attached" style="padding: 5px;">
		<!-- menu content list -->
		<div class="ui left aligned one column grid">
			<div class="row">
				<div class="column">
					<div class="ui vertical fluid menu czsMenuList">
						<c:forEach items="${menuList}" var="item">
							<div class="ui segment item czsMenuItem" czs-category="${item.category_id}" czs-taste="${item.taste_id}">
								<div class="content">
									<div>
										<div class="image czsSimpleMode" style="width: 80px; heght: 80px; float: left;" id="image-div-${item.id}">
											<img style="width: 100%;" src="../../../${item.path}120/${item.file_name}"
												czz-src="../../../${item.path}640/${item.file_name}" onclick="imageHandler('${item.id}')">
										</div>

										<div class="ui left corner label">
											<div class="text">${item.order_times}</div>
										</div>

										<div>
											<span class="name" style="margin-left: 8px;" onclick="imageHandler('${item.id}')">${item.name}</span>
											<div class="circular ui green label">￥${item.price}</div>

											<c:if test="${! empty item.introduce}">
												<div class="ui large label" style="float: right;" onclick="introduceHandler('${item.id}')">
													<i class="comment icon"></i>
												</div>
											</c:if>
											<div class="ui divider czsSimpleMode" style="margin-top: 8px; margin-bottom: 8px; margin-left: 88px;"></div>
											<div class="czsSimpleMode" style="display: inline-block; margin-left: 8px;">
												<div class="ui label">${item.category}</div>
												<div class="ui label">${item.taste}</div>
											</div>
											<p class="description" style="display: none;" id="introduce-p-${item.id}"
												onclick="introduceHandler('${item.id}')">${item.introduce}</p>
										</div>
										<div style="clear: both;"></div>
									</div>

									<div class="ui divider" style="margin-top: 8px; margin-bottom: 8px;"></div>

									<div class="2 fluid ui buttons">

										<c:if test="${item.status == 0 || item.status == 1 || item.status == 3}">
											<div class="ui small button disabled" id="confirm-ui-btn-${item.id}">
												<i class="cart icon"></i>下单
											</div>
										</c:if>
										<c:if test="${item.status != 0 && item.status != 1 && item.status != 3}">
											<div class="ui small button" id="confirm-ui-btn-${item.id}"
												onclick="billAddDealHandler(this, '${item.id}', '${param.openId}', ${item.price}, '${item.name}')">
												<i class="cart icon"></i>下单
											</div>
										</c:if>

										<div class="or"></div>

										<c:if test="${(empty item.fav_status) || item.fav_status == 1}">
											<div class="ui small button" id="hold-ui-btn-${item.id}"
												onclick="menuStowHandler(this, '${item.id}', '${param.openId}')">
												<i class="heart empty icon"></i>收藏
											</div>
										</c:if>
										<c:if test="${item.fav_status == 0}">
											<div class="ui small button disabled" id="hold-ui-btn-${item.id}">
												<i class="heart empty icon"></i>已收藏
											</div>
										</c:if>

									</div>

									<div style="" class="czsCopies czsSimpleMode">

										<c:if test="${! empty item.consumer_id && (item.status == 0 || item.status == 1 || item.status == 3)}">
											<div class="ui label" style="margin-top: 5px; margin-bottom: 5px;">
												自己(${item.copies})
												<div class="detail">
													<c:if test="${item.status == 0}">
														<a href="menu/free/billQuery.do?isOwn=1&consumerId=${param.openId}">待提交</a>
													</c:if>
													<c:if test="${item.status == 1}">
														<a href="menu/free/billQuery.do?isOwn=1&consumerId=${param.openId}">已下单</a>
													</c:if>
													<c:if test="${item.status == 3}">
														<a href="menu/free/billQuery.do?isOwn=1&consumerId=${param.openId}">已接单</a>
													</c:if>
												</div>
											</div>
										</c:if>
										<c:forEach items="${item.menuBill}" var="item2">
											<c:if test="${item2.status == 0 || item2.status == 1 || item2.status == 3}">
												<c:if test="${item.consumer_id != item2.consumer_id}">
													<div class="ui label" style="margin-top: 5px; margin-bottom: 5px;">
														${item2.nickname}(${item2.copies})
														<div class="detail">
															<c:if test="${item2.status == 0}">
																<a href="menu/free/billQuery.do?isOwn=0&consumerId=${param.openId}">待提交</a>
															</c:if>
															<c:if test="${item2.status == 1}">
																<a href="menu/free/billQuery.do?isOwn=0&consumerId=${param.openId}">已下单</a>
															</c:if>
															<c:if test="${item2.status == 3}">
																<a href="menu/free/billQuery.do?isOwn=0&consumerId=${param.openId}">已接单</a>
															</c:if>
														</div>
													</div>
												</c:if>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<!-- bottom header -->
	<div id="bottom-header" class="ui fixed bottom inverted fluid three item menu">
		<a class="item" style="padding-top: 5px; padding-bottom: 5px;"
			href="menu/free/billQuery.do?isOwn=1&consumerId=${param.openId}"><div style="font-size: small;">
				<i class="cart icon"></i><span id="bill-count-span">${count}</span>份
			</div>
			<div style="font-size: small;">
				<i class="icon yen"></i><span id="bill-total-span">${total}</span>
			</div></a> <a class="item" href="menu/free/list4bill.do?openId=${param.openId}"><i class="icon align justify"></i>商家菜单 </a> <a
			class="item" href="user/free/stowQuery.do?openId=${param.openId}"><i class="icon heart"></i>收藏美食</a>
	</div>

	<!-- 菜品添加弹出框 -->
	<div class="ui small modal czsAdd">
		<i class="close icon"></i>
		<div class="header">确认提示</div>
		<div class="content" style="padding: 8px;">
			<div class="3 fluid ui buttons">
				<div class="ui button czsReduce">减</div>
				<div class="ui button black" style="padding-left: 0px; padding-right: 0px;">
					<i class="cart icon"></i> <span id="czsCountSpan">1</span>
				</div>
				<div class="ui button czsAdd">加</div>
			</div>
			<div class="ui form" style="margin-top: 10px;">
				<div class="field" style="margin-bottom: 0px;">
					<input placeholder="特别备注" id="memo-input" type="text" maxlength="20">
				</div>
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

	<!-- 菜品图片展示 -->
	<div class="ui small modal czsBigImage">
		<div class="content" style="padding: 0px;">
			<div class="ui image" onclick="$('.ui.modal.czsBigImage').modal('hide');">
				<img alt="" src="">
			</div>
		</div>
	</div>


	<script type="text/javascript">
		var _menuId;
		var _consumerId;
		var _price;
		var _this;

		function imageHandler(id) {
			var $img = $('#image-div-' + id + " > img");
			var $img2 = $('.ui.modal.czsBigImage img');
			if (!$img2.attr('src') || $img2.attr('src') != $img.attr('czz-src')) {
				$img2.attr('src', $img.attr('czz-src')).get(0).onload = function() {
					$('.ui.modal.czsBigImage').modal('show');
				};
			} else {
				$('.ui.modal.czsBigImage').modal('show');
			}
		}

		function introduceHandler(id) {
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
			$('#memo-input').val('');
			$('.ui.modal.czsAdd').modal('show');

		}

		function menuStowHandler(_this, menuId, consumerId) {
			if ($(_this).attr('class').indexOf('disabled') > -1) {
				return;
			}

			$.post('user/free/foodStow.do', {
				openId : consumerId,
				refId : menuId,
				isDelete : 0
			}, function(msg) {
				if (msg.succeed) {
					$('#hold-ui-btn-' + menuId).addClass('disabled');
				} else {
					if (!!msg.msg && !!msg.msg.detail) {
						$('.ui.dimmer.czsMsg .center span').html('操作失败!<br/>失败信息:' + msg.msg.detail);
					} else {
						$('.ui.dimmer.czsMsg .center span').text('操作失败!');
					}
					$('.ui.dimmer.czsMsg > .content').show();
					$('.ui.dimmer.czsMsg').dimmer('show');
				}
			});
		}

		jQuery(function($) {

			var p = 0;
			var t = 0;
			
			$(window).scroll(function(e) {
				p = $(this).scrollTop();
				
				if(t < p){// down
					$('#top-header,#bottom-header').hide();
				}else{// up
					$('#top-header,#bottom-header').show();
				}
				setTimeout(function(){
					t = p;
				}, 0);
			});
			
			$.scrollUp({
			    scrollName: 'scrollUp',
			    topDistance: '300',
			    topSpeed: 300,
			    animation: 'fade',
			    animationInSpeed: 100,
			    animationOutSpeed: 200,
			    scrollText: '',
			    activeOverlay: false,
			});

			$('.ui.dimmer.czsMsg').click(function() {
				$('.ui.dimmer.czsMsg > .content').hide();
			});

			$('.ui.dropdown.czsOrder').dropdown({
				onChange : function(value, text) {
					$('#filter-form').submit();
				}
			});

			if ($('#category-id-input').val() != '-1') {
				$('div[czs-category][czs-category!=' + $('#category-id-input').val() + ']').hide();
			}
			if ($('#taste-id-input').val() != '-1') {
				$('div[czs-taste][czs-taste!=' + $('#taste-id-input').val() + ']').hide();
			}

			$('#menu-count-span').text($('.ui.item.czsMenuItem:visible').size());

			$('.ui.dropdown.czsCategory').dropdown({
				onChange : function(value, text) {
					$('.ui.item.czsMenuItem').show();

					if ($('#category-id-input').val() != '-1') {
						$('div[czs-category][czs-category!=' + $('#category-id-input').val() + ']').hide();
					}
					if ($('#taste-id-input').val() != '-1') {
						$('div[czs-taste][czs-taste!=' + $('#taste-id-input').val() + ']').hide();
					}

					$('#menu-count-span').text($('.ui.item.czsMenuItem:visible').size());
				}
			});
			$('.ui.dropdown.czsTaste').dropdown({
				onChange : function(value, text) {
					$('.ui.item.czsMenuItem').show();

					if ($('#category-id-input').val() != '-1') {
						$('div[czs-category][czs-category!=' + $('#category-id-input').val() + ']').hide();
					}
					if ($('#taste-id-input').val() != '-1') {
						$('div[czs-taste][czs-taste!=' + $('#taste-id-input').val() + ']').hide();
					}

					$('#menu-count-span').text($('.ui.item.czsMenuItem:visible').size());
				}
			});

			$('.ui.button.czsReduce').click(function() {
				var num = Number($('#czsCountSpan').text());
				if (num > 1) {
					$('#czsCountSpan').text(num - 1);
				}
			});
			$('.ui.button.czsAdd').click(function() {
				$('#czsCountSpan').text(Number($('#czsCountSpan').text()) + 1);
			});

			$('.ui.modal.czsBigImage').modal();

			$('.ui.modal.czsAdd')
					.modal('setting', 
							{
								onApprove : function() {

									var copies = Number($('#czsCountSpan').text());
									var memo = $('#memo-input').val();
									$
											.post(
													'menu/free/billDeal.do',
													{
														menuId : _menuId,
														consumerId : _consumerId,
														copies : copies,
														memo : memo,
														status : 0
													},
													function(msg) {
														if (msg.succeed) {
															$('#confirm-ui-btn-' + _menuId).addClass('disabled');
															$('#confirm-ui-btn-' + _menuId)
																	.parent()
																	.next()
																	.prepend(
																			'<div class="ui label" style="margin-top: 5px; margin-bottom: 5px;">自己('
																					+ copies
																					+ ')<div class="detail"><a href="menu/free/billQuery.do?isOwn=1&consumerId=${param.openId}">待提交</a></div></div>');

															$('#bill-total-span').text(
																	format_number(Number($('#bill-total-span').text())
																			+ Number(_price) * copies, 2));
															$('#bill-count-span').text(
																	Number($('#bill-count-span').text()) + copies);

														} else {
															if (!!msg.msg && !!msg.msg.detail) {
																$('.ui.dimmer.czsMsg .center span').html(
																		'操作失败!<br/>失败信息:' + msg.msg.detail);
															} else {
																$('.ui.dimmer.czsMsg .center span').text('操作失败!');
															}
															$('.ui.dimmer.czsMsg > .content').show();
															$('.ui.dimmer.czsMsg').dimmer('show');
														}
													});
								}
							});

			$('.ui.button.czsSimple').click(function() {
				if ($(this).attr('czs-status') == '0') {
					$(this).attr('czs-status', '1');
					$(this).addClass('green');
					$('.czsSimpleMode').hide();
				} else {
					$(this).attr('czs-status', '0');
					$(this).removeClass('green');
					$('.czsSimpleMode').show();
				}
			});

		});
	</script>
</body>
</html>
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
<title>餐助手-顾客服务</title>
<script type="text/javascript">
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideToolbar');
		WeixinJSBridge.call('hideOptionMenu');
	});
</script>
</head>
<body style="margin: 0px; padding: 0px;">

	<h4 class="ui top attached header" style="margin-top: 0px;">${title}
	</h4>
	<div class="ui segment attached">
		<div class="ui segment">
			<div class="ui toggle checkbox czsImage">
				<input type="checkbox" name="mode"> <label for="">图文模式</label>
			</div>
			<div class="ui toggle checkbox czsGroup">
				<input type="checkbox" name="mode"
					<c:if test="${isOwn == '0'}"> checked="checked"</c:if>> <label
					for="">集体消费</label>
			</div>
			<form class="czsOwn" action="menu/free/billQuery.do" method="post">
				<input type="hidden" name="status" value="${status}"> <input
					type="hidden" name="isOwn" value="1"> <input type="hidden"
					name="consumerId" value="${openId}"> <input type="hidden"
					name="isShowImg" value="0">
			</form>
			<form class="czsGroup" action="menu/free/billQuery.do" method="post">
				<input type="hidden" name="status" value="${status}"> <input
					type="hidden" name="isOwn" value="0"> <input type="hidden"
					name="consumerId" value="${openId}"> <input type="hidden"
					name="isShowImg" value="0">
			</form>
		</div>
		<div class="ui stackable items" id="bill-query-ui-stackable-items">
			<c:forEach items="${billList}" var="item">
				<div class="item" id="bill-item-${item.menu_id}"
					style="min-height: 0px;">
					<div class="image" style="display: none;">
						<img src="" czz-src="../../../${item.path}640/${item.file_name}">
						<!-- <a
							class="like ui corner label"> <i class="like icon"></i> -->
						</a>
					</div>
					<div class="content">
						<div class="name">${item.name}</div>
						<p class="description" style="display: none;">${item.introduce}</p>
						<div style="margin-top: 10px; margin-bottom: 10px;">
							<div class="ui red label">
								<i class="dollar icon"></i> ${item.price}
							</div>
							<div class="ui green label">${item.category}</div>
							<div class="ui blue label">${item.taste}</div>
						</div>
						<c:if test="${isOwn == '1'}">
							<div
								class="<c:if test="${item.status == 2}">2</c:if><c:if test="${item.status != 2}">1</c:if> fluid ui buttons">
								<c:if test="${item.status == 1 || item.status == 3}">
									<div class="2 fluid ui buttons">
										<input type="hidden" id="copies-${item.menu_id}"
											value="${item.copies}">
										<c:if test="${item.status == 1}">
											<div class="positive ui button"
												id="debook-ui-btn-${item.menu_id}"
												onclick="billDealHandler('${item.menu_id}', '${openId}', '2', 'debook', ${item.price}, ${item.privilege})">
												<i class="remove icon"></i>退一份
											</div>
											<div class="or"></div>
											<div class="negative ui button"
												onclick="billDealHandler('${item.menu_id}', '${openId}', '1', 'add', ${item.price}, ${item.privilege})">
												<i class="remove icon"></i>加一份
											</div>
										</c:if>
										<c:if test="${item.status == 3}">
											<div class="positive disabled ui button"
												id="debook-ui-btn-${item.menu_id}">
												<i class="remove icon"></i>退一份
											</div>
											<div class="or"></div>
											<div class="negative disabled ui button">
												<i class="remove icon"></i>加一份
											</div>
										</c:if>

									</div>
									<div class="ui divider"></div>
									<div style="margin-top: 10px;">
										<div class="ui label">
											自己
											<div class="detail" id="confirm-bill-msg-${item.menu_id}">${item.copies}</div>
											<c:if test="${item.status == 3}">
												<i class="checkmark icon"></i>
											</c:if>
											<c:if test="${item.status == 1}">
												<i class="loading icon"></i>
											</c:if>
										</div>
									</div>
								</c:if>
								<c:if test="${item.status == 0}">
									<div class="positive ui button"
										onclick="billDealHandler('${item.menu_id}', '${openId}', '1')">
										<i class="checkmark icon"></i>定了
									</div>
								</c:if>
								<c:if test="${item.status == 2}">
									<div class="positive ui button"
										onclick="billDealHandler('${item.menu_id}', '${openId}', '1')">
										<i class="checkmark icon"></i>定了
									</div>
									<div class="or"></div>
									<div class="negative ui button"
										onclick="billDealHandler('${item.menu_id}', '${openId}', '0')">
										<i class="heart empty icon"></i>待选
									</div>
								</c:if>
							</div>
						</c:if>
						<c:if test="${isOwn =='0'}">
							<div class="ui divider"></div>
							<div>
								<c:forEach items="${item.menuBill}" var="item2">
									<div class="ui label">
										${item2.nickname}
										<div class="detail">${item2.copies}</div>
										<c:if test="${item2.status == 3}">
											<i class="checkmark icon"></i>
										</c:if>
										<c:if test="${item2.status == 1}">
											<i class="loading icon"></i>
										</c:if>
									</div>
								</c:forEach>
							</div>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<div style="height: 44px;"></div>
	<!-- bottom header -->
	<div class="ui fixed bottom inverted fluid three item menu">
		<a class="item"
			href="menu/free/billQuery.do?status=1&isOwn=0&consumerId=${openId}"><i
			class="icon dollar"></i><span id="bill-total-span">${total}</span></a> <a
			class="item" href="menu/free/list4bill.do?openId=${openId}"><i
			class="icon align justify"></i>我的菜单</a> <a class="item"
			href="menu/free/billQuery.do?status=0&isOwn=1&consumerId=${openId}"><i
			class="icon heart"></i>我的收藏</a>
	</div>

	<script type="text/javascript">
		function billDealHandler(menuId, consumerId, status, cmd, price, privilege) {
			$.post('menu/free/billDeal.do', {
				menuId : menuId,
				consumerId : consumerId,
				status : status
			}, function(msg) {
				if (msg.succeed) {

					if (!!cmd && cmd == 'debook') {
						var copies = Number($('#copies-' + menuId).val());
						if (copies > 1) {
							$('#copies-' + menuId).val(copies - 1);
							$('#confirm-bill-msg-' + menuId).text(copies - 1)
						} else {
							$('#bill-item-' + menuId).remove();
						}
						
						var total = Number($('#bill-total-span').text());
						
						if(!!privilege && privilege >= 1){
							$('#bill-total-span').text(format_number(total-=(price - privilege), 2));
						}else if(!!privilege && (privilege < 1) && (privilege > 0)){
							$('#bill-total-span').text(format_number(total-=(price * privilege), 2));
						}else{
							$('#bill-total-span').text(format_number(total-=(price), 2));
						}
						
					} else if (!!cmd && cmd == 'add') {
						var copies = Number($('#copies-' + menuId).val());
						$('#copies-' + menuId).val(copies + 1);
						$('#confirm-bill-msg-' + menuId).text(copies + 1)
						
						var total = Number($('#bill-total-span').text());
						
						if(!!privilege && privilege >= 1){
							$('#bill-total-span').text(format_number(total+=(price - privilege), 2));
						}else if(!!privilege && (privilege < 1) && (privilege > 0)){
							$('#bill-total-span').text(format_number(total+=(price * privilege), 2));
						}else{
							$('#bill-total-span').text(format_number(total+=(price), 2));
						}
					} else {
						$('#bill-item-' + menuId).remove();
					}

				} else {
					alert('操作失败!')
				}
			});
		}

		/**
		*   Usage:  CurrencyFormatted(12345.678);
		*   result: 12345.68
		**/

		function format_number(pnumber,decimals){
		    if (isNaN(pnumber)) { return 0};
		    if (pnumber=='') { return 0};
		     
		    var snum = new String(pnumber);
		    var sec = snum.split('.');
		    var whole = parseFloat(sec[0]);
		    var result = '';
		     
		    if(sec.length > 1){
		        var dec = new String(sec[1]);
		        dec = String(parseFloat(sec[1])/Math.pow(10,(dec.length - decimals)));
		        dec = String(whole + Math.round(parseFloat(dec))/Math.pow(10,decimals));
		        var dot = dec.indexOf('.');
		        if(dot == -1){
		            dec += '.';
		            dot = dec.indexOf('.');
		        }
		        while(dec.length <= dot + decimals) { dec += '0'; }
		        result = dec;
		    } else{
		        var dot;
		        var dec = new String(whole);
		        dec += '.';
		        dot = dec.indexOf('.');    
		        while(dec.length <= dot + decimals) { dec += '0'; }
		        result = dec;
		    }  
		    return result;
		}
		
		jQuery(function($) {
			$('#menu-item-${type}-bill').addClass('active');
			
			$('.item.czsMenu').click(function() {
				$('.ui.left.sidebar').sidebar("toggle");
			});

			$('.ui.checkbox.czsImage').checkbox({
				onEnable : function() {
					$('input[name="isShowImg"]').val('1');
					$('#bill-query-ui-stackable-items').find('div[class="image"]').show().end().find('img').each(
							function() {
								$(this).attr('src', $(this).attr('czz-src'));
							});
				},
				onDisable : function() {
					$('input[name="isShowImg"]').val('0');
					$('#bill-query-ui-stackable-items').find('div[class="image"]').hide();
				}
			});
			
			if('${isShowImg}' == '1'){
				$('.ui.checkbox.czsImage').checkbox('enable');
			}
			
			$('.ui.checkbox.czsGroup').checkbox({
				onEnable : function() {
					$('form[class="czsGroup"]').submit();
				},
				onDisable : function() {
					$('form[class="czsOwn"]').submit();
				}
			});
		});
	</script>
</body>
</html>
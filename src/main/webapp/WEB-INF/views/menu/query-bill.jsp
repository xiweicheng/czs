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
</head>
<body style="margin: 0px; padding: 0px;">

	<!-- 侧边栏 -->
	<%@ include file="../menu2.jsp"%>

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">${title}
		- 共<span id="bill-total-span" style="color: red;">${total}</span>元
	</h4>
	<div class="ui segment attached">
		<div class="ui segment">
			<div class="ui toggle checkbox">
				<input type="checkbox" name="mode" id="mode-ui-checkbox"> <label
					for="check3">图文模式</label>
			</div>
		</div>
		<div class="ui stackable items" id="bill-query-ui-stackable-items">
			<c:forEach items="${billList}" var="item">
				<div class="item" id="bill-item-${item.menu_id}"
					style="min-height: 0px;">
					<div class="image" style="display: none;">
						<img src="" czz-src="../../../${item.path}">
						<!-- <a
							class="like ui corner label"> <i class="like icon"></i> -->
						</a>
					</div>
					<div class="content">
						<div class="name">${item.name}</div>
						<p class="description" style="display: none;">${item.introduce}</p>
						<div style="padding-bottom: 10px;">
							价格:${item.price} | 优惠:
							<c:if test="${item.privilege < 1}">${item.privilege * 10}折</c:if>
							<c:if test="${item.privilege >= 1}">${item.privilege}</c:if>
							<br /> 分类:${item.category} | 口味:${item.taste}
						</div>
						<div
							class="<c:if test="${item.status == 2}">2</c:if><c:if test="${item.status != 2}">1</c:if> fluid ui buttons">
							<c:if test="${item.status == 1}">
								<div class="2 fluid ui buttons">
									<input type="hidden" id="copies-${item.menu_id}"
										value="${item.copies}">
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
								</div>
								<div class="ui divider"></div>
								<div style="margin-top: 10px;"
									id="confirm-bill-msg-${item.menu_id}">
									<c:if test="${item.status == 1}">您已定了<b>${item.copies}</b>份!
							</c:if>
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
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

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
							$('#confirm-bill-msg-' + menuId).text('您已定了' + (copies - 1) + '份!')
						} else {
							$('#bill-item-' + menuId).remove();
						}
						
						var total = Number($('#bill-total-span').text());
						
						if(!!privilege && privilege >= 1){
							$('#bill-total-span').text(format_number(total-=(price - privilege), 2));
						}else if(!!privilege && privilege < 1){
							$('#bill-total-span').text(format_number(total-=(price * privilege), 2));
						}else{
							$('#bill-total-span').text(format_number(total-=(price), 2));
						}
						
					} else if (!!cmd && cmd == 'add') {
						var copies = Number($('#copies-' + menuId).val());
						$('#copies-' + menuId).val(copies + 1);
						$('#confirm-bill-msg-' + menuId).text('您已定了' + (copies + 1) + '份!')
						
						var total = Number($('#bill-total-span').text());
						
						if(!!privilege && privilege >= 1){
							$('#bill-total-span').text(format_number(total+=(price - privilege), 2));
						}else if(!!privilege && privilege < 1){
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

			$('.ui.checkbox').checkbox({
				onEnable : function() {
					$('#bill-query-ui-stackable-items').find('div[class="image"]').show().end().find('img').each(
							function() {
								$(this).attr('src', $(this).attr('czz-src'));
							});
				},
				onDisable : function() {
					$('#bill-query-ui-stackable-items').find('div[class="image"]').hide();
				}
			});
		});
	</script>
</body>
</html>
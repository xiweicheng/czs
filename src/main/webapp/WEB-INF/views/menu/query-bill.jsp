<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>餐助手-顾客服务</title>

<link href="../../../resources/semantic/css/semantic.min.css" rel="stylesheet" type="text/css">

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

	<h4 class="ui top attached header" style="margin-top: 0px;">${title}
		<div class="ui small buttons" style="position: absolute; right: 4px; top: 2px;">
			<div class="ui button czsSimple" czs-status="0">清爽模式</div>
		</div>
	</h4>

	<div class="2 fluid ui buttons">
		<c:if test="${isOwn == 1}">
			<div class="ui active green large button czsOwn">个人订单</div>
			<div class="or"></div>
			<div class="ui large button czsGroup">集体订单</div>
		</c:if>
		<c:if test="${isOwn == 0}">
			<div class="ui large button czsOwn">个人订单</div>
			<div class="or"></div>
			<div class="ui active green large button czsGroup">集体订单</div>
		</c:if>
	</div>
	<form class="czsOwn" action="menu/free/billQuery.do" method="post">
		<input type="hidden" name="isOwn" value="1"> <input type="hidden" name="consumerId" value="${openId}">
		<input type="hidden" name="isShowImg" value="0">
	</form>
	<form class="czsGroup" action="menu/free/billQuery.do" method="post">
		<input type="hidden" name="isOwn" value="0"> <input type="hidden" name="consumerId" value="${openId}">
		<input type="hidden" name="isShowImg" value="0">
	</form>
	<form class="czsSubmit" action="menu/free/billSubmit.do" method="post">
		<input type="hidden" name="openId" value="${openId}">
	</form>

	<c:if test="${isOwn == 1}">
		<div class="1 fluid ui buttons">
			<div class="ui large button czsSubmit" style="display: none;">
				提交订单<a class="ui red circular label"> <span class="czsSubmit czsCount">${submitCount}</span>份待提交
				</a>
			</div>
		</div>
	</c:if>

	<div class="ui segment attached" style="padding: 5px;">
		<div class="ui left aligned one column grid">
			<div class="row">
				<div class="column">
					<div class="ui vertical fluid menu czsMenuList">
						<c:forEach items="${billList}" var="item">
							<div class="ui segment item" id="menu-item-${item.menu_id}">
								<div>
									<div class="image czsSimpleMode" style="width: 80px; heght: 80px; float: left;" id="image-div-${item.id}">
										<img style="width: 100%;" src="../../../${item.path}120/${item.file_name}"
											czz-src="../../../${item.path}640/${item.file_name}" onclick="imageHandler('${item.id}')">
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
											<c:if test="${! empty item.memo}">
												<div class="ui red label">${item.memo}</div>
											</c:if>
										</div>
										<p class="description" style="display: none;" id="introduce-p-${item.id}"
											onclick="introduceHandler('${item.id}')">${item.introduce}</p>
									</div>
									<div style="clear: both;"></div>
								</div>

								<div class="ui divider czsSimpleMode" style="margin-top: 8px; margin-bottom: 8px;"></div>

								<!-- 个人 -->
								<c:if test="${isOwn == 1}">
									<div class="2 fluid ui buttons" style="margin-top: 5px; margin-bottom: 5px;">
										<c:if test="${item.status == 0 || item.status == 1}">
											<div class="ui small button"
												onclick="billReduceHandler('${item.menu_id}', '${openId}', ${item.price}, '${item.status}')">减一份</div>
											<div class="or"></div>
											<div class="ui small button" id="hold-ui-btn-${item.id}"
												onclick="billAddHandler('${item.menu_id}', '${openId}', ${item.price}, '${item.status}')">加一份</div>
										</c:if>
									</div>
									<div class="czsSimpleMode">
										<input type="hidden" value="${item.status}" class="czsBillStatus">
										<div class="ui label" style="margin-top: 5px; margin-bottom: 5px;">
											自己(<span id="item-copies-${item.menu_id}">${item.copies}</span>)
											<div class="detail">
												<c:if test="${item.status == 0}">待提交</c:if>
												<c:if test="${item.status == 1}">已下单</c:if>
												<c:if test="${item.status == 3}">已接单</c:if>
											</div>
										</div>
									</div>
								</c:if>

								<div class="czsSimpleMode">
									<!-- 集体 -->
									<c:if test="${isOwn == 0}">
										<c:forEach items="${item.menuBill}" var="item2">
											<div class="ui label" style="margin-top: 5px; margin-bottom: 5px;">
												${item2.nickname}(<span>${item2.copies}</span>)
												<div class="detail">
													<c:if test="${item2.status == 0}">待提交</c:if>
													<c:if test="${item2.status == 1}">已下单</c:if>
													<c:if test="${item2.status == 3}">已接单</c:if>
												</div>
											</div>
										</c:forEach>
									</c:if>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

	<c:if test="${isOwn == 1}">
		<div class="1 fluid ui buttons">
			<div class="ui large button czsSubmit" style="display: none;">
				提交订单<a class="ui red circular label"> <span class="czsSubmit czsCount">${submitCount}</span>份待提交
				</a>
			</div>
		</div>
	</c:if>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<!-- bottom header -->
	<div id="bottom-header" class="ui fixed bottom inverted fluid three item menu">
		<a class="item" style="padding-top: 5px; padding-bottom: 5px;"
			href="menu/free/billQuery.do?isOwn=1&consumerId=${openId}"><div style="font-size: small;">
				<i class="cart icon"></i><span id="bill-count-span">${count}</span>份
			</div>
			<div style="font-size: small;">
				<i class="icon yen"></i><span id="bill-total-span">${total}</span>
			</div></a> <a class="item" href="menu/free/list4bill.do?openId=${openId}"><i class="icon align justify"></i>商家菜单</a> <a
			class="item" href="user/free/stowQuery.do?openId=${openId}"><i class="icon heart"></i>收藏美食</a>
	</div>


	<div class="ui modal czsConfirm">
		<div class="header">确认提示</div>
		<div class="content">
			<div class="left">
				<i class="warning icon"></i>
			</div>
			<div class="right" style="font-size: 25px;">
				<p>确认要提交订单吗?</p>
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

	<script src="http://code.jquery.com/jquery-2.0.2.min.js" charset="utf-8"></script>
	<script src="../../../resources/semantic/javascript/semantic.min.js" charset="utf-8"></script>

	<script type="text/javascript">
	
		function imageHandler(id){
			var $img =  $('#image-div-' + id + " > img");
			var $img2 = $('.ui.modal.czsBigImage img');
			if(!$img2.attr('src') || $img2.attr('src') != $img.attr('czz-src')){
				$img2.attr('src', $img.attr('czz-src')).get(0).onload = function(){
					$('.ui.modal.czsBigImage').modal('show');
				};
			}else{
				$('.ui.modal.czsBigImage').modal('show');
			}
		}
		
		function introduceHandler(id){
			$('#introduce-p-' + id).toggle();
		}
	
		function billReduceHandler(menuId, consumerId, price, status) {
			$.post('menu/free/billDeal.do', {
				menuId : menuId,
				consumerId : consumerId,
				status : 2
			}, function(msg) {
				if (msg.succeed) {
					var copies = Number($('#item-copies-' + menuId).text());
					if (copies > 1) {
						$('#item-copies-' + menuId).text(copies - 1);
					} else {
						$('#menu-item-' + menuId).remove();
					}
					
					var total = Number($('#bill-total-span').text());
					$('#bill-total-span').text(format_number(total-=(price), 2));
					var count = Number($('#bill-count-span').text());
					$('#bill-count-span').text(count - 1);
					
					if(status == 0){
						var submit = Number($('.czsSubmit.czsCount').first().text());
						$('.czsSubmit.czsCount').text(submit - 1);
						
						if(submit - 1 == 0){
							$('.ui.button.czsSubmit').hide();
						}
					}
					
				} else {
					if(!!msg.msg && !!msg.msg.detail){
						$('.ui.dimmer.czsMsg .center span').html('操作失败!<br/>失败信息:' + msg.msg.detail);
					}else{
						$('.ui.dimmer.czsMsg .center span').text('操作失败!');
					}
					$('.ui.dimmer.czsMsg > .content').show();
					$('.ui.dimmer.czsMsg').dimmer('show');
				}
			});
		}
	
		function billAddHandler(menuId, consumerId, price, status) {
			$.post('menu/free/billDeal.do', {
				menuId : menuId,
				consumerId : consumerId,
				status : status
			}, function(msg) {
				if (msg.succeed) {
					var copies = Number($('#item-copies-' + menuId).text());
					$('#item-copies-' + menuId).text(copies + 1);
					
					var total = Number($('#bill-total-span').text());
					$('#bill-total-span').text(format_number(total+=(price), 2));
					var count = Number($('#bill-count-span').text());
					$('#bill-count-span').text(count + 1);
					
					if(status == 0){
						var submit = Number($('.czsSubmit.czsCount').first().text());
						$('.czsSubmit.czsCount').text(submit + 1);
					}
				} else {
					if(!!msg.msg && !!msg.msg.detail){
						$('.ui.dimmer.czsMsg .center span').html('操作失败!<br/>失败信息:' + msg.msg.detail);
					}else{
						$('.ui.dimmer.czsMsg .center span').text('操作失败!');
					}
					$('.ui.dimmer.czsMsg > .content').show();
					$('.ui.dimmer.czsMsg').dimmer('show');
				}
			});
		}

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
			
			var p = 0;
			var t = 0;
			
			$(window).scroll(function(e) {
				p = $(this).scrollTop();
				
				if(t < p){// down
					$('#bottom-header').hide();
				}else{// up
					$('#bottom-header').show();
				}
				setTimeout(function(){
					t = p;
				}, 0);
			});
			
			$('.ui.dimmer.czsMsg').click(function(){
				$('.ui.dimmer.czsMsg > .content').hide();
			});
			
			$('.ui.button.czsSimple').click(function(){
				if($(this).attr('czs-status') == '0'){
					$(this).attr('czs-status', '1');
					$(this).addClass('green');
					$('.czsSimpleMode').hide();
				}else{
					$(this).attr('czs-status', '0');
					$(this).removeClass('green');
					$('.czsSimpleMode').show();
				}
			});
			
			$('.ui.button.czsOwn').click(function(){
				$('form[class="czsOwn"]').submit();
			});
			$('.ui.button.czsGroup').click(function(){
				$('form[class="czsGroup"]').submit();
			});
			
			$('.ui.button.czsSubmit').click(function(){
				$('.ui.modal.czsConfirm').modal('show');
			});
			
			$('.ui.modal.czsConfirm').modal('setting', {
				onApprove : function() {
					$('form[class="czsSubmit"]').submit();
				}
			});
			
			$('input[class="czsBillStatus"]').each(function(){
				if($(this).val() == 0){
					$('.ui.button.czsSubmit').show();
					return false;
				}
			});
			
		});
	</script>
</body>
</html>
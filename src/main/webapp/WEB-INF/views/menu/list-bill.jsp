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
<script src="../../../resources/js/lib/jquery-1.10.2.min.js"
	charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.js"
	charset="utf-8"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>餐助手-商家自助后台</title>
</head>
<body style="margin: 0px; padding: 0px;">

	<!-- 侧边栏 -->
	<%@ include file="../menu2.jsp"%>

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">我要点菜</h4>
	<div class="ui segment attached">
		<div class="ui segment">
			<form action="menu/free/list4bill.do" id="filter-form">
				<input type="hidden" name="openId" value="${openId}">
				<div class="ui selection dropdown" style="margin-bottom:10px;">
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
				<div class="ui selection dropdown" style="margin-bottom:10px;">
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
				<div class="ui button" id="filter-ui-btn">筛选</div>
				<div class="ui divider"></div>
				<div style="margin-top: 10px;">
					<div class="ui toggle checkbox">
						<input type="checkbox" name="mode" id="mode-ui-checkbox">
						<label for="check3">图文模式</label>
					</div>
				</div>
			</form>
		</div>


		<div class="ui stackable items" id="bill-list-ui-stackable-items">
			<c:forEach items="${menuList}" var="item">
				<div class="item" style="min-height: 0px;">
					<div class="image" style="display: none">
						<img src="../../../${item.path}">
						<c:if test="${item.status == 1}">
							<a class="like ui corner label"> <i class="checkmark icon"></i>
						</c:if>
						<c:if test="${item.status == 0}">
							<a class="like ui corner label"> <i class="heart empty icon"></i>
						</c:if>
						</a>
					</div>
					<div class="content">
						<div class="name">${item.name}</div>
						<p class="description" style="display: none;">${item.introduce}</p>
						<div style="padding-bottom: 10px;">
							价格:${item.price} | 优惠:
							<c:if test="${item.privilege < 1}">${item.privilege * 10}折</c:if>
							<c:if test="${item.privilege >= 1}">${item.privilege}</c:if>
						</div>
						<div style="padding-bottom: 10px;">
							<br /> 分类:${item.category} | 口味:${item.taste}
						</div>
						<div class="2 fluid ui buttons">
							<div
								class="positive ui button <c:if test="${item.status == 1}">disabled</c:if>"
								id="confirm-ui-btn-${item.id}"
								<c:if test="${item.status != 1}">onclick="billDealHandler(this, '${item.id}', '${openId}', '1')"</c:if>>
								<i class="checkmark icon"></i>定了
							</div>
							<div class="or"></div>
							<div
								class="negative ui button <c:if test="${item.status == 0 || item.status == 1}">disabled</c:if>"
								id="hold-ui-btn-${item.id}"
								<c:if test="${item.status != 0 && item.status != 1}">onclick="billDealHandler(this, '${item.id}', '${openId}', '0')"</c:if>>
								<i class="heart empty icon"></i>待选
							</div>
						</div>
						<div style="margin-top: 10px;">
							<c:forEach items="${item.menuBill}" var="item2">
								<c:if test="${item2.status == 1}">[${item2.nickname}]已定了${item2.copies}份!<br/>
							</c:if>
								<c:if test="${item2.status == 0}">[${item2.nickname}]待选中!<br/></c:if>
								<c:if test="${item2.status == 2}">[${item2.nickname}]已退订!<br/></c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<script type="text/javascript">
		function billDealHandler(_this, menuId, consumerId, status) {
			if ($(_this).attr('class').indexOf('disabled') > -1) {
				return;
			}
			$.post('menu/free/billDeal.do', {
				menuId : menuId,
				consumerId : consumerId,
				status : status
			}, function(msg) {
				if (msg.succeed) {
					if (status == 1) {
						$('#confirm-ui-btn-' + menuId).addClass('disabled');
						$('#hold-ui-btn-' + menuId).addClass('disabled');
					} else if (status == 0) {
						$('#hold-ui-btn-' + menuId).addClass('disabled');
					}

				} else {
					alert('操作失败!')
				}
			});
		}
		jQuery(function($) {
			$('#menu-item-filter').addClass('active');
			$('.ui.dropdown').dropdown();

			$('#filter-ui-btn').click(function() {
				$('#filter-form').submit();
			});

			$('.ui.checkbox').checkbox({
				onEnable : function() {
					$('#bill-list-ui-stackable-items').find('div[class="image"]').show();
				},
				onDisable : function() {
					$('#bill-list-ui-stackable-items').find('div[class="image"]').hide();
				}
			});

			(function() {
				if ('${mode}' == 'on') {
					$('#mode-ui-checkbox').attr('checked', "checked");
					$('#bill-list-ui-stackable-items').find('div[class="image"]').show();
				} else {
					$('#bill-list-ui-stackable-items').find('div[class="image"]').hide();
				}
			})();

		});
	</script>
</body>
</html>
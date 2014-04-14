<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>餐助手-商家服务</title>
<link href="../../../resources/semantic/css/semantic.min.css"
	rel="stylesheet" type="text/css">
<script src="../../../resources/js/lib/jquery-1.10.2.min.js"
	charset="utf-8"></script>
<script src="../../../resources/semantic/javascript/semantic.min.js"
	charset="utf-8"></script>
<script src="../../../resources/js/lib/jquery.tmpl.min.js"
	charset="utf-8"></script>

<script id="imageItemTpl" type="text/x-jquery-tmpl">
<div class="item" style="min-height: 0px;"
	onclick="selectImage(this, '{{html id}}', '{{html path}}640/{{html fileName}}')">
	<div class="image">
		<img src="../../../{{html path}}640/{{html fileName}}"> <a
			class="like ui corner label"> <i class="like icon"></i>
		</a>
	</div>
	<div class="content">
		<div class="meta">
			{{html dateTime}}
		</div>
		<div class="name">{{html name}}</div>
		<!-- <p class="description"></p> -->
	</div>
</div>
</script>

</head>
<body style="margin: 0px; padding: 0px;">
	<!-- 侧边栏 -->
	<%@ include file="../menu.jsp"%>

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">菜单更新</h4>
	<a id="error-msg-anchor"></a>

	<div class="ui segment attached">
		<form action="menu.add.do" id="add-menu-form" method="post">
			<input type="hidden" name="id" value="${menu.id}">
			<div class="ui warning form segment" id='add-menu-ui-form'>
				<div class="ui error message" id="add-menu-ui-message"></div>
				<div class="two fields">
					<div class="field">
						<label>菜名</label> <input placeholder="输入菜名" type="text"
							name="name" value="${menu.name}">
					</div>
					<div class="inline field">
						<div class="ui checkbox" style="margin-top: 30px;">
							<input type="checkbox" name="_isDelete"
								<c:if test="${menu.isDelete==1}">checked="checked"</c:if>><label>禁用
								(勾选后该项菜对用户将不再可见)</label>
						</div>
					</div>
				</div>
				<div class="two fields">
					<div class="field">
						<label>分类</label>
						<div class="ui fluid selection dropdown">
							<div class="text">选择...</div>
							<i class="dropdown icon"></i> <input type="hidden"
								name="categoryId" value="${menu.categoryId}"
								id="category-hidden-input">
							<div class="menu" id="category-menu-items">
								<c:forEach items="${menuCategoryList}" var="item">
									<div class="item" data-value="${item.id}">${item.name }</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="field">
						<div class="ui action input" style="margin-top: 20px;">
							<input type="text" placeholder="增加分类"
								id="add-category-text-input">
							<div class="ui vertical animated button" id="add-category-btn"
								style="margin-top: 20px;">
								<div class="hidden content">增加分类</div>
								<div class="visible content">
									<i class="add icon"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="two fields">
					<div class="field">
						<label>价格</label> <input placeholder="价格" type="text" name="price"
							value="${menu.price}">
					</div>
					<div class="field">
						<label>优惠</label> <input placeholder="优惠" type="text"
							name="privilege" value="${menu.privilege}">
						<div class="ui red pointing above ui label">样例:7折输入 0.7
							直减10元输入 10</div>
					</div>
				</div>
				<div class="two fields">
					<div class="field">
						<label>口味</label>
						<div class="ui fluid selection dropdown">
							<div class="text">选择...</div>
							<i class="dropdown icon"></i> <input type="hidden" name="tasteId"
								value="${menu.tasteId}" id="taste-hidden-input">
							<div class="menu" id="taste-menu-items">
								<c:forEach items="${menuTasteList}" var="item">
									<div class="item" data-value="${item.id}">${item.name }</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="field">
						<div class="ui action input" style="margin-top: 20px;">
							<input type="text" placeholder="增加口味" id="add-taste-text-input">
							<div class="ui vertical animated button" id="add-taste-btn">
								<div class="hidden content">增加口味</div>
								<div class="visible content">
									<i class="add icon"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="two fields">
					<div class="field">
						<label>介绍</label>
						<textarea name="introduce">${menu.introduce}</textarea>
					</div>
				</div>
				<div class="two fields">
					<div class="field">
						<input type="hidden" name="resourceId" id="resourceId"
							value="${menu.resourceId}"> <label>图片</label> <img
							class="rounded ui image" alt="图片" src="../../../${extra_imgPath}"
							id="resourceImage">
					</div>
					<div class="ui vertical animated button" style="margin-top: 20px; margin-bottom: 20px;"
						id="select-image-btn">
						<div class="hidden content">选择图片</div>
						<div class="visible content">
							<i class="browser icon"></i>
						</div>
					</div>
				</div>
				<div class="ui blue submit button" id="add-menu-btn">更新</div>
			</div>
		</form>
	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>


	<!-- 菜单分类modal -->
	<div class="ui modal" id="add-category-modal">
		<i class="close icon"></i>
		<div class="header">添加分类</div>
		<div class="content">
			<div class="left">
				<div class="ui form">
					<div class="field">
						<label>输入分类</label> <input type="text" id="category-text">
					</div>
				</div>
			</div>
		</div>
		<div class="actions">
			<div class="two fluid ui buttons">
				<div class="ui deny labeled icon button">
					<i class="remove icon"></i> 取消
				</div>
				<div class="ui approve right labeled icon button">
					确定 <i class="checkmark icon"></i>
				</div>
			</div>
		</div>
	</div>

	<!-- 菜单口味modal -->
	<div class="ui modal" id="add-taste-modal">
		<i class="close icon"></i>
		<div class="header">添加口味</div>
		<div class="content">
			<div class="left">
				<div class="ui form">
					<div class="field">
						<label>输入口味</label> <input type="text" id="taste-text">
					</div>
				</div>
			</div>
		</div>
		<div class="actions">
			<div class="two fluid ui buttons">
				<div class="ui deny labeled icon button">
					<i class="remove icon"></i> 取消
				</div>
				<div class="ui approve right labeled icon button">
					确定 <i class="checkmark icon"></i>
				</div>
			</div>
		</div>
	</div>

	<!-- 图片选择modal -->
	<div class="ui basic modal" id="select-image-modal">
		<i class="close icon"></i>
		<div class="header">选择图片</div>
		<div class="content">
			<div class="ui three items" style="height: 350px; overflow: auto;"
				id="image-ui-items"></div>
		</div>
		<div class="actions">
			<div class="two fluid ui buttons">
				<div class="ui deny labeled icon button">
					<i class="remove icon"></i> 取消
				</div>
				<div class="ui approve right labeled icon button">
					确定 <i class="checkmark icon"></i>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		jQuery(function($) {
			$('#menu-item-menu-update').addClass('active');

			$('.ui.dropdown').dropdown();

			$('.ui.checkbox').checkbox();

			/* $('#add-category-modal').modal(
					{
						closable : false,
						onDeny : function() {
							return true;
						},
						onApprove : function() {
							var category = $('#category-text').val();
							if (!category) {// 不能为空
								return false;
							}
							$.post('menuCategory/add.do', {
								name : category
							}, function(data) {
								if (data.succeed) {
									$('#category-menu-items').append(
											$('<div class="item"></div>').attr('data-value', data.value.id).text(
													data.value.name));
									$('.ui.dropdown').dropdown();
								} else {
									alert(data.msg.detail);
								}
							});
						}
					}).modal('attach events', '#add-category-btn', 'show'); */

			/* $('#add-taste-modal').modal(
					{
						closable : false,
						onDeny : function() {
							return true;
						},
						onApprove : function() {
							var taste = $('#taste-text').val();
							if (!taste) {// 不能为空
								return false;
							}
							$.post('menuTaste/add.do', {
								name : taste
							}, function(data) {
								if (data.succeed) {
									$('#taste-menu-items').append(
											$('<div class="item"></div>').attr('data-value', data.value.id).text(
													data.value.name));
									$('.ui.dropdown').dropdown();
								} else {
									alert(data.msg.detail);
								}
							});
						}
					}).modal('attach events', '#add-taste-btn', 'show'); */

			$('#add-category-btn').click(
					function() {
						var category = $('#add-category-text-input').val();
						if (!category) {// 不能为空
							alert('不能为空!');
							return false;
						}
						$.post('menuCategory/add.do', {
							name : category
						}, function(data) {
							if (data.succeed) {
								$('#category-menu-items').append(
										$('<div class="item"></div>').attr('data-value', data.value.id).text(
												data.value.name));
								$('#category-hidden-input').val(data.value.id);
								$('#add-category-text-input').val('');
								$('.ui.dropdown').dropdown();
							} else {
								alert(data.msg.detail);
							}
						});
					});

			$('#add-taste-btn').click(
					function() {
						var taste = $('#add-taste-text-input').val();
						if (!taste) {// 不能为空
							alert('不能为空!');
							return false;
						}
						$.post('menuTaste/add.do', {
							name : taste
						}, function(data) {
							if (data.succeed) {
								$('#taste-menu-items').append(
										$('<div class="item"></div>').attr('data-value', data.value.id).text(
												data.value.name));
								$('#taste-hidden-input').val(data.value.id);
								$('#add-taste-text-input').val('');
								$('.ui.dropdown').dropdown();
							} else {
								alert(data.msg.detail);
							}
						});
					});

			$('#select-image-modal').modal({
				closable : false,
				onDeny : function() {
					return true;
				},
				onApprove : function() {
					return true;
				}
			});//.modal('attach events', '#select-image-btn', 'show');

			$('#select-image-btn,#resourceImage').click(function() {
				$.ajax({
					type : "POST",
					url : 'resources/list.do',
					contentType : 'application/json',
					processData : false,
					dataType : "json",
					//data : JSON.stringify({}),
					success : function(msg) {
						if (msg.succeed) {

							$("#imageItemTpl").tmpl(msg.value).appendTo($('#image-ui-items').empty());

							$('#select-image-modal').modal('show');
						} else {
							alert('获取图片失败!')
						}
					}
				});
			});

			$('#add-menu-ui-form').form({
				name : {
					identifier : 'name',
					rules : [ {
						type : 'empty',
						prompt : '请输入菜名!'
					} ]
				},
				category : {
					identifier : 'category',
					rules : [ {
						type : 'empty',
						prompt : '请选择分类!'
					} ]
				},
				price : {
					identifier : 'price',
					rules : [ {
						type : 'empty',
						prompt : '请输入正确价格!'
					} ]
				},
				privilege : {
					identifier : 'privilege',
					rules : [ {
						type : 'empty',
						prompt : '请输入正确优惠!'
					} ]
				}
			});

			$('#add-menu-ui-form').form('setting', {
				onSuccess : function() {

					$.post('menu/updateSubmit.do', $('#add-menu-form').serialize(), function(data) {

						if (data.succeed) {
							alert('更新成功!');
						} else {
							alert(data.msg.detail);
						}
					});
					//alert('success');
				},
				onFailure : function() {
					$("html,body").animate({
						scrollTop : $("#error-msg-anchor").offset().top
					}, 500);
					//alert('输入有误!');
				}
			});

			/* $('#add-menu-btn').click(function() {
				//$('#add-menu-ui-form').form('validate form');
				$('#add-menu-ui-form').form('submit');
			}); */
		});

		/**选中图片 **/
		function selectImage(_this, id, path) {
			$('#resourceId').val(id);
			$('#resourceImage').attr('src', '../../../' + path);

			$(_this).siblings("div[class='item']").find('i').removeClass('checkmark').addClass('like');

			$(_this).find('i').removeClass('like').addClass('checkmark');
		}
	</script>


</body>
</html>
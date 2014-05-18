<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- head common -->
<%@ include file="../common.jsp"%>
<title>餐助手-商家服务</title>
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

	<!-- sidebar -->
	<%@ include file="../menu.jsp"%>

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<!-- page main content -->
	<h4 class="ui top attached header" style="margin-top: 45px;">菜品添加</h4>
	<a id="error-msg-anchor"></a>

	<div class="ui segment attached">
		<form action="menu.add.do" id="add-menu-form" method="post">
			<div class="ui warning form segment" id='add-menu-ui-form'>
				<div class="ui error message" id="add-menu-ui-message"></div>
				<div class="two fields">
					<div class="field">
						<label>菜名</label> <input placeholder="输入菜名" type="text" name="name">
					</div>
					<div class="inline field">
						<div class="ui checkbox" style="margin-top: 30px;">
							<input type="checkbox" name="_isDelete"> <label>禁用 (勾选后该项菜对用户将不再可见)</label>
						</div>
					</div>
				</div>
				<div class="two fields">
					<div class="field">
						<label>分类</label>
						<div class="ui fluid selection dropdown">
							<div class="text">选择...</div>
							<i class="dropdown icon"></i> <input type="hidden" name="categoryId" id="category-hidden-input">
							<div class="menu" id="category-menu-items">
								<c:forEach items="${menuCategoryList}" var="item">
									<div class="item" data-value="${item.id}">${item.name }</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="field">
						<div class="ui action input" style="margin-top: 20px;">
							<input type="text" placeholder="增加分类" id="add-category-text-input">
							<div class="ui vertical animated button" id="add-category-btn" style="margin-top: 20px;">
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
						<label>价格</label> <input placeholder="价格" type="text" name="price">
					</div>
					<div class="field"></div>
					<!-- <div class="field">
						<label>优惠</label> <input placeholder="优惠" type="text"
							name="privilege">
						<div class="ui red pointing above ui label">样例:7折输入 0.7
							直减10元输入 10</div>
					</div> -->
				</div>
				<div class="two fields">
					<div class="field">
						<label>口味</label>
						<div class="ui fluid selection dropdown">
							<div class="text">选择...</div>
							<i class="dropdown icon"></i> <input type="hidden" name="tasteId" id="taste-hidden-input">
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
						<textarea name="introduce"></textarea>
					</div>
					<div class="field"></div>
				</div>
				<div class="two fields">
					<div class="field">
						<input type="hidden" name="resourceId" id="resourceId"> <label>图片</label> <img class="rounded ui image"
							alt="图片" src="../../../resources/img/menu-default.jpg" id="resourceImage">
					</div>
					<div class="field">
						<div class="ui vertical animated button" style="margin-top: 20px; margin-bottom: 20px;" id="select-image-btn">
							<div class="hidden content">选择图片</div>
							<div class="visible content">
								<i class="browser icon"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="ui blue submit button" id="add-menu-btn">添加</div>
			</div>
		</form>
	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<!-- 菜单分类modal -->
	<div class="ui small modal czzCategory" id="add-category-modal">
		<i class="close icon"></i>
		<div class="header">添加分类</div>
		<div class="content">
			<div class="ui form">
				<div class="field">
					<label>输入分类</label> <input type="text" id="category-text">
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
	<div class="ui small modal czzTaste" id="add-taste-modal">
		<i class="close icon"></i>
		<div class="header">添加口味</div>
		<div class="content">
			<div class="ui form">
				<div class="field">
					<label>输入口味</label> <input type="text" id="taste-text">
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
	<div class="ui modal czzImage" id="select-image-modal">
		<i class="close icon"></i>
		<div class="header">选择图片</div>
		<div class="content">
			<div class="ui stackable items" id="image-ui-items" style="height: 350px; overflow: auto;"></div>
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

	<div class="ui page dimmer czsMsg">
		<div class="content" style="display: none;">
			<div class="center">
				<div class="ui huge message">
					<span></span>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		jQuery(function($) {
			$('#menu-item-menu-input').addClass('active');

			$('.ui.dropdown').dropdown();

			$('.ui.checkbox').checkbox();

			$('.ui.modal').modal();

			$('.ui.page.dimmer.czsMsg').click(function() {
				$('.ui.page.dimmer.czsMsg > .content').hide();
			});

			$('#add-category-btn').click(
					function() {
						var category = $('#add-category-text-input').val();
						if (!category) {// 不能为空
							$('.ui.page.dimmer.czsMsg .center span').text('分类不能为空!');
							$('.ui.page.dimmer.czsMsg > .content').show();
							$('.ui.page.dimmer.czsMsg').dimmer('show');
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
								$('.ui.page.dimmer.czsMsg .center span').text(data.msg.detail);
								$('.ui.page.dimmer.czsMsg > .content').show();
								$('.ui.page.dimmer.czsMsg').dimmer('show');
							}
						});
					});

			$('#add-taste-btn').click(
					function() {
						var taste = $('#add-taste-text-input').val();
						if (!taste) {// 不能为空
							$('.ui.page.dimmer.czsMsg .center span').text('口味不能为空!');
							$('.ui.page.dimmer.czsMsg > .content').show();
							$('.ui.page.dimmer.czsMsg').dimmer('show');
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
								$('.ui.page.dimmer.czsMsg .center span').text(data.msg.detail);
								$('.ui.page.dimmer.czsMsg > .content').show();
								$('.ui.page.dimmer.czsMsg').dimmer('show');
							}
						});
					});

			$('#select-image-modal').modal('setting', {
				closable : false,
				onDeny : function() {
					return true;
				},
				onApprove : function() {
				}
			});

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
							$('.ui.page.dimmer.czsMsg .center span').text('获取图片失败!');
							$('.ui.page.dimmer.czsMsg > .content').show();
							$('.ui.page.dimmer.czsMsg').dimmer('show');
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
					identifier : 'categoryId',
					rules : [ {
						type : 'empty',
						prompt : '请选择分类!'
					} ]
				},
				taste : {
					identifier : 'tasteId',
					rules : [ {
						type : 'empty',
						prompt : '请选择口味!'
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

					$.post('menu/add.do', $('#add-menu-form').serialize(), function(data) {

						if (data.succeed) {
							$('.ui.page.dimmer.czsMsg .center span').text('菜品添加成功!');
							$('.ui.page.dimmer.czsMsg > .content').show();
							$('.ui.page.dimmer.czsMsg').dimmer('show');
						} else {
							$('.ui.page.dimmer.czsMsg .center span').text(data.msg.detail);
							$('.ui.page.dimmer.czsMsg > .content').show();
							$('.ui.page.dimmer.czsMsg').dimmer('show');
						}
					});
				},
				onFailure : function() {
					$("html,body").animate({
						scrollTop : $("#error-msg-anchor").offset().top
					}, 500);
				}
			});

		});

		/**选中图片 **/
		function selectImage(_this, id, path) {
			$('#resourceId').val(id);
			$('#resourceImage').attr('src', '../../../' + path);

			$(_this).siblings("div[class='item']").find('i').removeClass('checkmark').addClass('like');

			$(_this).find('i').removeClass('like').addClass('checkmark');

			$('#select-image-modal').modal('hide');
		}
	</script>


</body>
</html>
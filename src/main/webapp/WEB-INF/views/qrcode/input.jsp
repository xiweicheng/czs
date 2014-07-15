<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- head common -->
<%@ include file="../common.jsp"%>
<title>餐助手-商家服务</title>
</head>
<body style="margin: 0px; padding: 0px;">
	<!-- 侧边栏 -->
	<%@ include file="../menu.jsp"%>

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">二维码配置</h4>
	<a id="error-msg-anchor"></a>

	<div class="ui segment attached">
		<h5 class="ui top attached header">您的账户信息</h5>
		<div class="ui bottom attached segment">
			<div class="ui huge label" style="margin-top: 3px; margin-bottom: 3px;">
				餐豆值
				<div class="detail">${business.lifeValue}</div>
			</div>
			<div class="ui huge label" style="margin-top: 3px; margin-bottom: 3px;">
				二维码限制数
				<div class="detail">${business.qrcodeLimit}</div>
			</div>
			<div class="ui huge label" style="margin-top: 3px; margin-bottom: 3px;">
				授权天数
				<div class="detail">${business.days}</div>
			</div>
		</div>
		<form action="qrcode/create.do" id="add-qrcode-form" method="post">
			<div class="ui warning form segment" id='add-menu-ui-form'>
				<div class="ui error message" id="add-menu-ui-message"></div>
				<div class="two fields">
					<div class="field">
						<label>二维码信息</label> <input placeholder="输入说明" type="text" name="description">
						<div style="margin-top: 10px;">
							<input placeholder="授权使用次数" type="text" name="useTimes" maxlength="10" style="width: 200px;">
							<div class="ui red label">兑换率:一次/10餐豆值</div>
						</div>
					</div>
					<div class="field">
						<div class="ui blue button czsAdd" onclick="addHandler(this);" style="margin-top: 20px;">添加</div>
						<div class="ui blue button czsDelete" style="display: none; margin-top: 20px;" onclick="deleteHandler(this);">删除</div>
					</div>
				</div>
				<div class="two fields">
					<div class="field">
						<label>分类</label>
						<div class="ui fluid selection dropdown">
							<div class="text">选择...</div>
							<i class="dropdown icon"></i> <input type="hidden" name="categoryId" value="1">
							<div class="menu" id="category-menu-items">
								<c:forEach items="${categoryList}" var="item">
									<div class="item" data-value="${item.id}">${item.name }</div>
								</c:forEach>
							</div>
						</div>
						<div style="margin-top: 10px;">
							<div class="ui red label">提示:角色分类的二维码只能生成一张</div>
						</div>
					</div>
					<div class="field"></div>
				</div>
				<div class="ui blue submit button" id="add-menu-btn">生成</div>
			</div>
		</form>
	</div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<script type="text/javascript">
		function addHandler(_this) {
			var twoFields = $(_this).parent().parent();
			twoFields.clone().insertAfter(twoFields).find('.czsDelete').show();
		}
		function deleteHandler(_this) {
			$(_this).parent().parent().remove();
		}

		jQuery(function($) {
			$('#menu-item-qrcode-main').addClass('active');

			$('.ui.dropdown').dropdown();

			$('#add-menu-ui-form').form({
				name : {
					identifier : 'description',
					rules : [ {
						type : 'empty',
						prompt : '请输入说明!'
					} ]
				},
				useTimes : {
					identifier : 'useTimes',
					rules : [ {
						type : 'empty',
						prompt : '请输入授权使用次数!'
					} ]
				},
				category : {
					identifier : 'categoryId',
					rules : [ {
						type : 'empty',
						prompt : '请选择分类!'
					} ]
				}
			});

			$('#add-menu-ui-form').form('setting', {
				onSuccess : function() {
					$('#add-qrcode-form').submit();
				},
				onFailure : function() {
					$("html,body").animate({
						scrollTop : $("#error-msg-anchor").offset().top
					}, 500);
				}
			});
		});
	</script>
</body>
</html>
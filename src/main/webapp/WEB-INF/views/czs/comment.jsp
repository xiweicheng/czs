<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- head common -->
<%@ include file="common.jsp"%>
<title>餐助手-平台服务</title>
</head>
<body style="margin: 0px; padding: 0px;">

	<!-- header -->
	<div class="ui fixed transparent inverted main menu" style="top: 0px;">
		<div class="container">
			<div class="title item">
				<b>餐助手</b> 建议留言
			</div>
		</div>
	</div>

	<div class="czs top spacer"></div>

	<div class="ui segment attached">
		<div class="ui column grid">
			<div class="column">
				<div class="ui piled blue segment">
					<h2 class="ui header">
						<i class="icon inverted circular blue comment"></i> 建议留言
					</h2>
					<div class="ui threaded comments">
						<form class="ui reply form" id="czs-reply-form">
							<input type="hidden" name="openId" value="${param.openId}">
							<div class="field">
								<textarea name="content"></textarea>
							</div>
							<div class="ui fluid blue labeled submit icon button">
								<i class="icon edit"></i> 提交
							</div>
						</form>
						<c:forEach items="${list}" var="item">
							<div class="comment">
								<a class="avatar"> <img src="${item.headimgurl}/46">
								</a>
								<div class="content">
									<a class="author">${item.nickname}</a>
									<div class="metadata">
										<span class="date">${item.nice_time}</span>
									</div>
									<div class="text">${item.content}</div>
									<!-- <div class="actions">
										<a class="delete">删除</a>
									</div> -->
								</div>
								<c:if test="${! empty item.children}">
									<div class="comments">
										<c:forEach items="${item.children}" var="item">
											<div class="comment">
												<a class="avatar"> <img src="${item.headimgurl}/46">
												</a>
												<div class="content">
													<a class="author">${item.nickname}</a>
													<div class="metadata">
														<span class="date">${item.nice_time}</span>
													</div>
													<div class="text">${item.content}</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</c:if>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="footer.jsp"%>

	<script type="text/javascript">
		jQuery(function($) {
			$('.ui.submit.button').click(function() {
				if (!$('#czs-reply-form textarea').val()) {
					$.colorbox({
						html : '<h3 class="ui header">评论内容不能为空!</h3>'
					});
					return;
				}

				$.post('czs/free/commentSubmit.do', $('#czs-reply-form').serialize(), function(msg) {
					if (msg.succeed) {
						window.location.reload();
					} else {
						$.colorbox({
							html : '<h3 class="ui red header">操作失败!<br/>失败信息:' + msg.msg.detail + '</h3>'
						});
					}
				}, 'json');
			});
		});
	</script>
</body>
</html>
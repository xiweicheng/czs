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
<script src="../../../resources/js/lib/highcharts.js" charset="utf-8"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>餐助手-商家服务</title>
<script type="text/javascript">
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideToolbar');
		WeixinJSBridge.call('hideOptionMenu');
	});
</script>
</head>
<body style="margin: 0px; padding: 0px;">
	<!-- 侧边栏 -->
	<%@ include file="../menu.jsp"%>

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">菜品统计</h4>
	<div class="ui segment attached czsMenu"></div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>


	<!-- 信息modal -->
	<div class="ui modal czsMenuDay" id="business-update-modal">
		<i class="close icon"></i>
		<div class="header">菜品点击统计</div>
		<div class="content" style="padding: 5px; height:400px;"></div>
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
			
			$('#menu-item-business-menu-stat').addClass('active');
			
			$('.ui.modal.czsMenuDay').modal();
			

			Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function(color) {
				return {
					radialGradient : {
						cx : 0.5,
						cy : 0.3,
						r : 0.7
					},
					stops : [ [ 0, color ], [ 1, Highcharts.Color(color).brighten(-0.3).get('rgb') ] ]
				};
			});


			var _ids;//[]

			var menuDayGraphFunction = function(value, subtitle) {
				
				$('.ui.modal.czsMenuDay > .content').highcharts(
						{
							chart : {
								type : 'column'
							},
							title : {
								text : '菜品点击量'
							},
							subtitle : {
								text : subtitle
							},
							xAxis : {
								categories : value.date,
								labels : {
									rotation : -45,
									align : 'right',
								}
							},
							yAxis : {
								min : 0,
								title : {
									text : '点击量 (份)'
								}
							},
							credits : {
								enabled : false
							},
							tooltip : {
								shared : true
							},
							plotOptions : {
								column : {
									pointPadding : 0.2,
									borderWidth : 0
								}
							},
							series : [ {
								name : '日点击量',
								data : value.copies
							}, {
								name : '日点击量',
								type : 'spline',
								data : value.copies
							} ]
						});
			}

			$.post("business/menuGraph.do", {}, function(msg) {

				if (msg.succeed) {
					_ids = msg.value.ids;
					$('.ui.segment.czsMenu').highcharts({
						chart : {
							type : 'bar'
						},
						title : {
							text : '菜品点击统计'
						},
						subtitle : {
							text : '历史全部数据'
						},
						xAxis : {
							categories : msg.value.names,
							title : {
								text : null
							}
						},
						yAxis : {
							min : 0,
							title : {
								text : '顾客点击量',
								align : 'high'
							},
							labels : {
								overflow : 'justify'
							}
						},
						tooltip : {
							valueSuffix : ' 份'
						},
						plotOptions : {
							bar : {
								dataLabels : {
									enabled : true
								},
								events : {
									click : function(e) {

										$.each(_ids, function(i, item) {
											var arr = item.split('_');
											if (arr[1] == e.point.category) {

												$.post('business/menuDayGraph.do', {
													id : arr[0]
												}, function(msg) {
													if (msg.succeed) {

														$('.ui.modal.czsMenuDay').modal('show');

														menuDayGraphFunction(msg.value, arr[1]);
														
														
													} else {
														alert('获取数据失败!');
													}
												});

												return false;
											}
										});
									}
								}
							}
						},
						legend : {
							layout : 'vertical',
							align : 'right',
							verticalAlign : 'top',
							x : -40,
							y : 100,
							floating : true,
							borderWidth : 1,
							backgroundColor : '#FFFFFF',
							shadow : true
						},
						credits : {
							enabled : false
						},
						series : [ {
							name : '总点击量',
							data : msg.value.values
						} ]
					});
				} else {
					alert('获取数据失败!');
				}
			}, 'json');
		});
	</script>
</body>
</html>
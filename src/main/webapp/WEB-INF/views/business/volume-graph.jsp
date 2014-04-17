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

	<h4 class="ui top attached header" style="margin-top: 45px;">营业额统计</h4>
	<div class="ui segment attached czsMenu"></div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<!-- 信息modal -->
	<div class="ui modal czsVolumeDay">
		<i class="close icon"></i>
		<div class="header">日营业额统计</div>
		<div class="content" style="padding: 5px; height: 400px;"></div>
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
			$('#menu-item-business-volume-stat').addClass('active');

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

			var volumeDayGraphFunction = function(value, title) {
				// Build the chart
				$('.ui.modal.czsVolumeDay > .content').highcharts({
					chart : {
						plotBackgroundColor : null,
						plotBorderWidth : null,
						plotShadow : false
					},
					title : {
						text : title
					},
					tooltip : {
						pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
					},
					credits : {
						enabled : false
					},
					plotOptions : {
						pie : {
							allowPointSelect : true,
							cursor : 'pointer',
							dataLabels : {
								enabled : false
							},
							showInLegend : true
						}
					},
					series : [ {
						type : 'pie',
						name : '日营业额',
						data : value
					} ]
				});
			}

			$.post("business/volumeGraph.do", {}, function(msg) {

				if (msg.succeed) {

					$('.ui.segment.czsMenu').highcharts(
							{
								chart : {
									type : 'column'
								},
								title : {
									text : '营业额统计'
								},
								subtitle : {
									text : '按天统计'
								},
								xAxis : {
									categories : msg.value.date,
									labels : {
										rotation : -45,
										align : 'right',
									}
								},
								yAxis : {
									min : 0,
									title : {
										text : '营业额 (元)'
									}
								},
								credits : {
									enabled : false
								},
								tooltip : {
									headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
									pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
											+ '<td style="padding:0"><b>{point.y:.1f} 元</b></td></tr>',
									footerFormat : '</table>',
									shared : true,
									useHTML : true
								},
								plotOptions : {
									column : {
										pointPadding : 0.2,
										borderWidth : 0,
										events : {
											click : function(e) {
												$.post('business/volumeDayGraph.do', {
													date : e.point.category
												}, function(msg) {
													if (msg.succeed) {

														$('.ui.modal.czsVolumeDay').modal('show');

														volumeDayGraphFunction(msg.value, e.point.category);

													} else {
														alert('获取数据失败!');
													}
												});
											}
										}
									}
								},
								series : [ {
									name : '日营业额',
									data : msg.value.num
								}, {
									name : '日营业额',
									type : 'spline',
									data : msg.value.num
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
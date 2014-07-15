<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- head common -->
<%@ include file="../common.jsp"%>
<title>餐助手-商家服务</title>

<script type="text/javascript" src="../../../resources/js/lib/highcharts.js" charset="utf-8"></script>
<script type="text/javascript" src="../../../resources/js/lib/exporting.js" charset="utf-8"></script>
</head>
<body style="margin: 0px; padding: 0px;">

	<!-- 侧边栏 -->
	<%@ include file="../menu.jsp"%>

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<h4 class="ui top attached header" style="margin-top: 45px;">服务统计</h4>

	<div class="ui segment attached">
		<div class="ui icon input">
			<input type="text" placeholder="开始日期" id="datepicker-start"><i class="calendar icon"
				onclick="$('#datepicker-start').handleDtpicker('show');"></i>
		</div>
		<div class="ui label">～</div>
		<div class="ui icon input">
			<input type="text" placeholder="结束日期" id="datepicker-end"><i class="calendar icon"
				onclick="$('#datepicker-end').handleDtpicker('show');"></i>
		</div>
		<div class="ui button czsConfirm">确定</div>
	</div>

	<div class="ui segment attached czsService" style="min-height: 415px;"></div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<!-- 信息modal -->
	<div class="ui modal czsServiceDay">
		<i class="close icon"></i>
		<div class="header">日服务统计</div>
		<div class="content" style="padding: 5px; height: 400px;"></div>
		<!-- <div class="actions">
			<div class="two fluid ui buttons">
				<div class="ui deny labeled icon button">
					<i class="remove icon"></i> 取消
				</div>
				<div class="ui approve right labeled icon button">
					确定 <i class="checkmark icon"></i>
				</div>
			</div>
		</div> -->
	</div>

	<script type="text/javascript">
		function serviceDayGraph(value, title) {
			$('.ui.modal.czsServiceDay > .content').highcharts({
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
					name : '日服务数',
					data : value
				} ]
			});
		}

		function showGraph() {
			$.post("business/serviceGraph.do", {
				start : $("#datepicker-start").val(),
				end : $("#datepicker-end").val()
			}, function(msg) {

				if (msg.succeed) {

					$('.ui.segment.czsService').highcharts({
						chart : {
							type : 'column',
							events: {
								load : function(event){
									setTimeout(function(){
										event.currentTarget.reflow();
									}, 100)
								}
							}
						},
						title : {
							text : '服务统计'
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
								text : '服务数 (次)'
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
								borderWidth : 0,
								events : {
									click : function(e) {
										$.post('business/serviceDayGraph.do', {
											date : e.point.category
										}, function(msg) {
											if (msg.succeed) {

												$('.ui.modal.czsServiceDay').modal('show');

												serviceDayGraph(msg.value, e.point.category);

											} else {
												alert('获取数据失败!');
											}
										});
									}
								}
							}
						},
						series : [ {
							name : '日服务数',
							data : msg.value.cnt
						}, {
							name : '日服务数',
							type : 'spline',
							data : msg.value.cnt
						} ]
					});
				} else {
					alert('获取数据失败!');
				}
			}, 'json');
		}

		jQuery(function($) {

			$('#menu-item-business-service-stat').addClass('active');

			$('#datepicker-start').appendDtpicker({
				dateFormat : 'YYYY-MM-DD',
				dateOnly : true,
				locale : 'cn',
				closeOnSelected : true,
				current : '${start}'
			});
			$('#datepicker-end').appendDtpicker({
				dateFormat : 'YYYY-MM-DD',
				dateOnly : true,
				locale : 'cn',
				closeOnSelected : true,
				current : '${end}'
			});

			$('.ui.button.czsConfirm').click(function() {
				showGraph();
			});

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
			Highcharts.setOptions({
				lang : {
					downloadJPEG : '下载为JPEG图像',
					downloadPDF : '下载为PDF文档',
					downloadPNG : '下载为PNG图像',
					downloadSVG : '下载为SVG矢量图像',
					loading : '加载中...',
					printChart : '打印图表',
					rangeSelectorFrom : '从',
					rangeSelectorTo : '到'
				}
			});

			showGraph();
		});
	</script>
</body>
</html>
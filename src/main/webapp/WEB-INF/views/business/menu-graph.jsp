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

	<h4 class="ui top attached header" style="margin-top: 45px;">菜品统计</h4>

	<div class="ui segment attached czsMenu"></div>

	<!-- footer -->
	<%@ include file="../footer.jsp"%>

	<!-- 信息modal -->
	<div class="ui modal czsMenuDay" id="business-update-modal">
		<i class="close icon"></i>
		<div class="header">菜品点击统计</div>
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
		<div class="content" style="padding: 5px; height: 400px;"></div>
	</div>

	<script type="text/javascript">
		var _id;
		var _category;

		function menuDayGraph(value, subtitle) {

			$('.ui.modal.czsMenuDay > .content').highcharts({
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

		jQuery(function($) {

			$('#menu-item-business-menu-stat').addClass('active');

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
				$.post('business/menuDayGraph.do', {
					id : _id,
					start : $("#datepicker-start").val(),
					end : $("#datepicker-end").val()
				}, function(msg) {
					if (msg.succeed) {

						$('.ui.modal.czsMenuDay').modal('show');

						menuDayGraph(msg.value, _category);

					} else {
						alert("操作失败!");
					}
				});
			});

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

			var _ids;//[]

			$.post("business/menuGraph.do", {}, function(msg) {

				if (msg.succeed) {
					_ids = msg.value.ids;
					$('.ui.segment.czsMenu').highcharts({
						chart : {
							type : 'bar',
							events : {
								load : function(event) {
									setTimeout(function() {
										event.currentTarget.reflow();
									}, 100)
								}
							}
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

												_id = arr[0];
												_category = arr[1];

												$.post('business/menuDayGraph.do', {
													id : _id,
													start : $("#datepicker-start").val(),
													end : $("#datepicker-end").val()
												}, function(msg) {
													if (msg.succeed) {

														$('.ui.modal.czsMenuDay').modal('show');

														menuDayGraph(msg.value, _category);

													} else {
														alert("操作失败!");
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
jQuery(function($) {
	$('#testAddBtn').click(function() {

				$.ajax({
							type : "POST",
							url : $(this).text(),
							contentType : 'application/json',
							processData : false,
							dataType : "json",
							data : JSON.stringify({
										start : 0,
										limit : 50,
										params : {
											startTime : "2010/01/01 00:00:00",
											endTime : "2014/02/28 23:59:00",
											monitoringType : "agent",
											level : "2,3,4,5",
											keyword : "All",
											description : "Allmoni agent"
										}
									}),
							success : function(msg) {
								if (!!msg && msg.succeed) {
									var value = msg.value;
									if (!!value) {
										alert(value[0].description);
									}
								}
							}
						});

			});

	$('#testFormBtn').click(function() {

				$.post($(this).text(), {
							startTime : "2010/01/01 00:00:00",
							endTime : "2014/02/28 23:59:00",
							monitoringType : "agent",
							level : "2,3,4,5",
							keyword : "All",
							description : "Allmoni agent"
						}, function(data) {
						}, 'json');

			});

	$('#testRespBodyBtn').click(function() {

				$.post($(this).text(), {
							startTime : "2010/01/01 00:00:00",
							endTime : "2014/02/28 23:59:00",
							monitoringType : "agent",
							level : "2,3,4,5",
							keyword : "All",
							description : "aaa描述!aaaa"
						}, function(data) {

						}, 'json');

			});

	$('#weiXinVerifyBtn').click(function() {

		var params = "?signature=46fc4ed9f1754c4dd03e192621e4acbc2b5e5707&timestamp=1395287492&nonce=1394838964&echostr=5990787692012135876";

		$.ajax({
			type : "POST",
			url : $(this).text() + params,
			contentType : 'application/xml',
			processData : false,
			data : '<xml><ToUserName><![CDATA[gh_b401b0f3d9a6]]></ToUserName><FromUserName><![CDATA[o_gy-uDW8XJuRMZRzTOLEWVDJBok]]></FromUserName><CreateTime>1395291909</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA[哈哈哈]]></Content><MsgId>5992733117728498379</MsgId></xml>',
			success : function(msg) {
			}
		});

	});

});
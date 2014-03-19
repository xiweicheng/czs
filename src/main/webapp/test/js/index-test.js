jQuery(function($) {
	$('#testAddBtn').click(function() {

		$.ajax({
			type : "POST",
			url : $(this).text() + ".do",
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

		$.post($(this).text() + ".do", {
			startTime : "2010/01/01 00:00:00",
			endTime : "2014/02/28 23:59:00",
			monitoringType : "agent",
			level : "2,3,4,5",
			keyword : "All",
			description : "Allmoni agent"
		}, function(data) {
		}, 'json');

	});

	$('#weiXinVerifyBtn').click(function() {

		$.get($(this).text() + ".do", {
			signature : "qwertyuiop",
			timestamp : "2014/02/28 23:59:00",
			nonce : "123456",
			echostr : "2,3,4,5"
		}, function(data) {
		}, 'json');

	});
});
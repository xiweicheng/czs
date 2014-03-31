jQuery(function($) {
			$('.ui.sidebar').sidebar('show');

			$('.launch.item').click(function() {
						$('.ui.sidebar').sidebar("toggle");
					});
		});
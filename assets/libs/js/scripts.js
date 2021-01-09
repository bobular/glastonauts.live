(function( $ ){

	/* ********* WINDOW LOAD ********** */
	// jQuery(window).load(function() {

		const showTypes = {
			'playlist': 'Playlist',
			'repeat': 'Playlist Replay',
			'dgt-dj': 'Live DJ Set',
			'vin-dj': 'Live DJ Set',
			'pre-dj': 'Pre-recorded DJ Set',
			'colab': 'Collaborative Playlist',
			'quiz': 'Quiz',
		}


		const showIcons = {
			'playlist': '#playlist',
			'repeat': '#playlist',
			'dgt-dj': '#dgt-dj',
			'vin-dj': '#vinyl-dj',
			'pre-dj': '#dgt-dj',
			'colab': '#playlist',
			'quiz': '#quiz',
		}

		let $covers = $(".svg-cover");

		let editSvg = function (svg) {
			$(svg).contents().find('#settitle').text($(svg).data("settitle"));
			$(svg).contents().find('#contributor').text($(svg).data("contributor"));
			$(svg).contents().find('#settype').text(showTypes[$(svg).data("settype")]);
			$(svg).contents().find('#background').attr("fill",$(svg).data("bg"));

			if ($(svg).data("bg") && $(svg).data("bg").toLowerCase() === "#cbdee0") {
				$(svg).contents().find('#Logo-final,#playlist').attr("fill","#29878D");
				$(svg).contents().find('#contributor,#settype,#settitle').parent().attr("fill","#29878D");
			}
			
			if ($(svg).data("settype") === 'vin-dj') {
				let $vin = $(svg).contents().find('#vinyl-dj'); 
				$vin.find('#vinyl-colour').attr("fill", $(svg).data("bg"));
				
			}
			$(svg).contents().find(showIcons[$(svg).data("settype")]).removeAttr("display");
		}
	$covers.each(function () {
		$(this).on('load', function () {
			editSvg(this);
		});
	});
	// });
	

} )( jQuery );

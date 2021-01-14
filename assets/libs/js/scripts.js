(function( $ ){
	
	/* ********* WINDOW LOAD ********** */
	jQuery(window).load(function() {

		const showTypes = {
			'playlist': 'Playlist',
			'repeat': 'Playlist Replay',
			'dgt-dj': 'Live DJ Set',
			'vin-dj': 'Live DJ Set',
			'pre-dj': 'Pre-recorded DJ Set',
			'colab': 'Collaborative Playlist',
			'quiz': 'Quiz',
			'talk': 'Live Radio Show'
		}


		const showIcons = {
			'playlist': '#playlist',
			'repeat': '#playlist',
			'dgt-dj': '#dgt-dj',
			'vin-dj': '#vinyl-dj',
			'pre-dj': '#dgt-dj',
			'colab': '#playlist',
			'quiz': '#quiz',
			'talk': '#talk'
		}

		
	
		let $covers = $(".svg-cover");

		$covers.each(function () {
			$(this).contents().find('#settitle').text($(this).data("settitle"));
			$(this).contents().find('#contributor').text($(this).data("contributor"));
			$(this).contents().find('#settype').text(showTypes[$(this).data("settype")]);
			$(this).contents().find('#background').attr("fill",$(this).data("bg"));

			if ($(this).data("bg") && $(this).data("bg").toLowerCase() === "#cbdee0") {
				$(this).contents().find('#Logo-final,#playlist').attr("fill","#29878D");
				$(this).contents().find('#contributor,#settype,#settitle').parent().attr("fill","#29878D");
			}
			
			if ($(this).data("settype") === 'vin-dj') {
				let $vin = $(this).contents().find('#vinyl-dj'); 
				$vin.find('#vinyl-colour').attr("fill", $(this).data("bg"));
				
			}
			$(this).contents().find(showIcons[$(this).data("settype")]).removeAttr("display");
			console.log($(this).contents().find(showIcons[$(this).data("settype")]));
		})

	});
	

} )( jQuery );

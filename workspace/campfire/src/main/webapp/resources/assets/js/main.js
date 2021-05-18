/*
	Momentum by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
*/

(function($) {

	var settings = {
		carousel: {
			// Transition speed (in ms)
			// For timing purposes only. It *must* match the transition speed of ".carousel > article".
				speed: 350
		}
	};

	/**
	* Custom carousel for Momentum.
	* @return {jQuery} jQuery object.
	*/
	$.fn._carousel = function(options) {

		var	$window = $(window),
			$this = $(this);

		// Handle no/multiple elements.
			if (this.length == 0)
				return $this;

			if (this.length > 1) {

				for (var i=0; i < this.length; i++)
					$(this[i])._slider(options);

				return $this;

			}

		// Vars.
			var	current = 0, pos = 0, lastPos = 0,
				slides = [],
				$slides = $this.children('article'),
				intervalId,
				isLocked = false,
				i = 0;

		// Functions.
			$this._switchTo = function(x, stop) {

				// Handle lock.
					if (isLocked || pos == x)
						return;

					isLocked = true;

				// Stop?
					if (stop)
						window.clearInterval(intervalId);

				// Update positions.
					lastPos = pos;
					pos = x;

				// Hide last slide.
					slides[lastPos].removeClass('visible');

				// Finish hiding last slide after a short delay.
					window.setTimeout(function() {

						// Hide last slide (display).
							slides[lastPos].hide();

						// Show new slide (display).
							slides[pos].show();

						// Show new new slide.
							window.setTimeout(function() {
								slides[pos].addClass('visible');
							}, 25);

						// Unlock after sort delay.
							window.setTimeout(function() {
								isLocked = false;
							}, options.speed);

					}, options.speed);

			};

		// Slides.
			$slides
				.each(function() {

					var $slide = $(this);

					// Add to slides.
						slides.push($slide);

					// Hide.
						$slide.hide();

					i++;

				});

		// Nav.
			$this
				.on('click', '.next', function(event) {

					// Prevent default.
						event.preventDefault();
						event.stopPropagation();

					// Increment.
						current++;

						if (current >= slides.length)
							current = 0;

					// Switch.
						$this._switchTo(current);

				})
				.on('click', '.previous', function(event) {

					// Prevent default.
						event.preventDefault();
						event.stopPropagation();

					// Decrement.
						current--;

						if (current < 0)
							current = slides.length - 1;

					// Switch.
						$this._switchTo(current);

				});

		// Initial slide.
			slides[pos]
				.show()
				.addClass('visible');

		// Bail if we only have a single slide.
			if (slides.length == 1)
				return;

	};

	var $window = $(window),
		$body = $('body'),
		$header = $('#header'),
		$banner = $('#banner');

	// Breakpoints.
		breakpoints({
			default:	['1681px',	null		],
			xlarge:		['1281px',	'1680px'	],
			large: 		['981px',	'1280px'	],
			medium: 	['737px',	'980px'		],
			small: 		['481px',	'736px'		],
			xsmall: 	['361px',	'480px'		],
			xxsmall:	[null,		'360px'		]
		});

	// Play initial animations on page load.
		$window.on('load', function() {
			window.setTimeout(function() {
				$body.removeClass('is-preload');
			}, 100);
		});

	// Carousels.
		$('.carousel')
			._carousel(settings.carousel);

	// Dropdowns.
		$('#nav > ul').dropotron({
			alignment: 'right',
			hideDelay: 350,
			baseZIndex: 100000
		});

	// Menu.
		$('<a href="#navPanel" class="navPanelToggle"><span>Menu</span></a>')
			.appendTo($header);

		$( '<div id="navPanel">' +
				'<nav>' +
					$('#nav') .navList() +
				'</nav>' +
				'<a href="#navPanel" class="close"></a>' +
			'</div>')
				.appendTo($body)
				.panel({
					delay: 500,
					hideOnClick: true,
					hideOnSwipe: true,
					resetScroll: true,
					resetForms: true,
					target: $body,
					visibleClass: 'is-navPanel-visible',
					side: 'right'
				});

	// Banner.
		if ($banner.length > 0) {

			$banner
				.on('mouseenter', '.button', function() {

					$(this).parents('article')
						.addClass('hover');

				})
				.on('mouseleave', '.button', function() {

					$(this).parents('article')
						.removeClass('hover');

				});
		}

})(jQuery);
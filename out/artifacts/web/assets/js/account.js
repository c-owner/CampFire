/**
 * 회원가입/ 로그인 팝업
 */
 
		$( document ).ready(function() {
				$('.fa-findid').on('click', function() {
					$('.modal-wrapper').toggleClass('open');
					$('.page-wrapper').toggleClass('blur-it');
			return false;
				});
		});

		$( document ).ready(function() {
			$('.fa-find').on('click', function() {
				$('.modal-wrapper').toggleClass('open');
				$('.page-wrapper').toggleClass('blur-it');
		return false;
			});
	});
 
	  
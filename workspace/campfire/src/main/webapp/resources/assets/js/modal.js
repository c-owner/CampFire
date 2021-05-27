
/*
*************************
	modal javascript
*************************

*/
function goSignUp(){
	$(".loginModal").hide();
	$(".signUpModal").show();
	$('.modal-wrapper').toggleClass('open');
    $('.page-wrapper').toggleClass('blur-it');
}

function goSignIn(){
    $('.modal-wrapper').toggleClass('open');
    $('.page-wrapper').toggleClass('blur-it');
}
function goSignIn2(){
	$("#findPwBtn").children().css("color", "black");
	$("#findIdBtn").children().css("color", "#2388fa");

	$("form[name='findPwForm']").hide();
	$("form[name='findIdForm']").show();
	
	$(".findModal").hide();
	$(".signUpModal").hide();
	$(".loginModal").show();
}

$(document).ready(function () {
    /*$('.signin').on('click', function () {
        $('.modal-wrapper').toggleClass('open');
        $('.page-wrapper').toggleClass('blur-it');
        return false;
    });
	*/

	$('#findIdPw').on('click', function(e){
		e.preventDefault();
		$('.loginModal').hide();
		$('.findModal').show();
	})
	
	$('#findPwBtn').on('click', function(e){
		e.preventDefault();
		$("#findIdBtn").children().css("color", "black");
		$("#findPwBtn").children().css("color", "#2388fa");
	
		$("form[name='findIdForm']").hide();
		$("form[name='findPwForm']").show();
	})
	$('#findIdBtn').on('click', function(e){
		e.preventDefault();
		$("#findPwBtn").children().css("color", "black");
		$("#findIdBtn").children().css("color", "#2388fa");
	
		$("form[name='findPwForm']").hide();
		$("form[name='findIdForm']").show();
	})
	$('#goSignUpBtn').on('click', function(e){
		e.preventDefault();
		$(".loginModal").hide();
		$(".signUpModal").show();
	})
	/*
	$('.signup').on('click', function(e){
		e.preventDefault();
		$(".loginModal").hide();
		$(".signUpModal").show();
		$('.modal-wrapper').toggleClass('open');
        $('.page-wrapper').toggleClass('blur-it');
	})
	*/
	
	// $('.signup').on('click', function () {
	// 	$('.modal-wrapper').toggleClass('open');
	// 	$('.page-wrapper').toggleClass('blur-it');
	// 	return false;
	// });
	
	
	$(document).mouseup(function (e){
		  var LayerPopup = $('.modal-wrapper');
		  if(LayerPopup.has(e.target).length === 0){
			  LayerPopup.removeClass("open");
			  $(".signUpModal").hide();
			  $(".findModal").hide();
			  $(".loginModal").show();
			  $("form[name='findPwForm']").hide();
			  $("form[name='findIdForm']").show();
			  LayerPopup.removeClass("open");
		  }
		});
});

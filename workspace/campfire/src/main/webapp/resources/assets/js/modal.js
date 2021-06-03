
/*
*************************
	modal javascript
*************************

*/
var checkId = false;
var checkEmail = false;
var checkPw1 = false; //비밀번호 정규식 테스트 여부
var checkPw2 = false; //비밀번호 확인 일치 여부

var code = "";

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
	});
	
	$('#findPwBtn').on('click', function(e){
		e.preventDefault();
		$("#findIdBtn").children().css("color", "black");
		$("#findPwBtn").children().css("color", "#2388fa");
	
		$("form[name='findIdForm']").hide();
		$("form[name='findPwForm']").show();
	});
	$('#findIdBtn').on('click', function(e){
		e.preventDefault();
		$("#findPwBtn").children().css("color", "black");
		$("#findIdBtn").children().css("color", "#2388fa");
	
		$("form[name='findPwForm']").hide();
		$("form[name='findIdForm']").show();
	});
	$('#goSignUpBtn').on('click', function(e){
		e.preventDefault();
		$(".loginModal").hide();
		$(".signUpModal").show();
	});
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
	$("#userId2").on("change", function(e){
		checkId = false;
	});
	
	$("#checkId").on("click", function(e){
		e.preventDefault
		var id = $("#userId2").val();
		var reg = /^[a-z0-9_]{8,12}$/;
		if(!reg.test(id)){
			alert("아이디는 8자에서 12자로 입력해주세요.");
			return false;
		}
		$.ajax({
			type:"get",
			url:contextPath + "/account/checkId?userId="+id,
			dataType:"text",
			contentType:"charset=utf-8",
			success: function(result){
				console.log(result);
				if(result.trim() == "yes"){
					alert("사용 가능한 아이디입니다.");
					checkId = true;
				}else{
					alert("사용 불가능한 아이디입니다.");
					checkId = false;
				}
			},
			error: function(xhr, status, err){
				console.log(xhr);
				console.log(err);
			}
		})
	});
	
	
	
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
	
	$("#memberEmail").on("change", function(e){
		checkEmail = false;
	});
	
	
	
	
	
	$("#userPw").on("keyup", function(e){
		var reg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
		if(reg.test($(this).val())){
			checkPw1 = true;
		}else{
			checkPw1 = false;
		}
		
		if($("#userPw").val() == $("#userPw2").val()){
			checkPw2 = true;
			$("#userPw2").css("color", "green");
		}else{
			checkPw2 = false;
			$("#userPw2").css("color", "red");
		}
	});
	
	$("#userPw2").on("keyup", function(e){
		if($("#userPw").val() == $("#userPw2").val()){
			checkPw2 = true;
			$("#userPw2").css("color", "green");
		}else{
			checkPw2 = false;
			$("#userPw2").css("color", "red");
		}
	});
	
	
});
function EmailCheck(){
	var email = $("#memberEmail").val();
	
	$.ajax({
		type:"get",
		url:contextPath + "/account/sendMailCode?email="+email,
		dataType:"text",
		contentType:"charset=utf-8",
		success: function(result){
			console.log(result);
			if(result.trim() == "error"){
				alert("이메일 확인 후 다시 시도해주세요.");
			}else{
				alert("인증번호가 전송되었습니다.");
				code = result;
			}
		},
		error: function(xhr, status, err){
			console.log(xhr);
			console.log(err);
		}
	})
}

function verifyCheck(){
	var verifyCode = $("#verify").val();
	if(verifyCode == code){
		alert("인증되었습니다.");
		checkEmail = true;
		$("#memberEmail").attr("readonly", "readonly");
		$("#verify").attr("readonly", "readonly");
	}else{
		alert("인증번호가 다릅니다.\n다시 시도해주세요.");
		checkEmail = false;
	}
}

function formSubmit(){
	//유효성검사체크
	if(!checkId){
		alert("아이디 중복확인 후 시도해주세요.");
		return false;
	}
	if(!checkEmail){
		alert("이메일 본인인증 후 시도해주세요.");
		return false;
	}
	if(!checkPw1){
		alert("비밀번호는 영문(대+소문자)+숫자포함 8자이상으로 입력해주세요.");
		return false;
	}
	if(!checkPw2){
		alert("비밀번호 확인이 일치하지 않습니다.");
		return false;
	}
	
	signUpForm.submit();
	
}
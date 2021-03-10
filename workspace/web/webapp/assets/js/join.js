/*
	회원가입
 */

var check = false;
var form = document.joinForm;

// $("input[name='memberId']")
function formSubmit() {
	
	if(form.Agree.check== false) {
		alert('필수로 체크하셔야 진행할 수 있습니다.');
		check = false;
		return false;
	}
		
	      if (form.memberEmail.value == "") {
            alert("이메일을 입력하지 않았습니다.");
            form.memberEmail.focus();
			check = false;
            return false;
        }
		if(form.verify.value == "" ) {
			alert("인증번호를 입력하지 않았습니다.");
			form.verify.focus();
			check = false;
			return false;
		}
				if(form.memberPw.value.length < 8 ) {
			alert("비밀번호 길이는 최소 8자 이상입니다.");
			form.verify.focus();
			check = false;
			return false;
		}
      
		function email_check(email) {    
		    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		    return (email != '' && email != 'undefined' && regex.test(email)); 
		}
		$("input[type=email]").blur(function(){
		  var email = $(this).val();
		  if( email == '' || email == 'undefined') return;
		  if(! email_check(email) ) {
		    alert("잘못된 이메일 형식입니다.");
            form.memberEmail.value="";
		    $(this).focus();
			check = false;
		    return false;
		  } 
		});

		form.submit();
}
	$(function() {
		$('#memberId').keyup(function() {
			$('#idCheck_text').html('');
		});

		$('#memberId').keyup(function() {
			if ($('#memberId').val().length < 4 || $('#memberId').val().length > 12) {
				$('#idCheck_text').html('❌아이디를 4~12자 길이로 해야합니다.<br><br>');
				$('#idCheck_text').attr('color', '#f82a2aa3');
				form.memberId.focus();
				check = false;
			} else if ($('#memberId').val() == $('#memberPw').val()) {
				$('#idCheck_text').html('❌ 아이디와 비밀번호가 동일 합니다.<br><br>');
				$('#idCheck_text').attr('color', '#f82a2aa3');
				form.memberId.focus();
				check = false;
			} else {
			for (var i = 0; i < form.memberId.value.length; i++) {
				ch = form.memberId.value.charAt(i)
					if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z') || !check) {
						$('#idCheck_text').html('❌ 영문 대소문자와 숫자로 해야합니다.<br><br>');
						$('#idCheck_text').attr('color', '#f82a2aa3');
						form.memberId.focus();
						check = false;
					}
			}
				
				check = true;
				$('#idCheck_text').html('✔확인 완료<br><br>');
				$('#idCheck_text').attr('color', '#199894b3');
			}
				//아이디 유효성 검사 (영문소문자, 숫자만 허용)
	

		});
	});

	function checkId(id) {
		check = false;
		if (id == "") {
			$("#idCheck2_text").text("아이디를 작성 하십시오. ");
		} else {
			$.ajax({
				url: contextPath + "/user/MemberCheckIdOkAction.me?id=" + id,
				type: "GET",
				dataType: "text",
				success: function(result) {
					if (result.trim() == "ok") {
						check = true;
						$("#idCheck2_text").text("✔ID 중복 통과");
						$('#idCheck2_text').attr('color', '#199894b3');
					} else {
						$("#idCheck2_text").text("❌이미 존재한 회원ID 입니다.");
						$('#idCheck2_text').attr('color', '#f82a2aa3');
					}
				},
				error: function() { // 오류
					console.log("ERROR");
				}
			});
		}
	}

	$("input[name='memberId']").keyup(function(event) {
		var id = $("input[name='memberId']").val();
		checkId(id);
	})

	$(function() {
		$('#memberPw').keyup(function() {
			$('#pwCheck_text').html('');
			
				if ($('#memberPw').val() < 4 || $('#memberPw').val() > 12) { 
					$('#idCheck_text').attr('color', '#f82a2aa3');
         		 	$('#pwCheck_text').html('❌비밀번호를 4~12자까지 입력해주세요.');
         			   form.memberPw.focus();
            			return false;
					} 
		});
		$('#memberPw2').keyup(function() {
			if ($('#memberPw').val() == $('#memberPw2').val()) {
				$('#pwCheck_text').attr('color', '#199894b3');
				$('#pwCheck_text').html('✔일치합니다!<br><br>');
			} else {
				$('#pwCheck_text').attr('color', '#f82a2aa3');
				$('#pwCheck_text').html('❌일치하지 않습니다!<br><br>');
				return false;
			}
		for (var i = 0; i < form.memberPw.value.length; i++) {
		ch = form.memberPw.value.charAt(i)
		if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') &&  !check) {
				$('#pwCheck_text').attr('color', '#f82a2aa3');
				$('#pwCheck_text').html('❌ 비밀번호는 영문과 숫자 조합으로 해야합니다.<br><br>');
			form.memberPw.focus();
			check = false;
			return false;
		}
	}
			if ($('#memberId').val() == $('#memberPw').val()) {
				$('#idCheck_text').attr('color', '#f82a2aa3');
				$('#idCheck_text').html('❌ 아이디와 비밀번호가 동일 합니다.<br><br>');
				form.memberId.focus();
				check = false;
				return false;
			} 
			
				check = true;
				$('#pwCheck_text').html('✔확인 완료<br><br>');
				$('#pwCheck_text').attr('color', '#199894b3');
			
			
		});
	});
	

	/* 이메일 인증번호 요청 */
	function EmailCheck() {
			var email = $("input[name='memberEmail']").val();
			alert('잠시만 기다려주세요..');
		check = false;
		if (email == "") {
			alert('이메일을 입력하세요.');
		} else {
			$.ajax({
				url: contextPath + "/user/checkEmail.me?email=" + email,
				type: "GET",
				dataType: "text",
				success: function(result) {
					if (result.trim() == "ok") {
						check = true;
						EmailCheck2();
					} else {
						alert('이미 가입된 이메일 입니다.');
					}
				},
				error: function() { // 오류
					console.log("ERROR");
				}
			});
		}
	}
	
 
					/* 인증번호 7자리 */
				
				
		var code = ""; // 코드 
	function EmailCheck2(){
			var email = $("input[name='memberEmail']").val();
					var inputVerify = $(".verify");
			var inputVerifyBox = $(".mail_verify_input_box");
			$.ajax({
				url: "/user/verifyEmail.me?email=" + email,
				type: "GET",
				dataType: "text",
				success: function(result) {
						console.log('result : '+ result);
						check = true
						alert('해당 이메일로 인증번호 7자리를 발송하였습니다.');
						inputVerify.attr("disabled", false);				
						inputVerifyBox.attr("id", "mail_verify_input_box_true");		
						code = result;
				},
				error: function() { // 오류
						check = false;
						alert('인증번호 발송 서버 오류');
					console.log("ERROR");
				}
			});
		}
		
		function verifyCheck(){
			var verify = $("#verify").val();
			verify = parseInt(verify);
			code = parseInt(code);
			console.log('code = '+code);
			console.log('verify = ' + verify);
			check = false;
				if (verify != code) {
					$('#verify_check').attr('color', '#f82a2aa3');
					$('#verify_check').html('❌ 인증번호가 틀렸습니다.<br><br>');
					form.verify.focus();
				} else {
					check = true;
						$('#verify_check').attr('color', '#199894b3');
						$('#verify_check').html('✔인증 완료<br><br>');
						alert('인증에 성공 하였습니다.');
						document.getElementById('verify').readOnly = true;
						inputVerifyBox.attr("id", "mail_verify_input_box_false");		
				}
					/*if (code == verify) {
						console.log('code = ' + code);
						check = true
						alert('인증에 성공 하였습니다.');
					} else {
						alert('인증번호가 틀립니다. 다시 시도하세요.');
					} */
					
			}
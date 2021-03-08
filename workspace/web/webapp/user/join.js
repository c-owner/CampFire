/*
	회원가입
 */

var check = false;
var form = document.joinForm;
function formSubmit() {
	
	//아이디 유효성 검사 (영문소문자, 숫자만 허용)
	for (var i = 0; i < form.memberId.value.length; i++) {
		ch = form.memberId.value.charAt(i)
		if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z') && !check) {
				$('#idCheck_text').html('❌ 영문 대소문자와 숫자로 해야합니다.<br><br>');
				$('#idCheck_text').attr('color', '#f82a2aa3');
			form.memberId.focus();
			return false;
		}
	}
	      if (form.memberEmail.value == "") {
            alert("이메일을 입력하지 않았습니다.")
            form.memberEmail.focus();
            return false;
        }
      
		function email_check( email ) {    
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

	if (check == true ) { 
		form.submit();
	}
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
				check = true;
				$('#idCheck_text').html('✔확인 완료<br><br>');
				$('#idCheck_text').attr('color', '#199894b3');
			}

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
		});
		$('#memberPw2').keyup(function() {
			if ($('#memberPw').val() != $('#memberPw2').val()) {
				$('#pwCheck_text').html('❌일치하지 않음!<br><br>');
				$('#pwCheck_text').attr('color', '#f82a2aa3');
			} else if (form.memberPw.value.length < 4 || form.memberPw.value.length > 12) { 
          	$('#pwCheck_text').html('비밀번호를 4~12자까지 입력해주세요.');
            form.memberPw.focus();
            return false;
			} else if ($('#memberId').val() == $('#memberPw').val()) {
				$('#idCheck_text').html('❌ 아이디와 비밀번호가 동일 합니다.<br><br>');
				$('#idCheck_text').attr('color', '#f82a2aa3');
				form.memberId.focus();
				check = false;
			} else {
				check = true;
				$('#pwCheck_text').html('✔확인 완료<br><br>');
				$('#pwCheck_text').attr('color', '#199894b3');
			}
			
		});
	});

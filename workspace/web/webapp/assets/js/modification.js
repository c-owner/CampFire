/**
 * modifyForm 회원 정보 수정하기
 */

var form = document.modifyForm;

// $("input[name='memberPw']")
function formSubmit() {

	if ($("input[name='memberPw']").val().length < 8) {
		alert("비밀번호 길이는 최소 8자 이상입니다.");
		check = false;
		return false;
	}

	form.submit();
}

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
			if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') & !check) {
				$('#pwCheck_text').attr('color', '#f82a2aa3');
				$('#pwCheck_text').html('❌ 비밀번호는 영문과 숫자 조합으로 해야합니다.<br><br>');
				form.memberPw.focus();
				check = false;
				return false;
			}
		}
		check = true;
		$('#pwCheck_text').html('✔확인 완료<br><br>');
		$('#pwCheck_text').attr('color', '#199894b3');

	});
});


/*function pwUpdate() {
	var pw = $("input[name='memberPw']").val();
	alert('잠시만 기다려주세요..');
	check = false;
	if (email == "") {
		alert('이메일을 입력하세요.');
	} else {
		$.ajax({
			url: contextPath + "/user/MemberEditAction.me?id=" + id,
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
}*/
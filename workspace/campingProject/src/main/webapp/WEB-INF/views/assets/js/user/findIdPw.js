/**
 *  이메일 인증을 통해 Id, Pw 찾는 부분
 */

var form = document.getElementsByClassName("form-group");
function sendEmailId(email) {
	var email = $("input[name='memberEmail']").val();

	if (email == "") {
		alert('이메일을 입력 해주세요.');
		return false;
	} else {
		$.ajax({
			url: "/user/MemberFindIdCheck.me?email=" + email,
			type: "GET",
			dataType: "text",
			success: function(result) {
				if (result.trim() == "ok") {
					alert(email+' 메일로 ID를 전송 하였습니다.');
					emailFindId();
				} else {
					alert('가입된 이메일이 없습니다. 회원가입을 진행 해주세요.');
				}
			},
			error: function() { // 오류
				console.log("ERROR");
			}
		});
	}

}
	$("input[name='memberEmail']").on('click', 'button', function(event) {
		var email = $("input[name='memberEmail']").val();
		sendEmailId(email);
	})
	
function emailFindId(){
	var email = $("input[name='memberEmail']").val();
	location.href= contextPath+"/user/MemberFindId.me?email="+email;
	
}


function sendEmailPw(email) {
	var id = $("input[name='memberId2']").val();
	var email = $("input[name='memberEmail2']").val();
	if (email == "") {
		alert('이메일을 입력해주세요.');
		return false;
	} else if (id == "") {  
		alert('아이디를 입력해주세요.');
		return false;
	}else {
		$.ajax({
/*			url: "/user/MemberFindPwCheck.me?id=" + id +"?email="+email,*/
			url: "/user/MemberFindPwCheck.me?email=" + email,
			type: "GET",
			dataType: "text",
			success: function(result) {
				if (result.trim() == "ok") {
					alert(email+' 메일로 임시 비밀번호를 전송 하였습니다.');
					emailFindPw();
				} else {
					alert('가입된 이메일이 없습니다. 회원가입을 진행 해주세요.');
				}
			},
			error: function() { // 오류
				console.log("ERROR");
			}
		});
	}

}
	$("form[name='pwFindForm']").on('click', 'button', function(event) {
		var email = $("input[name='memberEmail2']").val();
		sendEmailPw(email);
	})
	
function emailFindPw(){
	var email = $("input[name='memberEmail2']").val();
	location.href=  "/user/MemberFindPw.me?email="+email;
	
	
}




/**
 * 
 */


// 로그인

$("#loginBtn").on("click", function(e){
	e.preventDefault();
	var userId = $("#userId").val(); 
	var userPw = $("#userPw").val();
	if(userId == ""){
		alert("아이디를 입력해 주십시오.");
		$("#userId").focus();
		return;
	}
	if(userPw == ""){
		alert("비밀번호를 입력해 주십시오.");
		$("#userPw").focus();
		return;
	}
	
	
	$.ajax({
		url : pageContext + "/account/signIn",
		type: "post",
		contentType : "application/json; charset=utf-8",
		data: JSON.stringify({userId:userId, userPw:userPw}),
		success: function(result){
			if(result != ""){
				alert( result + "님 환영합니다.");
				$('.modal-wrapper').removeClass("open");
			}else {
				alert("아이디 혹은 비밀번호를 다시 확인해 주십시오.");
				return;
			}
		}
	});
});
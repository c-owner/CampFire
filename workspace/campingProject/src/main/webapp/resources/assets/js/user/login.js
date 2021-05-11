/*
로그인
 */

var form = document.loginForm;
var id = $("input[name='memberId']");
var pw = $("input[name='memberPw']");

function loginCheck(){
    if(id == ""){
        alert("아이디를 입력해 주세요.");
        id.focus();
        return false;    // submit 시키지 말 것
    } 
	if(pw == ""){
        alert("암호를 입력해 주세요.");
        pw.focus();
        return false;    // submit 시키지 말 것
    }

    return true;  
}
/*
    회원가입
 */

var check = false;

function formSubmit() {
    var form = document.joinForm;

    if(form.memberId.value = "" || !check) {
        alert("아이디를 입력해주세요.");
        form.memberId.focus();
        return false;
    }
    if(form.memberPw.value = "" || !check) {
        alert("비밀번호를 입력해주세요.");
        form.memberPw.focus();
        return false;
    }
    if(form.memberEmail.value = "" || !check) {
        alert("이메일을 입력해주세요.");
        form.memberEmail.focus();
        return false;
    }

    form.Submit();
}


/*
    회원가입
 */

var check = false;

function formSubmit() {
    var form = document.joinForm;

    if (form.memberId.value = "") {
        alert("아이디를 입력해주세요.");
        form.memberId.focus();
        
        return false;
    }
	check = true;
    form.submit();
}

function checkId(id) {
    check = false;
    if (id == "") {
        $("#idCheck_text").text("아이디를 작성 하십시오. ");
    } else {
        $.ajax({
            url: "MemberCheckIdOkAction.me?id="+id,
            type: "GET",
            dataType: "text",
            success: function(result){
                if (result.trim() == "ok") {
                    check = true;
                    $("#idCheck_text").text("✔사용 가능");
                } else {
                    check = false;
                    $("#idCheck_text").text("❌사용 불가");
                }
            },
            error: function () { // 오류
                console.log("ERROR");
            }
        });
    }
}

$("input[name='memberId']").keyup(function(event){
    var id = $("input[name='memberId']").val();
    checkId(id);
})



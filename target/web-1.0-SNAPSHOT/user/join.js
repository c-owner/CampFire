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

    form.submit();
}

function checkId(id) {
    check = false;
    if(id==""){
        $("#idCheck_text").text("아이디를 작성해주세요.");
    } else {
    console.log("checkId 2")
        $.ajax({
            url: "/MemberCheckId.me?id="+id,
            type: "GET",
            dataType: "text",
            success: function (result) {
                if(result.trim() == "ok"){
                    check = true;
                    $("#idCheck_text").text("✔사용 가능");
                } else {
                    $("#idCheck_text").text("❌사용 불가");
                }
            },
            error: function() {
                console.log("ERROR");
            }
        })
    }
}

$("input[name='memberId']").keyup(function (event) {
    var id = $("input[name='memberId']").val();
    checkId(id);
})



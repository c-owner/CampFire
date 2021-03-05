/*
    회원가입
 */

var check = false;

function formSubmit() {
    var form = document.joinForm;

    if(form.userId.value == "" || !check){
        alert("아이디를 확인해주세요.");
        form.userId.focus();
        return false;
    }

    form.submit();
}

function checkId(id) {
    check = false;

    if(id == "" ) {
        $("idCheck_text").text("아이디를 작성해주세요.");
    } else {
        $.ajax({
            url: contextPath + "/user/UserCheckIdOk.me?id="+id,
            type: "GET",
            dataType: "text",
            success: function (result) {
                if(result.trim() == "ok") {
                    check = true;
                    $("#idCheck_text").text("사용할 수 있는 아이디입니다.");
              } else {
                    $("#idCheck_text").text("중복된 아이디입니다.");
                }
            },
            error:function () {
                console.log("Error")
            }
        });
    }
}

$("input[name='userId']").keyup(function(event){
    var id  = $("input[name='userId']").val();
    checkId(id);
});
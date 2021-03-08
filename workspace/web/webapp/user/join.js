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
    form.submit();
}

function checkId(id) {
    check = false;
    if (id == "") {
        $("#idCheck_text").text("아이디를 작성 하십시오. ");
    } else {
        $.ajax({
            url: contextPath + "/user/MemberCheckIdOkAction.me?id="+id,
            type: "GET",
            dataType: "text",
            success: function(result){
                if (result.trim() == "ok") {
                    check = true;
                    $("#idCheck_text").text("✔사용 가능");
                } else {
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

$(function(){
    $('#memberPw').keyup(function(){
      $('#pwCheck_text').html('');
    });

    $('#memberPw2').keyup(function(){
        if($('#memberPw').val() != $('#memberPw2').val()){
          $('#pwCheck_text').html('❌일치하지 않음!<br><br>');
          $('#pwCheck_text').attr('color', '#f82a2aa3');
        } else{
          $('#pwCheck_text').html('✔확인 완료<br><br>');
          $('#pwCheck_text').attr('color', '#199894b3');
        }

    });
});
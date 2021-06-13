<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>비밀번호 찾기 </title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
	    <link rel="stylesheet" href="/resources/assets/css/owl.carousel.min.css">
	    <!-- Bootstrap CSS -->
	    <link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
	    <!-- Style -->
	    <link rel="stylesheet" href="/resources/assets/css/style.css">
	    <style>
	    .form-group {
		    padding-left: 0 !important;
		}
		input {
			font-family: sans-serif !important;
		}
	    </style>
	</head>
	
	<body class="is-preload">

<%@include file="../includes/header.jsp" %>
 <c:if test="${cookie.userId.value eq null}">
	<script>
		alert("비밀번호 변경 링크가 만료되었습니다. 비밀번호 찾기를 다시 진행해 주십시오.");
		location.replace("/");
	</script>
</c:if>
<script>
	console.log("cookie?????? ${cookie.userId.value}");
	console.log("sessionId ??????? ${sessionId}");
</script>
<div class="content">
    <div class="container">
      <div class="row justify-content-center">
        <!-- <div class="col-md-6 order-md-2">
          <img src="images/undraw_file_sync_ot38.svg" alt="Image" class="img-fluid">
        </div> -->
        <div class="col-md-6 contents">
          <div class="row justify-content-center">
            <div class="col-md-12">
              <div class="form-block">
                  <div class="mb-4">
                  <h3>비밀번호 변경</h3>
                  <p class="mb-4">변경하실 비밀번호를 입력해주세요.</p>
                </div>
                <form name="changePwForm" action="/account/changePW" method="post">
                    <label for="changeUserPw">새 비밀번호</label>
                  <div class="form-group first">
                    <input type="password" name="userPw" class="form-control" id="changeUserPw">

                  </div>
                    <label for="changeUserPw2">새 비밀번호 확인</label>
                  <div class="form-group last mb-4">
                    <input type="password" class="form-control" id="changeUserPw2">
                    
                  </div>
                  <div class="d-flex mb-5 align-items-center">
                    <span class="ml-auto"><a href="javascript:goSignIn()" class="forgot-pass" style="text-decoration: none;">로그인 하기</a></span> 
                  </div>
					<a href="javascript: formSubmit();" class="button primary fit" style="text-decoration: none;">비밀번호 변경</a>
                </form>
              </div>
            </div>
          </div> 
        </div>
      </div>
    </div>
  </div>
<jsp:include page="../includes/campingFooter.jsp"/>
<jsp:include page="../includes/footer.jsp"/>
<%-- <%@include file="includes/footer.jsp" %> --%>
	</body>
	<script>
	var checkPw1 = false; //비밀번호 정규식 테스트 여부
	var checkPw1 = false; //비밀번호 확인 일치 여부
	$("#changeUserPw").on("keyup", function(e){
		var reg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-.]).{8,}$/;
		if(reg.test($(this).val())){
			checkPw1 = true;
		}else{
			checkPw1 = false;
		}
		
		if($("#changeUserPw").val() == $("#changeUserPw2").val()){
			checkPw2 = true;
			$("#changeUserPw2").css("color", "green");
		}else{
			checkPw2 = false;
			$("#changeUserPw2").css("color", "red");
		}
	});
	
	$("#changeUserPw2").on("keyup", function(e){
		if($("#changeUserPw").val() == $("#changeUserPw2").val()){
			checkPw2 = true;
			$("#changeUserPw2").css("color", "green");
		}else{
			checkPw2 = false;
			$("#changeUserPw2").css("color", "red");
		}
	});
	
	function formSubmit(){
		var userId = "${cookie.userId.value}";
		var userPw = $("#changeUserPw").val();
		console.log("???" + userId);
		console.log("???" + userPw);
		
		if(!checkPw1){
			alert("비밀번호는 영문(대+소문자)+숫자+특수문자 포함 8자이상으로 입력해 주십시오.");
			return false;
		}
		if(!checkPw2){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		
		$.ajax({
			url : pageContext + "/account/changePW",
			type: "post",
			contentType : "application/json; charset=utf-8",
			data: JSON.stringify({userId:userId, userPw:userPw}),
			success: function(result){
				if(result == "yes"){
					alert("비밀번호 변경을 완료했습니다. 다시 로그인해주십시오.");
				}else {
					alert("비밀번호 변경 시간이 만료되었습니다. 비밀번호 찾기를 다시 진행해 주십시오.");
				}
					location.replace("/");
			}
		});
	}
	</script>
</html>
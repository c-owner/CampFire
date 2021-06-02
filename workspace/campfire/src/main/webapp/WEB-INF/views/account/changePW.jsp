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
                <form action="#" method="post">
                    <label for="userPw">새 비밀번호</label>
                  <div class="form-group first">
                    <input type="password" class="form-control" id="userPw">

                  </div>
                    <label for="userPw2">새 비밀번호 확인</label>
                  <div class="form-group last mb-4">
                    <input type="password" class="form-control" id="userPw2">
                    
                  </div>
                  <div class="d-flex mb-5 align-items-center">
                    <span class="ml-auto"><a href="javascript:goSignIn()" class="forgot-pass" style="text-decoration: none;">로그인 하기</a></span> 
                  </div>
					<a href="#" class="button primary fit" style="text-decoration: none;">비밀번호 변경</a>
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
</html>
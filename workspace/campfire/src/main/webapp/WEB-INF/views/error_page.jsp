<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<% response.setStatus(200); %>
<!DOCTYPE html>
<html>
<head>
  <title>에러페이지 | 모닥불</title>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
  <meta name="description" content="" />
  <meta name="keywords" content="" />
  <link rel="stylesheet" href="/resources/assets/css/main.css" />
  <link rel="shortcut icon" type="image/x-icon" href="/resources/images/icon/title-icon.png">

  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <style>
    .wrapper.style2 {
      background: #0d0d0d !important;
    }
    #header{
      position: absolute;
    }
    
  </style>
</head>
<body class="is-preload">

	<%@include file="includes/header.jsp" %>


<section id="three">
    <div class="wrapper style2 special">
        <div class="inner" style="margin: 0 auto;">
            <h2 class="alt">No PAGE! </h2>
            <hr>
            <h3>죄송합니다.</h3>
            <p> 방문하시려는 페이지의 주소가 잘못 입력되었거나,
                <br>페이지의 주소가 변경 혹은 삭제되어
                <br>요청하신 페이지를 찾을 수 없습니다.</p>
            <a href="/" class="btn-right">메인   <span class="arrow-right"></span>
            </a>
            <!-- <button type="submit">메인</button> -->
            <hr>
        </div>
    </div>
</section>
		


		<jsp:include page="includes/footer.jsp" flush="false" />
<%-- <%@include file="includes/footer.jsp" %> --%>
</body>
</html>
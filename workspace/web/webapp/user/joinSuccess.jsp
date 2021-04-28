<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>이메일 인증 </title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/layout.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main-full.css"/>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/title-icon.png">
   
</head>
<body class="is-preload">

<c:set var = 'userStatus' value = "false"></c:set>
<c:if test="${param.type eq 'login' }">
	<c:set var = 'userStatus' value = 'true'/>
</c:if>

<!-- Header -->
<jsp:include page="${pageContext.request.contextPath}/assets/public/header.jsp"></jsp:include>
 

<section id="three">
    <div class="wrapper style2 special">
        <div class="inner" style="margin: 0 auto;">
            <h2 class="alt"> 회원가입을 축하 드립니다! </h2>
            <hr>
            <h3>회원가입이 성공적으로 끝났습니다.</h3>
            <p>
                <br>가입하신 계정으로 로그인하여 주시고 즐거운 시간 되시길 바랍니다.
                <br>감사합니다.</p>
            <a href="${pageContext.request.contextPath}/Main.me" class="btn-right">메인
            <span class="arrow-right"></span>
            </a>
            <!-- <button type="submit">메인</button> -->
        </div>
    </div>
</section>
	
<!-- Footer -->
<jsp:include page="${pageContext.request.contextPath}/assets/public/footer.jsp"></jsp:include>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/user/account.js"></script>

<script>

</script>
</body>
</html>
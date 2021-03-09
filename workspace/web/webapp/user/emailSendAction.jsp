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
    <link rel="stylesheet" href="../assets/css/main.css"/>
    <link rel="stylesheet" href="../assets/css/layout.css"/>
    <link rel="stylesheet" href="../assets/css/main-full.css"/>
    <link rel="shortcut icon" type="image/x-icon" href="../images/title-icon.png">
   
</head>
<body class="is-preload">

<!-- Header -->
<jsp:include page="../assets/public/header.jsp"></jsp:include>
 

<section id="three">
    <div class="wrapper style2 special">
        <div class="inner" style="margin: 0 auto;">
            <h2 class="alt"> 회원가입을 축하 드립니다! </h2>
            <hr>
            <h3>이메일 인증</h3>
            <p> 이메일로 인증 메일을 발송 하였습니다.
                <br>가입하신 이메일에 접속하여 인증을 해주시길 바랍니다.
                <br>감사합니다.</p>
            <a href="${pageContext.request.contextPath}/Main.me" class="btn-right">메인
            <span class="arrow-right"></span>
            </a>
            <!-- <button type="submit">메인</button> -->
        </div>
    </div>
</section>
	
<!-- Footer -->
<jsp:include page="../assets/public/footer.jsp"></jsp:include>

<!-- Scripts -->
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/browser.min.js"></script>
<script src="../assets/js/jquery.dropotron.min.js"></script>
<script src="../assets/js/breakpoints.min.js"></script>
<script src="../assets/js/util.js"></script>
<script src="../assets/js/main.js"></script>
<script src="../assets/js/account.js"></script>

<script>

</script>
</body>
</html>
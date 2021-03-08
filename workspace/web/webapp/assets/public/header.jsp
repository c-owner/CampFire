<%--
  Created by IntelliJ IDEA.
  User: corne
  Date: 2021-03-05
  Time: 오후 5:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:set var = 'userStatus' value = "false"></c:set>
<c:if test="${param.type eq 'login' }">
	<c:set var = 'userStatus' value = 'true'/>
</c:if>

<header id="header">

    <!-- Nav -->
    <nav id="nav">
        <ul class="navbar">
                
			<li><a href="${pageContext.request.contextPath}/Main.me">HOME</a>
			<img class="current" src="../images/menu-icon.png" alt="홈 바로가기" height="50">
			</li>
            <li class=""><a href="#">전체</a></li>
            <li><a href="#" class="dropdown">계정 메뉴</a>
                <ul>
                    <li class="actions stacked" style="margin: 0 auto; width: fit-content;">
                        <a href="${pageContext.request.contextPath}/user/MemberJoin.me">회원가입</a></li>
                    <li class="actions stacked" style="margin: 0 auto; width: fit-content;">
                        <a href="${pageContext.request.contextPath}/user/MemberLogin.me">로그인</a></li>
                        <c:if test="${userStatus eq true}">
                    <li class="actions stacked" style="margin: 0 auto; width: fit-content;">
                        <a href="${pageContext.request.contextPath}/user/MemberLogout.me">로그아웃</a></li>
                        </c:if>
                </ul>
            </li>
            <li><a href="#">공지사항</a></li>
            <li><a href="../../elements.jsp">고객센터</a></li>
            <!-- <li><a href="generic.html">Generic</a></li> -->
            <!-- <li><a href="elements.html">Elements</a></li> -->
        </ul>
    </nav>

    <!-- Logo -->


    <!-- <a class="logo" href="index.html">  <span>CORNER CAMP</span></a> -->
</header>


</body>
</html>

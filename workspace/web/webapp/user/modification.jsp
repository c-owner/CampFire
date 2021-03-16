<%--
  User: corne
  Date: 2021-03-10
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
request.setCharacterEncoding("utf-8");
%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>마이페이지</title>
    <meta charset="UTF-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no"/>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/layout.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/join.css"/>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/title-icon.png">
</head>
<body class="is-preload">

<c:set var = 'userStatus' value = "false"></c:set>
<c:if test="${param.type eq 'login' }">
	<c:set var = 'userStatus' value = 'true'/>
</c:if>

<!-- Header -->
<jsp:include page="${pageContext.request.contextPath}/assets/public/header.jsp"></jsp:include>

<!-- 회원가입 부분 -->

<h3 style="text-align: center; font-size: 56px;">정보 수정</h3>
<p></p>
   	<c:if test="${not empty param.update }">
   		<c:if test="${not param.update}">
   				<script>alert("누락된 항목은 없는지, 입력 사항을 다시 확인해주세요.");</script>
   		</c:if>
   	</c:if>
<form name="modifyForm" action="${pageContext.request.contextPath}/user/MemberEditAction.me" method="post" >
    <div class="row gtr-uniform">
        <div class="col-6 col-12-xsmall" style="margin: 0 auto;">
            아이디
            <input type="text" name="memberId" id="memberId" maxlength="12"/>
            <span style="color: red;">* </span><span style="font-weight: bold;">비밀번호</span>
            <span style="font-size: 12px; font-family:Verdana, Geneva, Tahoma, sans-serif; color: red;">
					(* 영문+숫자+대소문자 조합 8자이상 입력) </span>
            <input type="password" name="memberPw" id="memberPw"/>

            <br>
            <span style="color: #ff0000;">* </span><span style="font-weight: bold;">비밀번호 확인 </span>
            <input type="password" name="memberPw2" id="memberPw2" />
             <font id="pwCheck_text" size="3"></font>
             
        </div>
        </div>
    <div class="col-12">
        <br>
        <ul class="actions">
            <li style="margin: 0 auto;">
            <!-- <input type="submit" class="primary" value="저장하기"/> -->
            <a href="javascript:formSubmit()" class="btn-right" type="submit">수정하기</a>
            </li>
        </ul>
    </div>
</form>


<!-- Footer -->
<jsp:include page="${pageContext.request.contextPath}/assets/public/footer.jsp"></jsp:include>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
<script src="${pageContext.request.contextPath}/assets/js/modification.js"></script>
</body>
</html>

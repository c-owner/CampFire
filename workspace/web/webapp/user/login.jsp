<%--
  Created by IntelliJ IDEA.
  User: corne
  Date: 2021-03-05
  Time: 오후 5:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no"/>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/layout.css"/>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/title-icon.png">
</head>
<body class="is-preload">

<c:set var = 'userStatus' value = "false"></c:set>
<c:if test="${param.type eq 'login' }">
	<c:set var = 'userStatus' value = 'true'/>
</c:if>

<!-- Header -->
<jsp:include page="${pageContext.request.contextPath}/assets/public/header.jsp"></jsp:include>

<!-- 로그인 부분 -->

<h3 style="text-align: center; font-size: 56px;">로그인</h3>
   	<c:if test="${not empty param.login }">
   		<c:if test="${not param.login}">
   				<script>alert("아이디 또는 비밀번호를 다시 확인해주세요.");</script>
   		</c:if>
   	</c:if>
<form name="loginForm" method="post" action="${pageContext.request.contextPath}/user/MemberLoginOk.me">
    <div class="row gtr-uniform">
        <div class="col-6 col-12-xsmall" style="margin: 0 auto;">
            아이디
            <input type="text" name="memberId" id="memberId" maxlength="12"/>
            <br>
            비밀번호 
            <input type="password" name="memberPw" id="memberPw"/>
            <!-- <a href="#"><span style="font-size: 28px;"> </span></a> -->
            <br>
        </div>
    </div>
 
    <div class="col-12">
        <ul class="actions">
            <li style="margin: 0 auto;">
                <a href="${pageContext.request.contextPath}/user/MemberJoin.me" class="button">회원가입 </a>
                <!-- <a href="javascript:loginCheck()" class="button">로그인 </a> -->
              <input type="submit" value="로그인" class="primary"/>
            </li>
        </ul>
        <ul class="actions stacked" style="margin: 0 auto; width: fit-content;">
            <a href="#findAccount" class="button primary icon solid fa-find">
                🔍비밀번호 찾기</a>
            <!-- <a href="#" class="button small">help</a> -->
        </ul>
    </div>
</form>

<!-- findAccount -->
<!-- Modal -->
<div class="modal-wrapper">
    <div class="modal">
        <div class="head-pop"><h2>ID / PW 찾기</h2>
            <a class="btn-close fa-find" href="#" style="text-decoration: none !important;">❌
                <i class="quit" aria-hidden="true"></i>
            </a>
        </div>
        <div class="content" style="margin:0 auto;">
            <div class="good-job">
                <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
                <!-- <h2>Find your ID & Password!</h2> -->
                <div class="form-inline form-group findId">
                    <h3> 🔍아이디 찾기</h3>
                    <div class="msg">E-MAIL 을 입력하면 ID를 확인할 수 있습니다.</div>
                    <div style="width: 60%; margin: 0 0 20 auto;">
                        <input type="email" name="memberEmail" id="memberEmail" placeholder="📧이메일"
                               style=" display: inline;"/>
                        <input type="button" class="button primary fit small" value="아이디 찾기" 
                        onclick="sendEmailId()" style="display: inline;"/>
                    </div>
                </div>

                <div class="form-inline form-group findPw">
                    <h3>🔍 패스워드 찾기</h3>
                    <div class="msg">ID 와 E-MAIL 을 입력하여 임시비밀번호를 받을수 있습니다.</div>
                    <form name="pwFindForm" style="width: 60%; margin: 0 0 20 auto;" action="${pageContext.request.contextPath}/user/MemberFindPw.me">
                        아이디 <input type="text" name="memberId2" id="memberId2" placeholder="🕵️‍아이디"/>
                        이메일 <input type="email" name="memberEmail2" id="memberEmail" placeholder="📧이메일">
                        <input type="button" name="idEmailBtn" class="button primary fit small" value="패스워드 찾기"
                              onclick="sendEmailPw()" style="display: inline;  "/>
                              </form>
                    <a class="btn-close fa-find" href="#" style="font-size:13px; text-align: right; color: grey; text-decoration: none !important;">로그인
                        <i class="quit" aria-hidden="true"></i>
                    </a>
                </div>
                <br>
            </div>
        </div>
    </div>
</div>


<!-- Footer -->
<jsp:include page="${pageContext.request.contextPath}/assets/public/footer.jsp"></jsp:include>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/account.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/login.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
<script src="${pageContext.request.contextPath}/assets/js/findIdPw.js"></script>
<script>

</script>
</body>
</html>

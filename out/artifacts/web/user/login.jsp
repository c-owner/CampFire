<%--
  Created by IntelliJ IDEA.
  User: corne
  Date: 2021-03-05
  Time: 오후 5:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <link rel="stylesheet" href="../assets/css/main.css" />
    <link rel="stylesheet" href="../assets/css/layout.css" />
    <link rel="shortcut icon" type="image/x-icon" href="../images/title-icon.png">
</head>
<body class="is-preload">

<!-- Header -->
<jsp:include page="../assets/public/header.jsp"></jsp:include>

<!-- 로그인 부분 -->

<h3 style="text-align: center; font-size: 56px;">로그인</h3>
<form method="post" action="#">
    <div class="row gtr-uniform" >
        <div class="col-6 col-12-xsmall" style="margin: 0 auto;">
            아이디
            <input type="text" name="id" id="id" maxlength="12" />
            <br>
            비밀번호 <input type="password" name="pw" id="pw"/>
            <a href="#"><span style="font-size: 28px;"> </span></a>
            <br>
        </div>

    </div>
    <div class="col-12" >
        <ul class="actions">
            <li style="margin: 0 auto;">
                <a href="join.jsp" class="button">회원가입 </a>
                <input type="submit" value="로그인" class="primary" />
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
            <a class="btn-close fa-find" href="#">❌
                <i class="quit" aria-hidden="true"></i>
            </a>
        </div>
        <div class="content" style="margin:0 auto;">
            <div class="good-job" >
                <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
                <!-- <h2>Find your ID & Password!</h2> -->
                <div class="form-inline form-group" >
                    <h3> 🔍아이디 찾기</h3>
                    <div class="msg">E-MAIL 을 입력하면 ID 일부를 확인할 수 있습니다.</div>
                    <div style="width: 60%; margin: 0 0 20 auto;">
                        <input type="email" name="email" id="email" value="" placeholder="📧이메일"
                               style=" display: inline;"/>
                        <input type="button" class="button primary fit small" value="아이디 찾기" style="display: inline;" />
                    </div>
                </div>

                <div class="form-inline form-group" >
                    <h3>🔍 패스워드 찾기</h3>
                    <div class="msg">ID 와 E-MAIL 을 입력하여 임시비밀번호를 받을수 있습니다.</div>
                    <div style="width: 60%; margin: 0 0 20 auto;">
                        아이디 <input type="text" name="id" id="id" value="" placeholder="🕵️‍아이디"/>
                        이메일 <input type="email" name="email" id="email" value="" placeholder="📧이메일">
                        <input type="button" class="button primary fit small" value="패스워드 찾기" style="display: inline;  " />
                    </div>
                    <a class="btn-close fa-find" href="#" style="font-size:13px; text-align: right; color: grey;">로그인
                        <i class="quit" aria-hidden="true"></i>
                    </a>
                </div>
                <br>
            </div>
        </div>
    </div>
</div>


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

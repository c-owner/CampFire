<%--
  Created by IntelliJ IDEA.
  User: corne
  Date: 2021-03-06
  Time: 오후 2:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>
<% response.setStatus(200); %>
<html>
<head>
    <title>ERROR</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <link rel="stylesheet" href="../assets/css/main.css"/>
    <link rel="stylesheet" href="../assets/css/layout.css"/>
    <link rel="stylesheet" href="../assets/css/main-full.css"/>
    <link rel="shortcut icon" type="image/x-icon" href="../images/title-icon.png">
    <style type="text/css">
    .btn-right {
    margin: 0 auto;
    text-align: center;
  text-decoration: none;
  font-family: "jua";
  position: relative;
  color: white;
  font-weight: 300;
  font-size: 20px;
  letter-spacing: -0.03em;
  display: inline-block;
  color: #fff;
  background-color: #f48fb1;
  padding: 0.9em 2.8em 0.9em 2.25em;
}

.arrow-right {
  position: absolute;
  display: inline-block;
  width: 0;
  height: 0;
  border-top: 8px solid transparent;
  border-right: 8px solid transparent;
  border-bottom: 8px solid transparent;
  border-left: 8px solid white;
  margin-top: 8px;
  margin-left: 9px;
  animation: horizontal 0.7s ease-in-out infinite;
}

@keyframes horizontal {
  0% {
    margin-left: 9px;
  }
  50% {
    margin-left: 11px;
  }
  100% {
    margin-left: 9px;
  }
}
</style>
</head>
<body class="is-preload">
<jsp:include page="../assets/public/header.jsp"></jsp:include>
<section id="three">
    <div class="wrapper style2 special">
        <div class="inner" style="margin: 0 auto;">
            <h2 class="alt">No PAGE! </h2>
            <hr>
            <h3>죄송합니다.</h3>
            <p> 방문하시려는 페이지의 주소가 잘못 입력되었거나,
                <br>페이지의 주소가 변경 혹은 삭제되어
                <br>요청하신 페이지를 찾을 수 없습니다.</p>
            <a href="${pageContext.request.contextPath}/Main.me" class="btn-right">메인   <span class="arrow-right"></span>
            </a>
            <!-- <button type="submit">메인</button> -->
        </div>
    </div>
</section>

<jsp:include page="../assets/public/footer.jsp"></jsp:include>

<!-- Scripts -->
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/browser.min.js"></script>
<script src="../assets/js/jquery.dropotron.min.js"></script>
<script src="../assets/js/breakpoints.min.js"></script>
<script src="../assets/js/util.js"></script>
<script src="../assets/js/main.js"></script>
<script src="../assets/js/moment.js"></script>
<script src="../assets/js/moment-with-locales.js"></script>
<script src="../assets/js/account.js"></script>
<script> var contextPath = "${pageContext.request.contextPath}";</script>


</body>
</html>

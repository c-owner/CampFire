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
    <link rel="stylesheet" href="assets/css/main.css"/>
    <link rel="stylesheet" href="assets/css/layout.css"/>
    <link rel="stylesheet" href="assets/css/main-full.css"/>
    <link rel="shortcut icon" type="image/x-icon" href="images/title-icon.png">
</head>
<body class="is-preload">
<jsp:include page="./assets/public/header.jsp"></jsp:include>
<section id="three">
    <div class="wrapper style2 special">
        <div class="inner" style="margin: 0 auto;">
            <h2 class="alt">No PAGE! </h2>
            <hr>
            <h3>죄송합니다.</h3>
            <p> 방문하시려는 페이지의 주소가 잘못 입력되었거나,
            <br>페이지의 주소가 변경 혹은 삭제되어
                <br>요청하신 페이지를 찾을 수 없습니다.</p>
            <form method="post" action="#" class="combined" >
                <a href="${pageContext.request.contextPath}/Main.me" class="button" value="메인" />
            </form>
        </div>
    </div>
</section>

<jsp:include page="./assets/public/footer.jsp"></jsp:include>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/js/moment.js"></script>
<script src="assets/js/moment-with-locales.js"></script>
<script src="assets/js/account.js"></script>
<script> var contextPath = "${pageContext.request.contextPath}";</script>



</body>
</html>

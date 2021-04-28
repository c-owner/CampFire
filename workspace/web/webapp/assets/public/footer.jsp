<%--
  Created by IntelliJ IDEA.
  User: corne
  Date: 2021-03-05
  Time: 오후 5:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<!-- Footer -->
<section id="footer">
    <div class="wrapper style3">
        <div class="inner">
            <div>
                <header>
                    <h3> 💡 Community</h3>
                </header>
                <div id="comm" class="maininfo">
                    <div class="m-wrap">
                        <!--community-->

                        <dl>
                            <dt class="sbj">
                                <img src="${pageContext.request.contextPath}/../../images/community/bbsico_0.png" alt="" height="50"><br>
                                캠핑 팁
                                <a href="${pageContext.request.contextPath}/../..?c=info/camptip" class="fr more" title="더 보기">
                                    <svg x="0px" y="0px" viewBox="0 0 42 42" style="enable-background:new 0 0 42 42;"
                                         xml:space="preserve" width="16px" height="16px"><polygon
                                            points="42,20 22,20 22,0 20,0 20,20 0,20 0,22 20,22 20,42 22,42 22,22 42,22 "
                                            fill="#888"></polygon></svg>
                                </a>
                            </dt>
                        </dl>


                        <dl>
                            <dt class="sbj">
                                <img src="${pageContext.request.contextPath}/../../images/community/bbsico_1.png" alt="" height="50"><br>
                                캠핑 음식
                                <a href="${pageContext.request.contextPath}/../..?c=info/campfood" class="fr more" title="더 보기">
                                    <svg x="0px" y="0px" viewBox="0 0 42 42" style="enable-background:new 0 0 42 42;"
                                         xml:space="preserve" width="16px" height="16px"><polygon
                                            points="42,20 22,20 22,0 20,0 20,20 0,20 0,22 20,22 20,42 22,42 22,22 42,22 "
                                            fill="#888"></polygon></svg>
                                </a>
                            </dt>

                        </dl>


                        <dl>
                            <dt class="sbj">
                                <img src="${pageContext.request.contextPath}/../../images/community/bbsico_2.png" alt="" height="50"><br>
                                캠핑리뷰
                                <a href="${pageContext.request.contextPath}/../..?c=talk/review" class="fr more" title="더 보기">
                                    <svg x="0px" y="0px" viewBox="0 0 42 42" style="enable-background:new 0 0 42 42;"
                                         xml:space="preserve" width="16px" height="16px"><polygon
                                            points="42,20 22,20 22,0 20,0 20,20 0,20 0,22 20,22 20,42 22,42 22,22 42,22 "
                                            fill="#888"></polygon></svg>
                                </a>
                            </dt>

                        </dl>


                        <dl class="nomargin">
                            <dt class="sbj">
                                <img src="${pageContext.request.contextPath}/../../images/community/bbsico_3.svg" alt="" height="50"><br>
                                자유게시판
                                <a href="${pageContext.request.contextPath}/../..?c=talk/freeboard" class="fr more" title="더 보기">
                                    <svg x="0px" y="0px" viewBox="0 0 42 42" style="enable-background:new 0 0 42 42;"
                                         xml:space="preserve" width="16px" height="16px"><polygon
                                            points="42,20 22,20 22,0 20,0 20,20 0,20 0,22 20,22 20,42 22,42 22,22 42,22 "
                                            fill="#888"></polygon></svg>
                                </a>
                            </dt>
                        </dl>

                    </div>
                </div>


            </div>


            <div>
                <header>
                    <h3></h3>
                </header>
                <a href="${pageContext.request.contextPath}/Main.me">
                    <img class="current" src="${pageContext.request.contextPath}/../../images/menu-icon.png" alt="홈 바로가기" height="50"></a>
                <div class="contact-icons">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}"
                               class="icon solid fa-envelope"><span>개인정보취급방침</span></a></li>
                        <li><a href="#" class="icon brands fa-twitter"><span>홈페이지 이용약관</span></a></li>
                        <li><a href="#" class="icon brands fa-facebook-f"><span>광고 및 제휴 문의</span></a></li>
                        <li><a href="#" class="icon brands fa-linkedin-in"><span>고객센터</span></a></li>
                        <li class="actions stacked" style=" width: fit-content;">
                            <a href="${pageContext.request.contextPath}/user/MemberJoin.me">회원가입</a></li>
                        <li class="actions stacked" style=" width: fit-content;">
                            <a href="${pageContext.request.contextPath}/user/MemberLogin.me">로그인</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" class="icon solid fa-phone"><span>전화 (031) 211-0000</span></a></li>
                        <li>
                            <div class="icon solid fa-map-marker-alt">
                                <address>
                                    Pangyo-ro<br/>
                                    Building, TN 1111-02230<br/>
                                    Bundang-gu, Gyeonggi-do<br/>
                                    Republic of Korea
                                </address>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
        <div class="copyright">
            &copy; Camp Corner, All rights reserved. .
        </div>
    </div>
</section>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/moment-with-locales.js"></script>
</body>
</html>

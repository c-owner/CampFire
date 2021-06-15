<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	dl {
		float: left;
		padding: 1rem;
	}
	.wrapper.style3 { 
		padding: 10px 0 0 0;
	}
	#footer {
		font-family: 'NIXGONL-VB';
	}
	.footerTop {
		width: 80%;
		margin: 0 auto;
		text-align: center;
		padding: 0;
	}
	
	.footerBottom {
		margin: 0 auto;
	}
	
	@media screen and (max-width: 1280px){
		dl { 
			padding: 1.5rem; 
		}
		
		.nonfloat {
			clear: both;
		}
		
		.footerBottom {
			padding-left: 10% !important;
		}
		
		.iconDiv {
			display: inline-block !important;
		}
	}
	
	@media screen and (max-width: 980px){
		.address {
			display: none !important;	
		}
		
		.footerTop, .footerBottom {
			width: 50% !important;
			float: left;
		}
		
		.bottomHead {
			margin-top: 15%;
		}
	}

	@media screen and (max-width: 550px){
		.footerTop {
			width: 60% !important;
		}
		.footerBottom {
			padding-left: 0px !important;
			width: 40% !important;
		}
	}	
	
	@media screen and (max-width: 494px){
		.footerTop {
			width: 100% !important;
			float: none;
		}
		.footerBottom {
			width: 187px !important;
			float: none;
		}
	}
</style>

</head>
<body>

	<!-- Footer -->
<section id="footer">
    <div class="wrapper style3">
        <div class="inner">
           
            <div class="footerTop">
                <header>
                    <h3> 🔥 모닥불</h3>
                </header>
                <div id="comm" class="maininfo">
                    <div class="m-wrap iconDiv">
                        <!--community-->

                        <dl>
                            <dt class="sbj">
                                <img src="/resources/images/community/bbsico_0.png" alt="" height="50"><br>
                                캠핑 팁
								<a href="/campfire/tipList" class="fr more" title="더 보기">
									<svg x="0px" y="0px" viewBox="0 0 42 42" style="enable-background:new 0 0 42 42;"
									xml:space="preserve" width="16px" height="16px">
									<polygon points="42,20 22,20 22,0 20,0 20,20 0,20 0,22 20,22 20,42 22,42 22,22 42,22 "fill="#888">
									</polygon></svg>
                                </a>
                            </dt>
                        </dl>


                        <dl>
                            <dt class="sbj">
                                <img src="/resources/images/community/bbsico_1.png" alt="" height="50"><br>
                                캠핑 음식
								<a href="/campfire/foodList" class="fr more" title="더 보기">
									<svg x="0px" y="0px" viewBox="0 0 42 42" style="enable-background:new 0 0 42 42;"
									xml:space="preserve" width="16px" height="16px">
									<polygon points="42,20 22,20 22,0 20,0 20,20 0,20 0,22 20,22 20,42 22,42 22,22 42,22 "fill="#888">
									</polygon></svg>
                                </a>
                            </dt>
                        </dl>


                        <dl class="nonfloat">
                            <dt class="sbj">
                                <img src="/resources/images/community/bbsico_2.png" alt="" height="50"><br>
                                캠핑리뷰
                                <a href="/review/reviewList" class="fr more" title="더 보기">
									<svg x="0px" y="0px" viewBox="0 0 42 42" style="enable-background:new 0 0 42 42;"
									xml:space="preserve" width="16px" height="16px">
									<polygon points="42,20 22,20 22,0 20,0 20,20 0,20 0,22 20,22 20,42 22,42 22,22 42,22 "fill="#888">
									</polygon></svg>
                                </a>
                            </dt>
                        </dl>


                        <dl class="nomargin">
                            <dt class="sbj">
                                <img src="/resources/images/community/bbsico_3.svg" alt="" height="50"><br>
                                자유게시판
                                <a href="/free/freeList" class="fr more" title="더 보기">
									<svg x="0px" y="0px" viewBox="0 0 42 42" style="enable-background:new 0 0 42 42;"
									xml:space="preserve" width="16px" height="16px">
									<polygon points="42,20 22,20 22,0 20,0 20,20 0,20 0,22 20,22 20,42 22,42 22,22 42,22 "fill="#888">
									</polygon></svg>
                                </a>
                            </dt>
                        </dl>

                    </div> <!-- m-wrap-->
                </div> <!-- comm class -->
            </div>


            <div class="footerBottom">
                <header class="bottomHead">
                    <h3></h3>
                </header>
                <a href="/">
                    <img class="current" src="/resources/images/icon/menu-icon.png" alt="홈 바로가기" height="50"></a>
                <div class="contact-icons">
                    <ul>
                        <li><a href="#"
                               class="icon solid fa-envelope"><span>개인정보취급방침</span></a></li>
                        <li><a href="#" class="icon brands fa-twitter"><span>홈페이지 이용약관</span></a></li>
                        <li><a href="#" class="icon brands fa-facebook-f"><span>광고 및 제휴 문의</span></a></li>
                        <li><a href="#" class="icon brands fa-linkedin-in"><span>고객센터</span></a></li>
                    </ul>
                    <ul>
                        <li><a href="#" class="icon solid fa-phone"><span>전화 (031) 211-0000</span></a></li>
                        <li class="address">
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
            &copy; CampFire, All rights reserved. .
        </div>
    </div>
</section>
	

		<!-- Scripts -->
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/browser.min.js"></script>
			<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
			<script src="/resources/assets/js/breakpoints.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<script src="/resources/assets/js/main.js"></script>
			<script src="/resources/assets/js/moment.js"></script>
			<script src="/resources/assets/js/moment-with-locales.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

</body>
</html>



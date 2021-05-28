<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>모닥불</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!-- title -->
		<link rel="shortcut icon" type="image/x-icon" href="/resources/images/icon/title-icon.png">
		
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="stylesheet" href="/resources/assets/css/layout.css"/>

		<link rel="stylesheet" type="text/css" href="/resources/slick/slick.css"/>
		<link rel="stylesheet" type="text/css" href="/resources/slick/slick-theme.css"/>

		<style>
	 
			.slider .slick-slide img {
				width: 90%;
				height: 15em;
				object-fit: cover;
			}
			.testDiv{
			width: 300px;
			height: 300px;
			}
			h2.alt{
			    margin: 0 auto;
			    text-align: center;
			    top: -35%;
			    padding: 0;
			}
			span.mainMessageWrapper{
			    font-family: 'Handletter';
			}
			span.mainMessage{
				font-family: 'Handletter';
				font-size: 70px; font-weight: bold;
			}
			
		@media screen and (max-width: 736px) {
			#search{
			    border-bottom-right-radius: 2rem;
    			border-top-right-radius: 2rem;
				width: 100%;
			}
		
			#searchBtn{
			    border-bottom-left-radius: 2rem;
    			border-top-left-radius: 2rem;
				width: 100%;
			}
			span.mainMessageWrapper {
			    display: flow-root;
			}
			span.top2, span.top1{
				height:70px;
			}
			span.top1{text-align: left;}
			span.top2{text-align: center;}
			span.top3{text-align: right;}
			
		}
		</style>
	</head>
	
	<body class="is-preload">

			<!-- Header -->
			<header id="header" style="height: 7em; position: absolute; background:#00000000;">
				<!-- Nav -->
				<nav id="smallNav">
					<ul>
						<li><a href="javascript:void(0)" class="signup">공지사항</a></li>
						<li><a href="javascript:void(0)" class="signup">Home</a></li>
						<li><a href="javascript:goSignUp()" class="signup">회원가입</a></li>
						<li><a href="javascript:goSignIn()" class="signin">로그인</a></li>
						<li><a href="javascript:void(0)" class="signup">고객센터</a></li>
					</ul>
				</nav>
					<nav id="nav">
						<ul>
							<li class="current">
								<a href="/">
									<img class="current" src="/resources/images/icon/menu-icon.png" alt="홈 바로가기" height="50">
								</a></li>
	 
							<li><a href="#">전체</a></li>
							<li><a href="#">유/무료 캠핑장</a></li>
							<li><a href="#">난이도 캠핑장</a></li>
							<li><a href="#">글램핑/카라반</a></li>
							<li><a href="#">테마검색</a></li>
							<li><a href="#">장작장터</a></li>
							<li>
								<a href="#" class="dropdown">모닥불</a>
								<ul>
									<li><a href="#">자유게시판</a></li>
									<li><a href="#">캠핑 리뷰</a></li>
									<li><a href="#">캠핑 팁</a></li>
									<li><a href="#">캠핑 음식</a></li>
									<li><a href="#">캠핑 가이드</a></li>
									<li>
										<a href="#">계정</a>
										<ul>
											<li><a href="javascript:goSignUp()" class="signup">회원가입</a></li>
											<li><a href="javascript:goSignIn()" class="signin">로그인</a></li>
										</ul>
									</li>
								</ul>
							</li>
							
							<li>
								<a href="#" class="dropdown">고객센터</a>
								<ul>
									<li><a href="/generic">고객센터</a></li>
									<li><a href="/elements">Elements</a></li>
								</ul>
							</li>
						</ul>
					</nav>
			</header>	
			
			
		
		<!-- END header -->
		<!-- Banner -->
			<section id="banner">
					<article class="full" style="min-height: 100vh;">
					
						<div class="image" data-position="center">
							<img src="/resources/images/bg01.jpg" alt="" />
						</div>
						<div class="content">
						<div align="center" style="margin-top: 50px;">
							<h2 class="alt" style="text-align: center; margin: 0; margin-top: -10%;">
								<span class="mainMessageWrapper top1"><span class="mainMessage">모</span>험심을 가지고</span>
								<span class="mainMessageWrapper top2"><span class="mainMessage">닥</span>치는대로 도전하면</span> 
								<span class="mainMessageWrapper top3"><span class="mainMessage">불</span>가능은 없다.</span>
							</h2>
						</div>
							<form method="post" action="#" class="combined">
								<input type="text" name="search" id="search" placeholder="캠핑장 검색" class="invert" />
								 <a href="javascript:void(0);" class="button primary icon solid fa-search fa-find" id="searchBtn">&nbsp;</a>
							</form>
							<div class="test1" style="text-align:left; margin-top: 20%;">
								<h2 id="category" style="margin:0;">유/무료 캠핑장</h2>
							</div>
			  				<section class="slider">
								<div class="test1"><span id="t11"></span><img src="/resources/images/camping1.png" ></div>
								<div><img src="/resources/images/camping8.png" ></div>
								<div><img src="/resources/images/camping8.png" ></div>
								<div><img src="/resources/images/camping8.png" ></div>
								<div class="test2"><span id="t22"></span><img src="/resources/images/camping11.png" ></div>
								<div><img src="/resources/images/camping8.png" ></div>
								<div><img src="/resources/images/camping8.png" ></div>
								<div><img src="/resources/images/camping8.png" ></div>
								<div class="test3"><span id="t33"></span><img src="/resources/images/camping12.png" ></div>
								<div><img src="/resources/images/camping8.png"></div>
								<div><img src="/resources/images/camping8.png"></div>
								<div><img src="/resources/images/camping8.png"></div>
							</section>
					  	</div>
					</article>
					<article class="half">
						<div class="image" data-position="center">
							<img src="/resources/images/bg03.jpg" alt="" />
						</div>
						<div class="content">
							<ul class="actions">
								<li><a href="#" class="button">Learn More</a></li>
							</ul>
						</div>
					</article>
					<article class="half">
						<div class="image" data-position="center">
							<img src="/resources/images/bg02.jpg" alt="" />
						</div>
						<div class="content">
							<ul class="actions">
								<li><a href="#" class="button">Learn More</a></li>
							</ul>
						</div>
					</article>
			</section>
			


<jsp:include page="includes/modal.jsp"/>
<!-- 
	화면 레이아웃의 일부분을 모듈화 할 때 주로 사용된다. 
	하지만, get 방식으로 파라미터를 전달 할 수 없다.
	동적인 페이지 할당이 가능하다.

	flush="true" : 문서의 출력 결과를 항상 버퍼내에서 갱신 하라는 의미이다
	즉, 따로따로 실행 된 후 그 결과만을 가지고 include한다.
-->
<%@include file="includes/footer.jsp" %>
<!-- 
	<%-- <%@include %>  --%>
	-. 서버측 include 라고 생각하면 된다
	즉 소스 실행전에 include가 된다고 보자
	-. 소스 실행전 포함됨으로 변수를 같이 사용할 수 있다
	-. 동적으로 페이지 할당을 할 수가 없다  == 정적 페이지용
	자바 소스로 변환할 때 처리, 
-->
			
			

</body>

<!-- 슬라이더 -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="/resources/slick/slick.min.js"></script>

<script>
	$('.slider').slick({
		  dots: false,
		  infinite: true,
		  speed: 100,
		  slidesToShow: 4,
		  slidesToScroll: 4,
  		  autoplay: true,
		  autoplaySpeed: 2000,
		  responsive: [
		    {
		      breakpoint: 1024,
		      settings: {
		        slidesToShow: 3,
		        slidesToScroll: 3,
		      }
		    },
		    {
		      breakpoint: 600,
		      settings: {
		        slidesToShow: 2,
		        slidesToScroll: 2
		      }
		    },
		    {
		      breakpoint: 480,
		      settings: {
		        slidesToShow: 1,
		        slidesToScroll: 1
		      }
		    }
		    // You can unslick at a given breakpoint now by adding:
		    // settings: "unslick"
		    // instead of a settings object
		  ]
		});
	
	var i = 0;
	var category = ["인기 캠핑장", "난이도별 캠핑장", "유/무료 캠핑장"]
	var timer = setInterval(function(){
		if(i == 3) {i=0;}
		$("#category").text(category[i]);
		i++;
	}, 2000);
</script>

</html>
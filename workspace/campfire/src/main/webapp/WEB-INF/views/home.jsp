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
				/* width: 100%; */
				/* height: 15em; */
				/* max-width:160px;
				max-height:160px; */
				width:180px;
				height:180px;
				object-fit: cover;
			}
			.imgWrapper{
				width:180px;
				height:180px;
				background: cyan;
				position: relative;
			}
			.imgWrapper img{
				position: absolute;
				top: 50%;
				left:50%;
				transform: translate(-50%,-50%);
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
	
	<body class="is-preload" onload="showImage()">

				<!-- Header -->
			<header id="header" style="position: absolute; background:#00000000;">
				<!-- Nav -->
				<nav class="smallNav">
					<ul>
						<c:if test="${sessionId eq null}">
						<li><a href="javascript:goSignUp()" class="signup">회원가입</a></li>
						<li><a href="javascript:goSignIn()" class="signin">로그인</a></li>
						</c:if>	
						<c:if test="${sessionId ne null}">
						<li><a href="/logout" class="logout">로그아웃</a></li>
						</c:if>
						<li><a href="/policy/policy?tab=terms">고객센터</a></li>
					</ul>
				</nav>
				<nav id="nav">
					<ul>
						<li class="current">
							<a href="/">
								<img class="current" src="/resources/images/icon/menu-icon.png" alt="홈 바로가기" height="50">
							</a></li>
							<li class="smallMenu2"><a href="/">Home</a></li>
							<li><a href="/policy/policy?tab=notices">공지사항</a></li>
							<li>
								<a href="#" class="dropdown">캠핑장</a> 
								<ul>
									<li><a href="/camp/search">전체</a></li>
									<li><a href="/camp/pay">유료 캠핑장</a></li>
									<li><a href="/camp/free">무료 캠핑장</a></li>
									<li><a href="/camp/level">난이도 캠핑장</a></li>
									<li><a href="/camp/glamping">글램핑/카라반</a></li>
								</ul>
							</li>
							
							<li><a href="#">테마검색</a></li>
							<li>
								<a href="#" class="dropdown">장작장터</a>
								<ul>
									<li><a href="/market/marketList?check=S">팝니다</a></li>
									<li><a href="/market/marketList?check=B">삽니다</a></li>
									<li><a href="/market/marketList?check=F">무료나눔</a></li>
								</ul>
							</li>
							<li>
								<a href="#" class="dropdown">모닥불</a>
								<ul>
									<li><a href="/free/freeList">자유게시판</a></li>
									<li><a href="/review/reviewList">캠핑 리뷰</a></li>
									<li><a href="/campfire/tipList">캠핑 팁</a></li>
									<li><a href="/campfire/foodList">캠핑 음식</a></li>
									<li><a href="/campfire/guideList">캠핑 가이드</a></li>
								</ul>
							</li>
							<li class="smallMenu">
								<a href="#" class="dropdown">계정</a>
								<ul>
									<c:if test="${sessionId eq null}">
										<li><a href="javascript:goSignUp()" class="signup">회원가입</a></li>
										<li><a href="javascript:goSignIn()" class="signin">로그인</a></li>
									</c:if>	
									<c:if test="${sessionId ne null}">
										<li><a href="/logout" class="logout">로그아웃</a></li>
									</c:if>
									<li><a href="/policy/policy?tab=terms">고객센터</a></li>
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
							<img src="/resources/images/background/bg02.jpg" alt="" id="image" />
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
								<h2 id="category" style="margin:0;">HOT & NEW</h2>
							</div>
			  				<section class="slider">
								<div>
									<div>
										<div class="imgWrapper">
											<img src="/resources/images/background/bg10.jpg">
										</div>
										<div class="slideInfo">
											<p>카테고리</p>
											<p>캠핑장 이름</p>
										</div>
									</div>
								</div>
								<div>
									<div class="imgWrapper">
										<img src="/resources/images/background/bg11.jpg" >
									</div>
									<div class="slideInfo">
										<p>카테고리</p>
										<p>캠핑장 이름</p>
									</div>
								</div>
									
								<div>
									<div class="imgWrapper">
										<img src="/resources/images/background/bg12.jpg" >
									</div>
									<div class="slideInfo">
										<p>카테고리</p>
										<p>캠핑장 이름</p>
									</div>
								</div>
								<div>
									<div class="imgWrapper">
										<img src="/resources/images/background/bg13.jpg" >
									</div>
									<div class="slideInfo">
										<p>카테고리</p>
										<p>캠핑장 이름</p>
									</div>
								</div>
								<div class="test2"><span id="t22"></span><img src="/resources/images/background/bg01.jpg" ></div>
								<div><img src="/resources/images/background/bg02.jpg" ></div>
								<div><img src="/resources/images/background/bg03.jpg" ></div>
								<div><img src="/resources/images/background/bg04.jpg" ></div>
								<div class="test3"><span id="t33"></span><img src="/resources/images/background/bg05.jpg" ></div>
								<div><img src="/resources/images/background/bg06.jpg"></div>
								<div><img src="/resources/images/background/bg07.jpg"></div>
								<div><img src="/resources/images/background/bg08.jpg"></div>
							</section>
					  	</div>
					</article>
					<article class="half">
						<div class="image" data-position="center">
							<img src="/resources/images/bg03.jpg" alt="" />
						</div>
						<div class="content">
							<ul class="actions">
								<li><a href="/free/freeList" class="button">커뮤니티</a></li>
							</ul>
						</div>
					</article>
					<article class="half">
						<div class="image" data-position="center">
							<img src="/resources/images/bg02.jpg" alt="" />
						</div>
						<div class="content">
							<ul class="actions">
								<li><a href="/market/marketList?check=S" class="button">장작장터</a></li>
							</ul>
						</div>
					</article>
			</section>
			


<jsp:include page="includes/modal.jsp"/>
</body>

<!-- 슬라이더 -->
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
<script type="text/javascript" src="/resources/slick/slick.min.js"></script>

<script>
	$('.slider').slick({
		  dots: false,
		  infinite: true,
		  speed: 100,
		  slidesToShow: 4,
		  slidesToScroll: 4,
  		  autoplay: false,
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
/* 	
	var i = 0;
	var category = ["인기 캠핑장", "난이도별 캠핑장", "유/무료 캠핑장"]
	var timer = setInterval(function(){
		if(i == 3) {i=0;}
		$("#category").text(category[i]);
		i++;
	}, 2000); */
	
	var imgArray = new Array(); 
	imgArray[0]="/resources/images/background/bg14.jpg"; 
	imgArray[1]="/resources/images/background/bg03.jpg"; 
	imgArray[2]="/resources/images/background/bg05.jpg"; 
	/* imgArray[3]="/resources/images/background/bg07.jpg"; 
	imgArray[4]="/resources/images/background/bg08.jpg"; 
	imgArray[5]="/resources/images/background/bg09.jpg"; 
	imgArray[6]="/resources/images/background/bg10.jpg"; 
	imgArray[7]="/resources/images/background/bg11.jpg"; 
	imgArray[8]="/resources/images/background/bg12.jpg";  */
	
	function showImage(){ 
		var imgNum = Math.round(Math.random() * 2); 
		
		var objImg = document.getElementById("image"); 
		
		objImg.src = imgArray[imgNum]; 
		setTimeout(showImage,30000); 
		
	}

	
	
</script>



</html>
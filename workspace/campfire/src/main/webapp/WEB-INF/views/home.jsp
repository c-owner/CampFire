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
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		
		<!--  slider  -->
		
		<!-- <link rel="stylesheet" type="text/css" href="/plugin/slick/slick.css"/>
		<link rel="stylesheet" type="text/css" href="/plugin/slick/slick-theme.css"/> -->

		<link rel="stylesheet" type="text/css" href="/resources/slick/slick.css"/>
		<link rel="stylesheet" type="text/css" href="/resources/slick/slick-theme.css"/>

		<link rel="shortcut icon" type="image/x-icon" href="/resources/images/title-icon.png">
		<style>
			img {
				width: 90%;
				height: 90%;
				object-fit: cover;
			}
			.testDiv{
			width: 300px;
			height: 300px;
			}
		</style>
	</head>
	
	<body class="is-preload">

		<!-- Header -->
			<header id="header" style="height: 7em; position: absolute; background:#00000000;">
				<!-- Nav -->
					<nav id="nav">
						<ul>
							<li class="current"><a href="index.html">Home</a></li>
							<li>
								<a href="#" class="dropdown">Dropdown</a>
								<ul>
									<li><a href="#">Option One</a></li>
									<li><a href="#">Option Two</a></li>
									<li><a href="#">Option Three</a></li>
									<li>
										<a href="#">Submenu</a>
										<ul>
											<li><a href="#">Option One</a></li>
											<li><a href="#">Option Two</a></li>
											<li><a href="#">Option Three</a></li>
											<li><a href="#">Option Four</a></li>
										</ul>
									</li>
								</ul>
							</li>
							<li><a href="generic.html">Generic</a></li>
							<li><a href="elements.html">Elements</a></li>
						</ul>
					</nav>
				<!-- Logo -->
					<!-- <a class="logo" href="index.html">Momentum <span>by Pixelarity</span></a> -->
			</header>

		<!-- Banner -->
			<section id="banner">
					<article class="full" style="min-height: 100vh;">
					
						<div class="image" data-position="center">
							<img src="/resources/images/bg01.jpg" alt="" />
						</div>
						<div class="content">
							<form method="post" action="#" class="combined">
								<input type="email" name="email" id="email" placeholder="Your email address" class="invert" />
								<input type="submit" class="special" value="Subscribe" />
							</form>
								<div>
					  	<div id="slider-div"  style="margin-top: 226px;">
							<div class="testDiv"  ><span class="image fit"><img src="/resources/images/camping8.png" ></span></div>
							<div class="testDiv"  ><span class="image fit"><img src="/resources/images/camping8.png" ></span></div>
							<div class="testDiv"  ><span class="image fit"><img src="/resources/images/camping8.png" ></span></div>
							<div class="testDiv"  ><span class="image fit"><img src="/resources/images/camping8.png" ></span></div>
							<div class="testDiv"  ><span class="image fit"><img src="/resources/images/camping8.png" ></span></div>
							<div class="testDiv"  ><span class="image fit"><img src="/resources/images/camping8.png" ></span></div>
							<div class="testDiv"  ><span class="image fit"><img src="/resources/images/camping8.png" ></span></div>
							<div class="testDiv"  ><span class="image fit"><img src="/resources/images/camping8.png" ></span></div>
							<div class="testDiv"  ><span class="image fit"><img src="/resources/images/camping8.png" ></span></div>
							<div class="testDiv"  ><span class="image fit"><img src="/resources/images/camping8.png"></span></div>
							<div class="testDiv"  ><span class="image fit"><img src="/resources/images/camping8.png"></span></div>
					  	</div>
					</div>
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

		<!-- One -->


		<!-- Scripts -->
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/browser.min.js"></script>
			<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
			<script src="/resources/assets/js/breakpoints.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<script src="/resources/assets/js/main.js"></script>
			
			
<!-- 슬라이더 -->
			<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
			<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
			<script type="text/javascript" src="/resources/slick/slick.min.js"></script>
			
			<!-- 휠이동 -->
			<script src="/resources/assets/js/jquery.mousewheel.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	</body>
	
	
	<script>
	$(document).ready(function() {
	
	$(function(){
		$('#slider-div').slick({
			slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
			infinite : true, 	//무한 반복 옵션	 
			slidesToShow : 4,		// 한 화면에 보여질 컨텐츠 개수
			slidesToScroll : 4,		//스크롤 한번에 움직일 컨텐츠 개수
			speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
			arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
			dots : false, 		// 스크롤바 아래 점으로 페이지네이션 여부
			autoplay : true,			// 자동 스크롤 사용 여부
			autoplaySpeed : 5000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
			pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
			vertical : false,		// 세로 방향 슬라이드 옵션
			prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
			nextArrow : "<button type='button' class='slick-next'>Next</button>",		// 다음 화살표 모양 설정
			dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
			draggable : true, 	//드래그 가능 여부 
			
			responsive: [ // 반응형 웹 구현 옵션
				{  
					breakpoint: 960, //화면 사이즈 960px
					settings: {
						//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
						slidesToShow:3 
					} 
				},
				{ 
					breakpoint: 768, //화면 사이즈 768px
					settings: {	
						//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
						slidesToShow:2 
					} 
				}
			]

		});
		})
	});
	</script>
	<script>
	$(".is-preload").on("mousewheel DOMMouseScroll", function(event, delta){
		if(delta>0){
	  	//마우스 휠 up
	  	$('html, body').animate({scrollTop: 0}, 900, 'easeOutExpo');
	  	//$('html, body').animate({
    	//scrollTop: 0}, 800);
	  }else if(delta<0){
	  	//마우스 휠 down
	  	$('html, body').animate({scrollTop: '1000px'}, 900, 'easeOutExpo');
	  	//$(document).height()
	  }  
	});
	</script>
<!-- 	<script>
		$('.responsive').slick({
		  dots: true,
		  infinite: true,
		  speed: 300,
		  slidesToShow: 4,
		  slidesToScroll: 4,
		  responsive: [
		    {
		      breakpoint: 1024,
		      settings: {
		        slidesToShow: 3,
		        slidesToScroll: 3,
		        infinite: true,
		        dots: true
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
		}); -->
</html>
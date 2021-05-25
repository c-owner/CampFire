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
		@font-face {
		    font-family: 'KoreanFrenchTypewriter';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2102-01@1.0/KoreanFrenchTypewriter.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		@font-face {
    font-family: 'Handletter';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/naverfont_05@1.0/Handletter.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'JSArirangPPURI-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/JSArirangPPURI-RegularA1.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'InkLipquid';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/InkLipquid.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
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
			    font-family: 'Handletter';
			    margin: 0 auto;
			    text-align: center;
			    top: -35%;
			    padding: 0;
			}
			.alt > span {
				font-size: 70px; font-weight: bold;
			}
			
		</style>
	</head>
	
	<body class="is-preload">
      <div id="onepage">
      <section class="s1">
      </section>
		<%@include file="includes/header.jsp" %>

		<!-- Banner -->
			<section id="banner">
				<section class="s2"></section>
					<article class="full" style="min-height: 100vh;">
					
						<div class="image" data-position="center">
							<img src="/resources/images/bg01.jpg" alt="" />
						</div>
						<div class="content">
						<div align="center">
							<h2 class="alt" style="text-align: center; margin: 0; margin-top: -10%;">
							<span>모</span>험심을 가지고 
							<span>닥</span>치는대로 도전하면 
							<span>불</span>가능은 없다.
							</h2>
						</div>
							<form method="post" action="#" class="combined">
								<input type="text" name="search" id="search" placeholder="캠핑장 검색" class="invert" />
								 <a href="javascript:void(0);" class="button primary icon solid fa-search fa-find">&nbsp;</a>
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
</div>
		<!-- One -->

<%@include file="includes/footer.jsp" %>
			
			
<!-- 슬라이더 -->
			<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
			<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
			<script type="text/javascript" src="/resources/slick/slick.min.js"></script>
			
	</body>
	
	
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
	
	
	<!--  휠 -->
	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
	<script>
   var total_section = 0; //전체 원페이지 수
   var current_idx = 0;
   var screen_h = 0; // 화면 높이
   var page_h = 0;
   var last_y = 0; // 스크롤 마지막 하단 높이
   var onpage_on = true;
   var isScroll = false;

   $(document).ready(function(){
      
      init();
      
         
      // Scroll Event
      $('body').on('scroll touchmove mousewheel',function(event) {   
         
         //console.log(current_idx);

         if(last_y > $("html").scrollTop() && !onpage_on){
            
            //원페이지 스크롤 진입
            console.log(":: 원페이지 시작 ::");
            isScroll = false;
         }
         
         if(!onpage_on) return;
         
         //스크롤 이벤트 막기
         event.preventDefault(); 
         event.stopPropagation();      
         if(isScroll) return; // 현재 스크롤이 동작중이면 종료
         
         
         isScroll = true;      
         var direction = event.originalEvent.wheelDelta; //마우스 휠 방향
         var y = 0;

         if(direction > 0){
            // up
            current_idx --;
            if(current_idx < 0){current_idx = -1;}
            y = current_idx * page_h;
         }
         else{
            // down
            current_idx ++;
            if(current_idx > total_section){
               current_idx = total_section;
               onpage_on = false;
               return;
            }
            
            y = current_idx * page_h;      
         }

         $('body').animate({scrollTop: y}, 1000, function(){isScroll=false;});   
      });
   });

   $( window ).resize(function() {
      
      // 반응형
      setHeight();
   });


   function init(){
      
      setHeight();
      
      total_section = $('#onepage > section').length;
      last_y = page_h * total_section;
   }   

   function setHeight(){
      
      // 높이 설정
      screen_h = document.body.clientHeight;
      page_h = screen_h;
      $("#onepage > section").height(0);
   }
   </script>
   
	
</html>
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

		<link rel="stylesheet" type="text/css" href="/resources/slick/slick.css"/>
		<link rel="stylesheet" type="text/css" href="/resources/slick/slick-theme.css"/>

		<link rel="stylesheet" href="/resources/assets/css/layout.css"/>
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
			    font-family: 'Handletter';
			    margin: 0 auto;
			    text-align: center;
			    top: -35%;
			    padding: 0;
			}
			span#mainMessage{
				font-family: 'Handletter';
			}
			.alt > span {
				font-size: 70px; font-weight: bold;
			}
	/* modal */
	.loginModal {
		height: 500px;
	}
	.findModal {
		height: 500px;
	}
	#kakaoImageLarge {
		display: none;
	}
	#kakaoImage {
		display: inline;
	}
	#loginBtn {
		width: 187px;
	}

	.signUpModal {
		margin-top: -280px !important;
		height:750px !important;
	}

	@media screen and (max-width:480px) {
		#kakaoImageLarge {
			display: inline;
		}
		#kakaoImage {
			display: none;
		}
		#loginBtn {
			width: 100%;
		}
		.cautionMsg {
			font-size: 1em;
		}
	}
		</style>
	</head>
	
	<body class="is-preload">

			<!-- Header -->
			<header id="header" style="height: 7em; position: absolute; background:#00000000;">
				<!-- Nav -->
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
											<li><a href="#" class="signup">회원가입</a></li>
											<li><a href="#" class="signin">로그인</a></li>
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
						<div align="center">
							<h2 class="alt" style="text-align: center; margin: 0; margin-top: -10%;">
								<span id="mainMessage">모</span>험심을 가지고 
								<span id="mainMessage">닥</span>치는대로 도전하면 
								<span id="mainMessage">불</span>가능은 없다.
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
			
		<!-- modal -->
			
		<div class="modal-wrapper">
			<div class="modal loginModal">
				<div class="head-pop"><h2>로그인</h2>
				</div>
				<form name="" action="#" method="" >
					<div class="row gtr-uniform">
						<div class="col-10 col-11-xsmall" style="margin: 0 auto; margin-top: 10%;">
							<label for="userId">아이디</label>
							<input type="text" name="userId" id="userId" placeholder="ID">
							<label for="userPw" style="margin-top: 15px;">비밀번호</label>
							<input type="password" name="userPw" id="userPw" placeholder="PASSWARD">
							<div><a href="javascript:void(0);" id="goSignUpBtn" style="text-decoration: none;">회원가입</a>&nbsp;&nbsp;&nbsp;<a href="#" id="findIdPw" style="text-decoration: none;">아이디/비밀번호 찾기</a></div>
							<ul class="actions" style="margin-top: 5%;">
								<li style="margin-left: auto;">
									<a><img id="kakaoImage" style="height: 46px;" src="/resources/images/kakaoLogin.png"></a>
									<a><img id="kakaoImageLarge" style="height: 46px; width: 100%;" src="/resources/images/kakaoLoginLarge.png"></a>
								</li>
								<li style="margin-right: auto;">
									<a class="button primary" id="loginBtn" style="border-radius: 6px; height: 46px;">로그인</a>
								</li>
							</ul>
						</div>        
					</div>
				</form>
			</div>

			<div class="modal findModal" style="display:none;">
				<div class="head-pop">
					<div style="width: 49%; display: inline-block;"><a href="javascript:void(0);" id="findIdBtn" style="text-decoration: none;">
						<h2 style="color: #2388fa;">아이디 찾기</h2>
					</a></div>
					<div style="width: 49%; display: inline-block;"><a href="javascript:void(0);" id="findPwBtn" style="text-decoration: none;">
						<h2>비밀번호 찾기</h2>
					</a></div>
				</div>
				<hr style="margin: 25px;">
				<!-- 아이디찾기 -->
				<form name="findIdForm" action="#" method="" >
					<div class="row gtr-uniform">
						<div class="col-10 col-11-xsmall" style="margin: 0 auto; margin-top: 10%;">
							<h3 class="cautionMsg" style="text-align: center;">가입에 등록한 이메일을 입력해주세요.</h3>
							<label for="userEmail2">이메일</label>
							<input type="email" name="userEmail" id="userEmail2" placeholder="EMAIL">
							<ul class="actions" style="margin-top: 5%;">
								<li style="margin-left: auto;">
									<a class="button primary" class="goLoginBtn" style="border-radius: 6px; height: 46px;">로그인</a>
								</li>
								<li style="margin-right: auto;">
									<a class="button primary" id="goFindIdBtn" style="border-radius: 6px; height: 46px;">아이디 찾기</a>
								</li>
							</ul>
						</div>        
					</div>
				</form>
				<!-- 비밀번호 찾기 -->
				<form name="findPwForm" action="#" method="" style="display: none;">
					<div class="row gtr-uniform">
						<div class="col-10 col-11-xsmall" style="margin: 0 auto;">
							<h3 class="cautionMsg" style="text-align: center;">가입에 등록한 이메일을 입력해주세요.<br>해당 이메일로 비밀번호 변경 링크를 발송합니다.</h3>
							<label for="userId3">아이디</label>
							<input type="text" name="userId" id="userId3" placeholder="ID">
							<label for="userEmail3">이메일</label>
							<input type="email" name="userEmail" id="userEmail3" placeholder="EMAIL">
							<ul class="actions" style="margin-top: 5%;">
								<li style="margin-left: auto;">
									<a class="button primary" class="goLoginBtn" style="border-radius: 6px; height: 46px;">로그인</a>
								</li>
								<li style="margin-right: auto;">
									<a class="button primary" id="goFindIdBtn" style="border-radius: 6px; height: 46px;">이메일 발송</a>
								</li>
							</ul>
						</div>        
					</div>
				</form>
			</div>

			<div class="modal signUpModal" style="display:none;">
				<div class="head-pop">
					<div style="width: 49%; display: inline-block;"><h2>회원가입</h2></div>
				</div>
				<form name="" action="#" method="">
					<div class="row gtr-uniform">
						<div class="col-10 col-11-xsmall" style="margin: 0 auto;">
							<span style="color: red;">* </span><span style="font-weight: bold;">아이디</span><span style="font-size: small; color: red;
								font-family:sans-serif;"> (* 영문 혹은 영문+숫자 조합, 12길이)</span>
							<input type="text" name="memberId" id="memberId" maxlength="12"/>
							<font id="idCheck2_text" size="3"></font> 
							<font id="idCheck_text" size="2"></font>
							<br>
							<span style="color: red;">* </span><span style="font-weight: bold;">비밀번호</span>
							<span style="font-size: 12px; font-family:Verdana, Geneva, Tahoma, sans-serif; color: red;">
									(* 영문+숫자+대소문자 조합 8자이상 입력) </span>
							<input type="password" name="memberPw" id="memberPw"/>
							<br>
							<span style="color: #ff0000;">* </span><span style="font-weight: bold;">비밀번호 확인 </span>
							<input type="password" name="memberPw2" id="memberPw2" />
							<font id="pwCheck_text" size="3" style="text-align: right;"></font>
							<br>
							<span style="color: red;">* </span><span style="font-weight: bold;">이메일</span>
						<br>
							<input class="mediaInput" type="email" name="memberEmail" style="width:66%; float:left" placeholder="abc@gmail.com" />
							<a href="javascript:EmailCheck();" class="btn-right"
							type="submit" style="font-size: 0.87rem; border-radius: 6px; width: 34%;">
							인증번호 전송</a>
							<br><br>
							<div class="mail_verify_input_box" id="mail_verify_input_box_false">
							<input class="mediaInput" type="text" name="verify" id="verify" class="verify" style="width:66%; float:left" placeholder="7자리" disabled="disabled" />
							<a href="javascript:verifyCheck();" class="btn-right"
							type="submit" style="font-size: 0.87rem; border-radius: 6px; width: 34%;">
							인증번호 확인</a>
							</div>
							<font id="verify_check" size="3"></font>
							
							<input type="checkbox" id="Agree" name="Agree">
							<label for="Agree" style="margin-top: 3%;">
								<span style="color:crimson; font-size: 14px;">*[필수] <b>홈페이지 이용약관 동의</b> </span>
							</label> 
						<br>
						<div style="text-align: center;">
							<a id="submit" href="javascript:formSubmit()" class="btn-right" type="submit" 
							style="border-radius: 6px; margin: 0 auto;">가입하기</a>
						</div>
						</div>        
					</div>
				</form>

			</div>
		</div>


<%@include file="includes/footer.jsp" %>
			
			

</body>

<!-- 슬라이더 -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="/resources/slick/slick.min.js"></script>

<!-- modal -->
<script src="/resources/assets/js/modal.js"></script>
<!-- modal end -->

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
	<!-- <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
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
   </script> -->
   
	
</html>
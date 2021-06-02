<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>초안 게시판 </title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="shortcut icon" type="image/x-icon" href="/resources/images/title-icon.png">
		
		
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
		<!-- <link rel="stylesheet" href="/resources/assets/bootstrap-css/bootstrap.min.css" /> -->
		
		<!-- 부가적인 테마 -->
		<!-- <link rel="stylesheet" href="/resources/assets/bootstrap-css/bootstrap-theme.min.css" /> -->
		<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
		
		
		<style>
			@media screen and (min-width: 1px) {
				.inner.banner {
					width: 100%;
					max-width: 95%;
				}
			}
			@media screen and (max-width: 1440px) {
				.inner.banner {
					padding: 0 30px;
				}
			}
			
			/* 최상단 배너 */
			.main-banner-container {
				display: flex;
				align-items: center;
			}
			.main-banner-container > .description{
				width: 60%;
			}

			.main-banner-container > .description > .text-1 {
				font-size: 40px;
				font-weight: bold;
				color: #222;
				word-break: keep-all;
			}
			.main-banner-container > .description > .text-2 {
				font-size: 32px;
				font-weight: bold;
				color: #222;
				margin-top: 2px;
				word-break: keep-all;
			}
			.main-banner-container > .description > .text-3 {
				font-size: 17px;
				color: #666;
				margin-top: 18px;
			}	
			.main-banner-container > .description > .tools {
				margin-top: 40px;
			}	
			.main-banner-container > .btn.btn-secondary {
				background: #f85272;
				color: #fff;
				font-size: 13px;
				padding: 8px 16px;
				border-radius: 17px;
				font-weight: bold;
			}	
			.main-banner-container > .btn.btn-secondary.hero-upload {
				padding: 8px 24px;
			}
			.btn.btn-secondary-show {
				background-color: transparent;
				color: #f85272;
				text-decoration: none;
			}
			.btn.btn-secondary.hero-upload {
				padding: 8px 24px;
			}
			.btn.btn-secondary {
				background: #f85272;
				color: #fff;
				font-size: 13px;
				/* padding: 8px 16px; */
				border-radius: 17px;
				font-weight: bold;
				text-decoration: none;
			}
			a.btn.btn-secondary-show {
				position: absolute;
			}
			/* 카테고리 바 */
			.filter-mobile{
				display: flex;
				margin: 0 auto;
			}
			select#category, select#from {
				width: 30%;
				height: 30px;
			}
			@media screen and (min-width: 546px ) {
				select#category, select#from {
					width: 40%;
				}
			}
			@media screen and (min-width: 1660px ) {
				select#category, select#from {
					width: 40%;
					height: 50px;
				}
			}
			
/*         */
			.inner-image {
				width: 40%;
			}
			.posts {
				padding: 0 30px;
			}
			.posts > article .image img {
				width: 100%;
				border-radius: 6px;
			}
			a.image:hover img {
				border-radius: 6px;
			}

			/* post info 정보 */
			.info {
			/* padding: 18px 13px; */
				position: relative;
			}
			/* post title */
			.title {
				color: #222;
				padding: 0;
				/* position: absolute; */
				width: 100%;
				font-size: 14px;
				font-weight: bold;
				text-overflow: ellipsis;
				overflow: hidden;
				white-space: nowrap;
				word-wrap: normal !important;
				display: block;
			}
			/* profile icon 아이콘은 원형으로 */
			img.icon-round {
				border-radius: 50%;
			}
			
			/* post bottom */
			
			.bottom {
				width: 100%;
				display: flex;
				flex-direction: row;
				padding: 5px 0;
				margin-top: 10px;
				position: relative;
				min-width: 0;
			}	
			.bottom > div {
				flex: 1;
				display: flex;
			}
			.username img {
				width: 24px;
				height: 24px;
			}
			.bottom .social-info {
				width: 100%;
				display: flex;
				flex-direction: row;
				justify-content: flex-end;
				color: #777777;
			}
			.bottom .social-info .hit-cnt img {
				width: 16px !important;
				height: 11px;
			}
			.bottom .social-info .like-cnt {
				margin-left: 16px;
			}
			.bottom .social-info .like-cnt img {
				width: 14px !important;
				height: 13px;
			}
				@media screen and (min-width: 1px) {
					.view-icon, .love-icon, .comment-icon {
						vertical-align: middle;
						margin-right: 0px;
					}
				}
				
			/* 포스트 카테고리 바 post category bar */
			.original-main.project .filters-container {
				border-bottom: solid 1px #f1f1f1;
				border-top: solid 1px #f1f1f1;
			}
			.original-main .filters-container {
				margin: 48px 0px 20px 0px;
			}
			.filters-container .container {
					width: 100%;
					max-width: 1500px;
			}
			.filters-container .container {
				width: 100%;
				max-width: 1500px;
			}
			.filters-container .profile-filters {
				/* text-align: center; */
				display: flex;
				justify-content: space-between;
			}
			.project .btn.btn-soft-pink.btn-none-background {
				font-size: 1em;
				letter-spacing: -0.25px;
				font-weight: normal;
				color: #777777;
				font-family: 'NIXGONL-Vb';
				background-color: #ffffff;
				padding: 0 !important;
				/* width: unset !important; */
				margin-right: 32px;
				border: 0px;
				width: 5em;
			}
			.project .btn.btn-soft-pink.btn-none-background:hover, .project .btn.btn-soft-pink.btn-none-background.active {
				font-weight: bold;
				color: #f85272;
				background-color: #ffffff;
				position: relative;
				cursor: pointer;
				width: 5em;
			}
			@media screen and (max-width: 435px){
				.project .btn.btn-soft-pink.btn-none-background {
					width: auto;
				}
				.project .btn.btn-soft-pink.btn-none-background:hover, .project .btn.btn-soft-pink.btn-none-background.active {
					width: auto;
				}
			}
			.project .filter-side-divider {
				height: 14px;
				background-color: #e1e1e1;
				width: 1px;
				display: inline-block;
				position: relative;
				top: 3px;
			}
			.project .filter-side-divider {
				height: 14px;
				background-color: #e1e1e1;
				width: 1px;
				display: inline-block;
				position: relative;
				top: 3px;
			}			
			.project .filter .bootstrap-select .btn-default {
				color: #222222;
				letter-spacing: -0.25px;
				font-size: 0.929em;
				font-family: 'NIXGONL-Vb';
			}
			.project .filter .bootstrap-select .btn-default .caret {
				/* border-top: 4px solid #222222; */
				/* border-bottom: none; */

				/* 왜 안떠 ,,, */
				background: url("/resources/images/down-arrow.png"); 
				
				border: none;
				top: 30%;
				width: 14px;
				height: 14px;
			}
			.project .dropdown-menu.open {
				border: 1px solid #e1e1e1;
				border-radius: 4px;
				box-shadow: none;
				z-index: 99;
			}
			@media screen and (max-width: 447px) {
				.filter-mobile{
					display: flex;
				}
			}
			.bootstrap-select.btn-group .dropdown-menu.inner {
				position: static;
				border: 0;
				padding: 0;
				margin: 0;
				-webkit-border-radius: 0;
				-moz-border-radius: 0;
				border-radius: 0;
				-webkit-box-shadow: none;
				-moz-box-shadow: none;
				box-shadow: none;
			}
			.dropdown-menu li {
				text-align: left;
				font-family: 'NIXGONL-Vb';
				letter-spacing: -0.25px;
				font-size: 0.857em;
			}
			
			.imgDiv {
				width: 100%;
				height: 550px;
				margin: 0 auto;
			}
			
			.reviewImg {
				width: 100%;
				height: 100%;
				object-fit: cover; 
			}
			
			@media screen and (max-width: 1980px){
				.imgDiv {
					height: 340px; 
				}
			}
			@media screen and (max-width: 980px){
				.imgDiv {
					width: 80%;
					height: 300px; 
				}
				
				.info {
					width: 80%;
					margin: 0 auto;
				}
				
				.main-banner-container {
					margin-bottom: 5%;
				}
			}

			

			
		</style>
		
	</head>
	
	<body class="is-preload">

<%@include file="../includes/header.jsp" %>

<div id="main">

		<!-- Post -->
		<section class="main special" style="margin-top: 30px;">
			<div class="inner banner">
					<header class="major">
						<span class="category">캠핑 리뷰</span>
					</header>
					<div class="main-banner-container">
						<div class="description">
							<div class="text-1">늦었다고 생각할 때가 가장 늦었다.</div>
							<div class="text-2">지금 여러분의 캠핑을 업로드해보세요!</div>
							<div class="text-3">모닥불은 모든 캠퍼들의 활동을 응원합니다.</div>
							<div class="tools">
								<div class="hidden-xs">
									<a class="btn btn-secondary hero-upload" href="#">지금 업로드 해보기</a>
									<a class="btn btn-secondary-show" href="#">보러가기</a>
								</div>
							</div>
						</div>
						<div class="inner-image">
							<a href="#" class="image main"><img src="/resources/images/background/bg09.jpg" alt="" /></a>
						</div>
					</div>
				</div>
			</section>

			<div class="project original-main hidden-sm hidden-xs" style="margin-top: 0px;">
				<div class="filters-container">
					<form name="list" method="get" style="margin: 2rem 0;">
						<input type="hidden" id="order" value="noted">
						<div class="container">
							<div class="filter profile-filters">
								<div class="filter-mobile">
									<div class="btn btn-sort btn-soft-pink btn-none-background active" >캠퍼 픽</div>
									<div class="btn btn-sort btn-soft-pink btn-none-background btn-left-align " >최신순</div>
									<div class="btn btn-sort btn-soft-pink btn-none-background btn-left-align" >추천순</div>
		
									<span class="filter-side-divider"></span>
		
									<select name="from" class="select " id="from">
										<option value="all" selected="">전체기간</option>
										<option value="day">최근 24시간</option>
										<option value="week">최근 1주일</option>
										<option value="month">최근 1달</option>
										<option value="month3">최근 3달</option>
									</select>
		
									<select class="categories" name="category" id="category" >
										<option selected="" value="">전체분야</option>
										<option value="A7">유료 캠핑장</option>
										<option value="B7">무료 캠핑장</option>
										<option value="C7">노지 캠핑장</option>
										<option value="D7">난이도 캠핑장</option>
										<option value="E7">글램핑 캠핑장</option>
										<option value="F7">카라반 캠핑장</option>
									</select>
									
								</div>
							</div>
		
						</div>
		
					</form>
				</div>
			</div>
			
			
		<!-- Posts -->
			<section class="main">
				<div class="posts">
					<article>
						<div class="imgDiv"><a href="#" class="image"><img class="reviewImg" src="/resources/images/background/bg05.jpg" alt="" /></a></div>
						
						<div class="info">
							<div class="info-detail">
								<div class="title">test</div>
								<div class="bottom">
									<div class="username">
										<span class="go-profile-area" data-username="MoonSH">
											<img class="icon-round" onerror="this.src='/resources/images/default_profile_face.png'" src="/resources/images/icon.png">
											TangTang
										</span>
									</div>
									
									<div class="social-info">
										<div class="hit-cnt">
											<img class="view-icon" src="/resources/images/view-gray.png" style="width:30%;"> 145.1k
										</div>
										<div class="like-cnt">
											<img class="love-icon" src="/resources/images/love-gray.png" style="width:30%;"> 2.1k
										</div>
									</div>
								</div>
							</div>
						</div>
					</article>
					<article>
						<div class="imgDiv"><a href="#" class="image"><img class="reviewImg" src="/resources/images/background/bg06.jpg" alt="" /></a></div>
						
						<div class="info">
							<div class="info-detail">
								<div class="title">test</div>
								<div class="bottom">
									<div class="username">
										<span class="go-profile-area" data-username="MoonSH">
											<img class="icon-round" onerror="this.src='/resources/images/default_profile_face.png'" src="/resources/images/profile-icon.png">
											TangTang
										</span>
									</div>
									
									<div class="social-info">
										<div class="hit-cnt">
											<img class="view-icon" src="/resources/images/view-gray.png" style="width:30%;"> 145.1k
										</div>
										<div class="like-cnt">
											<img class="love-icon" src="/resources/images/love-gray.png" style="width:30%;"> 2.1k
										</div>
									</div>
								</div>
							</div>
						</div>
					</article>
					<article>
						<div class="imgDiv"><a href="#" class="image"><img class="reviewImg" src="/resources/images/background/bg07.jpg" alt="" /></a></div>
						
						<div class="info">
							<div class="info-detail">
								<div class="title">test</div>
								<div class="bottom">
									<div class="username">
										<span class="go-profile-area" data-username="MoonSH">
											<img class="icon-round" onerror="this.src='/resources/images/default_profile_face.png'" src="/resources/images/profile-icon.png">
											TangTang
										</span>
									</div>
									
									<div class="social-info">
										<div class="hit-cnt">
											<img class="view-icon" src="/resources/images/view-gray.png" style="width:30%;"> 145.1k
										</div>
										<div class="like-cnt">
											<img class="love-icon" src="/resources/images/love-gray.png" style="width:30%;"> 2.1k
										</div>
									</div>
								</div>
							</div>
						</div>
					</article>
					<article>
						<div class="imgDiv"><a href="#" class="image"><img class="reviewImg" src="/resources/images/background/bg08.jpg" alt="" /></a></div>
						
						<div class="info">
							<div class="info-detail">
								<div class="title">test</div>
								<div class="bottom">
									<div class="username">
										<span class="go-profile-area" data-username="MoonSH">
											<img class="icon-round" onerror="this.src='/resources/images/default_profile_face.png'" src="/resources/images/profile-icon.png">
											TangTang
										</span>
									</div>
									
									<div class="social-info">
										<div class="hit-cnt">
											<img class="view-icon" src="/resources/images/view-gray.png" style="width:30%;"> 145.1k
										</div>
										<div class="like-cnt">
											<img class="love-icon" src="/resources/images/love-gray.png" style="width:30%;"> 2.1k
										</div>
									</div>
								</div>
							</div>
						</div>
					</article>
					<article>
						<div class="imgDiv"><a href="#" class="image"><img class="reviewImg" src="/resources/images/background/bg09.jpg" alt="" /></a></div>
						
						<div class="info">
							<div class="info-detail">
								<div class="title">test</div>
								<div class="bottom">
									<div class="username">
										<span class="go-profile-area" data-username="MoonSH">
											<img class="icon-round" onerror="this.src='/resources/images/default_profile_face.png'" src="/resources/images/profile-icon.png">
											TangTang
										</span>
									</div>
									
									<div class="social-info">
										<div class="hit-cnt">
											<img class="view-icon" src="/resources/images/view-gray.png" style="width:30%;"> 145.1k
										</div>
										<div class="like-cnt">
											<img class="love-icon" src="/resources/images/love-gray.png" style="width:30%;"> 2.1k
										</div>
									</div>
								</div>
							</div>
						</div>
					</article>
					<article>
						<div class="imgDiv"><a href="#" class="image"><img class="reviewImg" src="/resources/images/background/bg10.jpg" alt="" /></a></div>
						
						<div class="info">
							<div class="info-detail">
								<div class="title">test</div>
								<div class="bottom">
									<div class="username">
										<span class="go-profile-area" data-username="MoonSH">
											<img class="icon-round" onerror="this.src='/resources/images/default_profile_face.png'" src="/resources/images/profile-icon.png">
											TangTang
										</span>
									</div>
									
									<div class="social-info">
										<div class="hit-cnt">
											<img class="view-icon" src="/resources/images/view-gray.png" style="width:30%;"> 145.1k
										</div>
										<div class="like-cnt">
											<img class="love-icon" src="/resources/images/love-gray.png" style="width:30%;"> 2.1k
										</div>
									</div>
								</div>
							</div>
						</div>
					</article>
				</div>
				<footer class="major">
					<ul class="pagination">
						<!--<li><a href="#" class="previous">Prev</a></li>-->
						<li><a href="#" class="page active">1</a></li>
						<li><a href="#" class="page">2</a></li>
						<li><a href="#" class="page">3</a></li>
						<li><span class="extra">&hellip;</span></li>
						<li><a href="#" class="page">19</a></li>
						<li><a href="#" class="page">20</a></li>
						<li><a href="#" class="next">Next</a></li>
					</ul>
				</footer>
			</section>
				
				
			 
				
</div>



<jsp:include page="../includes/footer.jsp"/>
<%-- <%@include file="includes/footer.jsp" %> --%>

	</body>
</html>
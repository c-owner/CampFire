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

		<style>
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
			.inner-image {
				width: 40%;
			}
			.posts > article .image img {
				width: 100%;
				border-radius: 6px;
			}
			a.image:hover img {
				border-radius: 6px;
			}
			.inner {
				margin: 0;
				max-width: 100%;
				width: 100%;
			}
			/* info */
			.info {
			/* padding: 18px 13px; */
				position: relative;
			}
			/* title */
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
			
			/* bottom */
			
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
				@media (min-width: 1px) {
					.view-icon, .love-icon, .comment-icon {
						vertical-align: middle;
						margin-right: 0px;
					}
				}
				
			/* 포스트 카테고리 바 post category bar */
			.filters-container .container {
					width: 100%;
					max-width: 1500px;
			}
			
			
		</style>
		
	</head>
	
	<body class="is-preload">

<%@include file="includes/header.jsp" %>

<div id="main">
	<div class="wrapper">

		<!-- Post -->
		<section class="main special">
			<div class="inner">
					<header class="major">
						<span class="category">캠핑 리뷰</span>
						<h2><a href="#">샘플</a></h2>
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
					<form name="list" method="get">
						<input type="hidden" id="order" value="noted">
						<div class="container">
							<div class="filter profile-filters">
								<div>
									<div class="btn btn-sort btn-soft-pink btn-none-background " data-value="pick">노트폴리오 픽</div>
									<div class="btn btn-sort btn-soft-pink btn-none-background btn-left-align " data-value="newest">최신순</div>
									<div class="btn btn-sort btn-soft-pink btn-none-background btn-left-align active" data-value="noted">추천순</div>
		
									<span class="filter-side-divider"></span>
		
									<select name="from" class="select " id="from" style="display: none;">
										<option value="all" selected="">전체기간</option>
										<option value="day">최근 24시간</option>
										<option value="week">최근 1주일</option>
										<option value="month">최근 1달</option>
										<option value="month3">최근 3달</option>
									</select><div class="btn-group bootstrap-select select"><button type="button" class="btn dropdown-toggle selectpicker btn-default" data-toggle="dropdown" data-id="from"><div class="filter-option pull-left">전체기간</div>&nbsp;<div class="caret"></div></button><div class="dropdown-menu open"><ul class="dropdown-menu inner selectpicker" role="menu"><li rel="0" class="selected"><a tabindex="0" class="" style=""><span class="text">전체기간</span><i class="glyphicon glyphicon-ok icon-ok check-mark"></i></a></li><li rel="1"><a tabindex="0" class="" style=""><span class="text">최근 24시간</span><i class="glyphicon glyphicon-ok icon-ok check-mark"></i></a></li><li rel="2"><a tabindex="0" class="" style=""><span class="text">최근 1주일</span><i class="glyphicon glyphicon-ok icon-ok check-mark"></i></a></li><li rel="3"><a tabindex="0" class="" style=""><span class="text">최근 1달</span><i class="glyphicon glyphicon-ok icon-ok check-mark"></i></a></li><li rel="4"><a tabindex="0" class="" style=""><span class="text">최근 3달</span><i class="glyphicon glyphicon-ok icon-ok check-mark"></i></a></li></ul></div></div>
		
									<select class="categories" name="category" id="category" style="display: none;">
										<option selected="" value="">전체분야</option>
										<option value="J7"></option>
										<option value="D7"></option>
										<option value="C7"></option>
										<option value="F7"></option>
										<option value="G7"><option>
										<option value="B7"></option>
										<option value="K7"></option>
										<option value="E7"></option>
										<option value="I7"></option>
										<option value="H7"></option>
										<option value="A7"></option>
									</select>
									<div class="btn-group bootstrap-select categories">
										<button type="button" class="btn dropdown-toggle selectpicker btn-default" data-toggle="dropdown" data-id="category">
											<div class="filter-option pull-left">전체분야</div>&nbsp;
											<div class="caret"></div>
										</button>
										<div class="dropdown-menu open">
											<ul class="dropdown-menu inner selectpicker" role="menu">
												<li rel="0" class="selected">
													<a tabindex="0" class="" style="">
														<span class="text">전체분야</span>
														<i class="glyphicon glyphicon-ok icon-ok check-mark"></i>
													</a>
												</li>
												<li rel="1">
													<a tabindex="0" class="" style="">
														<span class="text">무제</span>
														<i class="glyphicon glyphicon-ok icon-ok check-mark"></i>
													</a>
												</li>
												<li rel="2">
													<a tabindex="0" class="" style="">
														<span class="text">무제</span>
														<i class="glyphicon glyphicon-ok icon-ok check-mark"></i>
													</a>
												</li>
											</ul>
										</div>
									</div>
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
						<a href="#" class="image"><img src="/resources/images/background/bg05.jpg" alt="" /></a>
						
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
						<a href="#" class="image"><img src="/resources/images/background/bg06.jpg" alt="" /></a>
						
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
						<a href="#" class="image"><img src="/resources/images/background/bg07.jpg" alt="" /></a>
						
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
						<a href="#" class="image"><img src="/resources/images/background/bg08.jpg" alt="" /></a>
						
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
						<a href="#" class="image"><img src="/resources/images/background/bg09.jpg" alt="" /></a>
						
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
						<a href="#" class="image"><img src="/resources/images/background/bg10.jpg" alt="" /></a>
						
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
</div>



<jsp:include page="includes/footer.jsp"/>
<%-- <%@include file="includes/footer.jsp" %> --%>
	</body>
</html>
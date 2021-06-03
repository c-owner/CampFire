<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>자유게시판 | 모닥불🏕  </title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="shortcut icon" type="image/x-icon" href="/resources/images/icon/title-icon.png">
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
			</div>
			<div class="row" style="display:block;">
				<div class="col-6 col-10-medium col-11-small" style="margin: 0 auto;"><h2 style="font-weight: bold;">리뷰 상세보기</h2></div>
				<div class="col-6 col-10-medium col-11-small" style="margin: 0 auto;">
					<div class="header">
						<h3 style="font-weight: bold; text-align: left; margin: 0 0;">
							테스트 제목입니다.
						</h3>
						<div style="position: absolute;">
							<span>작성자 : ㅇㅇㅇ</span>
						</div>
						<div style="text-align: right;">
							<span>조회수 : ㅇㅇㅇ</span>
						</div>
					</div>
					<div style="margin-bottom: 10px;">
						<textarea rows="12" cols="">테스트 내용입니다.테스트 내용입니다.테스트 내용입니다.테스트 내용입니다.테스트 내용입니다.테스트 내용입니다.테스트 내용입니다.테스트 내용입니다.
						테스트 내용입니다.테스트 내용입니다.테스트 내용입니다.테스트 내용입니다.테스트 내용입니다.테스트 내용입니다.테스트 내용입니다.테스트 내용입니다.
						테스트 내용입니다.테스트 내용입니다.테스트 내용입니다.테스트 내용입니다.테스트 내용입니다.</textarea>
					</div>
				</div>
				<div class="col-6 col-10-medium col-11-small" style="margin: 0 auto 10px auto;">
					<div class="row">
						<div class="col-3" style="text-align:left; text-decoration: none;">
							<a href="#" id="heartIcon" style="font-size:18px;text-decoration: none;"><i style="font-size: 35px;" class="far fa-heart"></i>123개</a>
						</div>
						<div class="col-9" style="text-align: right;">
							<a href="#" style="font-size: 21px; text-decoration: none;">테드한의 캠핑장 바로가기</a>
						</div>
					</div>
					
				</div>
				
				<!-- 댓글작성칸 -->
				<div class="col-6 col-10-medium col-11-small" style="margin: 0 auto 10px auto;">
					<div class="row">
						<div class="col-9">
							<input type="text">
						</div>
						<div class="col-3" style="padding:0 0;">
							<ul class="actions stacked" style="margin: 0 0;">
								<li>
									<a class="button primary fit" style="border-radius: 6px;">댓글 작성</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
				<!-- 댓글리스트 -->
				<div class="col-6 col-10-medium col-10-small" style="margin: 0 auto;">
					<div>
						<h3 style="font-weight: bold; text-align: left; margin: 0 0;">댓글</h3>
					</div>
					<ul class="alt">
						<li>
							<div style="position: absolute;">
								<h4 style="margin: 0; text-align: left;">작성자: 고희광</h4>
							</div>
							<div style="text-align: right;">
								<h5 style="margin: 0;">12분 전</h5>
							</div>
							<div style="text-align: left;">
								<span>댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.</span>
							</div>
						</li>
						<li>
							<div style="position: absolute;">
								<h4 style="margin: 0; text-align: left;">작성자: 고희광</h4>
							</div>
							<div style="text-align: right;">
								<h5 style="margin: 0;">12분 전</h5>
							</div>
							<div style="text-align: left;">
								<span>댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.</span>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</section>
</div>
<jsp:include page="../includes/footer.jsp"/>
	</body>
	<script>
		$(document).ready(function () {
			$("#heartIcon").on("click", function(e){
				e.preventDefault();
				$(this).find(".fa-heart").toggleClass("far");
				$(this).find(".fa-heart").toggleClass("fas");
			});
		});
	</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
	<head>
		<title>리뷰게시판 | 모닥불🏕 </title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="stylesheet" href="/resources/assets/css/search.css" />
		<link rel="stylesheet" href="/resources/assets/css/review.css" />
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
					<div class="main-banner-container">
						<div class="description">
							<div class="text-1">늦었다고 생각할 때가 가장 늦었다.</div>
							<div class="text-2">지금 여러분의 캠핑을 업로드해보세요!</div>
							<div class="text-3">모닥불은 모든 캠퍼들의 활동을 응원합니다.</div>
							<div class="tools">
								<div class="hidden-xs">
								
									<a class="button small" href="/review/reviewWrite${pageMaker.cri.getListLink()}">지금 업로드 해보기</a>
									<!-- <a class="btn btn-secondary hero-upload" href="/review/reviewWrite${pageMaker.cri.getListLink()}">지금 업로드 해보기</a>-->
									<!-- <a class="btn btn-secondary-show" href="#">보러가기</a> -->
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
					<form name="list" action="/review/reviewList" style="margin: 2rem 0;">
						<input type="hidden" id="order" value="noted">
						<div class="container">
							<div class="filter profile-filters">
								<div class="filter-mobile">
									<div class="btn btn-sort btn-soft-pink btn-none-background active" >캠퍼 픽</div>
									<div class="btn btn-sort btn-soft-pink btn-none-background btn-left-align " >최신순</div>
									<div class="btn btn-sort btn-soft-pink btn-none-background btn-left-align" >추천순</div>
								</div>
		
									<!-- <span class="filter-side-divider"></span> -->
		
									<select name="from" class="select " id="from">
										<option value="all" >전체기간</option>
										<option value="day">최근 24시간</option>
										<option value="week">최근 1주일</option>
										<option value="month">최근 1달</option>
										<option value="month3">최근 3달</option>
									</select>
		
									<select class="categories" name="type" id="category" >
										<option value="all">전체분야</option>
										<option value="A7">유료 캠핑장</option>
										<option value="B7">무료 캠핑장</option>
										<option value="C7">노지 캠핑장</option>
										<option value="D7">난이도 캠핑장</option>
										<option value="E7">글램핑 캠핑장</option>
										<option value="F7">카라반 캠핑장</option>
									</select>
									
							</div>
		
						</div>
					</form>
					<div class="navSearch" style="text-align: right;">
						<form action="/review/reviewList?search=" name="searchForm" id="search" method="post">
							<input type="hidden" name="category" value="지역별">
							<input type="hidden" name="category2" value="recent">
							<input type="search" class="searchTerm" name="keyword" placeholder="검색어를 입력하세요"
							style="border-radius: initial; height:30px; width: 100%; ">
							<a href="javascript:searchForm.submit();" class="button primary icon solid fa-search">Search</a>
							<!-- <a href="javascript:searchForm.submit();" class="fas fa-search" style="text-decoration: none; margin-top: 5px;"></a> -->
						</form>
					</div>
				</div>
			</div>
			
			
		<!-- Posts -->
			<section class="main">
				<div class="posts">
					<c:forEach var="review" items="${list}" begin="0" step="1">
					<article>
						<div class="imgDiv"><a href="/review/reviewView?bno=${review.bno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}" class="image">
						<img class="reviewImg" src="/display?fileName=/review/${review.thumb}" alt="" /></a></div>
						
						<div class="info">
							<div class="info-detail">
								<div class="title">${review.title}<span style="font-size: 8px;">[${review.replyCnt}]</span></div>
								<div class="star" style="color: gold;">${review.star}</div>
								<div class="bottom">
									<div class="username">
										<span class="go-profile-area" data-username="">
											<img class="icon-round" onerror="this.src='/resources/images/default_profile_face.png'" src="/resources/images/icon.png">
											${review.writer}
										</span>
									</div>
									
									<div class="social-info">
										<div class="hit-cnt">
											<img class="view-icon" src="/resources/images/view-gray.png" style="width:30%;"> 
											${review.readCnt}
										</div>
										<div class="like-cnt">
											<img class="love-icon" src="/resources/images/love-gray.png" style="width:30%;"> 
											${review.likeCnt}
										</div>
									</div>
								</div>
							</div>
						</div>
					</article>
					</c:forEach>
					
				</div>
				<div class="big-width" style="text-align: center;">
					<footer class="major">
						<ul class="pagination" id="pagination_prev">
							<c:if test="${pageMaker.prev}">
								<li><a class="changePage" id="previous" href="${1}">처음</a></li>
								<li><a class="changePage" id="previous" href="${pageMaker.startPage - 1}">이전</a></li>
							</c:if>
						</ul>
						<ul class="pagination">
							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<c:choose>
									<c:when test="${num eq pageMaker.cri.pageNum}">
										<li><a class="page active">${num}</a></li>
									</c:when>
									<c:otherwise>
										<li><a class="changePage" id="page" href="${num}">${num}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
						<ul class="pagination" id="pagination_next">
							<c:if test="${pageMaker.next}">
								<li><a class="changePage" id="next" href="${pageMaker.endPage + 1}">다음</a></li>
								<li><a class="changePage" id="next" href="${pageMaker.realEnd}">끝</a></li>
							</c:if>
						</ul>
					</footer>
				</div>
	
				<div class="small-width" style="text-align: center;">
					<footer class="major">
						<ul class="pagination" id="pagination_prev">
							<c:if test="${pageMaker.cri.pageNum > 1}">
								<li><a id="previous" class="changePage" href="${1}">처음</a></li>
								<li><a id="previous" class="changePage" href="${pageMaker.cri.pageNum - 1}">이전</a></li>
							</c:if>
						</ul>
						<ul class="pagination">
							<li><a class="page active">${pageMaker.cri.pageNum}</a></li>
						</ul>
						<ul class="pagination" id="pagination_next">
							<c:if test="${pageMaker.cri.pageNum < pageMaker.realEnd}">
								<li><a class="changePage" id="next" href="${pageMaker.cri.pageNum + 1}">다음</a></li>
								<li><a class="changePage" id="next" href="${pageMaker.realEnd}">끝</a></li>
							</c:if>
						</ul>
					</footer>
				</div>
				<form id="actionForm" action="/review/reviewList">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="type" value="${pageMaker.cri.type}">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					</form>
			</section>

				
			 
				
</div>



<jsp:include page="../includes/footer.jsp"/>
<%-- <%@include file="includes/footer.jsp" %> --%>

	</body>
	<script>
	$(".changePage").on("click", function(e){
		e.preventDefault();
		var actionForm = $("#actionForm");
		var pageNum = $(this).attr("href");
		actionForm.find("input[name='pageNum']").val(pageNum);
		actionForm.submit();
	});
	</script>
</html>
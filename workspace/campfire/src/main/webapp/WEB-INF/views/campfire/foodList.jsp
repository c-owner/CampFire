<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
	<head>
		<title>캠핑음식 | 모닥불🏕 </title>
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
					<div class="main-banner-container">
						<div class="inner-image">
							<a class="image main"><img src="/resources/images/background/bg09.jpg" alt="" /></a>
						</div>
						<div class="description">
							<div class="text-1">캠핑요리 더욱 더 다양하게</div>
							<div class="text-2">여러분의 캠핑요리를 공유해보세요!</div>
							<div class="text-3">모닥불은 모든 캠퍼들의 활동을 응원합니다.</div>
							<div class="tools">
								<div class="hidden-xs">		
									<a class="button small" href="javascript: upload();">지금 업로드 해보기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			
		<!-- Posts -->
			<section class="main">
				<div class="posts">
					<c:forEach var="food" items="${list}" begin="0" step="1">
					<article>
						<div class="imgDiv"><a href="javascript: view(${food.bno}, ${pageMaker.cri.pageNum},${pageMaker.cri.amount});" class="image">
						<img class="reviewImg" src="https://img.youtube.com/vi/bzODJm-YivA/0.jpg" onerror="this.src='/resources/images/thumb/default_thumb.png'" alt="" /></a></div>
						
						<div class="info">
							<div class="info-detail">
							<c:set var="title_org" value="${food.title}"/>
							<c:set var="title_length" value="${fn:length(title_org)}"/>
							<c:set var = "post_title" value = "${fn:substring(title_org, 0, 23)}" />
								<div class="title">${post_title}…<span style="font-size: 8px;">[${food.replyCnt}]</span></div>
									<div style="text-align: right; float: right; font-size: 12px;">${food.updateDate}</div>
								<div class="bottom">
									<div class="username">
										<span class="go-profile-area" data-username="">
											<img class="icon-round" onerror="this.src='/resources/images/default_profile_face.png'" src="/resources/images/icon.png">
											${food.writer}
										</span>
									</div>
									
									<div class="social-info">
										<div class="hit-cnt">
											<img class="view-icon" src="/resources/images/view-gray.png" style="width:30%;"> 
											${food.readCnt}
										</div>
										<div class="like-cnt">
											<img class="love-icon" src="/resources/images/love-gray.png" style="width:30%;"> 
											${food.likeCnt}
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
				<form id="actionForm" action="/campfire/foodList">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="type" value="${pageMaker.cri.type}">
						<input type="hidden" name="categories" value="${pageMaker.cri.categories}">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
						<input type="hidden" name="from" value="${pageMaker.cri.from}">
					</form>
			</section>

				
			 
				
</div>



<jsp:include page="../includes/footer.jsp"/>
<script src="/resources/assets/js/modal.js"></script>

	</body>
	<script>
	$("a.fa-search").on("click", function(e){
		e.preventDefault();
		var searchForm = document.searchForm;
		
		searchForm.submit();
	});
	
	$(".changePage").on("click", function(e){
		e.preventDefault();
		var actionForm = $("#actionForm");
		var pageNum = $(this).attr("href");
		actionForm.find("input[name='pageNum']").val(pageNum);
		actionForm.submit();
	});

	function upload(){
		if ("${sessionId}" == ""){
			alert("로그인 후 이용해 주십시오.");
			goSignIn();
		}else{
			location.replace("/campfire/foodWrite${pageMaker.cri.getListLink()}");
		}
	}
	
	function view(bno, pageNum, amount){
		if ("${sessionId}" == ""){
			alert("로그인 후 이용해 주십시오.");
			goSignIn();
		}else{
			location.replace("/campfire/foodView?bno="+bno+"&pageNum="+pageNum+"&amount="+amount);
		}
	}
	</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>장작장터 | 모닥불🏕 </title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="/resources/assets/css/search.css" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="shortcut icon" type="image/x-icon" href="/resources/images/icon/title-icon.png">
		<!-- Bootstrap core CSS -->
		<link href="/resources/assets/market/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<style>
			body {
				line-height: 2.5;
			}
			
			input {
				font-family: initial;
			    font-weight: 300;
			    font-size: 1rem;
			    line-height: 2.5;
			}
			
			a {
				color: #404040;
			}
			
			.col-lg-9{
				margin: 0 auto;	
			}
		
			.categoryDiv {
				width: 18%;
				display: inline-block;
			}
			
			.writeBtn {
				padding-left: 71%;
				display: inline-block;
			}
			
			.imgDiv {
				margin: 0 auto;
				width: fit-content;
				height: 300px;
			}
			
			.imgA {
				overflow: hidden;
				position: relative;
				display: inline-block;
			}
			
			.imgA img{
				object-fit: cover;
				height: 100%;
			}
			
			.big-width{display:block;}
			.small-width{display:none;}
			
			#index_01 {
				margin: 0 auto;
			}
			
			.major {
				width: 100%;
				margin: 0 auto; 
			}
			
			.searchTag {
				float: left;
				width: 20%;
			}
			
			#keyword {
				width: 68%;
				float: left;
				height: 3.25rem;
			}
			
			.searchBtn {
				text-decoration: none; 
				border-radius: 0.25rem; 
				height: 3.25rem;
			}
			
			.card-title {
				width: 300px;
				overflow: hidden;
				text-overflow: ellipsis;
				white-space: nowrap;
			}
			
			@media screen and (max-width: 1680px){
				.writeBtn {
					padding-left: 73%;
				}
				
				#keyword {
					width: 69%;
				}
			}
			
			@media screen and (max-width: 1280px){
				.writeBtn {
					padding-left: 74%;
				}
				
				#keyword {
					width: 70%;
				}
			}
			
			@media screen and (max-width: 1199px){
				.writeBtn {
					padding-left: 72%;
				}
				
				#keyword {
					width: 68%;
				}
			}
			
			@media screen and (max-width: 991px){
				.big-width{display:none;}
				.small-width{display:block;}
				.writeBtn {
					padding-left: 69%;
				}
				
				#keyword {
					width: 64%;
				}				
			}
			
			@media screen and (max-width: 767px){
				.writeBtn {
					padding-left: 59%;
				}
				
				.categoryDiv {width: 23%;}
				
				.searchTag {
					width: 100%;
					clear: both;
				}
				
				#keyword {
					width: 100%;
					clear: both;
				}
				
				.searchBtn {
					width: 100%;					
				}
			}
			
			@media screen and (max-width: 575px){
				.writeBtn {
					padding: 0;
					width: 100%;
				}
				
				.moveWrite, .categoryDiv {width: 100%;}
				
				.row > * {
					padding: 0 1.25rem 0 1.25rem;
				}
			}
		</style>
	</head>

	<body class="is-preload">
		<%@include file="../includes/header.jsp" %>
  		<!-- Page Content -->
		<div class="container">
			<div class="row">
				<!-- <div class="col-lg-9">
					<div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						</ol>
						<div class="carousel-inner" role="listbox">
							<div class="carousel-item active">
								<img class="d-block img-fluid" src="/resources/images/market1.JPG" alt="First slide">
							</div>
						</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="/resources/images/market2.JPG" alt="Second slide">
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
					  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					  <span class="sr-only">Previous</span>
					</a>
					<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
					  <span class="carousel-control-next-icon" aria-hidden="true"></span>
					  <span class="sr-only">Next</span>
					</a>
				</div> -->
				<div id="index_01">
					<ul style="padding-left: 0;">
		       			<c:choose>
		       				<c:when test="${check == 'F'}">
				       			<img style="max-width: 100%;height: auto;" src="/resources/images/market1.JPG" alt="슬라이드1">
		       				</c:when>
		       				<c:otherwise>
				       			<img style="max-width: 100%;height: auto;" src="/resources/images/market2.JPG" alt="슬라이드1">
		       				</c:otherwise>
		       			</c:choose>
	       			</ul>
	        	</div>
				<div class="major">
					<div class='categoryDiv'>
			       		<select name="category" id="category">
			       			<option value="sale">팝니다</option>
			       			<option value="buy">삽니다</option>
			       			<option value="free">무료나눔</option>
			       		</select>
	       			</div>
					<h3 class="writeBtn"><a href="javascript:checkLogin()" class="button small moveWrite" style="border-radius: 0; text-decoration: none;">
						<i class="fas fa-pencil-alt"></i>&nbsp;글쓰기</a>
	            	</h3>
	        		<hr style="border-top: 2px solid black;">
					<form action="/market/marketList" id="searchForm">
						<div class="fields" class="field">
							<div>
								<div style="text-align:center; width: 100%;">
									<select class="searchTag" name="type" style="padding-top: 0.5%;">
										<option value="" ${pageMaker.cri.type == null ? 'selected' : ''}>검색 기준</option>
										<option value="T" ${pageMaker.cri.type == 'T' ? 'selected' : ''}>제목</option>
										<option value="C" ${pageMaker.cri.type == 'C' ? 'selected' : ''}>내용</option>
										<option value="TC" ${pageMaker.cri.type == 'TC' ? 'selected' : ''}>전체</option>
									</select>
									<input type="hidden" name="check" value="">
									<input id="keyword" type="text" name="keyword" value="${pageMaker.cri.keyword}">
									<a href="javascript:void(0)" class="button primary icon solid fa-search searchBtn">검색</a>
								</div>
							</div>
						</div>
					</form>
				</div>
			<%-- 검색창 상단에 넣은 코드 
				<div class="major" style="width: 100%;">
					<div class='categoryDiv' style="float: left;">
			       		<select name="category" id="category">
			       			<option value="sale">팝니다</option>
			       			<option value="buy">삽니다</option>
			       			<option value="free">무료나눔</option>
			       		</select>
	       			</div>
					<form action="/free/freeList" id="searchForm" style="float: left; padding-left: 12%;">
						<div>
							<div>
								<div style="text-align:center; width: 100%;">
									<select name="type" style="padding-top: 0.5%; width: 38%; float: left;">
										<option value="" ${pageMaker.cri.type == null ? 'selected' : ''}>검색 기준</option>
										<option value="T" ${pageMaker.cri.type == 'T' ? 'selected' : ''}>제목</option>
										<option value="C" ${pageMaker.cri.type == 'C' ? 'selected' : ''}>내용</option>
										<option value="W" ${pageMaker.cri.type == 'W' ? 'selected' : ''}>작성자</option>
										<option value="TC" ${pageMaker.cri.type == 'TC' ? 'selected' : ''}>제목 또는 내용</option>
										<option value="TW" ${pageMaker.cri.type == 'TW' ? 'selected' : ''}>제목 또는 작성자</option>
										<option value="TCW" ${pageMaker.cri.type == 'TCW' ? 'selected' : ''}>전체</option>
									</select>
									<input id="keyword" type="text" name="keyword" style="height: 3.25rem; float: left; width: 39%;" value="${pageMaker.cri.keyword}">
									<a href="javascript:void(0)" class="button primary icon solid fa-search" style="text-decoration: none; border-radius: 0.25rem; height: 3.25rem; float: left;">검색</a>
								</div>
							</div>
						</div>
					</form>
					<h3 class="writeBtn" style="padding-left: 10%; padding-top: 0.5%;"><a href="javascript:checkLogin()" class="button small moveWrite" style="border-radius: 0; text-decoration: none;">
						<i class="fas fa-pencil-alt"></i>&nbsp;글쓰기</a>
	            	</h3>
	        		<hr style="border-top: 2px solid black;">
				</div> --%>
				<div class="row contentDiv">
					<c:forEach var="board" items="${list}">
						<div class="col-lg-4 col-md-6 mb-4">
							<!-- <div class="card h-100"> -->
							<div class="card">
								<div class="imgDiv">
									<a class="imgA" href="javascript: view(${board.bno}, ${pageMaker.cri.pageNum},${pageMaker.cri.amount});">
										<%-- <c:if test="${board.thumbnail eq null}">
											<img class="icon-round" onerror="this.src='/resources/images/default_profile_face.png'" src="/resources/images/icon.png">
										</c:if> --%>
										<img class="card-img-top" src="/display?fileName=/market/${board.thumbnail}" onerror="this.src='/resources/images/thumb/default_thumb.jpg'" alt="">
									</a>
								</div>
								<%-- <a href="javascript: view(${board.bno}, ${pageMaker.cri.pageNum},${pageMaker.cri.amount});"><img class="card-img-top" src="/resources/images/marketEX.jpg" alt=""></a> --%>
								<div class="card-body">
									<h4 class="card-title">
										<a href="javascript: view(${board.bno}, ${pageMaker.cri.pageNum},${pageMaker.cri.amount});">${board.title}</a>
									</h4>
									<c:if test="${board.marketKeyword ne 'F'}">
										<h5>${board.price} 원</h5>
									</c:if>
							  	</div>
								<div class="card-footer">
									<small class="text-muted">${board.writer}</small><br>
									<small class="text-muted">${board.updateDate}</small>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<footer class="major">
			<div class="big-width" style="text-align:center;">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li><a class="changePage" href="${pageMaker.startPage - 1}">이전</a></li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<c:choose>
							<c:when test="${num eq pageMaker.cri.pageNum}">
								<li><a class="page active">${num}</a></li>
							</c:when>
							<c:otherwise>
								<li><a class="changePage" href="${num}">${num}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<li><a class="changePage" href="${pageMaker.endPage + 1}">다음</a></li>
					</c:if>
				</ul>
			</div>
			
			<div class="small-width" style="text-align:center;">
				<ul class="pagination">
					<c:if test="${pageMaker.cri.pageNum > 1}">
						<li><a class="changePage" href="${pageMaker.cri.pageNum - 1}">이전</a></li>
					</c:if>
					<li><a class="page active">${pageMaker.cri.pageNum}</a></li>
					<c:if test="${pageMaker.cri.pageNum < pageMaker.realEnd}">
						<li><a class="changePage" href="${pageMaker.cri.pageNum + 1}">다음</a></li>
					</c:if>
				</ul>
			</div>
			<form id="actionForm" action="/market/marketList">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<%-- <input type="hidden" name="type" value="${pageMaker.cri.type}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"> --%>
				<input type="hidden" name="check" value="${check}">
			</form>
		</footer>
		<!-- Bootstrap core JavaScript -->
		<script src="/resources/assets/market/vendor/jquery/jquery.min.js"></script>
		<script src="/resources/assets/market/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<jsp:include page="../includes/footer.jsp"/>
	</body>
	<script>
		$(document).ready(function(){
			var list = '${list}';
			if(list.length == 2){
				$(".contentDiv").css({"width": "100%"});
				$(".contentDiv").html("<div style='width: 100%; text-align: center; margin: 0 2% 2% 2%;'><p>검색 결과가 없습니다.</p></div>");
			}
			
			var temp = "${check}";
			if(temp == "S"){$('#category option:eq(0)').prop('selected', true);}
			if(temp == "B"){$('#category option:eq(1)').prop('selected', true);}
			if(temp == "F"){$('#category option:eq(2)').prop('selected', true);}
		});
		
		function checkLogin(){
			var temp = "${check}";
			if("${sessionId}" == ""){
				alert("로그인 후 이용해 주십시오.");
				goSignIn();
			}else{
				location.replace("/market/marketWrite${pageMaker.cri.getListLink()}&check="+temp);
			}
		}
		
		$("#category").on("change", function(){
			var check = "";
			//console.log($("#category option:selected").val());
			if($("#category option:selected").val() == 'sale'){
				check = "S";
			}else if($("#category option:selected").val() == 'buy'){
				check = "B";
			}else {
				check = "F";
			}
			console.log(check);
			$.ajax({
				url: "/market/marketList?check="+check,
				type: "get",
				success: function(data){
					location.replace("/market/marketList?check="+check);
				}
			});
		});
		
		function view(bno, pageNum, amount){
			if ("${sessionId}" == ""){
				alert("로그인 후 이용해 주십시오.");
				goSignIn();
			}else{
				location.replace("/market/marketView?bno="+bno+"&pageNum="+pageNum+"&amount="+amount);
			}
		}
		
		$(".changePage").on("click", function(e){
			e.preventDefault();
			var actionForm = $("#actionForm");
			var pageNum = $(this).attr("href");
			actionForm.find("input[name='pageNum']").val(pageNum);
			actionForm.submit();
		});
		
		$(".searchBtn").on("click", function(e){
			e.preventDefault();
			var searchForm = $("#searchForm");
			
			if(!searchForm.find("option:selected").val()){
				alert("검색 종류를 선택하세요.");
				return false;
			}
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요.");
				return false;
			}
			$("input[name='check']").val("${check}");
			searchForm.submit();
		});
	</script>
</html>

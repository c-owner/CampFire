<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
	<head>
		<title>팁게시판 | 모닥불🏕 </title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="shortcut icon" type="image/x-icon" href="/resources/images/icon/title-icon.png">
		<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
		<style>
			.table-wrapper{
				width: 80%;
				margin: 0 auto;
			}
			table thead{
				border-bottom: none;
				border-top: solid 1px;
			}
			table th{
				text-align: center !important;
				padding: 0.75rem 0.75rem 0.75rem 0.75rem;
			}
			table td{
				text-align: center !important;
				padding: unset;
			}
			a{
				text-decoration: none;
			}
			a:hover {
				text-decoration: underline;
			}
			.button{
				box-shadow: inset 0 0 0 0.5px #404040;
				color: black;
				border-radius: 0;
			}
			
			.big-width{display:block;}
			.small-width{display:none;}
			.table-wrapper {overflow-x:hidden !important;}
			/* select{width: 25%;display: inline;} */
			/* input[name='keyword']{width: 55%; display: inline;} */
			/* .search{width: 18%;} */
			.material-icons {vertical-align: middle;}
	        
	        #keywordDiv {
	        	padding:0;
	        }
	        #searchBtnDiv {
	        	padding:0;
	        }
	        
			@media (max-width: 918px){
				/* h1{
					font-size: 1.5rem;
				    margin-left: 10%;
				} */
				.table-wrapper {
				    width: 100%;
				}
				.bno {display:none;}
				.regDate {display:none;}
				.big-width{display:none;}
				.small-width{display:block;}
				select{width: 100%;}
				input[name='keyword']{width: 100%;}
				.search{width: 100%;}
			}
			@media (max-width: 736px){
		        #keywordDiv {
		        	padding:0 0 0 1.25rem;
		        }
		        #searchBtnDiv {
		        	padding:0 0 0 1.25rem;
		        }
			}
		</style>
	</head>
	<body class="is-preload">
	<%@include file="../includes/header.jsp" %>
		<!-- Main -->
		<div id="main">
			<div class="wrapper">
				<div class="inner">
				
					<!-- Elements -->
					<header class="major">
						<h1>팁게시판</h1>
					</header>
					<!-- Table -->
					<div class="table-wrapper">
						<table>
							<thead>
								<tr class="tHead">
									<th class="bno"></th>
									<th class="title">제목</th>
									<th class="writer">작성자</th>
									<th class="regDate">작성일</th>
									<th class="readCnt">조회</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${list != null and fn:length(list) > 0}">
										<c:forEach var="board" items="${list}">
											<tr class="tBody">
												<td class="bno">${board.bno}</td>
												<td class="title miniTitle"><a href="/campfire/tipView?bno=${board.bno}">${board.title}</a>
													<%-- <i style="font-size: 35px;" class="far fa-heart"></i> --%><span style="font-size: 0.5rem;">[${board.replyCnt}]</span>
													&nbsp;
													<c:if test="${board.regDate > nowday}"><i class="material-icons">fiber_new</i><%-- <i class="fas fa-heart"></i> --%></c:if>
												</td>
												<td class="writer">${board.writer}</td>
												<td class="regDate">${board.updateDate}</td>
												<td class="updateDate">${board.readCnt}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr class="tBody">
											<td colspan="5">
												<h4 style="margin-top: 1rem;">현재 등록된 캠핑 가이드가 없습니다.</h4>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<h3 style="text-align: right;"><a href="javascript: tipWrite();" class="button small" style="border-radius: 0; text-decoration: none;">
							<i class="fas fa-pencil-alt"></i>&nbsp;글쓰기</a>
						</h3>
						<!-- A -->
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
					   
						<form id="actionForm" action="/campfire/tipList" style="margin:0;">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
							<input type="hidden" name="type" value="${pageMaker.cri.type}">
							<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
						</form>
						<!-- B -->
						<form action="/campfire/tipList" id="searchForm">
							<div class="fields">
								<div class="field">
									<div class="row" style="text-align:center">
										<div class="col-3 col-12-small" id="typeDiv">
											<select name="type" style="padding-top: 0.5%;">
												<option value="" ${pageMaker.cri.type == null ? 'selected' : ''}>검색 기준</option>
												<option value="T" ${pageMaker.cri.type == 'T' ? 'selected' : ''}>제목</option>
												<option value="C" ${pageMaker.cri.type == 'C' ? 'selected' : ''}>내용</option>
												<option value="W" ${pageMaker.cri.type == 'W' ? 'selected' : ''}>작성자</option>
												<option value="TC" ${pageMaker.cri.type == 'TC' ? 'selected' : ''}>제목 또는 내용</option>
												<option value="TW" ${pageMaker.cri.type == 'TW' ? 'selected' : ''}>제목 또는 작성자</option>
												<option value="TCW" ${pageMaker.cri.type == 'TCW' ? 'selected' : ''}>전체</option>
											</select>
										</div>
										<div class="col-7 col-12-small" id="keywordDiv">
											<input id="keyword" type="text" name="keyword" style="/* margin-top: 1%; */ height: 3.25rem;" value="${pageMaker.cri.keyword}">
										</div>
										<div class="col-2 col-4-small col-6-xsmall" id="searchBtnDiv" style="margin:0 auto;">
											<a href="javascript:void(0)" class="button primary icon solid fa-search" style="text-decoration: none;/*  margin-top: 1%; */ border-radius: 0.25rem; width:100%; height: 3.25rem;">검색</a>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div> 
		<!-- Scripts -->
		<jsp:include page="../includes/footer.jsp"/>
		<script src="/resources/assets/js/modal.js"></script>
	</body>
	<script>
		$("a.fa-search").on("click", function(e){
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
			searchForm.submit();
		});
   
		$(".changePage").on("click", function(e){
			e.preventDefault();
			var actionForm = $("#actionForm");
			var pageNum = $(this).attr("href");
			actionForm.find("input[name='pageNum']").val(pageNum);
			actionForm.submit();
		});
   
		//alert("${result}");
		var result = "${result}";
		$(document).ready(function(){
			if(result == '' || isNaN(result)){
				return;
			}
			alert("게시글 " + result + "번이 등록되었습니다.")
		});

	function tipWrite(){
    	 if ("${sessionId}" == ""){
 			alert("로그인 후 이용해 주십시오.");
 			goSignIn();
 		}else{
 			location.replace("/campfire/tipWrite${pageMaker.cri.getListLink()}");
 		}
     }
	</script>
</html>
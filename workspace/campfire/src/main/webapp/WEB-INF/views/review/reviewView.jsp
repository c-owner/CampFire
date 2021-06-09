<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>리뷰게시판 | 모닥불🏕 </title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="shortcut icon" type="image/x-icon" href="/resources/images/icon/title-icon.png">
		<style>
		img { 
		    object-fit: contain;
		    width: 100% !important;
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
			</div>
			<a href="/review/reviewList${cri.getListLink()}" class="button small primary">목록 보기</a>
			<div class="row" style="display:block;">
				<div class="col-6 col-10-medium col-11-small" style="margin: 0 auto;"><h2 style="font-weight: bold;">${review.title}</h2></div>
				<div class="col-6 col-10-medium col-11-small" style="margin: 0 auto;">
					<div class="header">
						<%-- <h3 style="font-weight: bold; text-align: left; margin: 0 0;">
							${review.title}
						</h3> --%>
						<div class="row">
							<div class="col-6" style="text-align: left;">
								<h3>작성자 : ${review.writer}</h3>
							</div>
							<div class="col-6" style="text-align:right;">
								<div class="row">
									<span style="margin-left: auto;">작성일 : ${review.updateDate}</span>
								</div>
								<div class="row">
									<span style="margin-left: auto;">조회수 : ${review.readCnt}</span>
								</div>
								<span style="font-size:30px; display:block; color: gold;">${review.star}</span>
							</div>
						</div>
					</div>
					<div style="margin-bottom: 10px; border: darkgrey 1px solid; border-radius: 10px;">
						${review.content}
					</div>
				</div>
				<div class="col-6 col-10-medium col-11-small" style="margin: 0 auto 10px auto;">
					<div class="row">
						<div class="col-3" style="text-align:left; text-decoration: none;">
							<a href="#" id="heartIcon" style="font-size:18px;text-decoration: none;">
							<c:choose>
								<c:when test="${userLike == true}">
									<i style="font-size: 35px;" class="fas fa-heart"></i>
								</c:when>
								<c:otherwise>
									<i style="font-size: 35px;" class="far fa-heart"></i>
								</c:otherwise>
							</c:choose>
							<span id="likeCount">${review.likeCnt}</span>
							</a>
						</div>
						<div class="col-9" style="text-align: right;">
								<input type="button" class="button" value="수정" onclick="location.href='/review/reviewModify${cri.getListLink()}&bno=${review.bno}'"/>
								<input type="submit" class="button" value="삭제"/>
						</div>
					</div>
					
				</div>
				
				<!-- 댓글작성칸 -->
				<div class="col-6 col-10-medium col-11-small" style="margin: 0 auto 10px auto;">
					<div class="row">
						<div class="col-12">
						<c:if test="${sessionId == null}">
							<textarea name="content" id="reply" rows="4" name="reply" style="resize: none;" readonly>로그인 후 댓글을 작성하실 수 있습니다.</textarea>
						</c:if>
						<c:if test="${sessionId != null}">
							<textarea rows="4" name="reply" id="reply" placeholder="10자 이상, 1000자 이내 작성" style="resize: none;"></textarea>
							<span style="color:#aaa;" id="counter">10자 이상 (0 / 최대 1000자)</span>
						</c:if>
						<a href="javascript:void(0);" class="button primary fit" style="border-radius: 6px;">댓글 작성</a>
						</div>
					</div>
				</div>
				
				<!-- 댓글리스트 -->
				<div class="col-6 col-10-medium col-10-small" style="margin: 0 auto;">
					<div>
						<h3 style="font-weight: bold; text-align: left; margin: 5rem 0 0; border-bottom: 1px solid #aaa;">댓글</h3>
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
				<div>
					<ul class="pagination">
						<!-- <li><a class="changePage">이전</a></li> -->
						<li><a class="page active">1</a></li>
						<li><a class="changePage">2</a></li>
						<li><a class="changePage">3</a></li>
						<li><a class="changePage">4</a></li>
						<li><a class="changePage">5</a></li>
						<li><a class="changePage">6</a></li>
						<li><a class="changePage">7</a></li>
						<li><a class="changePage">다음</a></li>
					</ul>
				</div>
			</div>
		</section>
</div>
<jsp:include page="../includes/footer.jsp"/>
	</body>
	<script>
		var contextPath = "${pageContext.request.contextPath}";
		$(document).ready(function () {
			$("#heartIcon").on("click", function(e){
				e.preventDefault();
				var sessionId = "${sessionId}";
				var bno = "${review.bno}";
				if(sessionId == null){
					console.log("로그인 후 이용할 수 있습니다.");
					return false;
				}				
				var heart = $(this).find(".fa-heart");
				if(heart.hasClass("far")){ //하트아닐때
					$.ajax({
						type: "get",
						url: contextPath + "/review/plusLike/"+bno+"/"+sessionId,
						contentType:"application/text; charset=utf-8",
						success: function(result){
							getCount(bno);
							
							heart.toggleClass("far");
							heart.toggleClass("fas");
						},
						error: function(a, b, c){
							console.log(a);
							console.log(b);
							console.log(c);
						}
					});
				}else if(heart.hasClass("fas")){ //하트일때
					$.ajax({
						type: "get",
						url: contextPath + "/review/minusLike/"+bno+"/"+sessionId,
						contentType:"application/text; charset=utf-8",
						success: function(result){
							$("#likeCount").html(getCount(bno))
							heart.toggleClass("far");
							heart.toggleClass("fas");
						},
						error: function(a, b, c){
							console.log(a);
							console.log(b);
							console.log(c);
						}
					});
				}
			});
			function getCount(bno){
				$.ajax({
					type: "get",
					url: contextPath + "/review/getLikeCnt/"+bno,
					contentType:"application/text; charset=utf-8",
					success: function(result){
						$("#likeCount").text(result);
					},
					error: function(a, b, c){
						console.log(a);
						console.log(b);
						console.log(c);
					}
				});
			}
		});
		
		/**********************************************
					댓글	
		**********************************************/
		$('#reply').keyup(function (e){
			var reply_Content = $(this).val();
			$('#counter').html("("+reply_Content.length+" / 최대 1000자)");    //글자수 실시간 카운팅

			if (reply_Content.length > 1000){
				alert("최대 1000자까지 입력 가능합니다.");
				$(this).val(reply_Content.substring(0, 1000));
				$('#counter').html("1000 / 최대 1000자)");
			}
		});
	</script>
</html>
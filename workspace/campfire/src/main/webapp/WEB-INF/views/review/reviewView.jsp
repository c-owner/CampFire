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
		.col-6.col-10-medium.col-11-small img {
		    width: 100% !important;
		    object-fit: contain;
	    }
	    .replyBtn, .timeDiv {
	    	text-align: right !important;
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
			<a href="/review/reviewList${cri.getListLink()}" class="button small primary">돌아가기</a>
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
								<a class="button small" href='/review/reviewModify${cri.getListLink()}&bno=${review.bno}' style="box-shadow: 0 0 0 0.5px black"><i class="fas fa-pencil-alt"></i>&nbsp;수정</a>
								<a class="button small" id="boardRemove" href="javascript:removeForm.submit()" style="box-shadow: 0 0 0 0.5px black"><i class="fas fa-trash-alt"></i>&nbsp;삭제</a>
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
							<a href="javascript:void(0);" class="button primary fit register" style="border-radius: 6px;">댓글 작성</a>
						</c:if>
						</div>
					</div>
				</div>
				<form name="removeForm" action="/review/reviewRemove">
					<input type="hidden" name="pageNum" value="${cri.pageNum}">
					<input type="hidden" name="amount" value="${cri.amount}">
					<input type="hidden" name="type" value="${cri.type}">
					<input type="hidden" name="keyword" value="${cri.keyword}">
					<input type="hidden" name="bno" value="${review.bno}">
				</form>
				<!-- 댓글리스트 -->
				<div class="col-6 col-10-medium col-10-small" style="margin: 0 auto;">
					<div>
						<h3 style="font-weight: bold; text-align: left; margin: 5rem 0 0; border-bottom: 1px solid #aaa;">댓글</h3>
					</div>
					<ul class="alt replies">
						
					</ul>
				</div>
					<div class="paging" style="text-align: center; margin-bottom: 2%;">
						<ul class="pagination">
						
						</ul>
					</div>
			</div>
		</section>
</div>
<jsp:include page="../includes/footer.jsp"/>
	</body>
	<script src="/resources/assets/js/reviewboard/reviewReply.js"></script>
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
			
/**********************************************
			REPLY MODULE 
**********************************************/
			
			var replyer = "${sessionId}";
			var bno = "${review.bno}";
			var pageNum = 1;
			 showList();
			
			$(".register").on("click", function(e){
				e.preventDefault();
				
				var reply = $("textarea[name='reply']").val();
				/* var replyer = $("input[name='replyer']").val(); */
				
				if(reply.length > 1000 || reply.length == '') {
					alert('글자 수는 1자 이상 300자 이내로 작성하셔야 합니다.');
					return;
				}
				
				replyService.add({bno:bno, reply:reply, replyer:replyer}, function(result){
						pageNum = 1;
						showList(pageNum);
				});
			});
			
			function showReplyPage(replyCnt){
				var str = "";
				var endNum = Math.ceil(pageNum / 10.0) * 10
				var startNum = endNum - 9;
				var realEnd = Math.ceil(replyCnt / 10.0)
				var divTag = $(".paging ul");   			
				
				if(endNum > realEnd){
					endNum = realEnd;
				}
				
				var prev = startNum != 1;
				var next = endNum * 10 < replyCnt;
				
				if(matchMedia("screen and (max-width:918px)").matches){
					//918px보다 작을 때
					if(pageNum > 1){
						str += "<li><a class='changePage' href='" + (pageNum - 1) + "'>이전</a></li>";
					}
					str += "<li><a class='page active'>" + pageNum + "</a></li>";
					if(pageNum < realEnd){
						str += "<li><a class='changePage' href='" + (pageNum + 1) + "'>다음</a>";
					}
				}else{
					//918px 이상일 때
					if(prev){
						str += "<li><a class='changePage' href='" + (startNum - 1) + "'>이전</a></li>";
					}
					for(let i=startNum; i<=endNum; i++){
						if(i == pageNum){
							str += "<li><a class='page active'>" + i + "</a></li>";
							continue;
						}
						str += "<li><a class='changePage' href='" + i + "'>" + i + "</a></li>";
					}
					if(next){
						str += "<li><a class='changePage' href='" + (endNum + 1) + "'>다음</a><li>";
					}
				}
				divTag.html(str);
			}
			
			$(".pagination").on("click", "a.changePage", function(e) {
				e.preventDefault();
				pageNum = parseInt($(this).attr("href"));
				showList(pageNum);
			});
			
			function showList(page) {
				var replyUL = $(".replies");
				replyService.getList({bno:bno, page:page||1},
					function(replyCnt, list){
						var str = "";
						if(list == null || list.length == 0 ){
							if(pageNum > 1){
								pageNum -= 1;
								showList(pageNum);
							}
							replyUL.html("등록된 댓글이 없습니다.");
							return;
						}
						
						for(let i=0, len=list.length; i<len; i++) {
							str += "<li data-rno='" + list[i].rno + "'>";
							str += "<div style='position: absolute;'>";
							str += "<h4 style='margin: 0; text-align: left;'>작성자: " + list[i].replyer + "</h4></div>";
							if(list[i].replyDate != list[i].updateDate){
								str += "<div class='timeDiv'><strong><br>"+replyService.timeForToday(list[i].updateDate) + " 수정";
							}else {
								str += "<div class='timeDiv'><strong>" + replyService.timeForToday(list[i].replyDate);
							}
							/* str += "<div style='text-align: right;'><h5 style='margin: 0;'>"+ rDate +"</h5></div>"; */
							str += "<div style='text-align: left;'><span class='reply" + list[i].rno + "'>"+ list[i].reply +"</span></div>";
							
							if(sessionId == list[i].replyer){
								str += "<div class='replyBtn'><a class='modify' href='" + list[i].rno + "'>수정</a>";
								str += "<a class='finish' href='" + list[i].rno + "' style='display:none;'>수정완료</a>";
								str += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
								str += "<a class='remove' href='" + list[i].rno + "'>삭제</a>";
								str += "</div>";
							}
							str += "</li>";
						}
						replyUL.html(str);
						showReplyPage(replyCnt);
					});
			} 
			
			// 댓글 삭제
			$(".replies").on("click", "a.remove", function(e){
				e.preventDefault();
				var rnoValue = $(this).attr("href");
				replyService.remove(rnoValue, 
					function(result){
						alert(result);
						showList(pageNum);
					}
				);
			});
			
			var check = false;
			// 댓글 수정 
			$(".replies").on("click", "a.modify", function(e){
				e.preventDefault();
				
				if(check){alert("수정중인 댓글이 있습니다."); return;}
				
				var rnoValue = $(this).attr("href");
				var replyTag = $(".reply" + rnoValue);
				replyTag.html("<textarea style='resize: none;' class='" + rnoValue + "'>" + replyTag.text() + "</textarea>");
				$(this).hide();
				
				var finishs = $(".finish");
				for(let i=0; i<finishs.length; i++){
					if($(finishs[i]).attr("href") == rnoValue){
						$(finishs[i]).show();
						check = true;
						break;
					}
				}   			
			});
			
			//수정 완료
			$(".replies").on("click", "a.finish", function(e){
				e.preventDefault();
				
				var rnoValue = $(this).attr("href");
				var newReply = $("." + rnoValue).val();
				
				if(newReply == ""){return;}
				
				replyService.modify({rno:rnoValue, reply:newReply},
						function(result){
							alert(result);
							check = false;
							showList(pageNum);
				});
			});
			
		});
		
		/**********************************************
					댓글	유효성
		**********************************************/
		$('#reply').keyup(function (e){
			var reply_Content = $(this).val();
			$('#counter').html("("+reply_Content.length+" / 최대 300자)");    //글자수 실시간 카운팅

			if (reply_Content.length > 300){
				alert("최대 1000자까지 입력 가능합니다.");
				$(this).val(reply_Content.substring(0, 300));
				$('#counter').html("300 / 최대 300자)");
			}
		});
		
		
	</script>
</html>
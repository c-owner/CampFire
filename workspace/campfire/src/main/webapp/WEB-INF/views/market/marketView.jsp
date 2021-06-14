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
				padding-left: 68%;
				display: inline-block;
			}
			
			.itempDiv {
				float: left;
			}
			
			@media screen and (max-width: 1680px){
				.writeBtn {
					padding-left: 70%;
				}
			}
			
			@media screen and (max-width: 1280px){
				.writeBtn {
					padding-left: 71%;
				}
			}
			
			@media screen and (max-width: 1199px){
				.writeBtn {
					padding-left: 69%;
				}
			}
			
			@media screen and (max-width: 767px){
				.writeBtn {
					padding-left: 59%;
				}
				
				.categoryDiv {width: 23%;}
				.itemPicture {
					clear: both;
					width: 100% !important;
				}
				
				.itempDiv {
					clear: both;
					text-align: center;
					width: 100%;
				}
				
				.itemPrice {
					display: block !important;
				}
			}
			
			@media screen and (max-width: 575px){
				.writeBtn {
					padding: 0;
					width: 100%;
				}
				
				.moveWrite, .categoryDiv {width: 100%;}
			}
			
			.itemPicture {
				width: 65%;
		    	float: left;
		    	padding: 4%;
			}
			
			.itemTitle {
				font-size: 24px;
			    margin-bottom: 25px;
			    font-weight: 600;
			    line-height: 1.4;
			}
			
			.itemPrice {
				font-size: 40px;
			    font-weight: 500;
			    display: -webkit-box;
			    -webkit-box-pack: justify;
			    justify-content: space-between;
			    align-items: flex-end;
			    padding-bottom: 1%;
		    	border-bottom: 1px solid rgb(238, 238, 238);
			}
			
			.itemEle{
				padding-top: 2%;
				font-weight: 600;
		    	color: rgb(153, 153, 153) !important;
			}
			
			.col-6 {
				flex: 0 0 75%;
			    max-width: 75%;
			}
			
			.content img{
				width: 100% !important;
			}
			
			ul.alt li:first-child {
				padding-top: 0.75rem;
			}
			
			#boardModify, #boardRemove {
    			color: black !important;
    			border-radius: 0;
			}
			
			.btnDiv {
				margin: 0 auto;
				text-align: right;
				margin-top: 2%;
				margin-bottom: 2%;
			}
		</style>
	</head>

	<body class="is-preload">
		<%@include file="../includes/header.jsp" %>
		<div class="container">
			<div class="row">
				<div class="col-lg-9">
					<div class="item">
						<img class="itemPicture" src="/display?fileName=/market/${board.thumbnail}" onerror="this.src='/resources/images/thumb/default_thumb.jpg'" alt="">
						<small class="text-muted" style="float: right; font-weight: 600;">${board.regDate}</small><br>
						<div class="itempDiv">
							<div class="itemTitle">${board.title}</div>
							<c:if test="${board.marketKeyword ne 'F'}">
								<div class="itemPrice">${board.price}<span>원</span></div>
							</c:if>
							<div class="itemEle">작성자&nbsp;&nbsp;<p style="display: inline-block; color: black;">${board.writer}</div>
							<div class="itemEle">연락처&nbsp;&nbsp;<p style="display: inline-block; color: black;">010-1234-5678</div>
							<div class="itemEle">거래 지역&nbsp;&nbsp;<p style="display: inline-block; color: black;">서울</div>
						</div>
					</div>
				</div>
				<div class="col-6 col-10-medium col-11-small" style="margin: 0 auto 10px auto;">
					<div class="row">
						<h2 style="margin-left: -1%;">상세정보</h2>
						<div class="col-12 content" style="width: 100%; text-align: center;">
							<p style="border-top: 1px solid rgb(238, 238, 238); padding-top: 1%;">${board.content}
						</div>
					</div>
				</div>
				<div class="col-6 col-10-medium col-11-small btnDiv">
					<a class="button small" id="boardModify" href="/free/freeModify${cri.getListLink()}&bno=${board.bno}" style="box-shadow: 0 0 0 0.5px black"><i class="far fa-lightbulb"></i>&nbsp;신고</a>
					<c:if test="${sessionId eq board.writer}">
						<a class="button small" id="boardModify" href="/free/freeModify${cri.getListLink()}&bno=${board.bno}" style="box-shadow: 0 0 0 0.5px black"><i class="fas fa-pencil-alt"></i>&nbsp;수정</a>
						<a class="button small" id="boardRemove" href="javascript:removeForm.submit()" style="box-shadow: 0 0 0 0.5px black"><i class="fas fa-trash-alt"></i>&nbsp;삭제</a>
					</c:if>
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
				
				<!-- 댓글리스트 -->
				<div class="col-6 col-10-medium col-10-small" style="margin: 0 auto;">
					<div>
						<h3 style="font-weight: bold; text-align: left; margin: 5rem 0 0; border-bottom: 1px solid #aaa;">댓글</h3>
					</div>
					<ul class="alt replies">
							
					</ul>
					</div>
				</div>
				<div class="paging" style="text-align: center; margin-bottom: 2%;">
					<ul class="pagination">
					
					</ul>
				</div>
				<form name="removeForm" action="/market/marketRemove">
					<input type="hidden" name="pageNum" value="${cri.pageNum}">
					<input type="hidden" name="amount" value="${cri.amount}">
					<input type="hidden" name="type" value="${cri.type}">
					<input type="hidden" name="keyword" value="${cri.keyword}">
					<input type="hidden" name="bno" value="${board.bno}">
					<input type="hidden" name="check" value="${board.marketKeyword}">
				</form>
    		</div>
		</div>
		<script src="/resources/assets/market/vendor/jquery/jquery.min.js"></script>
		<script src="/resources/assets/market/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<jsp:include page="../includes/footer.jsp"/>
	</body>
	<script src="/resources/assets/js/marketboard/marketReply.js"></script>
	<script>
		$(document).ready(function () {
		var replyer = "${sessionId}";
		var bno = "${board.bno}";
		var pageNum = 1;
		 showList(pageNum);
		
		$(".register").on("click", function(e){
			e.preventDefault();
			
			var reply = $("textarea[name='reply']").val();
			/* var replyer = $("input[name='replyer']").val(); */
			
			if(reply.length > 1000 || reply.length == '' || reply.length < 10) {
				alert('글자 수는 10자 이상 300자 이내로 작성하셔야 합니다.');
				return;
			}
			
			replyService.add({bno:bno, reply:reply, replyer:replyer}, function(result){
				alert(result);
				pageNum = 1;
				showList(pageNum);
				/* $("input[name='reply']").val(""); */
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
						str += "<div>";
						str += "<h4 style='margin: 0; text-align: left; font-weight: bolder;'>작성자: " + list[i].replyer + "</h4></div>";
						if(list[i].replyDate != list[i].updateDate){
							str += "<div class='timeDiv' style='text-align: right;'><strong><br>"+replyService.timeForToday(list[i].updateDate) + " 수정";
						}else {
							str += "<div class='timeDiv' style='text-align: right;'><strong>" + replyService.timeForToday(list[i].replyDate);
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
		
		//댓글 유효성
		$('#reply').keyup(function (e){
		var reply_Content = $(this).val();
		$('#counter').html("("+reply_Content.length+" / 최대 1000자)");    //글자수 실시간 카운팅
		
		if (reply_Content.length > 1000){
			alert("최대 1000자까지 입력 가능합니다.");
			$(this).val(reply_Content.substring(0, 1000));
			$('#counter').html("1000 / 최대 1000자)");
			}
			});
		});
	</script>
</html>

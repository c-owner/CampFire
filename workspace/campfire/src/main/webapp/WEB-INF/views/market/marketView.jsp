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
	}
	
	@media screen and (max-width: 575px){
		.writeBtn {
			padding: 0;
			width: 100%;
		}
		
		.moveWrite, .categoryDiv {width: 100%;}
	}
	
	.itemPicture {
		width: 60%;
    	float: left;
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
</style>
</head>

<body class="is-preload">
<%@include file="../includes/header.jsp" %>
  <!-- Page Content -->
  <div class="container">

    <div class="row">
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">
        
		<div class="major">
			<div class='categoryDiv'>
	       		<select name="category" id="category">
	       			<option value="sale">팝니다</option>
	       			<option value="buy">삽니다</option>
	       			<option value="free">무료나눔</option>
	       		</select>
       		</div>
        	<h3 class="writeBtn"><a href="/market/marketWrite" class="button small moveWrite" style="border-radius: 0; text-decoration: none;">
            	<i class="fas fa-pencil-alt"></i>&nbsp;글쓰기</a>
            </h3>
        	<hr style="border-top: 2px solid black;">
		</div>

		<div class="item">
			<img class="itemPicture" src="/resources/images/marketEX3.jpg" alt="">
			<small class="text-muted" style="float: right; font-weight: 600;">21.06.11.</small><br>
			<div class="itemTitle">모닥불용 램프</div>
			<div class="itemPrice">30,000<span>원</span></div>
			<div class="itemEle">작성자&nbsp;&nbsp;<p style="display: inline-block; color: black;">테스터</div>
			<div class="itemEle">연락처&nbsp;&nbsp;<p style="display: inline-block; color: black;">010-1234-5678</div>
			<div class="itemEle">거래 지역&nbsp;&nbsp;<p style="display: inline-block; color: black;">서울</div>
		</div>

      </div>
      <!-- /.col-lg-9 -->
      <div class="col-6 col-10-medium col-11-small" style="margin: 0 auto 10px auto;">
					<div class="row">
						<h2 style="margin-left: -1%;">상세정보</h2>
						<div class="col-12">
							<p style="border-top: 1px solid rgb(238, 238, 238); padding-top: 1%;">장작장터 장작장터 좋아요!! 장작장터 좋아요!!	
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

    </div>
    <!-- /.row -->
	</div>

  <!-- Bootstrap core JavaScript -->
  <script src="/resources/assets/market/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/assets/market/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <jsp:include page="../includes/footer.jsp"/>
</body>
</html>

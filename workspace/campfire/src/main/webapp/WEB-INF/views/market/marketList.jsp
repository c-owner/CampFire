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
</style>
</head>

<body class="is-preload">
<%@include file="../includes/header.jsp" %>
  <!-- Page Content -->
  <div class="container">

    <div class="row">
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

    <!-- <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
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
        			<img style="max-width: 100%;height: auto;" src="/resources/images/market2.JPG" alt="슬라이드1">
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
		</div>

        <div class="row">

		<c:forEach var="board" items="${list}">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <%-- <a href="#"><img class="card-img-top" src="${thumbnail[0]}" alt=""></a> --%>
              <a href="javascript: view(${board.bno}, ${pageMaker.cri.pageNum},${pageMaker.cri.amount});"><img class="card-img-top" src="/resources/images/marketEX.jpg" alt=""></a>
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
          
          <!-- <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="/resources/images/marketEX.jpg" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Item One</a>
                </h4>
                <h5>99,000원</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
              </div>
              <div class="card-footer">
                <small class="text-muted" style="float: left;">모닥모닥불</small>
                <small class="text-muted" style="float: right;">21.06.07.</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="/resources/images/marketEX2.jpeg" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Item Two</a>
                </h4>
                <h5>99,000원</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit amet.</p>
              </div>
              <div class="card-footer">
                <small class="text-muted" style="float: left;">모닥모닥불</small>
                <small class="text-muted" style="float: right;">21.06.07.</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="/resources/images/marketEX3.jpg" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Item Three</a>
                </h4>
                <h5>99,000원</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
              </div>
              <div class="card-footer">
                <small class="text-muted" style="float: left;">모닥모닥불</small>
                <small class="text-muted" style="float: right;">21.06.07.</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="/resources/images/marketEX.jpg" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Item Four</a>
                </h4>
                <h5>99,000원</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
              </div>
              <div class="card-footer">
                <small class="text-muted" style="float: left;">모닥모닥불</small>
                <small class="text-muted" style="float: right;">21.06.07.</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="/resources/images/marketEX2.jpeg" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Item Five</a>
                </h4>
                <h5>99,000원</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit amet.</p>
              </div>
              <div class="card-footer">
                <small class="text-muted" style="float: left;">모닥모닥불</small>
                <small class="text-muted" style="float: right;">21.06.07.</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="/resources/images/marketEX3.jpg" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Item Six</a>
                </h4>
                <h5>99,000원</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
              </div>
              <div class="card-footer">
                <small class="text-muted" style="float: left;">모닥모닥불</small>
                <small class="text-muted" style="float: right;">21.06.07.</small>
              </div>
            </div>
          </div> -->

        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->
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
	</div>

  <!-- Bootstrap core JavaScript -->
  <script src="/resources/assets/market/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/assets/market/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <jsp:include page="../includes/footer.jsp"/>
</body>
<script>
	$(document).ready(function(){
		var temp = "${check}";
		if(temp == "S"){$('#category option:eq(0)').prop('selected', true);}
		if(temp == "B"){$('#category option:eq(1)').prop('selected', true);}
		if(temp == "F"){$('#category option:eq(2)').prop('selected', true);}
	});
	
	function checkLogin(){
		if("${sessionId}" == ""){
			alert("로그인 후 이용해 주십시오.");
			goSignIn();
		}else{
			location.replace("/market/marketWrite${pageMaker.cri.getListLink()}");
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
</script>
</html>

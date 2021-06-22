<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>자유게시판 | 모닥불🏕 </title>
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
			/* select{width: 25%;display: inline;}
			input[name='keyword']{width: 55%; display: inline;}
			.search{width: 18%;} */
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
	<%@include file="includes/header.jsp" %>
		<!-- Main -->
		<div id="main">
			<div class="wrapper">
				<div class="inner">
					<!-- Elements -->
					<header class="major">
						<h1>지도 테스트</h1>
					</header>
					<div class="row">
						<div class="col-10" id="map" style="height:500px;"></div>
					</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=04f349734d8d14fe1f7263bdcffd3043"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
				</div>
			</div>
		</div>
		<!-- Scripts -->
		<jsp:include page="includes/footer.jsp"/>
		<script src="/resources/assets/js/modal.js"></script>
	</body>
	<script>
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	</script>
</html>
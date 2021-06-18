<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>모닥불</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<link rel="stylesheet" href="/resources/assets/css/main.css" />
	<link rel="stylesheet" href="/resources/assets/css/review.css" />
	<link rel="stylesheet" href="/resources/assets/css/summernote-lite.css">
	<link rel="shortcut icon" type="image/x-icon" href="/resources/images/icon/title-icon.png">
</head>
<style>
	input[type='text'] {
		border-top : none;
		border-left : none;
		border-right : none;
		border-radius : 0%;
		padding : 0;
		margin-bottom: 2rem;
	}
	
	.reviewForm label {
		font-size: 1.5rem;
		color:#545454;
		margin: 0;
	}
/* 	button, .button {
		box-shadow: none;
	} */
/* Summer note ****************** */	
	button.note-btn {
	    box-shadow: none;
	}
	
	/* ************** 평점 ****************** */
	.star_rating {font-size:0; letter-spacing:-4px; margin-right:5%;}
	.star_rating a {
	    font-size:22px;
	    letter-spacing:0;
	    display:inline-block;
	    margin-left:5px;
	    color:#ccc;
	    text-decoration:none;
	}
	.star_rating a:first-child {margin-left:0;}
	.star_rating a.on {color:#ffee58;}
	a.star {color: #ffee58;}
</style>

<body class="is-preload">

	<%@include file="../includes/header.jsp" %>
	
	<div id="main">
		<div class="wrapper">
			<div class="inner">
				<header class="major">
					<span class="category">캠핑 리뷰 작성</span>
				</header>
				<form name="reviewForm" class="reviewForm" action="/review/reviewWrite" method="post">
					<div class="row gtr-uniform">
						<div class="col-10 col-11-xsmall" style="margin:0 auto;">							
							<span id="startext">당신의 점수는? </span>
							<p class="star_rating" style="display:inline; margin: 0 auto;">
							    <a href="#" class="on">★</a>
							    <a href="#" class="on">★</a>
							    <a href="#" class="on">★</a>
							    <a href="#" class="on">★</a>
							    <a href="#" class="on">★</a>
							  <input type="hidden" name="star" value=""/>
							</p>
							
							<label>캠핑장 이름</label>
							<input type="text" name="campName">
							<label>캠핑장 주소</label>
								<input type="text" name="zipcode" class="postcodify_postcode5" value="" placeholder="우편번호" style="width:30%; display:inline;" readonly />
								<a class="btn btn-secondary hero-upload" id="postcodify_search_button">검색</a>
								
								<input type="text" name="address" class="postcodify_address" value="" placeholder="주소" readonly/><br />
								<input type="text" name="addressDetail" class="postcodify_details" value="" placeholder="상세주소2"/><br />
								<input type="text" name="addressEtc" class="postcodify_extra_info" value="" placeholder="상세주소1" readonly/><br />
								
								<select class="categories" name="categories" id="category">
										<option value="all">전체분야</option>
										<option value="A7">유료 캠핑장</option>
										<option value="B7">무료 캠핑장</option>
										<option value="C7">노지 캠핑장</option>
										<option value="D7">난이도 캠핑장</option>
										<option value="E7">글램핑 캠핑장</option>
										<option value="F7">카라반 캠핑장</option>
								</select>
							<br>
							
							<label>제목 <span style="color:#aaa;" id="titleCounter">(0 / 최대 40자)</span></label>
							<input type="text" name="title" class="title" placeholder="제목을 입력해주세요. ">
							<label>내용</label>
							<textarea class="summernote" name="content"></textarea>
							<div class="tools">
								<div class="hidden-xs">
									<!-- <a class="btn btn-secondary hero-upload" href="javascript:validation();">등록하기</a> -->
									<a class="button small" href="javascript:validation();"><i class="fas fa-pencil-alt" style="line-height: inherit;">등록하기</i></a>
								</div>
							</div>
						</div>
					</div>
					<input type="hidden" name="writer" value="campfire"/>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="../includes/footer.jsp" />
</body>
<script src="/resources/assets/js/summernote-lite.js"></script>
<script src="/resources/assets/js/summernote-ko-KR.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script>
$('.summernote').summernote({
	  // 에디터 높이
	  height: 300,
	  // 에디터 한글 설정
	  lang: "ko-KR",
	  // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
	  focus : true,
	  toolbar: [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 확대해서보기, 도움말
		    ['view', ['fullscreen', 'help']]
		  ],
		  // 추가한 글꼴
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		 // 추가한 폰트사이즈
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
	  
	  	callbacks : { 
			onImageUpload : function(files, editor, welEditable) {
			// 파일 업로드(다중업로드를 위해 반복문 사용)
				for (var i = files.length - 1; i >= 0; i--) {
					uploadSummernoteImageFile(files[i], this);
				}
			}
	  
		}
	});

var j = 0;
var check = false;
function uploadSummernoteImageFile(file, el) {
	var reviewForm = $("form[name=reviewForm]");
	data = new FormData();
	data.append("uploadFile", file);
	console.log("el ~~~~~~~~~~" + el);
	$.ajax({
		data : data,
		type : "POST",
		url : "/upload/review",
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			//var url = encodeURIComponent(data.r_succeedList[0].uploadPath + "\\" + data.r_succeedList[0].uuid + "_" + data.r_succeedList[0].fileName);
			var url = encodeURIComponent(data.r_succeedList[0].uploadPath + "/" + data.r_succeedList[0].uuid + "_" + data.r_succeedList[0].fileName);
			//$(el).summernote('editor.insertImage', "/display?fileName=" + url);
			console.log("url : :: : : " + url);
			$(el).summernote('editor.insertImage', "/display?fileName=/review/" + url);
			var str = "";
			
			if(!check){
				str += "<input type='hidden' name='thumb' value='"+url+"'>";
				check = true;				
			}
			
			str += "<input type='hidden' class='"+j+"' name='attachList["+j+"].uploadPath' value='" + data.m_succeedList[0].uploadPath + "'>";               
            str += "<input type='hidden' class='allList "+j+"' name='attachList["+j+"].uuid' value='" + data.m_succeedList[0].uuid + "'>";               
            str += "<input type='hidden' class='"+j+"' name='attachList["+j+"].fileName' value='" + data.m_succeedList[0].fileName + "'>";               
            str += "<input type='hidden' class='"+j+"' name='attachList["+j+"].fileType' value='true'>";
			reviewForm.append(str);
			j++;
		}
	});
};

//평점
var score = 1;
reviewForm.star.value = "5"; // default 5
$( ".star_rating a" ).click(function() {
    $(this).parent().children("a").removeClass("on");
    $(this).addClass("on").prevAll("a").addClass("on");
	score = $('.on').length;
    reviewForm.star.value = score;
    return false;
});
	/*  주소 검색용 */
$(function() { $("#postcodify_search_button").postcodifyPopUp(); });
</script>
<!-- 유효성 -->
<script>
	$('.title').keyup(function (e){
		var title = $(this).val();
		$('#titleCounter').html("("+title.length+" / 최대 40자)");    //글자수 실시간 카운팅
	
		if (title.length > 40){
			alert("최대 40자까지 입력 가능합니다.");
			$(this).val(title.substring(0, 40));
			$('#titleCounter').html("(40 / 최대 40자)");
		}
});

	function validation() {
		if(reviewForm.campName.value == '' || reviewForm.campName.value == null) {
			alert('캠핑장 이름을 입력해주세요.');
			return false;
		}
		
		if(reviewForm.zipcode.value == '' || reviewForm.zipcode.value == null ){
			alert('캠핑장 주소를 입력해주세요.');
			return false;
		}
		
		if(reviewForm.title.value.length < 5 || reviewForm.title.value.length == '') {
			alert('제목은 5자 이상 필수 입력입니다.');
			return false;
		}
		
		if(reviewForm.categories.value == 'all'){
			alert('분야를 선택해주세요!');
			return false;
		}

        var attachList = $(".allList");
        var target = $(".summernote").val();
        
        for(let i=0; i<attachList.length; i++){
           if(target.indexOf($(attachList[i]).val()) == -1){
              $("."+i).remove();            
           }
        }
		
		j = 0;
		check = false;
		reviewForm.submit();	
	}
	
	</script>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title> 공지사항 | 모닥불🏕 </title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<link rel="stylesheet" href="/resources/assets/css/main.css" />
	<link rel="stylesheet" href="/resources/assets/css/summernote-lite.css">
	<link rel="shortcut icon" type="image/x-icon" href="/resources/images/icon/title-icon.png">
</head>
<style>
	.major {
		border-bottom: 1px solid #323232;
	    width: 80%;
	    text-align: left !important;
	    margin: 0 auto !important;
	}
	.title_text{
		margin-top: 2%;
	}
	input[type='text'] {
		border-top : none;
		border-left : none;
		border-right : none;
		border-radius : 0%;
		padding : 0;
		margin-bottom: 2rem;
	}
	
	.policyForm label {
		font-size: 1.5rem;
		color:#545454;
		margin: 0;
	}
</style>

<body class="is-preload">

	<%@include file="../includes/header.jsp" %>
	
	<div id="main">
		<div class="wrapper">
			<div class="inner">
				<header class="major">
                        <h2>공지사항 글쓰기</h2>
                </header>
				<form class="policyForm" action="/policy/policyWrite" method="post" name="policyForm">
					<div class="row gtr-uniform">
						<br>
						<div class="col-10 col-11-xsmall" style="margin: 0 auto; width: 80%;">					
							<input type="text" class="title_text" name="title" value="" placeholder="제목을 입력해주세요." maxlength="30">
							<textarea class="summernote" name="content"></textarea>
							<input type="hidden" name="writer" value="${sessionId}">
							<input type="hidden" name="tab" value="notices"/>
 						</div>
					</div>
						<h3 style="text-align: center; margin-top: 2%;"><a href="javascript: validation();" class="button big" style="text-decoration: none;">등록</a></h3>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="../includes/footer.jsp" />
</body>
<script src="/resources/assets/js/summernote-lite.js"></script>
<script src="/resources/assets/js/summernote-ko-KR.js"></script>
<script>
	$('.summernote').summernote({
		// 에디터 높이
		height: 300,
		// 에디터 한글 설정
		lang: "ko-KR",
		// 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
		focus : true,
		toolbar: [
			// 동영상첨부
			['insert',['video']],
			// 글꼴 설정
			['fontname', ['fontname']],
			// 글자 크기 설정
			['fontsize', ['fontsize']],
			// 기울임꼴, 밑줄,취소 선, 서식지우기
			['style', ['italic', 'underline','strikethrough', 'clear']],
			// 글자색
			['color', ['forecolor','color']],	
			// 글머리 기호, 번호매기기, 문단정렬
			['para', ['ul', 'ol', 'paragraph']],
			// 줄간격
			['height', ['height']]
		],
		// 추가한 글꼴
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		// 추가한 폰트사이즈
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		placeholder: '동영상 URL은 위 버튼으로 첨부해주세요.',
		disableResizeEditor: true,
		callbacks : { 
			onImageUpload : function(files, editor, welEditable) {
			// 파일 업로드(다중업로드를 위해 반복문 사용)
				//length 정상
				for (let i = files.length - 1; i >= 0; i--) {
					uploadSummernoteImageFile(files[i], this);
				}
			}
		}
	});
    
	
	function validation(){
		var policyForm = $("form[name='policyForm']");
		var title = $("input[name='title']").val();
		var content = $("textarea[name='content']").val();
		
		if(title == ""){
			alert("제목을 입력해주세요.");
			$("input[name='title']").focus();
			return;
		}
		
		if(content == ""){
			alert("내용을 입력해주세요.");
			$("textarea[name='content']").focus();
			return;
		}
		
		policyForm.submit();
	}
</script>
</html>
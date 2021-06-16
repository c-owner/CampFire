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
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="stylesheet" href="/resources/assets/css/summernote-lite.css">
		<link rel="shortcut icon" type="image/x-icon" href="/resources/images/icon/title-icon.png">
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
			
			.reviewForm label {
				font-size: 1.5rem;
				color:#545454;
				margin: 0;
			}
			
			.keyword{
				width: fit-content;
		    	margin-left: 10%;
		    	border-color: black;
			}
		</style>
	</head>

	<body class="is-preload">

		<%@include file="../includes/header.jsp" %>
	
		<div id="main">
			<div class="wrapper">
				<div class="inner">
					<header class="major">
						<h2 style="padding-top: 1em;">장작장터 글쓰기</h2>
	                </header>
					<form class="reviewForm" action="/market/marketWrite" method="post" name="marketForm">
	                   <div style="text-align:center; margin-top: 1%;">
	                      <select class="keyword" name="marketKeyword" id="category">
	                         <option value="S" >팝니다</option>
	                         <option value="B" >삽니다</option>
	                         <option value="F" >무료나눔</option>                         
	                      </select>         
	                   </div>
						<div class="row gtr-uniform">
							<br>
							<div class="col-10 col-11-xsmall" style="margin: 0 auto; width: 80%;">
								<input type="text" name="area" placeholder="지역을 입력해주세요." style="margin-top: 2%;" maxlength="12">					
								<input type="text" name="price" placeholder="가격을 입력해주세요." style="margin-top: 2%;">					
								<input type="text" class="title_text" name="title" value="" placeholder="제목을 입력해주세요." maxlength="30">
								<textarea class="summernote" name="content"></textarea>
								<input type="hidden" name="writer" value="${sessionId}">
								<input type="hidden" name="thumbnail" value="">
							</div>
						</div>
						<h3 style="text-align: center; margin-top: 2%;"><a href="javascript: lastCheck();" class="button big" style="text-decoration: none; border-radius: 6px;">등록</a></h3>
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
				// 코드보기, 확대해서보기, 도움말
				['view', ['codeview','fullscreen', 'help']]
			],
			// 추가한 글꼴
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			// 추가한 폰트사이즈
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			placeholder: '내용을 입력해주세요.',
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
	    
		var j = 0;
		function uploadSummernoteImageFile(file, el) {
			console.log("TEST");
			data = new FormData();
			var marketForm = $("form[name=marketForm]");
			data.append("uploadFile", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "/upload/market",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					console.log(data);
					//계속 0번방을 찾는 이유는 첨부파일 4개를 하나의 배열로 보내는 것이 아니라
					//1개씩 보내고 1개씩 응답받기 때문에 응답받는 리스트에는 계속 0번방만 존재하기 때문이다.
					//var url = encodeURIComponent(data.m_succeedList[0].uploadPath + "\\" + data.m_succeedList[0].uuid + "_" + data.m_succeedList[0].fileName);
					var url = encodeURIComponent(data.m_succeedList[0].uploadPath + "/" + data.m_succeedList[0].uuid + "_" + data.m_succeedList[0].fileName);
					//$(el).summernote('editor.insertImage', "/display?fileName=" + url);
					$(el).summernote('editor.insertImage', "/display?fileName=/market/" + url);
					var str = "";
					str += "<input type='hidden' class='"+j+"' name='attachList["+j+"].uploadPath' value='" + data.m_succeedList[0].uploadPath + "'>";					
					str += "<input type='hidden' class='allList "+j+"' name='attachList["+j+"].uuid' value='" + data.m_succeedList[0].uuid + "'>";					
					str += "<input type='hidden' class='"+j+"' name='attachList["+j+"].fileName' value='" + data.m_succeedList[0].fileName + "'>";					
					str += "<input type='hidden' class='"+j+"' name='attachList["+j+"].fileType' value='true'>";
					if(j == 0){
						$("input[name='thumbnail']").val(url);
					}
					marketForm.append(str);
					j++;
				}
			});
		};
		
		function lastCheck(){
			var marketForm = $("form[name=marketForm]");
			var attachList = $(".allList");
			var target = $(".summernote").val();
			
			for(let i=0; i<attachList.length; i++){
				if(target.indexOf($(attachList[i]).val()) == -1){
					$("."+i).remove();				
				}
			}
			
			j = 0;
			
			marketForm.submit();
		}
		
		function checkValue(){
			var price = $("input[name='price']").val();
			var title = $("input[name='title']").val();
			var content = $("textarea[name='content']").val();
			var area = $("input[name='area']").val();
			
			if(area == ""){
				alert("지역을 입력해주세요.");
				$("input[name='area']").focus();
				return;			
			}
			
			if(isNaN(price)){
				alert("숫자만 입력해주세요.");
				$("input[name='price']").focus();
				return;			
			}
			
			if(price == ""){
				alert("가격을 입력해주세요.");
				$("input[name='price']").focus();
				return;
			}
			
			if(title == ""){
				alert("제목을 입력해주세요.");
				$("input[name='title']").focus();
				return;
			}
			
			if(content == ""){
				alert("내용을 입력해주세요.");
				return;
			}
			
			marketForm.submit();
		}
		
		//셀렉트 태그가 무료나눔일 경우 가격입력창 제거하는 함수
		$(document).ready(function(){
			var temp = "${check}";
			if(temp == "S"){
				$('#category option:eq(0)').prop('selected', true);
				$("input[name='price']").show();
			}else if(temp == "B"){
				$('#category option:eq(1)').prop('selected', true);
				$("input[name='price']").show();
			}else if(temp == "F"){
				$('#category option:eq(2)').prop('selected', true);
				$("input[name='price']").hide();
				$("input[name='price']").val(0);
			}
			
			$("#category").on("change", function(){
				if($("#category").val() == "S"){
					$('#category option:eq(0)').prop('selected', true);
					$("input[name='price']").show();
					$("input[name='price']").val("");
				}else if($("#category").val() == "B"){
					$('#category option:eq(1)').prop('selected', true);
					$("input[name='price']").show();
					$("input[name='price']").val("");
				}else if($("#category").val() == "F"){
					$('#category option:eq(2)').prop('selected', true);
					$("input[name='price']").hide();
					$("input[name='price']").val(0);
				}
			});
		});
	</script>
</html>
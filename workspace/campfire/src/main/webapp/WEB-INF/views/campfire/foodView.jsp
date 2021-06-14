<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
		<title>캠핑음식 | 모닥불🏕 </title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="stylesheet" href="/resources/assets/css/search.css" />
		<link rel="shortcut icon" type="image/x-icon" href="/resources/images/icon/title-icon.png">
</head>
<body class="is-preload">
	<%@include file="../includes/header.jsp" %>
	<div id="main">
		<!-- 썸네일 -->
		<div>
			<img src="https://img.youtube.com/vi/bzODJm-YivA/0.jpg">
		</div>
		
		<!-- 동영상 -->
		<div>
			<iframe width="50%" height="50%" src="https://www.youtube.com/embed/bzODJm-YivA" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen muted="muted"></iframe>
		</div>
	</div>
	
	<jsp:include page="../includes/footer.jsp"/>
<script src="/resources/assets/js/modal.js"></script>
</body>
</html>
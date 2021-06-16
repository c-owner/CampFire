<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>공지사항 | 모닥불🏕  </title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="shortcut icon" type="image/x-icon" href="/resources/images/icon/title-icon.png">
		<style>
			.content img {
				width: 100% !important;
			}
			
			.replyBtn, .timeDiv {
				text-align: right !important;
			}
			
			.replies a {
				text-decoration: none;
			}
			
			.paging a {
				text-decoration: none;
			}
			
			.paging code {
				background: white;
			}
			
			#boardReport, #boardModify, #boardRemove {
    			color: black !important;
    			border-radius: 0;
			}
			
			.far {
				color: red;
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
						<span class="category">공지사항</span>
					</header>
				</div>
				<div class="row" style="display:block;">
					<div class="col-6 col-10-medium col-11-small" style="margin: 0 auto;"><h2 style="font-weight: bold;">${policy.title}</h2></div>
					<div class="col-6 col-10-medium col-11-small" style="margin: 0 auto; text-align: right;">
						<c:if test="${sessionId eq board.writer}">
							<a class="button small" id="boardModify" href="/policy/policyModify${cri.getListLink()}&bno=${policy.bno}" style="box-shadow: 0 0 0 0.5px black"><i class="fas fa-pencil-alt"></i>&nbsp;수정</a>
							<a class="button small" id="boardRemove" href="javascript:removeForm.submit()" style="box-shadow: 0 0 0 0.5px black"><i class="fas fa-trash-alt"></i>&nbsp;삭제</a>
						</c:if>
					</div>
					<div class="col-6 col-10-medium col-11-small" style="margin: 0 auto;">
						<div class="header">
							<h3 style="font-weight: bold; text-align: left; margin: 0 0;">
								No.${policy.bno}
							</h3>
							<div style="text-align: right;">
								<span > ${policy.writer}</span>
							</div>
						</div>
						<div style="width: 100%; border: 1px solid #4d4d4d; border-radius: 10px; padding: 20% 0;" class="content">
							${policy.content}
						</div>
					</div>
					<form name="removeForm" action="/policy/policyRemove">
						<input type="hidden" name="pageNum" value="${cri.pageNum}">
						<input type="hidden" name="amount" value="${cri.amount}">
						<input type="hidden" name="type" value="${cri.type}">
						<input type="hidden" name="keyword" value="${cri.keyword}">
						<input type="hidden" name="bno" value="${policy.bno}">
					</form>
					</div>
			</section>
		</div>
		<jsp:include page="../includes/footer.jsp"/>
	</body>
</html>
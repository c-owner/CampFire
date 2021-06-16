<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>서비스 약관 | 모닥불</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="shortcut icon" type="image/x-icon" href="/resources/images/icon/title-icon.png">
		<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
	.box_account {
	    overflow: hidden;
	    position: relative;
	    padding: 30px 40px;
	    background: #f4f4f4;
	}
	ul li{
		padding-left: 0;
	}
	.tab_policy {
	    height: 50px;
	    padding-top: 40px;
	}
	.tab_policy{
		list-style: none;
	}
	.tab_policy li{
	    float: left;
		display: table;
	    width: 165px;
	    height: 48px;
	    margin-right: -1px;
	    border: 1px solid #d4d4d4;
	    text-align: center;
	    line-height: 48px;
	}
	.tab_policy .link_policy {
		display: table-cell;
	    color: #666;
	    font-size: 14px;
	    vertical-align: middle;
	}
	a.link_policy { text-decoration: none; }
	#mArticle{
	    overflow: hidden;
	    position: relative;
	    max-width: 1160px;
	    margin: 0 auto;
	    padding-bottom: 180px;
    }
    /* 탭 활성화 상태 */
    .tab_policy .on {
	    z-index: 1;
	    border-color: #1e1e1e;
    }
    .tab_policy .on .link_policy {
	    position: relative;
	    color: #fff;
	    background-color: #1e1e1e;
	    border: 1px solid #1e1e1e;
	    z-index: 99;
	}
    
    /* 내용 */
    .material-icons {vertical-align: middle;}
    .wrap_cont {
   	    overflow: visible;
	    position: relative;
	    width: 1160px;
	    margin: 0 auto;
	    padding-top: 20px;
	    clear: both;
    }
    .area_tit {
	    float: left;
	}
	.area_tit .tit_corp {
	    display: block;
	    padding: 76px 0 0 0;
	    font-size: 18px;
	    line-height: 30px;
	    color: #1e1e1e;
	    vertical-align: top;
	}
	.area_cont {
	    float: right;
	    width: 80%;
	}
	.tbl_comm {
	    overflow: hidden;
	    width: 860px;
	    margin-top: 80px;
	    border-top: 2px solid #4d4d4d;
	    word-break: normal;
	}
	.tbl {
	    width: 100%;
	    border-collapse: collapse;
	    border-spacing: 0;
	    table-layout: fixed;
	}
	.tbl thead th {
	    padding: 15px 20px;
	    color: #1e1e1e;
	    font-weight: bold;
	    text-align: center;
	}
	.tbl_type2 th {
	    border-left: 0 none;
	    text-align: center;
	}
	.tbl .ta_left {
	    text-align: left;
	}
	.tbl_public .txt_public {
	    position: relative;
	    display: inline-block;
	    max-width: 100%;
	    padding-right: 17px;
	}
	.tbl .link_txt {
	    color: #1e1e1e;
	    line-height: 24px;
	    font-family: 'NotoSans Regular','Malgun Gothic','맑은 고딕','Apple SD Gothic Neo','돋움',dotum, sans-serif;
	}
	.loss_word {
	    display: block;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    word-break: break-all;
	    text-decoration: none;
	}
	.inner_cell {
		text-align: left;	
	}

	/* 페이징 처리 */
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
			
			.sch_comm {
			    width: 50%;
			    margin: 0 auto;
			    padding-top: 11px;
			}
			.sch_comm .sch_form {
				position: relative;
			}
			.screen_out {
				overflow: hidden;
				position: absolute;
				width: 0;
				height: 0;
				line-height: 0;
				text-indent: -9999px;
			}
			.sch_comm .lab_sch {
				position: absolute;
				top: 10px;
				left: 0;
				color: #919191;
			}
			.sch_comm .inp_keyword {
				float: left;
				width: 30rem;
				border: 0 none;
				box-sizing: border-box;
				color: #1e1e1e;
				border-bottom: 1px solid #4d4d4d;
				border-radius: 0;
			}
			.sch_comm .btn_search {
				float: right;
				width: 34px;
			}	
			.sch_comm .btn_search .ico_corp {
				width: 17px;
				height: 17px;
				margin: 12px 0 13px 17px;
				background-position: 0 -10px;
			}		
			
			fieldset, img {
				border: 0 none;
			}
			form{
				margin: 0;
			}
</style>
	</head>
	
	<body class="is-preload">

	<%@include file="../includes/header.jsp" %>

	<div id="main">
		<div class="wrapper">
			<div class="inner">
				<div id="mArticle">
					<div class="box_account">
				        <p class="desc_account" style="margin: 0;"> <span class="ico_corp">&gt;</span> 메뉴에서 여러분에게 적용되는 약관 및 정책을 확인하실 수 있습니다. </p>
				    </div>
					    <ul class="tab_policy" role="tablist">
						    <!-- 활성화 시 on 클래스 추가 -->
						    <!-- WAI-ARIA 속성 구현 예정 -->
						    <li class=" "><a href="/policy/policy?tab=terms" class="link_policy" role="tab">이용약관</a></li>
						    <li class=""><a href="/policy/policy?tab=location" class="link_policy" role="tab">위치기반서비스 이용약관</a></li>
						    <li class=""><a href="/policy/policy?tab=privacy" class="link_policy" role="tab">개인정보처리방침</a></li>
						    <li class=""><a href="/policy/policy?tab=oppolicy" class="link_policy" role="tab">운영정책</a></li>
					        <li class=""><a href="/policy/policy?tab=safeguard" class="link_policy" role="tab">권리침해신고안내</a></li>
						    <li class=" on"><a href="/policy/policy?tab=notices" class="link_policy" role="tab">공지사항</a></li>
						</ul>
				<div class="wrap_cont wrap_notices">
	                <div class="area_tit">
	                    <h4 class="tit_corp">모닥불 서비스 <br>공지사항</h4>
	                </div>
	                <div class="table-wrapper">
	                    <div class="tbl_comm fst tbl_public">
	                        <table class="tbl tbl_type2">
	                        	<colgroup>
	                                <col style="width:81%">
	                                <col style="width:19%">
	                            </colgroup>
	                            <thead>
	                            <tr>
	                                <th scope="col">내용</th>
	                                <th scope="col">등록일</th>
	                            </tr>
	                            </thead>
	                            <!-- posts -->
	                            <tbody>
	                            <c:forEach var="policy" items="${list}" begin="0" step="1">
	                                <tr>
	                                    <td class="ta_left">
	                                        <div class="inner_cell">
	                                        <span class="txt_public">
	                                            <a href="/policy/policy" class="loss_word link_txt">
	                                                    ${policy.title}
	                                            </a>
	                                                <c:if test="${policy.regDate > nowday}"><i class="material-icons">fiber_new</i><%-- <i class="fas fa-heart"></i> --%></c:if>
	                                        </span>
	                                        </div>
	                                    </td>
	                                    <td>
	                                    	<div class="inner_cell">${policy.updateDate}</div>
	                                   	</td>
	                                </tr>
                                </c:forEach>
	                            </tbody>
	                        </table>
	                    </div>
						<footer class="major">
							<div class="big-width" style="text-align:center;">
								<ul class="pagination">
									<c:if test="${pageMaker.prev}">
										<li><a class="changePage" href="${pageMaker.startPage - 1}">이전</a></li>
									</c:if>
									<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
										<c:choose>
											<c:when test="${num eq pageMaker.cri.pageNum}">
												<li><a class="page active">${num}</a></li>
											</c:when>
											<c:otherwise>
												<li><a class="changePage" href="${num}">${num}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${pageMaker.next}">
										<li><a class="changePage" href="${pageMaker.endPage + 1}">다음</a></li>
									</c:if>
								</ul>
							</div>
							
							<div class="small-width" style="text-align:center;">
								<ul class="pagination">
									<c:if test="${pageMaker.cri.pageNum > 1}">
										<li><a class="changePage" href="${pageMaker.cri.pageNum - 1}">이전</a></li>
									</c:if>
									<li><a class="page active">${pageMaker.cri.pageNum}</a></li>
									<c:if test="${pageMaker.cri.pageNum < pageMaker.realEnd}">
										<li><a class="changePage" href="${pageMaker.cri.pageNum + 1}">다음</a></li>
									</c:if>
								</ul>
							</div>
							<form id="actionForm" action="/policy/policy">
								<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
								<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
								<%-- <input type="hidden" name="type" value="${pageMaker.cri.type}">
								<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"> --%>
								<input type="hidden" name="check" value="${check}">
							</form>
						</footer>
						<div class="sch_comm">
	                        <form method="post" class="sch_form" name="SearchFrm" id="searchForm" action="/policy/policy">
	                            <fieldset>
	                                <legend class="screen_out">검색어 입력폼</legend>
	                                <input type="text" id="search_word" name="keyword" class="inp_keyword" title="검색어" value="${pageMaker.cri.keyword}" placeholder="검색">
	                                <a href="javascript:void(0)" class="fas fa-search" style="padding-top: 5%; position: absolute;"></a>
	                            </fieldset>
								<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
								<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
								<input type="hidden" name="tab" value="${tab}">
	                        </form>
	                    </div>
	
	
               		</div> <!-- area content-->
           		</div>  <!-- wrapper content-->
			</div> <!-- mArticle-->
		</div> <!-- inner-->
	</div> <!-- wrapper -->
</div>  <!-- main end-->
		


		<jsp:include page="../includes/footer.jsp"/>
		<script src="/resources/assets/js/modal.js"></script>
	</body>
	<script>
		$(document).ready(function () {
			$(".link_policy").on("click", function(e){
				e.preventDefault();
				var on = $(this).parents("li");
				var ons = $(".tab_policy li");
				for(let i=0; i<ons.length; i++){
					if($(ons[i]).attr("class") == "on"){
						ons.removeClass("on");
					}
					on.addClass("on");
				}			
			});
			
			$(".changePage").on("click", function(e){
				e.preventDefault();
				var actionForm = $("#actionForm");
				var pageNum = $(this).attr("href");
				actionForm.find("input[name='pageNum']").val(pageNum);
				actionForm.submit();
			});
			$("a.search").on("click", function(e){
				e.preventDefault();
				var searchForm = $("#searchForm");
				
				if(!searchForm.find("input[name='keyword']").val()){
					alert("키워드를 입력하세요.");
					return false;
				}
				searchForm.submit();
			});
			
		});
	</script>
	
	<script>

	
   
   
		//alert("${result}");
		var result = "${result}";
		$(document).ready(function(){
			if(result == '' || isNaN(result)){
				return;
			}
			alert("게시글 " + result + "번이 등록되었습니다.")
		});

	function guideWrite(){
    	 if ("${sessionId}" == ""){
 			alert("로그인 후 이용해 주십시오.");
 			goSignIn();
 		}else{
 			location.replace("/campfire/guideWrite${pageMaker.cri.getListLink()}");
 		}
     }

	</script>
</html>
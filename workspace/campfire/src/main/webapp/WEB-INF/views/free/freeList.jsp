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
      <link rel="shortcut icon" type="image/x-icon" href="/resources/images/title-icon.png">
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
			box-shadow: inset 0 0 0 0.5px #2388fa;
    		color: black;
    		border-radius: 0;
		}
		
         .big-width{display:block;}
         .small-width{display:none;}
         .table-wrapper {overflow-x:hidden !important;}
         select{width: 25%;display: inline;}
         input[name='keyword']{width: 55%; display: inline;}
         .search{width: 18%;}
         
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
            .readCnt {display:none;}
            .big-width{display:none;}
            .small-width{display:block;}
			select{width: 100%;}
         	input[name='keyword']{width: 100%;}
         	.search{width: 100%;}
         }
      </style>
   </head>
   <body class="is-preload">
   <%@include file="../includes/header.jsp" %>
      <!-- Main -->
         <div id="main">
            <div class="wrapper">
               <div class="inner">

                  <!-- Elements -->
                     <header class="major">
                        <h1>자유게시판</h1>
                     </header>
                           <!-- Table -->
                              <div class="table-wrapper">
                                 <table>
                                    <thead>
                                       <tr class="tHead">
                                          <th class="bno"></th>
                                          <th class="title">제목</th>
                                          <th class="writer">작성자</th>
                                          <th class="regDate">작성일</th>
                                          <th class="readCnt">조회</th>
                                       </tr>
                                    </thead>
                                    <tbody>
                                       <c:forEach var="board" items="${list}">
                                          <tr class="tBody">
                                             <td class="bno">${board.bno}</td>
                                             <td class="title"><a href="/free/freeView${pageMaker.cri.getListLink()}&bno=${board.bno}">${board.title}</a>
                                             	<i style="font-size: 35px;" class="far fa-heart"></i><span style="font-size: 0.5rem;">[${board.replyCnt}]</span><i className="material-icons">fiber_new</i><i class="fas fa-heart"></i><i class="material-icons">fiber_new</i>
                                             </td>
                                             <td class="writer">${board.writer}</td>
                                             <td class="regDate">${board.regDate}</td>
                                             <td class="updateDate">${board.updateDate}</td>
                                          </tr>
                                       </c:forEach>
                                          <%-- <tr class="tBody">
                                             <td class="bno">1234567</td>
                                             <td class="title"><a href="#" style="color: black !important;">자유게시판 테스트용 제목입니다.</a>&nbsp;<span style="font-weight: bold; color: #ff2f3b;">[3]</span>
                                             	<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M7.25 12.5L4.75 9H3.5v6h1.25v-3.5L7.3 15h1.2V9H7.25zM9.5 15h4v-1.25H11v-1.11h2.5v-1.26H11v-1.12h2.5V9h-4zm9.75-6v4.5h-1.12V9.99h-1.25v3.52h-1.13V9H14.5v5c0 .55.45 1 1 1h4c.55 0 1-.45 1-1V9h-1.25z"/></svg>
                                             </td>
                                             <td class="writer">모닥불 테스터</td>
                                             <td class="regDate">2021.06.03</td>
                                             <td class="readCnt">27</td>
                                          </tr> --%>
                                    </tbody>
                                    <tfoot>
                                    </tfoot>
                                 </table>
                                 <h3 style="text-align: right;"><a href="/free/freeWrite${pageMaker.cri.getListLink()}" class="button small" style="border-radius: 0; text-decoration: none;">
                                 	<i class="fas fa-pencil-alt"></i>&nbsp;글쓰기</a>
                                 </h3>
                                 <!-- A -->
                                 <div class="big-width" style="text-align:center;">
                                    <c:if test="${pageMaker.prev}">
                                       <a class="changePage" href="${1}"><code>&lt;&lt;</code></a>
                                       <a class="changePage" href="${pageMaker.startPage - 1}"><code>&lt;</code></a>
                                    </c:if>
                                    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                       <c:choose>
                                          <c:when test="${num eq pageMaker.cri.pageNum}">
                                             <code>${num}</code>
                                          </c:when>
                                          <c:otherwise>
                                             <a class="changePage" href="${num}"><code>${num}</code></a>
                                          </c:otherwise>
                                       </c:choose>
                                    </c:forEach>
                                    <c:if test="${pageMaker.next}">
                                       <a class="changePage" href="${pageMaker.endPage + 1}"><code>&gt;</code></a>
                                       <a class="changePage" href="${pageMaker.realEnd}"><code>&gt;&gt;</code></a>
                                    </c:if>
                                 </div>
                                 
                                 <div class="small-width" style="text-align:center;">
                                    <c:if test="${pageMaker.cri.pageNum > 1}">
                                       <a class="changePage" href="${1}"><code>&lt;&lt;</code></a>
                                       <a class="changePage" href="${pageMaker.cri.pageNum - 1}"><code>&lt;</code></a>
                                    </c:if>
                                    <code>${pageMaker.cri.pageNum}</code>
                                    <c:if test="${pageMaker.cri.pageNum < pageMaker.realEnd}">
                                       <a class="changePage" href="${pageMaker.cri.pageNum + 1}"><code>&gt;</code></a>
                                       <a class="changePage" href="${pageMaker.realEnd}"><code>&gt;&gt;</code></a>
                                       
                                    </c:if>
                                 </div>
                                 
                                 <form id="actionForm" action="/free/freeList">
                                    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                                    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                                    <input type="hidden" name="type" value="${pageMaker.cri.type}">
                                    <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                                 </form>
                                 <!-- B -->
                                 <form action="/free/freeList" id="searchForm">
                                    <div class="fields">
                                       <div class="field">
                                          <div style="text-align:center">
                                             <select name="type">
                                                <option value="" ${pageMaker.cri.type == null ? 'selected' : ''}>검색 기준</option>
                                                <option value="T" ${pageMaker.cri.type == 'T' ? 'selected' : ''}>제목</option>
                                                <option value="C" ${pageMaker.cri.type == 'C' ? 'selected' : ''}>내용</option>
                                                <option value="W" ${pageMaker.cri.type == 'W' ? 'selected' : ''}>작성자</option>
                                                <option value="TC" ${pageMaker.cri.type == 'TC' ? 'selected' : ''}>제목 또는 내용</option>
                                                <option value="TW" ${pageMaker.cri.type == 'TW' ? 'selected' : ''}>제목 또는 작성자</option>
                                                <option value="TCW" ${pageMaker.cri.type == 'TCW' ? 'selected' : ''}>전체</option>
                                             </select>
                                             <input id="keyword" type="text" name="keyword" style="margin-top: 1%;" value="${pageMaker.cri.keyword}">
                                             <a href="javascript:void(0)" class="search button primary icon solid" style="text-decoration: none; margin-top: 1%;">검색</a>
                                          </div>
                                       </div>
                                    </div>
                                 </form>
                              </div>
                        </div>
                     </div>
                  </div> 
      <!-- Scripts -->
	<jsp:include page="../includes/footer.jsp"/>
   </body>
   <script>
      $("a.search").on("click", function(e){
         e.preventDefault();
         var searchForm = $("#searchForm");
         
         if(!searchForm.find("option:selected").val()){
            alert("검색 종류를 선택하세요.");
            return false;
         }
         if(!searchForm.find("input[name='keyword']").val()){
            alert("키워드를 입력하세요.");
            return false;
         }
         searchForm.submit();
      })
   
      $(".changePage").on("click", function(e){
         e.preventDefault();
         var actionForm = $("#actionForm");
         var pageNum = $(this).attr("href");
         actionForm.find("input[name='pageNum']").val(pageNum);
         actionForm.submit();
      })
   
      //alert("${result}");
      var result = "${result}";
      $(document).ready(function(){
         if(result == '' || isNaN(result)){
            return;
         }
         alert("게시글 " + result + "번이 등록되었습니다.")
      })
   </script>
</html>
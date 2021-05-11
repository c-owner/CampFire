<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
      <title>Board</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <meta name="description" content="" />
      <meta name="keywords" content="" />
      <link rel="stylesheet" href="/resources/assets/css/main.css" />
   </head>
   <body class="is-preload">
      <!-- Main -->
         <div id="main">
            <div class="wrapper">
               <div class="inner">

                  <!-- Elements -->
                     <header class="major">
                        <h1>Board</h1>
                        <p>게시판 목록</p>
                     </header>
                           <!-- Table -->
                              <h3><a href="" class="button small">글 등록</a></h3>
                              <div class="table-wrapper">
                                 <table>
                                    <thead>
                                       <tr class="tHead">
                                          <th class="bno">번호</th>
                                          <th class="title">제목</th>
                                          <th class="writer">작성자</th>
                                          <th class="regDate">작성일</th>
                                          <th class="updateDate">수정일</th>
                                       </tr>
                                    </thead>
                                    <tbody>
         								<c:forEach var="board" items="${list}">
         									<tr class="tBody">
		                                        <td class="bno">${board.bno}</td>
		                                        <td class="title">${board.title}</td>
		                                        <td class="writer">${board.writer}</td>
		                                        <td class="regDate">${board.regDate}</td>
		                                        <td class="updateDate">${board.updateDate}</td>
         									</tr>
         								</c:forEach>
                                    </tbody>
                                    <tfoot>
                                    </tfoot>
                                 </table>
                              </div>
                        </div>
                     </div>
                  </div> 

      <!-- Scripts -->
         <script src="/resources/assets/js/jquery.min.js"></script>
         <script src="/resources/assets/js/jquery.dropotron.min.js"></script>
         <script src="/resources/assets/js/browser.min.js"></script>
         <script src="/resources/assets/js/breakpoints.min.js"></script>
         <script src="/resources/assets/js/util.js"></script>
         <script src="/resources/assets/js/main.js"></script>
   </body>
</html>
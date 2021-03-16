<%--
  Created by IntelliJ IDEA.
  User: corne
  Date: 2021-03-05
  Time: 오후 5:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>캠퍼들 모여 </title>

    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/layout.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main-full.css"/>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/title-icon.png">

</head>
<body class="is-preload" onload="printClock()">

<c:set var = 'userStatus' value = "false"></c:set>
<c:if test="${param.type eq 'login' }">
	<c:set var = 'userStatus' value = 'true'/>
</c:if>
 
<!-- Header -->
<jsp:include page="${pageContext.request.contextPath}/assets/public/header.jsp"></jsp:include>

<!-- Banner -->
<section id="banner">
    <article class="full">
        <div class="image" data-position="center">
            <img src="${pageContext.request.contextPath}/images/bg01.jpg" alt=""/>
        </div>
        <div class="content">
            <h1 class="alt"><a href="${pageContext.request.contextPath}/Main.me"> 캠핑 코너 </a></h1>
            <!-- <h2 class="dateview1">MMMM Do YYYY, h:mm:ss a</h2> -->
            <div id="clock" style=" width:350px;
        height:250px; 
        line-height:250px; 
        color:#80deea;
        font-size:65px;
        margin: 0 auto; 
        text-align:center;">
            </div>

            <h2 class="alt" style="font-family: 'Nanum Brush Script', cursive;">오늘은 어디로 가볼까?</h2>
            <form method="post" action="#" class="combined">
                <select name="category" id="category" style="margin: 0 auto; width: 40%;">
                    <option value="select">- 지역별 -</option>
                    <option value="alpha">서울</option>
                    <option value="beta">경기</option>
                    <option value="gamma">강원</option>
                    <option value="delta">경북</option>
                    <option value="epsilon">경남</option>
                    <option value="eta">충북</option>
                    <option value="zeta">충남</option>
                    <option value="theta">제주</option>
                </select>
                <input type="search" name="search" id="search" placeholder="검색어 입력" class="invert"/>
                <a href="#" class="button primary icon solid fa-search">Search</a>
            </form>
            <a href="javascript:;" class=" ">#서울</a>
            <a href="javascript:;" class=" ">#경기</a>
            <a href="javascript:;" class=" ">#강원</a>
            <a href="javascript:;" class=" ">#경북</a>
            <a href="javascript:;" class=" ">#경남</a>
            <a href="javascript:;" class=" ">#충남</a>
            <a href="javascript:;" class=" ">#노지</a>
            <a href="javascript:;" class=" ">#무료야영장</a>

        </div>

        <div class="flex-wrapper" style="display: block;">
            <div class="single-chart">
                <a href="./?c=camping">
                    <svg viewBox="0 0 36 36" class="circular-chart color4">
                        <path class="circle-bg total"
                              d="M18 2.0845  a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"></path>
                        <path class="circle total" stroke-dasharray="100, 100"
                              d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"></path>
                        <text x="18" y="21.5" class="ptext total">2,560</text>
                    </svg>
                </a>
                <div class="sitename">전체</div>
            </div>
            <div class="single-chart">
                <a href="./?c=5g">
                    <svg viewBox="0 0 36 36" class="circular-chart color1">
                        <path class="circle-bg"
                              d="M18 2.0845  a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"></path>
                        <path class="circle" stroke-dasharray="13.828125, 100"
                              d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"></path>
                        <text x="18" y="21.5" class="ptext">354</text>
                    </svg>
                </a>
                <div class="sitename">
                    오지/노지캠핑
                </div>
            </div>

            <div class="single-chart">
                <a href="./?c=camp">
                    <svg viewBox="0 0 36 36" class="circular-chart color2">
                        <path class="circle-bg"
                              d="M18 2.0845  a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"></path>
                        <path class="circle" stroke-dasharray="65.078125, 100"
                              d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"></path>
                        <text x="18" y="21.5" class="ptext">1,666</text>
                    </svg>
                </a>
                <div class="sitename">
                    유료캠핑장
                </div>
            </div>

            <div class="single-chart">
                <a href="./?c=glamping">
                    <svg viewBox="0 0 36 36" class="circular-chart color3">
                        <path class="circle-bg"
                              d="M18 2.0845  a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"></path>
                        <path class="circle" stroke-dasharray="21.09375, 100"
                              d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"></path>
                        <text x="18" y="21.5" class="ptext">540</text>
                    </svg>
                </a>
                <div class="sitename">
                    글램핑/카라반
                </div>
            </div>

        </div>
    </article>

    <article class="half">
        <div class="image" data-position="center">
            <img src="images/bg02.jpg" alt=""/>
        </div>
        <div class="content">
            <h2 class="alt"><a href="#">공지사항</a></h2>
            <ul class="actions">
                <li><a href="#" class="button">Learn More</a></li>
            </ul>
        </div>
    </article>
    <article class="half">
        <div class="image" data-position="center">
            <img src="images/bg03.jpg" alt=""/>
        </div>
        <div class="content">
            <h2 class="alt"><a href="#">캠핑 꿀팁</a></h2>
            <ul class="actions">
                <li><a href="#" class="button">Learn More</a></li>
            </ul>
        </div>
    </article>
</section>


<!-- Footer -->
<jsp:include page="${pageContext.request.contextPath}/./assets/public/footer.jsp"></jsp:include>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/moment-with-locales.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/account.js"></script>
<script> var contextPath = "${pageContext.request.contextPath};</script>
<script>
    var date = new Date();
    $('.dateview1').html(moment(date).format('MMMM Do YYYY,h:mm:ss a'));

    function printClock() {
        
        var clock = document.getElementById("clock");            // 출력할 장소 선택
        var currentDate = new Date();                                     // 현재시간
        var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
        var amPm = 'AM'; // 초기값 AM
        var currentHours = addZeros(currentDate.getHours(),2); 
        var currentMinute = addZeros(currentDate.getMinutes() ,2);
        var currentSeconds =  addZeros(currentDate.getSeconds(),2);
        
        if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
        	amPm = 'PM';
        	currentHours = addZeros(currentHours - 12,2);
        }

        if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
           currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
        }
        clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:50px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
        
        setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
    }

    function addZeros(num, digit) { // 자릿수 맞춰주기
    	  var zero = '';
    	  num = num.toString();
    	  if (num.length < digit) {
    	    for (i = 0; i < digit - num.length; i++) {
    	      zero += '0';
    	    }
    	  }
    	  return zero + num;
    }

    
    
</script>
</body>
</html>

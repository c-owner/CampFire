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
    .tab_policy .current {
	    z-index: 1;
	    border-color: #1e1e1e;
	    background-color: #1e1e1e;
    }
    .tab_policy .current .link_policy {
	    position: relative;
	    color: #fff;
	    z-index: 99;
	}
    
    /* 내용 */
    .material-icons {vertical-align: middle;}
    .wrap_cont {
   	    overflow: visible;
	    position: relative;
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
	    margin-top: 80px;
	    border-top: 2px solid #4d4d4d;
    	margin-bottom: 3em;
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
		text-align: center;	
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
	
	footer {
	    border-bottom: 1px solid #71717185;
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
			
	#tbl_regdate {
		width: 10rem;
	}
	@media screen and (max-width: 480px) {
		#tbl_regdate,#tbl_regdate2 {
			display: none;
		}
	}
	
	p > iframe.note-video-clip {
		object-fit: contain !important;
		width: 100% !important;
	}

	ul.tab_policy{
		list-style: none;
	}
	ul.tab_policy li{
		background: none;
		cursor: pointer;
	}

	.wrap_cont{
		display: none;
	}

	.wrap_cont.current{
		display: inherit;
	}
	
	ul.list_1depth, ul.list_1depth > li, ul.list_2depth_type2 {
    	list-style: none;
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
				        <p class="desc_account" style="margin: 0;"> 
				        <span class="ico_corp">&gt;</span>
				         메뉴에서 여러분에게 적용되는 약관 및 정책을 확인하실 수 있습니다. 
				         
				         <c:if test="${admin eq '1' }">
				          <a href="/policy/policyWrite" class="button">공지 작성</a>
				         </c:if>     
				         </p>
				    </div>
				    <form>
					    <ul class="tab_policy">
						    <!-- 활성화 시 on 클래스 추가 -->
						    <!-- WAI-ARIA 속성 구현 예정 -->
						    <li class="${pageMaker.cri.tab == 'terms' ? 'current' : ''}" data-tab="tab-1"><a href="#" class="link_policy">이용약관</a></li>
						    <li class="${pageMaker.cri.tab == 'location' ? 'current' : ''}" data-tab="tab-2"><a href="#" class="link_policy">위치기반서비스 이용약관</a></li>
						    <li class="${pageMaker.cri.tab == 'privacy' ? 'current' : ''}" data-tab="tab-3"><a href="#" class="link_policy">개인정보처리방침</a></li>
						    <li class="${pageMaker.cri.tab == 'oppolicy' ? 'current' : ''}" data-tab="tab-4"><a href="#" class="link_policy">운영정책</a></li>
					        <li class="${pageMaker.cri.tab == 'safeguard' ? 'current' : ''}" data-tab="tab-5"><a href="#" class="link_policy">권리침해신고안내</a></li>
						    <li class="${pageMaker.cri.tab == 'notices' ? 'current' : ''}" data-tab="tab-6"><a href="#" class="link_policy">공지사항</a></li>
						</ul>
				    </form>
				<div class="wrap_cont wrap_notices current" id="tab-1">
	                <div class="area_tit">
	                    <h4 class="tit_corp">모닥불 서비스 <br>이용약관</h4>
	                </div>
	                
	                
	                <div class="table-wrapper">
	                    <div class="tbl_comm fst tbl_public">
<div class="wrap_menu">
                <ul class="list_menu">
                    <li>
                        <a href="#useterms01" class="link_menu">제 1 장 환영합니다!</a>
                        <ul class="list_submenu">
                            <li><a href="#useterms01_01" class="link_menu">제 1 조 (목적)</a></li>
                            <li><a href="#useterms01_02" class="link_menu">제 2 조 (약관의 효력 및 변경)</a></li>
                            <li><a href="#useterms01_03" class="link_menu">제 3 조 (약관 외 준칙)</a></li>
                            <li><a href="#useterms01_04" class="link_menu">제 4 조 (용어의 정의)</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#useterms02" class="link_menu">제 2 장 모닥불계정 이용계약</a>
                        <ul class="list_submenu">
                            <li><a href="#useterms02_05" class="link_menu">제 5 조 (계약의 성립)</a></li>
                            <li><a href="#useterms03_06" class="link_menu">제 6 조 (모닥불계정 이용의 제한)</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="list_menu">
                    <li>
                        <a href="#useterms03" class="link_menu">제 3 장 모닥불계정 이용</a>
                        <ul class="list_submenu">
                            <li><a href="#useterms03_07" class="link_menu">제 7 조 (모닥불계정 제공)</a></li>
                            <li><a href="#useterms03_08" class="link_menu">제 8 조 (모닥불계정 서비스의 변경 및 종료)</a></li>
                            <li><a href="#useterms03_09" class="link_menu">제 9 조 (모닥불계정 관리)</a></li>
                            <li><a href="#useterms03_10" class="link_menu">제 10 조 (모닥불콘)</a></li>
                            <li><a href="#useterms04_11" class="link_menu">제 11 조 (인증서비스)</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#useterms04" class="link_menu">제 4 장 계약당사자의 의무</a>
                        <ul class="list_submenu">
                            <li><a href="#useterms04_12" class="link_menu">제 12 조 (회원의 의무)</a></li>
                            <li><a href="#useterms04_13" class="link_menu">제 13 조 (개인정보의 보호)</a></li>
                            <li><a href="#useterms04_14" class="link_menu">제 14 조 (회원에 대한 통지 및 공지)</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="list_menu">
                    <li>
                        <a href="#useterms05" class="link_menu">제 5 장 이용계약 해지 등</a>
                        <ul class="list_submenu">
                            <li><a href="#useterms05_15" class="link_menu">제 15 조 (이용계약 해지)</a></li>
                            <li><a href="#useterms05_16" class="link_menu">제 16 조 (손해배상)</a></li>
                            <li><a href="#useterms05_17" class="link_menu">제 17 조 (분쟁의 해결)</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            
            <!--  -->

            

            <!-- 2021-06-18 모닥불계정 약관 시작 -->
            <div class="wrap_terms wrap_policy">
                <h4 id="useterms01" class="tit_policy">제 1 장 환영합니다!</h4>
                <strong id="useterms01_01" class="tit_subject">제 1 조 (목적)</strong>
                <p class="desc_g">
                    주식회사 모닥불(이하 ‘회사’)가 제공하는 서비스를 이용해 주셔서 감사합니다. 회사는 여러분이 다양한 인터넷과 모바일 서비스를 좀 더 편리하게 이용할 수 있도록 회사 또는 관계사의 개별 서비스에 모두 접속 가능한 통합로그인계정 체계를 만들고 그에 적용되는 '모닥불계정 약관(이하 '본 약관')을 마련하였습니다. 본 약관은 여러분이 모닥불계정 서비스를 이용하는 데 필요한 권리, 의무 및 책임사항, 이용조건 및 절차 등 기본적인 사항을 규정하고 있으므로 조금만 시간을 내서 주의 깊게 읽어주시기 바랍니다.
                </p>
                <strong id="useterms01_02" class="tit_subject">제 2 조 (약관의 효력 및 변경)</strong>
                <ul class="list_1depth">
                    
                        
                        
                            <li><span class="txt_num">①</span>본 약관의 내용은 <a href="/" target="_blank" class="link_policy">모닥불계정 웹사이트</a> 또는 개별 서비스의 화면에 게시하거나 기타의 방법으로 공지하고, 본 약관에 동의한 여러분 모두에게 그 효력이 발생합니다.</li>
                        
                    
                    <li><span class="txt_num">②</span>회사는 필요한 경우 관련법령을 위배하지 않는 범위 내에서 본 약관을 변경할 수 있습니다. 본 약관이 변경되는 경우 회사는 변경사항을 시행일자 15일 전부터 여러분에게 서비스 공지사항에서 공지 또는 통지하는 것을 원칙으로 하며, 피치 못하게 여러분에게 불리한 내용으로 변경할 경우에는 그 시행일자 30일 전부터 모닥불계정에 등록된 이메일 주소로 이메일(이메일주소가 없는 경우 서비스 내 전자쪽지 발송, 서비스 내 알림 메시지를 띄우는 등의 별도의 전자적 수단) 발송 또는 여러분이 등록한 휴대폰번호로 모닥불톡 메시지 또는 문자메시지 발송하는 방법 등으로 개별적으로 알려 드리겠습니다. </li>
                    <li><span class="txt_num">③</span>회사가 전항에 따라 공지 또는 통지를 하면서 공지 또는 통지일로부터 개정약관 시행일 7일 후까지 거부의사를 표시하지 아니하면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 여러분의 의사표시가 없는 경우에는 변경된 약관을 승인한 것으로 봅니다. 여러분이 개정약관에 동의하지 않을 경우 여러분은 이용계약을 해지할 수 있습니다.</li>
                </ul>
                <strong id="useterms01_03" class="tit_subject">제 3 조 (약관 외 준칙)</strong>
                <p class="desc_g">본 약관에 규정되지 않은 사항에 대해서는 관련법령 또는 회사가 정한 개별 서비스의 이용약관, 운영정책 및 규칙 등(이하 ‘세부지침’)의 규정에 따릅니다.</p>
                <strong id="useterms01_04" class="tit_subject">제 4 조 (용어의 정의)</strong>
                <ul class="list_1depth">
                    <li>
                        <span class="txt_num">①</span>본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
                        <ul class="list_2depth_type2">
                            <li><span class="txt_num">1.</span>모닥불계정: 회사 또는 관계사가 제공하는 개별 서비스를 하나의 로그인계정과 비밀번호로 회원 인증, 회원정보 변경, 회원 가입 및 탈퇴 등을 관리할 수 있도록 회사가 정한 로그인계정 정책을 말합니다.</li>
                            <li><span class="txt_num">2.</span>회원: 모닥불계정이 적용된 개별 서비스 또는 모닥불계정 웹사이트에서 본 약관에 동의하고, 모닥불계정을 이용하는 자를 말합니다.</li>
                           <li><span class="txt_num">3.</span>관계사: 회사와 제휴 관계를 맺고 모닥불계정을 공동 제공하기로 합의한 법인을 말합니다. 개별 관계사는 <a href="/policy/policy?tab=notices" target="_blank" class="link_policy">모닥불 기업사이트</a>에서 확인할 수 있고 추후 추가/변동될 수 있으며 관계사가 추가/변동될 때에는 모닥불 기업사이트에 변경 사항을 게시합니다.</li>
                           <li><span class="txt_num">4.</span>개별 서비스: 모닥불계정을 이용하여 접속 가능한 회사 또는 관계사가 제공하는 서비스를 말합니다. 개별 서비스는 추후 추가/변동될 수 있으며 서비스가 추가/변동될 때에는 <a href="/policy/pollicy?tab=notices" target="_blank" class="link_policy">모닥불 기업사이트</a>에 변경 사항을 게시합니다.</li>
                            <li><span class="txt_num">5.</span>모닥불계정 웹사이트: 회원이 온라인을 통해 모닥불계정 정보를 조회 및 수정할 수 있는 인터넷 사이트를 말합니다.</li>
                            <li><span class="txt_num">6.</span>모닥불계정 정보 : 모닥불계정을 이용하기 위해 회사가 정한 필수 내지 선택 입력 정보로서 모닥불계정 웹사이트 또는 개별 서비스 내 모닥불계정 설정 화면을 통해 정보 확인, 변경 처리 등을 관리할 수 있는 회원정보 항목을 말합니다.</li>
                            <li><span class="txt_num">7.</span>모닥불콘 : 회사가 회원의 개별 서비스 이용 과정에서 지급하는 혜택으로서 회원은 회사가 정한 방법에 따라서 모닥불콘을 사용할 수 있습니다.</li>
                            <li><span class="txt_num">8.</span>인증서 : 인증서라 함은 회사가 인증서비스를 통하여 발급하는 전자서명생성정보가 회원에게 유일하게 속한다는 사실 등을 확인하고 이를 증명하는 전자적 정보를 말합니다.</li>
                            <li><span class="txt_num">9.</span>전자서명 : 서명자의 신원을 확인하고 서명자가 해당 전자문서에 서명하였다는 사실을 나타내는데 이용하기 위하여 전자문서에 첨부되거나 논리적으로 결합된 전자적 형태의 정보를 말합니다.</li>
                            <li><span class="txt_num">10.</span>전자서명생성정보 : 전자서명을 생성하기 위하여 이용하는 전자적 정보를 말합니다.</li>
                            <li><span class="txt_num">11.</span>인증회원 : 회사로부터 전자서명생성정보를 인증 받은 회원을 말합니다.</li>
                            <li><span class="txt_num">12.</span>이용기관 : 인증회원의 전자서명 및 인증서를 바탕으로 한 거래 등을 위하여 인증서비스를 이용하려는 제3자를 말합니다.</li>
                        </ul>
                    </li>
                </ul>
                <h4 id="useterms02" class="tit_policy">제 2 장 모닥불계정 이용계약</h4>
                <strong id="useterms02_05" class="tit_subject">제 5 조 (계약의 성립)</strong>
                <ul class="list_1depth">
                    <li>
                        <span class="txt_num">①</span>모닥불계정 이용 신청은 개별 서비스 또는 모닥불계정 웹사이트 회원가입 화면에서 여러분이 모닥불계정 정보에 일정 정보를 입력하는 방식으로 이루어집니다.
                    </li>
                    <li><span class="txt_num">②</span>모닥불계정 이용계약은 여러분이 본 약관의 내용에 동의한 후 본 조 제1항에서 정한 이용신청을 하면 회사가 입력된 일정 정보를 인증한 후 가입을 승낙함으로써 체결됩니다.</li>
                </ul>
                <strong id="useterms02_06" class="tit_subject">제 6 조 (모닥불계정 이용의 제한)</strong>
                <ul class="list_1depth">
                    <li><span class="txt_num">①</span>제5조에 따른 가입 신청자에게 회사는 원칙적으로 모닥불계정의 이용을 승낙합니다. 다만, 회사는 아래 각 호의 경우에는 그 사유가 해소될 때까지 승낙을 유보하거나 승낙하지 않을 수 있습니다. 특히, 여러분이 만 14세 미만인 경우에는 부모님 등 법정대리인의 동의가 있는 경우에만 모닥불계정을 생성할 수 있습니다.
                        <ul class="list_2depth_type2">
                            <li><span class="txt_num">1.</span>회사가 본 약관 또는 세부지침에 의해 여러분의 모닥불계정을 삭제하였던 경우</li>
                            <li><span class="txt_num">2.</span>여러분이 다른 사람의 명의나 이메일 주소 등 개인정보를 이용하여 모닥불계정을 생성하려 한 경우</li>
                            <li><span class="txt_num">3.</span>모닥불계정 생성 시 필요한 정보를 입력하지 않거나 허위의 정보를 입력한 경우</li>
                            <li><span class="txt_num">4.</span>제공 서비스 설비 용량에 현실적인 여유가 없는 경우</li>
                            <li><span class="txt_num">5.</span>서비스 제공을 위한 기술적인 부분에 문제가 있다고 판단되는 경우</li>
                            <li><span class="txt_num">6.</span>기타 회사가 재정적, 기술적으로 필요하다고 인정하는 경우</li>
                            <li><span class="txt_num">7.</span>회사로부터 회원자격정지 조치 등을 받은 회원이 그 조치기간에 이용계약을 임의로 해지하고 재이용을 신청하는 경우</li>
                            <li><span class="txt_num">8.</span>기타 관련법령에 위배되거나 세부지침 등 회사가 정한 기준에 반하는 경우</li>
                        </ul>
                    </li>
                    <li><span class="txt_num">②</span>만약, 여러분이 위 조건에 위반하여 모닥불계정을 생성한 것으로 판명된 때에는 회사는 즉시 여러분의 모닥불계정 이용을 정지시키거나 모닥불계정을 삭제하는 등 적절한 제한을 할 수 있습니다.</li>
                </ul>
                <h4 id="useterms03" class="tit_policy">제 3 장 모닥불계정 이용</h4>
                <strong id="useterms03_07" class="tit_subject">제 7 조 (모닥불계정 제공)</strong>
                <ul class="list_1depth">
                    <li><span class="txt_num">①</span>회사가 개별 서비스와 연동하여 모닥불계정에서 제공하는 서비스(이하 “모닥불계정 서비스” 또는 “서비스”) 내용은 아래와 같습니다.
                        <ul class="list_2depth_type2">
                            <li><span class="txt_num">1.</span>통합로그인 : 모닥불계정이 적용된 개별 서비스에서 하나의 모닥불계정과 비밀번호로 로그인할 수 있는 통합 회원 인증 서비스를 이용할 수 있습니다. </li>
                            <li><span class="txt_num">2.</span>SSO(Single Sign On): 웹브라우저나 특정 모바일 기기에서 모닥불계정 1회 로그인으로 여러분이 이용 중인 개별 서비스간 추가 로그인 없이 자동 접속 서비스를 이용할 수 있습니다.</li>
                            <li><span class="txt_num">3.</span>모닥불계정 정보 통합 관리 : 개별 서비스 이용을 위해 모닥불계정 정보를 통합 관리합니다. 또한, 여러분이 이용하고자 하는 개별 서비스의 유형에 따라 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있고, 이를 모닥불계정 정보로 저장합니다.</li>
                            <li><span class="txt_num">4.</span>인증서비스 : 회사가 제공하는 전자서명과 인증서를 활용한 일체의 서비스를 말합니다.</li>
                            <li><span class="txt_num">5.</span>기타 회사가 제공하는 서비스</li>
                        </ul>
                    </li>
                    <li><span class="txt_num">②</span>회사는 더 나은 모닥불계정 서비스의 제공을 위하여 여러분에게 서비스의 이용과 관련된 각종 고지, 관리 메시지 및 기타 광고를 비롯한 다양한 정보를 서비스화면 내에 표시하거나 여러분의 이메일로 전송할 수 있습니다. 광고성 정보 전송의 경우에는 사전에 수신에 동의한 경우에만 전송합니다.</li>
                </ul>
                <strong id="useterms03_08" class="tit_subject">제 8 조 (모닥불계정 서비스의 변경 및 종료)</strong>
                <ul class="list_1depth">
                    <li>
                        <span class="txt_num">①</span>회사는 모닥불계정 서비스를 365일, 24시간 쉬지 않고 제공하기 위하여 최선의 노력을 다합니다. 다만, 아래 각 호의 경우 모닥불계정 서비스의 전부 또는 일부를 제한하거나 중지할 수 있습니다.
                        <ul class="list_2depth_type2">
                            <li><span class="txt_num">1.</span>모닥불계정 서비스용 설비의 유지·보수 등을 위한 정기 또는 임시 점검의 경우 </li>
                            <li><span class="txt_num">2.</span>정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 모닥불계정 이용에 지장이 있는 경우</li>
                            <li><span class="txt_num">3.</span>관계사와의 계약 종료, 정부의 명령/규제 등 회사의 제반 사정으로 모닥불계정 서비스를 유지할 수 없는 경우</li>
                            <li><span class="txt_num">4.</span>기타 천재지변, 국가비상사태 등 불가항력적 사유가 있는 경우</li>
                        </ul>
                    </li>
                    <li><span class="txt_num">②</span>전항에 의한 모닥불계정 서비스 중단의 경우에는 미리 제12조에서 정한 방법으로 여러분에게 통지 내지 공지하겠습니다. 다만, 회사로서도 예측할 수 없거나 통제할 수 없는 사유(회사의 과실이 없는 디스크 내지 서버 장애, 시스템 다운 등)로 인해 사전 통지 내지 공지가 불가능한 경우에는 그러하지 아니합니다. 이러한 경우에도 회사가 상황을 파악하는 즉시 최대한 빠른 시일 내에 서비스를 복구하도록 노력하겠습니다.</li>
                    <li><span class="txt_num">③</span>여러분에게 중대한 영향을 미치는 서비스의 변경 사항이나 종료는 모닥불계정에 등록된 이메일 주소로 이메일(이메일주소가 없는 경우 서비스 내 전자쪽지 발송, 서비스 내 알림 메시지를 띄우는 등의 별도의 전자적 수단) 발송 또는 여러분이 등록한 휴대폰번호로 모닥불톡 메시지 또는 문자메시지 발송하는 방법 등으로 개별적으로 알려 드리겠습니다.</li>
                </ul>
                <strong id="useterms03_09" class="tit_subject">제 9 조 (모닥불계정 관리)</strong>
                <ul class="list_1depth">
                    <li><span class="txt_num">①</span>모닥불계정은 여러분 본인만 이용할 수 있으며, 다른 사람이 여러분의 모닥불계정을 이용하도록 허락할 수 없습니다. 그리고 여러분은 다른 사람이 여러분의 모닥불계정을 무단으로 사용할 수 없도록 직접 비밀번호를 관리하여야 합니다. 회사는 다른 사람이 여러분의 모닥불계정을 무단으로 사용하는 것을 막기 위하여 비밀번호 입력 및 추가적인 본인 확인 절차를 거치도록 할 수 있습니다. 만약 무단 사용이 발견된다면, 고객센터를 통하여 회사에게 알려주시기 바라며, 회사는 무단 사용을 막기 위한 방법을 여러분에게 안내하도록 하겠습니다.</li>
                    <li><span class="txt_num">②</span>여러분은 모닥불계정 웹사이트 또는 개별 서비스 내 모닥불계정 설정 화면을 통하여 여러분의 모닥불계정 정보를 열람하고 수정할 수 있습니다. 다만, 모닥불계정 서비스의 제공 및 관리를 위해 필요한 모닥불계정, 전화번호, 단말기 식별번호, 기타 본인확인정보 등 일부 정보는 수정이 불가능할 수 있으며, 수정하는 경우에는 추가적인 본인 확인 절차가 필요할 수 있습니다. 여러분이 이용 신청 시 알려주신 내용에 변동이 있을 때, 직접 수정하시거나 이메일, 고객센터를 통하여 회사에 알려 주시기 바랍니다.</li>
                    <li><span class="txt_num">③</span>여러분이 모닥불계정 정보를 적시에 수정하지 않아 발생하는 문제에 대하여 회사는 책임을 부담하지 아니합니다.</li>

                </ul>
                <strong id="useterms03_10" class="tit_subject">제 10 조 (모닥불콘)</strong>
                <ul class="list_1depth">
                    <li><span class="txt_num">①</span>여러분이 모닥불계정을 통해 개별 서비스를 이용하면서 회사가 제시한 조건을 충족하는 경우 회사는 정해진 정책에 따라 여러분의 모닥불계정에 모닥불콘을 부여할 수 있습니다.</li>
                    <li><span class="txt_num">②</span>여러분은 회사가 정하는 절차와 조건에 따라 모닥불콘으로 회사가 제공하는 서비스 및 혜택 등을 이용할 수 있습니다. 단, 회사 이외의 제휴사 기타 제3자가 제공하는 서비스의 경우 그에 대한 안전성 및 적법성 등에 대해 보증하거나 책임지지 않으며, 관련된 일체의 위험의 부담에 대해 여러분이 해당 서비스를 사용하기 전에 동의함을 원칙으로 합니다.</li>
                    <li><span class="txt_num">③</span>모닥불콘으로 이용할 수 있는 회사의 서비스 및 혜택 등은 회사의 정책과 제3자와의 제휴 관계에 따라 수시로 변경될 수 있으며, 회사는 모닥불콘의 영속적인 사용성을 보장하지 않습니다.</li>
                    <li><span class="txt_num">④</span>모닥불콘은 재산적 가치가 없으며, 회사는 모닥불콘에 대해 현금으로의 환전 및 환불 등을 제공하지 않으며, 여러분도 모닥불콘의 현금 환전 또는 유상거래 등의 행위를 할 수 없습니다.</li>
                    <li><span class="txt_num">⑤</span>회사는 개별 서비스 운영상의 목적과 모닥불콘의 효율적 이용 지원을 위해 필요한 경우 부득이하게 정책에 정해진 바에 따라 모닥불콘의 일부 또는 전부를 조정하거나 이용 제한 또는 소멸 등의 조치를 취할 수 있습니다.</li>
                    
                        
                        
                            <li><span class="txt_num">⑥</span>본조에서 정하고 있는 내용 외에 모닥불콘의 부여 및 이용에 관한 상세한 사항은 회사가 별도로 정한 <a href="/policy/pollicy?tab=oppolicy" target="_blank" class="link_policy">운영정책</a>을 따르며, 회사는 고객센터 도움말 페이지 등을 통하여 여러분에게 안내합니다.</li>
                        
                    
                </ul>
                <strong id="useterms04_11" class="tit_subject">제 11 조 (인증서비스)</strong>
                <ul class="list_1depth">
                    <li><span class="txt_num">①</span>회사는 전자서명생성정보 및 인증서를 발급하고, 전자서명과 인증서를 활용한 각종 서비스를 아래 각 호와 같이 인증회원에게 제공합니다. 이 때 회사는 필요한 경우 인증서비스의 유형 및 종류를 추가하거나, 부가서비스를 별도로 제공할 수 있습니다.
                        <ul class="list_2depth_type2">
                            <li><span class="txt_num">1.</span>전자서명생성정보 및 인증서 발급</li>
                            <li><span class="txt_num">2.</span>전자서명 및 인증서를 활용한 각종 서비스</li>
                            <li><span class="txt_num">3.</span>이용기관 로그인 및 신원확인을 위한 간편인증</li>
                            <li><span class="txt_num">4.</span>기타 전자서명인증업무 운영준칙에서 정하는 서비스</li>
                        </ul>
                    </li>
                    <li><span class="txt_num">②</span>회원은 회사가 정하는 방법에 따라 정확한 정보만을 제공하여 인증서비스에 가입하여야 하며, 인증서를 발급받음과 동시에 인증회원으로 전환됩니다. 인증서는 명의자 당 1개의 모닥불계정에서 1대의 기기에만 발급됩니다. 만일 인증회원이 다른 기기 또는 다른 모닥불계정에서 인증서를 재발급하는 경우 기존에 발급받은 인증서는 자동 폐지됩니다.</li>
                    <li><span class="txt_num">③</span>인증회원은 회사가 정한 방법에 따라 인증서비스를 이용하여야 합니다. 또한 인증회원은 자신의 전자서명생성정보와 인증서 및 이와 관련된 모든 정보를 안전하게 관리하고 인증서비스 이용 기간 중 회사에 제공한 정보 및 인증서에 포함된 정보가 정확하고 완전하게 유지되도록 하여야 합니다. 인증회원은 자신의 전자서명생성정보와 인증서 및 이에 관련된 정보를 타인에게 양도, 증여, 판매, 사용 허락할 수 없으며, 분실, 훼손, 도난 또는 유출되거나 그러할 위험이 있다고 인지한 경우 즉시 그 사실을 회사에 통지하여야 합니다.</li>
                    <li><span class="txt_num">④</span>회사는 다음 각 호의 경우 인증서의 신청 및 발급을 제한하거나 발급된 인증서를 인증회원의 동의없이 폐지할 수 있습니다.
                        <ul class="list_2depth_type2">
                            <li><span class="txt_num">1.</span>피성년후견인 또는 피한정후견인이 법정대리인의 동의 없이 가입한 경우</li>
                            <li><span class="txt_num">2.</span>타인 명의의 신청 및 정보 도용 등 신청 내용이 허위의 사실이라 판단되는 경우</li>
                            <li><span class="txt_num">3.</span>회사가 제시하는 인증 절차를 완료하지 못하거나, 회사가 정하지 않은 비정상적인 방법으로 시스템에 접근하여 인증서비스에 가입하는 경우</li>
                            <li><span class="txt_num">4.</span>회사로부터 이용 정지를 당하거나, 법령 또는 본 약관을 위반하는 등의 이유로 서비스 이용 계약이 해지된 회원이 재이용신청을 하는 경우</li>
                            <li><span class="txt_num">5.</span>기타 회원의 귀책사유로 발급이 곤란한 경우 또는 회사가 정한 이용신청 요건이 충족되지 않은 경우</li>
                        </ul>
                    </li>
                    <li><span class="txt_num">⑤</span>인증회원은 인증서비스를 자유롭게 이용할 수 있으나, 아래 각 호의 행위는 하여서는 안 됩니다.
                        <ul class="list_2depth_type2">
                            <li><span class="txt_num">1.</span>회사가 정하지 않은 비정상적인 방법으로 시스템에 접근하거나 인증서비스를 이용하는 행위</li>
                            <li><span class="txt_num">2.</span>부정한 방법으로 인증서를 발급받거나 행사하는 등 인증서비스를 불법적 또는 부당한 용도로 사용하는 행위</li>
                        </ul>
                    </li>
                    <li><span class="txt_num">⑥</span>회사는 다음 각 호의 경우 인증회원에게 발급한 인증서 이용의 일부 또는 전부를 제한할 수 있으며, 인증회원의 동의 없이 인증서를 즉시 폐지할 수 있습니다.
                        <ul class="list_2depth_type2">
                            <li><span class="txt_num">1.</span>인증서의 유효기간이 경과한 경우</li>
                            <li><span class="txt_num">2.</span>인증회원이 인증서의 비밀번호를 연속하여 제한 횟수 이상 잘못 입력한 경우</li>
                            <li><span class="txt_num">3.</span>인증회원의 모닥불계정에 등록된 모닥불톡 전화번호가 변경된 경우</li>
                            <li><span class="txt_num">4.</span>인증회원의 사망, 구속 등으로 신원확인이나 전자거래가 불가능한 경우</li>
                            <li><span class="txt_num">5.</span>인증서비스 가입 시 본인확인기관에서 전달받은 연계정보(CI)가 국적, 성별 등의 변경으로 더이상 유효하지 않음이 확인된 경우</li>
                            <li><span class="txt_num">6.</span>회사가 인증서비스와 관련된 보안절차나 인증회원의 전자서명생성정보 유출과 같은 보안상의 이유로 기 발급된 인증서의 이용제한이 필요한 경우</li>
                            <li><span class="txt_num">7.</span>전시, 사변, 천재지변 또는 이에 준하는 비상사태가 발생하거나 발생할 우려가 있는 경우</li>
                            <li><span class="txt_num">8.</span>회사 고객센터 등을 통해서 인증서의 분실신고가 접수된 경우</li>
                            <li><span class="txt_num">9.</span>인증회원의 인증서가 부정하게 사용된 사실을 회사가 인지한 경우 등 인증회원이 본 약관 및 운영정책을 포함한 회사의 서비스 이용 정책을 위반하거나 위반할 우려가 있다고 회사가 판단하는 경우</li>
                            <li><span class="txt_num">10.</span>기타 인증서비스의 안전성과 신뢰성을 저해할 우려가 있는 경우</li>
                        </ul>
                    </li>
                    <li><span class="txt_num">⑦</span>회사는 인증서를 사용하는 인증회원과 이용기관 상호간 거래에 대하여 어떠한 책임도 부담하지 않으며, 회사는 인증회원과 이용기관의 귀책사유로 인하여 발생한 손해에 대하여 회사의 귀책사유가 없는 경우 책임을 부담하지 않습니다.
                    <li><span class="txt_num">⑧</span>본 조에서 정하고 있는 내용 외에 인증서비스와 관련된 상세한 사항은 전자서명법 등을 포함한 관련법령 및 회사가 별도로 정한 전자서명인증업무준칙에 따르며, 회사는 인증서비스 공지사항 및 고객센터 도움말 페이지 등을 통하여 회원에게 안내합니다.
                </ul>

                <h4 id="useterms04" class="tit_policy">제 4 장 계약당사자의 의무</h4>
                <strong id="useterms04_12" class="tit_subject">제 12 조 (회원의 의무)</strong>
                <ul class="list_1depth">
                    <li><span class="txt_num">①</span>여러분이 모닥불계정 서비스를 이용할 때 아래 각 호의 행위는 하여서는 안 됩니다.
                        <ul class="list_2depth_type2">
                            <li><span class="txt_num">1.</span>이용 신청 또는 변경 시 허위 사실을 기재하거나, 다른 회원의 모닥불계정 및 비밀번호를 도용, 부정하게 사용하거나, 다른 사람의 명의를 사용하거나 명의자의 허락 없이 문자메시지(SMS) 인증 등을 수행하는 행위</li>
                            <li><span class="txt_num">2.</span>타인의 명예를 손상시키거나 불이익을 주는 행위</li>
                            <li><span class="txt_num">3.</span>게시판 등에 음란물을 게재하거나 음란사이트를 연결(링크)하는 행위</li>
                            <li><span class="txt_num">4.</span>회사 또는 제3자의 저작권 등 기타 권리를 침해하는 행위</li>
                            <li><span class="txt_num">5.</span>공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형, 음성 등을 타인에게 유포하는 행위</li>
                            <li><span class="txt_num">6.</span>모닥불계정 서비스와 관련된 설비의 오동작이나 정보 등의 파괴 및 혼란을 유발시키는 컴퓨터 바이러스 감염 자료를 등록 또는 유포하는 행위</li>
                            <li><span class="txt_num">7.</span>모닥불계정 서비스의 운영을 고의로 방해하거나 안정적 운영을 방해할 수 있는 정보 및 수신자의 명시적인 수신거부의사에 반하여 광고성 정보 또는 스팸메일(Spam Mail)을 전송하는 행위</li>
                            <li><span class="txt_num">8.</span>회사의 동의 없이 서비스 또는 이에 포함된 소프트웨어의 일부를 복사, 수정, 배포, 판매, 양도, 대여, 담보제공하거나 타인에게 그 이용을 허락하는 행위와 소프트웨어를 역설계하거나 소스 코드의 추출을 시도하는 등 서비스를 복제, 분해 또는 모방하거나 기타 변형하는 행위</li>
                            <li><span class="txt_num">9.</span>타인으로 가장하는 행위 및 타인과의 관계를 허위로 명시하는 행위</li>
                            <li><span class="txt_num">10.</span>다른 회원의 개인정보를 수집, 저장, 공개하는 행위</li>
                            <li><span class="txt_num">11.</span>자기 또는 타인에게 재산상의 이익을 주거나 타인에게 손해를 가할 목적으로 허위의 정보를 유통시키는 행위</li>
                            <li><span class="txt_num">12.</span>윤락행위를 알선하거나 음행을 매개하는 내용의 정보를 유통시키는 행위</li>
                            <li><span class="txt_num">13.</span>수치심이나 혐오감 또는 공포심을 일으키는 말이나 음향, 글이나 화상 또는 영상을 계속하여 상대방에게 도달하게 하여 상대방의 일상적 생활을 방해하는 행위</li>
                            <li><span class="txt_num">14.</span>관련 법령에 의하여 그 전송 또는 게시가 금지되는 정보(컴퓨터 프로그램 포함)의 전송 또는 게시 행위</li>
                            <li><span class="txt_num">15.</span>회사 또는 관계사의 직원이나 운영자를 가장하거나 사칭하여 또는 타인의 명의를 도용하여 글을 게시하거나 E-mail, 모닥불톡 메시지 등을 발송하는 행위</li>
                            <li><span class="txt_num">16.</span>컴퓨터 소프트웨어, 하드웨어, 전기통신 장비의 정상적인 가동을 방해, 파괴할 목적으로 고안된 소프트웨어 바이러스, 기타 다른 컴퓨터 코드, 파일, 프로그램을 포함하고 있는 자료를 게시하거나 E-mail, 모닥불톡 메시지 등으로 발송하는 행위</li>
                            <li><span class="txt_num">17.</span>기타 불법한 행위</li>
                        </ul>
                    </li>
                    <li><span class="txt_num">②</span>여러분은 서비스의 이용권한, 기타 이용계약상 지위를 타인에게 양도·증여할 수 없으며, 담보로 제공할 수 없습니다.</li>
                    <li><span class="txt_num">③</span>혹시라도 여러분이 관련 법령, 회사의 모든 약관 또는 정책을 준수하지 않는다면, 회사는 여러분의 위반행위 등을 조사할 수 있고, 여러분의 서비스 이용을 잠시 또는 계속하여 중단하거나, 재가입에 제한을 둘 수도 있습니다.</li>
	                 <li><span class="txt_num">④</span>본 조에서 정한 사항 및 그 밖에 모닥불계정 서비스의 이용에 관한 자세한 사항은 <a href="/policy/pollicy?tab=oppolicy" target="_blank" class="link_policy">모닥불 운영정책</a> 등을 참고해 주시기 바랍니다.</li>
                </ul>
                <strong id="useterms04_13" class="tit_subject">제 13 조 (개인정보의 보호)</strong>
                
                    
                    
                        <p class="desc_g">여러분의 개인정보의 안전한 처리는 회사에게 있어 가장 중요한 일 중 하나입니다. 여러분의 개인정보는 서비스의 원활한 제공을 위하여 여러분이 동의한 목적과 범위 내에서만 이용됩니다. 법령에 의하거나 여러분이 별도로 동의하지 아니하는 한 회사가 여러분의 개인정보를 제3자에게 제공하는 일은 결코 없으므로, 안심하셔도 좋습니다. 회사가 여러분의 개인정보를 안전하게 처리하기 위하여 기울이는 노력이나 기타 자세한 사항은 <a href="/policy/pollicy?tab=privacy" target="_blank" class="link_policy">모닥불 개인정보처리방침</a>을 참고하여 주십시오.</p>
                    
                
                <strong id="useterms04_14" class="tit_subject">제 14 조 (회원에 대한 통지 및 공지)</strong>
                
                    
                    
                        <p class="desc_g">회사는 여러분과의 의견 교환을 소중하게 생각합니다. 여러분은 언제든지 <a href="/" target="_blank" class="link_policy">고객센터</a>에 방문하여 의견을 개진할 수 있습니다. 서비스 이용자 전체에 대한 공지는 칠(7)일 이상 <a href="/policy/pollicy?tab=notices" target="_blank" class="link_policy">서비스 공지사항</a>란에 게시함으로써 효력이 발생합니다. 여러분에게 중대한 영향을 미치는 사항의 경우에는 모닥불계정에 등록된 이메일 주소로 이메일(이메일주소가 없는 경우 서비스 내 전자쪽지 발송, 서비스 내 알림 메시지를 띄우는 등의 별도의 전자적 수단) 발송 또는 여러분이 등록한 휴대폰번호로 모닥불톡 메시지 또는 문자메시지 발송하는 방법 등으로 개별적으로 알려 드리겠습니다.</p>
                    
                
                <h4 id="useterms05" class="tit_policy">제 5 장 이용계약 해지 등</h4>
                <strong id="useterms05_15" class="tit_subject">제 15 조 (이용계약 해지)</strong>
                <ul class="list_1depth">
                    <li><span class="txt_num">①</span>여러분이 모닥불계정 이용을 더 이상 원치 않는 때에는 언제든지 서비스 내 제공되는 메뉴를 이용하여 이용계약의 해지 신청을 할 수 있으며, 회사는 법령이 정하는 바에 따라 신속히 처리하겠습니다.</li>
                    <li><span class="txt_num">②</span>회사는 법령에서 정하는 기간 동안 여러분이 모닥불계정 서비스를 이용하기 위해 모닥불계정 로그인 혹은 접속한 기록이 없는 경우 여러분이 등록한 이메일주소, 휴대폰번호로 이메일, 문자메시지 또는 모닥불톡 메시지를 보내는 등 기타 유효한 수단으로 통지 후 여러분의 모닥불계정 정보를 파기하거나 분리 보관할 수 있으며, 이로 인해 모닥불계정 서비스 이용을 위한 필수적인 정보가 부족할 경우 이용계약이 해지될 수도 있습니다.  이와 관련된 보다 자세한 사항은 모닥불 운영정책의 모닥불 서비스 휴면 정책 부분을 꼭 확인하시기 바랍니다.</li>
                    <li><span class="txt_num">③</span>이용계약이 해지되면 법령 및 개인정보 처리방침에 따라 여러분의 정보를 보유하는 경우를 제외하고는 여러분의 모닥불계정 정보 및 모닥불계정으로 이용하였던 개별 서비스 데이터는 삭제됩니다. 다만, 여러분이 개별 서비스 내에서 작성한 게시물 등 모든 데이터의 삭제와 관련한 사항은 개별 서비스의 약관에 따릅니다.</li>
                    <li><span class="txt_num">④</span>이용계약이 해지된 경우라도 여러분은 다시 회사에 대하여 이용계약의 체결을 신청할 수 있습니다.</li>
                </ul>
                <strong id="useterms05_16" class="tit_subject">제 16 조 (손해배상)</strong>
                <ul class="list_1depth">
                    <li><span class="txt_num">①</span>회사는 법령상 허용되는 한도 내에서 서비스와 관련하여 본 약관에 명시되지 않은 어떠한 구체적인 사항에 대한 약정이나 보증을 하지 않습니다. 또한, 회사는 CP(Contents Provider)가 제공하거나 회원이 작성하는 등의 방법으로 서비스에 게재된 정보, 자료, 사실의 신뢰도, 정확성 등에 대해서는 보증을 하지 않으며, 회사의 과실 없이 발생된 여러분의 손해에 대하여는 책임을 부담하지 아니합니다.</li>
                    <li><span class="txt_num">②</span>회사는 회사의 과실로 인하여 여러분이 손해를 입게 될 경우 본 약관 및 관련 법령에 따라 여러분의 손해를 배상하겠습니다. 다만 회사는 회사의 과실 없이 발생된 아래와 같은 손해에 대해서는 책임을 부담하지 않습니다. 또한 회사는 법률상 허용되는 한도 내에서 간접 손해, 특별 손해, 결과적 손해, 징계적 손해, 및 징벌적 손해에 대한 책임을 부담하지 않습니다.
                        <ul class="list_2depth_type2">
                            <li><span class="txt_num">1.</span>천재지변 또는 이에 준하는 불가항력의 상태에서 발생한 손해</li>
                            <li><span class="txt_num">2.</span>여러분의 귀책사유로 서비스 이용에 장애가 발생한 경우</li>
                            <li><span class="txt_num">3.</span>서비스에 접속 또는 이용과정에서 발생하는 개인적인 손해</li>
                            <li><span class="txt_num">4.</span>제3자가 불법적으로 회사의 서버에 접속하거나 서버를 이용함으로써 발생하는 손해</li>
                            <li><span class="txt_num">5.</span>제3자가 회사 서버에 대한 전송 또는 회사 서버로부터의 전송을 방해함으로써 발생하는 손해</li>
                            <li><span class="txt_num">6.</span>제3자가 악성 프로그램을 전송 또는 유포함으로써 발생하는 손해</li>
                            <li><span class="txt_num">7.</span>전송된 데이터의 생략, 누락, 파괴 등으로 발생한 손해, 명예훼손 등 제3자가 서비스를 이용하는 과정에서 발생된 손해</li>
                            <li><span class="txt_num">8.</span>기타 회사의 고의 또는 과실이 없는 사유로 인해 발생한 손해</li>
                        </ul>
                    </li>
                </ul>
                <strong id="useterms05_17" class="tit_subject">제 17 조 (분쟁의 해결)</strong>
                <p class="desc_g">
                    본 약관 또는 서비스는 대한민국법령에 의하여 규정되고 이행됩니다. 서비스 이용과 관련하여 회사와 여러분 간에 분쟁이 발생하면 이의 해결을 위해 성실히 협의할 것입니다. 그럼에도 불구하고 해결되지 않으면 민사소송법상의 관할법원에 소를 제기할 수 있습니다.
                </p>
                <ul class="list_2depth">
                    <li>공고일자 : 2021년 06월 15일</li>
                    <li>시행일자 : 2021년 06월 18일</li>
                </ul>
                <div class="wrap_btn">
                    <a href="/policy/pollicy?tab=terms" target="_blank" class="btn_step btn_with">변경 전 모닥불계정 약관 보기<span class="ico_corp ico_arr"></span></a>
                </div>
            </div>
            <!-- 2021-06-18 모닥불계정 약관 끝 -->
                         </div>
	
               		</div> <!-- area content-->
           		</div>  <!-- wrapper terms content-->
           		
           		
           		
           		
           		
           		
					<div class="wrap_cont wrap_notices" id="tab-2">
						<div class="area_tit">
							<h4 class="tit_corp">모닥불 서비스 <br>위치기반서비스 이용약관</h4>
						</div>
						<div class="table-wrapper">
		                    <div class="tbl_comm fst tbl_public">
		                   		<div class="wrap_terms">
					                <h4 class="tit_subject fst">제 1 조 (목적)</h4>
					                <p class="desc_g">
					                    본 약관은 주식회사 모닥불(이하 &#34;회사&#34;)가 제공하는 위치기반서비스에 대해 회사와 위치기반서비스를 이용하는 개인위치정보주체(이하 &#34;이용자&#34;)간의 권리·의무 및 책임사항, 기타 필요한 사항 규정을 목적으로 합니다.
					
					                </p>
					                <h4 class="tit_subject">제 2 조 (이용약관의 효력 및 변경)</h4>
					                <ul class="list_1depth">
					                    <li><span class="txt_num">①</span>본 약관은 이용자가 본 약관에 동의하고 회사가 정한 절차에 따라 위치기반서비스의 이용자로 등록됨으로써 효력이 발생합니다.</li>
					                    <li><span class="txt_num">②</span>회사는 법률이나 위치기반서비스의 변경사항을 반영하기 위한 목적 등으로 약관을 수정할 수 있습니다.</li>
					                    <li><span class="txt_num">③</span>약관이 변경되는 경우 회사는 변경사항을 최소 7일 전에 회사의 홈페이지 등 기타 공지사항 페이지를 통해 게시합니다.</li>
					                    <li><span class="txt_num">④</span>단, 개정되는 내용이 이용자 권리의 중대한 변경이 발생하는 경우에는 30일 전에 게시하도록 하겠습니다.</li>
					                </ul>
					                <h4 class="tit_subject">제 3 조 (약관 외 준칙) </h4>
					                <p class="desc_g">
					                    이 약관에 명시되지 않은 사항에 대해서는 위치 정보의 보호 및 이용 등에 관한 법률, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관계법령 및 회사가 정한 지침 등의 규정에 따릅니다.
					                </p>
					                <h4 class="tit_subject">제 4 조 (서비스의 내용)</h4>
					                <p class="desc_g">
					                    회사는 직접 수집하거나 위치정보사업자로부터 수집한 이용자의 현재 위치 또는 현재 위치가 포함된 지역을 이용하여 아래와 같은 위치기반서비스를 제공합니다.
					                </p>
					                <ul class="list_1depth">
					                    <li><span class="txt_num">①</span>위치정보를 활용한 정보 검색결과 및 콘텐츠를 제공하거나 추천</li>
					                    <li><span class="txt_num">②</span>생활편의를 위한 위치 공유, 위치/지역에 따른 알림, 경로 안내</li>
					                    <li><span class="txt_num">③</span>위치기반의 컨텐츠 분류를 위한 콘텐츠 태깅(Geotagging)</li>
					                    <li><span class="txt_num">④</span>위치기반의 맞춤형 광고</li>
					                </ul>
					                <h4 class="tit_subject">제 5 조 (서비스 이용요금)</h4>
					                <p class="desc_g">
					                    회사가 제공하는 위치기반서비스는 무료입니다.<br>단, 무선 서비스 이용 시 발생하는 데이터 통신료는 별도이며, 이용자가 가입한 각 이동통신사의 정책에 따릅니다.
					                </p>
					                <h4 class="tit_subject">제 6 조 (서비스 이용의 제한·중지)</h4>
					                <ul class="list_1depth">
					                    <li><span class="txt_num">①</span>회사는 위치기반서비스사업자의 정책변경 등과 같이 회사의 제반사정 또는 법률상의 이유로 위치기반서비스를 유지할 수 없는 경우 위치기반서비스의 전부 또는 일부를 제한·변경·중지할 수 있습니다.</li>
					                    <li><span class="txt_num">②</span>단, 위 항에 의한 위치기반서비스 중단의 경우 회사는 사전에 회사 홈페이지 등 기타 공지사항 페이지를 통해 공지하거나 이용자에게 통지합니다.</li>
					                </ul>
					                <h4 class="tit_subject">제 7 조 (개인위치정보주체의 권리)</h4>
					                <ul class="list_1depth">
					                    <li><span class="txt_num">①</span>이용자는 언제든지 개인위치정보의 수집·이용·제공에 대한 동의 전부 또는 일부를 유보할 수 있습니다.</li>
					                    <li><span class="txt_num">②</span>이용자는 언제든지 개인위치정보의 수집·이용·제공에 대한 동의 전부 또는 일부를 철회할 수 있습니다. 이 경우 회사는 지체 없이 철회된 범위의 개인위치정보 및 위치정보 수집·이용·제공사실 확인자료를 파기합니다.</li>
					                    <li><span class="txt_num">③</span>이용자는 개인위치정보의 수집·이용·제공의 일시적인 중지를 요구할 수 있으며, 이 경우 회사는 이를 거절할 수 없고 이를 충족하는 기술적 수단을 마련합니다.</li>
					                    <li><span class="txt_num">④</span>이용자는 회사에 대하여 아래 자료에 대한 열람 또는 고지를 요구할 수 있으며, 해당 자료에 오류가 있는 경우에는 정정을 요구할 수 있습니다. 이 경우 정당한 사유 없이 요구를 거절하지 않습니다.</li>
					                        <ul class="list_2depth_type2">
					                            <li><span class="txt_num">1.</span>이용자에 대한 위치정보 수집·이용·제공사실 확인자료</li>
					                            <li><span class="txt_num">2.</span>이용자의 개인위치정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법령의 규정에 의하여 제3자에게 제공된 이유 및 내용</li>
					                        </ul>
					                    <li><span class="txt_num">⑤</span>이용자는 권리행사를 위해 본 약관 제14조의 연락처를 이용하여 회사에 요청할 수 있습니다.</li>
					                </ul>
					                <h4 class="tit_subject">제 8 조 (개인위치정보의 이용 또는 제공)</h4>
					                <ul class="list_1depth">
					                    <li><span class="txt_num">①</span>회사는 개인위치정보를 이용하여 위치기반서비스를 제공하는 경우 본 약관에 고지하고 동의를 받습니다.</li>
					                    <li><span class="txt_num">②</span>회사는 이용자의 동의 없이 개인위치정보를 제3자에게 제공하지 않으며, 제3자에게 제공하는 경우에는 제공받는 자 및 제공목적을 사전에 이용자에게 고지하고 동의를 받습니다.</li>
					                    <li><span class="txt_num">③</span>회사는 개인위치정보를 이용자가 지정하는 제3자에게 제공하는 경우 개인위치정보를 수집한 통신단말장치로 매회 이용자에게 제공받는 자, 제공일시 및 제공목적을 즉시 통지합니다.</li>
					                    <li><span class="txt_num">④</span>단, 아래의 경우 이용자가 미리 특정하여 지정한 통신단말장치 또는 전자우편주소, 온라인게시 등으로 통지합니다.</li>
					                    <ul class="list_2depth_type2">
					                        <li><span class="txt_num">1.</span>개인위치정보를 수집한 당해 통신단말장치가 문자, 음성 또는 영상의 수신기능을 갖추지 아니한 경우</li>
					                        <li><span class="txt_num">2.</span>이용자의 개인위치정보를 수집한 통신단말장치 외의 통신단말장치 또는 전자우편주소, 온라인게시 등으로 통보할 것을 미리 요청한 경우</li>
					                    </ul>
					                    <li><span class="txt_num">⑤</span>회사는 위치정보의 보호 및 이용 등에 관한 법률 제16조 제2항에 근거하여 개인위치정보 수집·이용·제공사실 확인자료를 자동으로 기록·보존하며, 해당 자료는 6개월간 보관합니다.</li>
					                </ul>
					                <a href="/policy/policy?tab=notices" target="_blank" class="btn_step btn_with">위치정보 제공 현황 자세히 보기<span class="ico_corp ico_arr"></span></a> <!-- 2019-07-09 링크 추가 -->
					                <h4 class="tit_subject">제 9 조 (법정대리인의 권리)</h4>
					                <p class="desc_g">
					                    회사는 14세 미만의 이용자에 대해서는 개인위치정보를 이용한 위치기반서비스 제공 및 개인위치정보의 제3자 제공에 대한 동의를 이용자 및 이용자의 법정대리인으로부터 동의를 받아야 합니다. 이 경우 법정대리인은 본 약관 제7조에 의한 이용자의 권리를 모두 가집니다.
					                </p>
					                <h4 class="tit_subject">제 10 조 (8세 이하의 아동 동의 보호의무자의 권리)</h4>
					                <ul class="list_1depth">
					                    <li><span class="txt_num">①</span>회사는 아래의 경우에 해당하는 자(이하 “8세 이하의 아동 등”)의 위치정보의 보호 및 이용 등에 관한 법률 제26조2항에 해당하는 자(이하 “보호의무자”)가 8세 이하의 아동 등의 생명 또는 신체보호를 위하여 개인위치정보의 이용 또는 제공에 동의하는 경우에는 본인의 동의가 있는 것으로 봅니다.</li>
						                    <ul class="list_2depth_type2">
						                        <li><span class="txt_num">1.</span>8세 이하의 아동</li>
						                        <li><span class="txt_num">2.</span>피성년후견인</li>
						                        <li><span class="txt_num">3.</span>장애인복지법 제2조제2항제2호에 따른 정신적 장애를 가진 사람으로서 장애인고용촉진 및 직업재활법 제2조제2호에 따른 중증장애인에 해당하는 사람(장애인복지법 제32조에 따라 장애인 등록을 한 사람만 해당한다)</li>
						                    </ul>
					                    <li><span class="txt_num">②</span>8세 이하의 아동 등의 생명 또는 신체의 보호를 위하여 개인위치정보의 이용 또는 제공에 동의를 하고자 하는 보호의무자는 서면동의서에 보호의무자임을 증명하는 서면을 첨부하여 회사에 제출하여야 합니다.</li>
					                    <li><span class="txt_num">③</span>보호의무자는 8세 이하의 아동 등의 개인위치정보 이용 또는 제공에 동의하는 경우 본 약관 제7조에 의한 이용자의 권리를 모두 가집니다.</li>
					                </ul>
					                <h4 class="tit_subject">제 11 조 (손해배상)</h4>
					                <p class="desc_g">
					                    회사의 위치정보의 보호 및 이용 등에 관한 법률 제15조 및 26조의 규정을 위반한 행위로 인해 손해를 입은 경우 이용자는 회사에 손해배상을 청구할 수 있습니다. 회사는 고의, 과실이 없음을 입증하지 못하는 경우 책임을 면할 수 없습니다.
					                </p>
					                <h4 class="tit_subject">제 12 조 (면책)</h4>
					                <ul class="list_1depth">
					                    <li><span class="txt_num">①</span>회사는 다음 각 호의 경우로 위치기반서비스를 제공할 수 없는 경우 이로 인하여 이용자에게 발생한 손해에 대해서는 책임을 부담하지 않습니다.
					                        <ul class="list_2depth_type2">
					                            <li><span class="txt_num">1.</span>천재지변 또는 이에 준하는 불가항력의 상태가 있는 경우</li>
					                            <li><span class="txt_num">2.</span>위치기반서비스 제공을 위하여 회사와 서비스 제휴계약을 체결한 제3자의 고의적인 서비스 방해가 있는 경우</li>
					                            <li><span class="txt_num">3.</span>이용자의 귀책사유로 위치기반서비스 이용에 장애가 있는 경우</li>
					                            <li><span class="txt_num">4.</span>제1호 내지 제3호를 제외한 기타 회사의 고의·과실이 없는 사유로 인한 경우</li>
					                        </ul>
					                    </li>
					                    <li><span class="txt_num">②</span>회사는 위치기반서비스 및 위치기반서비스에 게재된 정보, 자료, 사실의 신뢰도, 정확성 등에 대해서는 보증을 하지 않으며 이로 인해 발생한 이용자의 손해에 대하여는 책임을 부담하지 아니합니다.</li>
					                </ul>
					                <h4 class="tit_subject">제 13 조 (분쟁의 조정 및 기타)</h4>
					                <ul class="list_1depth">
					                    <li><span class="txt_num">①</span>회사는 위치정보와 관련된 분쟁의 해결을 위해 이용자와 성실히 협의합니다.</li>
					                    <li><span class="txt_num">②</span>전항의 협의에서 분쟁이 해결되지 않은 경우, 회사와 이용자는 위치정보의 보호 및 이용 등에 관한 법률 제28조의 규정에 의해 방송통신위원회에 재정을 신청하거나, 개인정보보호법 제43조의 규정에 의해 개인정보 분쟁조정위원회에 조정을 신청할 수 있습니다.</li>
					                </ul>
					                <h4 class="tit_subject">제 14 조 (회사의 주소 및 연락처)</h4>
					                <p class="desc_g">회사의 상호, 주소 및 연락처는 아래와 같습니다.</p>
					                <ul class="list_2depth">
					                    <li>상호 : 주식회사 모닥불</li>
					                    <li>대표 : 천기훈 | 팀원 : 방준호, 홍아현, 송승훈, 고희광</li>
					                    <li>주소 : 서울특별시 강남구 테헤란로 146</li>
					                    <li>대표전화 : 1111-223X</li>
					                </ul>
					                <h4 class="tit_subject">부칙</h4>
					                <strong class="tit_subject">제 1 조 (시행일)</strong>
					                <p class="desc_g">본 약관은 2021년 3월 2일부터 시행됩니다.</p>
					                <strong class="tit_subject">제 2 조 (위치정보관리책임자 정보)</strong>
					                <p class="desc_g">
					                    회사는 개인위치정보를 적절히 관리·보호하고, 이용자의 불만을 원활히 처리할 수 있도록 실질적인 책임을 질 수 있는 지위에 있는 자를 위치정보관리책임자로 지정해 운영하고 있으며, 위치정보관리책임자는 위치기반서비스를 제공하는 부서의 부서장으로서 성명과 연락처는 아래와 같습니다.
					                </p>
					                <ul class="list_2depth">
					                    <li>성명 : 천기훈</li>
					                    <li>대표전화 : 1111-223X</li>
					                    <li>위치정보 전용문의 게시판 :
					
					                        
					                            <a href="/policy/policy?tab=notices" class="link_policy">/policy/policy?tab=location</a>
					                        
					                        
					
					
					
					                    </li>
					                </ul>
					                <div class="wrap_btn">
					                    <!-- <a href="#none" target="_blank" class="btn_step btn_with">[별표1] 위치기반서비스의 종류 및 요금<span class="ico_corp ico_arr"></span></a> -->
					                    <a href="/policy/policy?tab=notices" target="_blank" class="btn_step btn_with">변경 전 위치기반서비스 이용약관 보기<span class="ico_corp ico_arr"></span></a>
					                </div>
					            </div>
		                    </div>
	                    </div>
						
						
					</div>
					<div class="wrap_cont wrap_notices" id="tab-3">
						<div class="area_tit">
							<h4 class="tit_corp">모닥불 서비스 <br>개인정보처리방침</h4>
						</div>
						<div class="table-wrapper">
		                    <div class="tbl_comm fst tbl_public">
		                    
		                    </div>
	                    </div>
					</div>
					<div class="wrap_cont wrap_notices" id="tab-4">
						<div class="area_tit">
							<h4 class="tit_corp">모닥불 서비스 <br>운영정책</h4>
						</div>
						<div class="table-wrapper">
		                    <div class="tbl_comm fst tbl_public">
		                    
		                    </div>
	                    </div>
					</div>
					<div class="wrap_cont wrap_notices" id="tab-5">
						<div class="area_tit">
							<h4 class="tit_corp">모닥불 서비스 <br>권리침해신고안내</h4>
						</div>
						<div class="table-wrapper">
		                    <div class="tbl_comm fst tbl_public">
		                    
		                    </div>
	                    </div>
					</div>
					
					
					
					
					
					
					
					<!-- ----------공지사항----------- -->
				<div class="wrap_cont wrap_notices" id="tab-6">
	                <div class="area_tit">
	                    <h4 class="tit_corp">모닥불 서비스 <br>공지사항</h4>
	                </div>
	                <div class="table-wrapper">
	                    <div class="tbl_comm fst tbl_public">
	                        <table class="tbl tbl_type2">
	                            <thead>
	                            <tr>
	                                <th id="tbl_title">내용</th>
	                                <th id="tbl_regdate">등록일</th>
	                            </tr>
	                            </thead>
	                            <!-- posts -->
	                            <tbody>
	                            <c:forEach var="policy" items="${list}" begin="0" step="1">
	                                <tr>
	                                    <td class="ta_left" id="tbl_title2">
	                                        <div class="inner_cell">
	                                        <span class="txt_public">
	                                            <a href="javascript: view(${policy.bno}, ${pageMaker.cri.pageNum},${pageMaker.cri.amount});" class="loss_word link_txt">
	                                                    ${policy.title}
	                                            </a>
	                                                <c:if test="${policy.regDate > nowday}"><i class="material-icons">fiber_new</i><%-- <i class="fas fa-heart"></i> --%></c:if>
	                                        </span>
	                                        </div>
	                                    </td>
	                                    <td id="tbl_regdate2">
	                                    	<div class="inner_cell">${policy.updateDate}</div>
	                                   	</td>
	                                </tr>
                                </c:forEach>
	                            </tbody>
	                        </table>
						<footer>
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
						</footer>
						<div class="sch_comm">
	                        <form class="sch_form" name="searchForm" id="searchForm" action="/policy/policy">
	                            <fieldset>
	                                <legend class="screen_out">검색어 입력폼</legend>
	                                <input type="text" id="search_word" name="keyword" class="inp_keyword" title="검색어" value="" placeholder="검색">
	                                <a href="javascript:void(0)" class="fas fa-search" style="padding-top: 5%; position: absolute;"></a>
	                            </fieldset>
								<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
								<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
								<input type="hidden" name="tab" value="${pageMaker.cri.tab}">
	                        </form>
	                    </div>
	                    </div>
	
							<form id="actionForm" action="/policy/policy">
								<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
								<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
								<%-- <input type="hidden" name="type" value="${pageMaker.cri.type}">
								<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"> --%>
								<input type="hidden" name="tab" value="${pageMaker.cri.tab}">
								<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
								<input type="hidden" name="check" value="${check}">
							</form>
	
               		</div> <!-- area content-->
           		</div>  <!-- wrapper notices content-->
           		 
			</div> <!-- mArticle-->
		</div> <!-- inner-->
	</div> <!-- wrapper -->
</div>  <!-- main end-->
		


		<jsp:include page="../includes/footer.jsp"/>
		<script src="/resources/assets/js/modal.js"></script>
	</body>
	<script>
		$(document).ready(function () {
			
				var tab = "${pageMaker.cri.tab}";
				var on = $(this).parents("li");
				var ons = $(".tab_policy li");
				
			$('ul.tab_policy li').click(function(){
				var tab_id = $(this).attr('data-tab');

				/* $('ul.tab_policy li').removeClass('current'); */

				for(let i=0; i<ons.length; i++){
					if($(ons[i]).attr("class") == "current"){
						ons.removeClass("current");
						$('.wrap_cont').removeClass('current');
					}
				}	
				$("#"+tab_id).addClass('current');
				$(this).addClass('current');
				window.location.href("/policy/policy?tab=" + tab);
			
			});

			/* p > iframe.note-video-clip {
				object-fit: contain !important;
				width: 100% !important;
			} */
			
			$('iframe').css('object-fit','contain !important');
			$('iframe').css('width','100% !important');
			
			
			
/* 				
			$(".link_policy").on("click", function(){
				var on = $(this).parents("li");
				var ons = $(".tab_policy li");
				for(let i=0; i<ons.length; i++){
					if($(ons[i]).attr("class") == "on"){
						ons.removeClass("on");
					}
					on.addClass("on");
					location.href("/policy/policy?tab=" + tab);
				}			
				
			});
 */			
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
 			location.replace("/policy/policy${pageMaker.cri.getListLink()}");
 		}
     }
	
	function view(bno, pageNum, amount){
		if ("${sessionId}" == ""){
			alert("로그인 후 이용해 주십시오.");
			goSignIn();
		}else{
			location.replace("/policy/policyView?bno="+bno+"&pageNum="+pageNum+"&amount="+amount);
		}
	}

	</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/assets/css/layout.css"/>
<style>
	.loginModal {
		height: 500px;
	}
	#kakaoImageLarge {
		display: none;
	}
	#kakaoImage {
		display: inline;
	}
	#loginBtn {
		width: 187px;
	}
	@media screen and (max-width:480px) {
		#kakaoImageLarge {
			display: inline;
		}
		#kakaoImage {
			display: none;
		}
		#loginBtn {
			width: 100%;
		}
	}
</style>
</head>
<body>
	<!-- Header -->
			<header id="header" style="height: 7em; position: absolute; background:#00000000;">
				<!-- Nav -->
					<nav id="nav">
						<ul>
							<li class="current"><a href="index.html">Home</a></li>
							<li>
								<a href="#" class="dropdown">Dropdown</a>
								<ul>
									<li><a href="#">Option One</a></li>
									<li><a href="#">Option Two</a></li>
									<li><a href="#">Option Three</a></li>
									<li>
										<a href="#">Submenu</a>
										<ul>
											<li><a href="#">Option One</a></li>
											<li><a href="#">Option Two</a></li>
											<li><a href="#">Option Three</a></li>
											<li><a href="#">Option Four</a></li>
										</ul>
									</li>
								</ul>
							</li>
							<li><a href="generic.html">Generic</a></li>
							<li><a href="elements.html">Elements</a></li>
						</ul>
					</nav>
				<!-- Logo -->
					<!-- <a class="logo" href="index.html">Momentum <span>by Pixelarity</span></a> -->
			</header>
			
			
			<div class="modal-wrapper">
				<div class="modal loginModal">
					<div class="head-pop"><h2>로그인</h2>
					</div>
					<form name="" action="#" method="" >
						<div class="row gtr-uniform">
							<div class="col-10 col-11-xsmall" style="margin: 0 auto; margin-top: 10%;">
								<label for="userId">아이디</label>
								<input type="text" name="userId" id="userId" placeholder="ID">
								<label for="userPw" style="margin-top: 15px;">비밀번호</label>
								<input type="password" name="userPw" id="userPw" placeholder="PASSWARD">
								<div><a style="text-decoration: none;">회원가입</a>&nbsp;&nbsp;&nbsp;<a style="text-decoration: none;">아이디/비밀번호 찾기</a></div>
								<ul class="actions" style="margin-top: 5%;">
									<li style="margin-left: auto;">
										<a><img id="kakaoImage" style="height: 46px;" src="/resources/images/kakaoLogin.png"></a>
										<a><img id="kakaoImageLarge" style="height: 46px; width: 100%;" src="/resources/images/kakaoLoginLarge.png"></a>
									</li>
									<li style="margin-right: auto;">
										<a class="button primary" id="loginBtn" style="border-radius: 6px; height: 46px;">로그인</a>
									</li>
								</ul>
							</div>        
						</div>
					</form>
				</div>
			</div>
</body>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
			<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script>
	$(document).ready(function () {
    $('.fa-findid').on('click', function () {
        $('.modal-wrapper').toggleClass('open');
        $('.page-wrapper').toggleClass('blur-it');
        return false;
    });
});

$(document).ready(function () {
    $('.fa-find').on('click', function () {
        $('.modal-wrapper').toggleClass('open');
        $('.page-wrapper').toggleClass('blur-it');
        return false;
    });
});

</script>
</html>
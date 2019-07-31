<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BASIC</title>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>

<link rel="stylesheet" type="text/css"
	href="${cp}/resource/wrap/css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="${cp}/resource/wrap/css/dropdownnav.css" />
</head>
	

<header class="header-area">
	<div id="header" id="home" class="header-scrolled2">
		<div class="container">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<a href="index.html"></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li class="menu-active"><a href="index.html">Home</a></li>
						<li><a href="departments.html">회사소개</a></li>
						<li><a href="departments.html">마이페이지</a></li>
						<li><a href="#">요양 정보</a>
							<ul>
<%-- 								<li><a href="${cp}/basicU/main">요양보호소찾기 </a></li> --%>
								<li><a href="${cp}/basicU/findingCareWorker">요양원/요양병원
										찾기</a></li>
								<li><a href="${cp}/basicU/findingCareWorker">기관 정보 조회</a></li>
							</ul></li>

						<li class="menu-has-children"><a href="">커뮤니티</a>
							<ul>
								<li><a href="about.html">공지사항</a></li>
								<li><a href="about.html">자유게시판</a></li>
								<li><a href="elements.html">QnA</a></li>
							</ul></li>


						<li class="menu-has-children"><a href="">건강정보</a>
							<ul>
								<li><a href="blog-home.html">인지 능력 향상 프로그램</a></li>
								<li><a href="blog-home.html">인지테스트</a></li>
								<li><a href="blog-home.html">스트레스 지수 </a></li>
								<li><a href="blog-home.html">수면상태</a></li>
								<li><a href="blog-home.html">GPS</a></li>
							</ul></li>

						<li class="menu-has-children"><a href="">기타 문화 정보</a>
							<ul>
								<li><a href="blog-home.html">무더위 쉼터</a></li>
								<li><a href="blog-home.html">문화시설</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<br>
	<hr>
</header>


	<br>
	<br>
	<br>

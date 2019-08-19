<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage navigation bar</title>

<style>
.ko {
	color: white !important;
}
</style>
</head>
<body>

	<nav
		class="navbar navbar-default col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
		<div class="navbar-menu-wrapper d-flex align-items-center">
			<button class=" navbar-toggler   navbar-dark align-self-center mr-5"
				type="button" data-toggle="minimize">

				<div id="header" class="header-scrolled2">
					<div class="container">
						<div class="row  justify-content-between d-flex">
							<div id="logo">
								<a href="index.html"></a>

							</div>
							<nav id="nav-menu-container">
								<ul class="nav-menu" style="color: white;">


									<li><a class="ko" href="${cp}/main">Home</a></li>
									<li><a class="ko" href="departments.html">마이페이지</a></li>
									<li><a class="ko" href="#">요양 정보</a>
										<ul>
											<li><a href="${cp}/basicU/main">요양보호소 찾기 </a></li>
											<li><a href="${cp}/hospital/pagingList?page=1&pageSize=10">요양원/요양병원
													찾기</a></li>
											<li><a href="${cp}/nursingHome/pagingList?page=1&pageSize=10">기관 정보
													조회</a></li>
										</ul></li>

									<li><a class="ko" href="">커뮤니티</a>
										<ul>
											<li><a href="about.html">공지사항</a></li>
											<li><a href="about.html">자유게시판</a></li>
											<li><a href="elements.html">QnA</a></li>
										</ul></li>


									<li><a class="ko" href="">건강정보</a>
										<ul>
											<li><a href="blog-home.html">인지 능력 향상 프로그램</a></li>
											<li><a href="blog-home.html">인지테스트</a></li>
											<li><a href="${cp}/mypage/stress?mem_id=${MEM_INFO.mem_id}">스트레스 지수 </a></li>
											<li><a href="${cp}/mypage/gpxMap?mem_id=${MEM_INFO.mem_id}">GPS 정보</a></li>
											<li><a href="blog-home.html">GPS</a></li>
										</ul></li>

									<li><a class="ko" href="">기타 문화 정보</a>
										<ul>
											<li><a href="${cp }/shelter/pagingList?page=1&pageSize=10">무더위 쉼터</a></li>
											<li><a href="blog-home.html">문화시설</a></li>

										</ul>
										
									</li>



									<li> <a class="ko" style="position: absolute; left:80%; " href="/logout">로그아웃</a></li>

								</ul>
							</nav>
						</div>
					</div>
				</div>
				<hr>
				<br>
			</button>
		</div>
	</nav>

</body>
</html>
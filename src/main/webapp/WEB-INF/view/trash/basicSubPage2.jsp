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
								<li><a
									href="${cp}/basicU/main">요양보호소
										찾기 </a></li>
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
</head>
<body>



	<%@include file="/WEB-INF/view/common/sideBar.jsp"%>


	<br>
	<br>
	<br>

	<section class="blog_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="blog_left_sidebar">
						<article class="row blog_item">
							<div class="col-md-3">
								<div class="blog_info text-right" style="border: 2px; background-color: red;">
								
								</div>
							</div>
							<div class="col-md-9">
								<div class="blog_post">
								
									<div class="blog_details" style="border: 2px; background-color: red;">
										
									</div>
								</div>
							</div>
						</article>
						<article class="row blog_item">
							<div class="col-md-3">
								<div class="blog_info text-right"  style="border: 2px; background-color: red;">
									
								</div>
							</div>
							<div class="col-md-9">
								<div class="blog_post" style="border: 2px; background-color: red;">
									
								</div>
							</div>
						</article>
						<article class="row blog_item" style="border: 2px; background-color: red;">
						
						</article>
						<article class="row blog_item">
							<div class="col-md-3">
								<div class="blog_info text-right">
									<div class="post_tag">
										<a href="#">Food,</a> <a class="active" href="#">Technology,</a>
										<a href="#">Politics,</a> <a href="#">Lifestyle</a>
									</div>
									<ul class="blog_meta list">
										<li><a href="#">Mark wiens<i class="fa fa-user-o"></i></a></li>
										<li><a href="#">12 Dec, 2017<i
												class="fa fa-calendar-o"></i></a></li>
										<li><a href="#">1.2M Views<i class="fa fa-eye"></i></a></li>
										<li><a href="#">06 Comments<i class="fa fa-comment-o"></i></a></li>
									</ul>
								</div>
							</div>
							<div class="col-md-9">
								<div class="blog_post">
									<img
										src="${cp}/resource/medino/assets/images/blog/main-blog/m-blog-4.jpg"
										alt="">
									<div class="blog_details">
										<a href="blog-details.html"><h4>The Night Sky</h4></a>
										<p>MCSE boot camps have its supporters and its detractors.
											Some people do not understand why you should have to spend
											money on boot camp when you can get the MCSE study materials
											yourself at a fraction.</p>
										<a href="blog-details.html" class="template-btn">View More</a>
									</div>
								</div>
							</div>
						</article>
						<article class="row blog_item">
							<div class="col-md-3">
								<div class="blog_info text-right">
									<div class="post_tag">
										<a href="#">Food,</a> <a class="active" href="#">Technology,</a>
										<a href="#">Politics,</a> <a href="#">Lifestyle</a>
									</div>
									<ul class="blog_meta list">
										<li><a href="#">Mark wiens<i class="fa fa-user-o"></i></a></li>
										<li><a href="#">12 Dec, 2017<i
												class="fa fa-calendar-o"></i></a></li>
										<li><a href="#">1.2M Views<i class="fa fa-eye"></i></a></li>
										<li><a href="#">06 Comments<i class="fa fa-comment-o"></i></a></li>
									</ul>
								</div>
							</div>
							<div class="col-md-9">
								<div class="blog_post">
									<img
										src="${cp}/resource/medino/assets/images/blog/main-blog/m-blog-5.jpg"
										alt="">
									<div class="blog_details">
										<a href="blog-details.html"><h4>Telescopes 101</h4></a>
										<p>MCSE boot camps have its supporters and its detractors.
											Some people do not understand why you should have to spend
											money on boot camp when you can get the MCSE study materials
											yourself at a fraction.</p>
										<a href="blog-details.html" class="template-btn">View More</a>
									</div>
								</div>
							</div>
						</article>
						<nav class="blog-pagination justify-content-center d-flex" style="border: 2px; background-color: red;">
						
						</nav>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget">
							<div class="input-group">
								<input type="text" class="form-control"> <span
									class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div>
							<!-- /input-group -->
							<div class="br"></div>



							<!-- 							rightbar -->

						</aside>
						<aside class="single_sidebar_widget author_widget" style="border: 2px; background-color: red;">
							
						</aside>
						<aside class="single_sidebar_widget popular_post_widget" style="border: 2px; background-color: red;">
							
						</aside>
						<aside class="single_sidebar_widget ads_widget" style="border: 2px; background-color: red;">
							
						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">Post Catgories</h4>
							<ul class="list cat-list">
								<li><a href="#" class="d-flex justify-content-between">
										<p>Technology</p>
										<p>37</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>Lifestyle</p>
										<p>24</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>Fashion</p>
										<p>59</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>Art</p>
										<p>29</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>Food</p>
										<p>15</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>Architecture</p>
										<p>09</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>Adventure</p>
										<p>44</p>
								</a></li>
							</ul>
							<div class="br"></div>
						</aside>
						<aside class="single-sidebar-widget newsletter_widget">
							<h4 class="widget_title">Newsletter</h4>
							<p>Here, I focus on a range of items and features that we use
								in life without giving them a second thought.</p>
							<div class="form-group d-flex flex-row">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fa fa-envelope" aria-hidden="true"></i>
										</div>
									</div>
									<input type="text" class="form-control"
										id="inlineFormInputGroup" placeholder="Enter email"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter email'">
								</div>
								<a href="#" class="bbtns">Subscribe</a>
							</div>
							<p class="text-bottom">You can unsubscribe at any time</p>
							<div class="br"></div>
						</aside>
						<aside class="single-sidebar-widget tag_cloud_widget">
							<h4 class="widget_title">Tag Clouds</h4>
							<ul class="list">
								<li><a href="#">Technology</a></li>
								<li><a href="#">Fashion</a></li>
								<li><a href="#">Architecture</a></li>
								<li><a href="#">Fashion</a></li>
								<li><a href="#">Food</a></li>
								<li><a href="#">Technology</a></li>
								<li><a href="#">Lifestyle</a></li>
								<li><a href="#">Art</a></li>
								<li><a href="#">Adventure</a></li>
								<li><a href="#">Food</a></li>
								<li><a href="#">Lifestyle</a></li>
								<li><a href="#">Adventure</a></li>
							</ul>
						</aside>
					</div>
				</div>
			</div>
		</div>
	</section>


</body>
</html>
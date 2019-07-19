<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>
</head>
<body>
	<%@include file="/WEB-INF/view/common/LibForMain.jsp"%>

	<!-- 베너영역 -->
	<section class="banner-area other-pageCC">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>YoroCare</h1>
					<a href="departments.html">NoincareYoroCare</a> <a
						href="departments.html">Home</a> <span>|</span> <a
						href="departments.html">Care World</a>
				</div>
			</div>
		</div>


	</section>


	<!-- Header Area Starts -->
	<header class="header-area">
		
<%@include file="/WEB-INF/view/common/top_Header.jsp"%>
		<div>
			<div class="container">
				<div class="row align-items-center justify-content-between d-flex">

					<div id="logo">
						<a href="departments.html"><img
							src="assets/images/logo/logo.png" alt="" title="" /></a>
					</div>

					<%@include file="/WEB-INF/view/common/navMenu.jsp"%>

				</div>

			</div>
		</div>
	</header>


	<!-- Map Area Starts -->
	<section class="map-area doa-padding4">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div id="mapBox" class="mapBox" data-lat="40.701083"
						data-lon="-74.1522848" data-zoom="13"
						data-info="PO Box CT16122 Collins Street West, Victoria 8007, Australia."
						data-mlat="40.701083" data-mlon="-74.1522848"></div>
				</div>
			</div>
		</div>
	</section>
	<!-- Map Area End -->






	<%@include file="/WEB-INF/view/common/footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>


<%@include file="/WEB-INF/view/common/joinCare.jsp"%>


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

	<header class="header-area">

		<%@include file="/WEB-INF/view/common/top_Header.jsp"%>
		<div>
			<div class="container">
				<div class="row align-items-center justify-content-between d-flex">


					<div id="logo">
						<a href="departments.html"><img
							src="assets/images/logo/logo.png" alt="" title="" /></a>
					</div>
					     <div style="position: absolute; left: 45%;">
                <%@include file="/WEB-INF/view/common/navMenu.jsp" %>
           </div>


				</div>

			</div>
		</div>
	</header>



<br>
<br>
<br>

	<div id="template-map">

		<section>

			<div class="map-right" style="position: absolute; left: 50%;">




				<p class="search-cnt ng-binding">검색결과 : 0개</p>

				<div id="map-right-scholl" class="map-right-scholl">
					<div>
						<p class="search-kind ng-binding">검색어표시</p>

						<div class="mobile_search ng-scope" style="display: none;">
							<div class="map-menu1">
								<div class="form-group form-inline input-group fl w70p mb0">
									<input type="text"
										class="input-txt ng-pristine ng-untouched ng-valid ng-not-empty"
										placeholder="원하는 지역명 입력">
									<button class="input-btn">찾아보기</button>

									<div class="select-address hidden">
										<select name="address" size="10"
											class="ng-pristine ng-untouched ng-valid ng-not-empty"><option
												value="? string:0 ?" selected="selected"></option>
										</select>
									</div>
								</div>
								<div class="search-check fr w30p">
									<button class="btn btn-link now-position">현재위치</button>
								</div>
							</div>
						</div>

						<div class="pl10 pr10 form-inline">

							<div class="mt10 ng-scope">

								<div class="btn-group">
									<button type="button" class="btn btn-default">요양보호사</button>
									<button type="button" class="btn btn-default">간병인</button>
									<button type="button" class="btn btn-default">방문요양</button>
									<button type="button" class="btn btn-default">//대분류
										직종표시</button>
								</div>



								<div class="panel panel-default mt10 mb0 p0">
									<div class="panel-heading">
										<div>상세검색</div>
									</div>
									<div class="panel-body p5 ng-hide">
										<div class="">
											<div class="">
												<div class="btn-group fl">
													<button type="button" class="btn btn-default active">전체</button>
													<button type="button" class="btn btn-default">구직중</button>
													<button type="button" class="btn btn-default">일하는중</button>
												</div>

												<div class="btn-group fl ml10">
													<button type="button" class="btn btn-default active">전체</button>
													<button type="button" class="btn btn-default">남</button>
													<button type="button" class="btn btn-default">여</button>
												</div>

												<div class="cb"></div>
											</div>

											<div class="btn-group mt5">
												<button type="button" class="btn btn-default">재가희망</button>
												<button type="button" class="btn btn-default">시설근무희망</button>
											</div>

											<div class="btn-group mt5">
												<button type="button" class="btn btn-default active">전체</button>
												<button type="button" class="btn btn-default">초보</button>
												<button type="button" class="btn btn-default">중견</button>
												<button type="button" class="btn btn-default">프로</button>
											</div>

											<div class="btn-group mt5">
												<button type="button" class="btn btn-default active">전체</button>
												<button type="button" class="btn btn-default">40세↓</button>
												<button type="button" class="btn btn-default">40~50세</button>
												<button type="button" class="btn btn-default">50~60세</button>
												<button type="button" class="btn btn-default">60세↑</button>
											</div>

											<div class="btn-group mt5">
												<button type="button" class="btn btn-default">주야간교대</button>
												<button type="button" class="btn btn-default">주간</button>
												<button type="button" class="btn btn-default">야간</button>
												<button type="button" class="btn btn-default">24시간</button>
												<button type="button" class="btn btn-default">입주</button>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>

						<div class="search-ul list-group">
							<a class="ng-scope"> 등록된 데이터가 없습니다. </a>
						</div>
					</div>
				</div>
			</div>
		</section>

	</div>

















</body>
</html>
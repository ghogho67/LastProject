<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>


<%@include file="/WEB-INF/view/common/joinCare.jsp"%>



<script type="text/javascript"
	src="https://ssl.google-analytics.com/ga.js"></script>
<script
	src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=9fab65e3b8ef15d7156eccedc229bee1&amp;libraries=services,clusterer,drawing"></script>
<script charset="UTF-8"
	src="https://t1.daumcdn.net/mapjsapi/js/main/4.1.5/kakao.js"></script>
<script charset="UTF-8"
	src="https://s1.daumcdn.net/svc/attach/U03/cssjs/mapapi/libs/1.0.1/1515130215283/services.js"></script>
<script charset="UTF-8"
	src="https://s1.daumcdn.net/svc/attach/U03/cssjs/mapapi/libs/1.0.6/1460434272434/clusterer.js"></script>
<script charset="UTF-8"
	src="https://t1.daumcdn.net/mapjsapi/js/libs/drawing/1.2.5/drawing.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>


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
					<%@include file="/WEB-INF/view/common/navMenu.jsp"%>

				</div>

			</div>
		</div>
	</header>



	<div id="template-map" style="height: 50%" class="ng-scope">
		<style>
body {
	overflow: hidden !important
}
</style>


		<section id="contents" style="height: 100%">
			<section style="height: 100%">
				<div id="map" class="map-main"
					style="float: left; width: calc(100% - 395px); height: calc(100% - 155px); position: relative;">
					<div class="angular-daum-map-container"></div>
					<div
						style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; touch-action: none; cursor: url(&quot;https://i1.daumcdn.net/dmaps/apis/cursor/openhand.cur.ico&quot;) 7 5, url(&quot;https://i1.daumcdn.net/dmaps/apis/cursor/openhand.cur.ico&quot;), default;">


						<section class="map-area doa-padding4">
							<div class="container">
								<div class="row">
									<div class="col-lg-10">
										<div id="mapBox" class="mapBox" data-lat="40.701083"
											data-lon="-74.1522848" data-zoom="13"
											data-info="PO Box CT16122 Collins Street West, Victoria 8007, Australia."
											data-mlat="40.701083" data-mlon="-74.1522848"></div>
									</div>
								</div>
							</div>
						</section>

					</div>

				</div>



				<div class="map-right">
					<p class="search-cnt ng-binding">검색결과 : 0개</p>

					<div id="map-right-scholl" class="map-right-scholl">
						<div>
							<p class="search-kind ng-binding">요양보호사</p>

							<div ng-if="path != undefiend &amp;&amp; path == '/map'"
								class="mobile_search ng-scope" style="display: none;">
								<div class="map-menu1">
									<div class="form-group form-inline input-group fl w70p mb0">
										<input type="text"
											class="input-txt ng-pristine ng-untouched ng-valid ng-not-empty"
											placeholder="원하는 지역명 입력">
										<button class="input-btn"
											ng-click="changeMapAddress(mapSrv.mapConfig.selectAddress)">찾아보기</button>

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

								<input type="text" name="search"
									class="form-control form-control-small map-search-input ng-pristine ng-untouched ng-valid ng-empty"
									placeholder="현재 지도내 시설명 검색">
								<button type="button" class="btn btn-default map-search-button"
								>검색</button>
								<div class="mt10 ng-scope">

									<div class="btn-group">
										<button type="button" class="btn btn-default"
											ng-click="search01Check(0)">요양보호사</button>
										<button type="button" class="btn btn-default"
											ng-click="search01Check(1)">간병인</button>
										<button type="button" class="btn btn-default"
											ng-click="search01Check(2)">사회복지사</button>
										<button type="button" class="btn btn-default"
											ng-click="search01Check(5)">간호사</button>
										<button type="button" class="btn btn-default"
											ng-click="search01Check(3)">간호조무사</button>
										<button type="button" class="btn btn-default"
											ng-click="search01Check(6)">물리치료사</button>
										<button type="button" class="btn btn-default"
											ng-click="search01Check(4)">기타직종</button>
									</div>

									<div class="panel panel-default mt10 mb0 p0">
										<div class="panel-heading">
											<div class="fl w50p">상세검색</div>
											<div class="fr w50p right">
												<button type="button" class="btn btn-default btn-small"
													ng-click="searchDetail=!searchDetail">
													<span 
														class="glyphicon glyphicon-chevron-down ng-scope"></span>
													<!-- end ngIf: !searchDetail -->
													<!-- ngIf: searchDetail -->
												</button>
											</div>
											<div class="cb"></div>
										</div>
										<div ng-show="searchDetail" class="panel-body p5 ng-hide">
											<div class="">
												<div class="">
													<div class="btn-group fl">
														<button type="button" class="btn btn-default active"
															ng-click="search01.careworker_status=''">전체</button>
														<button type="button" class="btn btn-default"
															ng-click="search01.careworker_status='Y'">구직중</button>
														<button type="button" class="btn btn-default"
															ng-click="search01.careworker_status='N'">일하는중</button>
													</div>

													<div class="btn-group fl ml10">
														<button type="button" class="btn btn-default active"
															ng-click="search01.gender=''">전체</button>
														<button type="button" class="btn btn-default"
															ng-click="search01.gender='M'">남</button>
														<button type="button" class="btn btn-default"
															ng-click="search01.gender='F'">여</button>
													</div>

													<div class="cb"></div>
												</div>

												<div class="btn-group mt5">
													<button type="button" class="btn btn-default"
														ng-click="search01.work_hope[0]=!search01.work_hope[0]">재가희망</button>
													<button type="button" class="btn btn-default"
														ng-click="search01.work_hope[1]=!search01.work_hope[1]">시설근무희망</button>
												</div>

												<div class="btn-group mt5">
													<button type="button" class="btn btn-default active"
														ng-click="search01.history=''">전체</button>
													<button type="button" class="btn btn-default"
														ng-click="search01.history='1'">초보</button>
													<button type="button" class="btn btn-default"
														ng-click="search01.history='2'">중견</button>
													<button type="button" class="btn btn-default"
														ng-click="search01.history='3'">프로</button>
												</div>

												<div class="btn-group mt5">
													<button type="button" class="btn btn-default active"
														ng-click="search01.birthdate=''">전체</button>
													<button type="button" class="btn btn-default"
														ng-click="search01.birthdate='1'">40세↓</button>
													<button type="button" class="btn btn-default"
														ng-click="search01.birthdate='2'">40~50세</button>
													<button type="button" class="btn btn-default"
														ng-click="search01.birthdate='3'">50~60세</button>
													<button type="button" class="btn btn-default"
														ng-click="search01.birthdate='4'">60세↑</button>
												</div>

												<div class="btn-group mt5">
													<button type="button" class="btn btn-default"
														ng-click="search01.work_type[0]=!search01.work_type[0]">주야간교대</button>
													<button type="button" class="btn btn-default"
														ng-click="search01.work_type[1]=!search01.work_type[1]">주간</button>
													<button type="button" class="btn btn-default"
														ng-click="search01.work_type[2]=!search01.work_type[2]">야간</button>
													<button type="button" class="btn btn-default"
														ng-click="search01.work_type[3]=!search01.work_type[3]">24시간</button>
													<button type="button" class="btn btn-default"
														ng-click="search01.work_type[4]=!search01.work_type[4]">입주</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- end ngIf: mapSrv.groupCode=='01' -->
							</div>

							<div class="search-ul list-group">
								<a class="ng-scope">
									등록된 데이터가 없습니다. </a>
							</div>
						</div>
					</div>
				</div>
			</section>

		</section>
	</div>

















</body>
</html>
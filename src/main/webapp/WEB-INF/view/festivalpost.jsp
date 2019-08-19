<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


<style type="text/css">
#titlee h2, #pzone h2 {
	font-size: 40px;
	font-weight: normal;
	letter-spacing: -1px;
}

#titlee h2 {
	padding: 5px 5px;
}

#titlee h2 span {
	font-weight: bold;
	color: #473fa0;
}

tr {
	text-align: center;
	font-weight: 500;
}

td {
	text-align: center;
}

.inputTitle {
	border-radius: 6px;
	background-color: transparent;
	width: 180px;
	height: 30px;
	padding: 3px;
	font-size: 8pt;
	text-align: center;
}

.kkk {
	background-color: transparent;
	border-color: transparent;
	width: 30px;
	padding: 3px;
	font-size: 9pt;
	width: 30px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dnxk8c7baj&submodules=geocoder"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>
	$(document).ready(function() {

		
		
		console.log('${vo.mapy}');
		console.log('${vo.mapx}');
		console.log('${vo.mlevel}');
		var position = new naver.maps.LatLng('${vo.mapy}','${vo.mapx}');

		var map = new naver.maps.Map('map', {
		    center: position,
		    zoom: 6
		});

		var markerOptions = {
		    position: position.destinationPoint(90, 15),
		    map: map,
		    icon: {
		        url: '${cp}/image/main.png',
		        size: new naver.maps.Size(50, 52),
		        origin: new naver.maps.Point(0, 0),
		        anchor: new naver.maps.Point(25, 26)
		    },
			animation : naver.maps.Animation.BOUNCE
		};

		var marker = new naver.maps.Marker(markerOptions);


	});
</script>

</head>
<body>


	<%@include file="/WEB-INF/view/common/subPageheader.jsp"%>
	<%@include file="/WEB-INF/view/common/subPagesideBar.jsp"%>

	<form action="${cp}/lecture/modifyLecture" method="post">


		<div class="container">

			<div style="padding-top: 50px; width: 1350px;">

				<div class="card">
					<div class="card-body">

						<div id="titlee">
							<h2>
								<span>${vo.title}</span>
							</h2>
						</div>
						<hr>



						<div class="row">
							<div class="col-lg-5 col-xlg-6 col-md-7">
								<div class="card">
									<div class="card-body">
										<div class="form-horizontal form-material">
											<div><img alt="" src="${vo.firstimage}" style="width: 100%; height: 400px;">
											</div>
											<br>
											<div id="map" style="width: 100%; height: 400px;"></div>
										</div>
									</div>
								</div>



							</div>
						

							<div class="col-lg-6 col-xlg-6 col-md-7">
								<div class="card">
									<div class="card-body">
										<div class="form-horizontal form-material">



											<div class="form-group">
												<label class="col-md-12">행사 소개</label>
												<div class="col-md-12">
												<p >${vo.overview}</p>
												<hr class="form-control form-control-line">
												</div>
											</div>
											
																<div class="form-group">
												<label class="col-md-12">강좌 시작일</label>
												<div class="col-md-12">
													<fmt:parseDate value="${startDate}" var="startDate" pattern="yyyyMMdd"/>
													<input type="text" style="" value="<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd"/>"
														class="form-control form-control-line" name="lec_cont"
														id="lec_cont">
			

												</div>
											</div>



											<div class="form-group">
												<label class="col-md-12">강좌 종료일</label>
												<div class="col-md-12">
														<fmt:parseDate value="${endDate}" var="endDate" pattern="yyyyMMdd"/>
														<input type="text" style="" value="<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd"/>"
														class="form-control form-control-line" name="lec_cont"
														id="lec_cont">
												</div>
											</div>

											<div class="form-group">
												<label class="col-md-12">전화번호 </label>
												<div class="col-md-12">
													<input type="text" value="${vo.telname} ${vo.tel}"
														name="lec_tea" id="lec_tea"
														class="form-control form-control-line">
														
												</div>
											</div>
											
											<div class="form-group">
												<label for="birth" class="col-md-12">주소</label>
												<div class="col-md-12">
													<input type="text" value="${vo.addr1}"
														class="form-control form-control-line" name="lec_time"
														id="lec_time">
												</div>
											</div>


											<div class="form-group">
												<label class="col-md-12">홈페이지</label>
												<div class="col-md-12">
<%-- 													<input type="text" value="${vo.homepage}" --%>
<!-- 														class="form-control form-control-line"> -->
														<p>${vo.homepage}</p>
												
												</div>
											</div>



						





										</div>
									</div>
								</div>
							</div>





						</div>



					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
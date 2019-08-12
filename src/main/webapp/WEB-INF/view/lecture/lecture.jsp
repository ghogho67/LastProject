<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



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
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dnxk8c7baj&submodules=geocoder"></script>

<script>
	$(document).ready(function() {
		getLocation();

	});

	var map;
	function getLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition);

		} else {
			x.innerHTML = "Geolocation is not supported by this browser.";
		}
	}

	var nLat;
	var nLng;

	function showPosition(position) {

		nLat = position.coords.latitude;
		nLng = position.coords.longitude;

		var mapOptions = {
			center : new naver.maps.LatLng(nLat, nLng),
			zoom : 10
		};

		map = new naver.maps.Map('map', mapOptions);
		drawMarker();

	}

	var markers = [], infoWindows = [];
	//요양보호사 아이디
	var listData1 = []
	//요양보호사 주소 
	var listData2 = [ '대전 유성구 유성대로654번길 130', '대전광역시 중구 중앙로76', '대전 중구 중앙로 77' ];

	function drawMarker() {
		for (var i = 0; i < listData2.length; i++) {

			naver.maps.Service
					.geocode(
							{
								address : listData2[i]
							},
							function(status, response) {
								if (status !== naver.maps.Service.Status.OK) {
									return alert('Something wrong!');
								}

								var result = response.result, // 검색 결과의 컨테이너
								items = result.items; // 검색 결과의 배열
								console.log(items);

								var position = new naver.maps.LatLng(
										items[0].point.y, items[0].point.x);

								var marker = new naver.maps.Marker({
									map : map,
									position : position,
									title : "123",
									icon : {
										url : '/image/main.png',
										size : new naver.maps.Size(50, 52),
										origin : new naver.maps.Point(0, 0),
										anchor : new naver.maps.Point(25, 26)
									},
									zIndex : 100,
									animation : naver.maps.Animation.BOUNCE
								//id: 요양보호사 id listData1[i]
								});

								console.log("aaa");

								var infoWindow = new naver.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:10px;">The Letter is <b>"'
													+ "1234" + '"</b>.</div>'
										});

								markers.push(marker);
								infoWindows.push(infoWindow);

							});

		}
		;

		naver.maps.Event.addListener(map, 'idle', function() {
			updateMarkers(map, markers);
		});

	}

	function updateMarkers(map, markers) {

		var mapBounds = map.getBounds();
		var marker, position;
		for (var i = 0; i < markers.length; i++) {

			marker = markers[i]
			position = marker.getPosition();

			if (mapBounds.hasLatLng(position)) {
				showMarker(map, marker);
			} else {
				hideMarker(map, marker);
			}
		}
	}

	function showMarker(map, marker) {

		if (marker.setMap())
			return;
		marker.setMap(map);
	}

	function hideMarker(map, marker) {

		if (!marker.setMap())
			return;
		marker.setMap(null);
	}

	//해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
	function getClickHandler(seq) {
		return function(e) {
			var marker = markers[seq], infoWindow = infoWindows[seq];

			if (infoWindow.getMap()) {
				infoWindow.close();
			} else {
				infoWindow.open(map, marker);
			}
		}
	}

	window.onload = function() {
		console.log(markers.length);
		for (var i = 0, ii = markers.length; i < ii; i++) {
			naver.maps.Event.addListener(markers[i], 'click',
					getClickHandler(i));
		}
	}
</script>

</head>
<body>


	<%@include file="/WEB-INF/view/common/subPageheader.jsp"%>
	<%@include file="/WEB-INF/view/common/subPagesideBar.jsp"%>

	<div class="container">
		<div style="padding-top: 50px; width: 1350px;">

			<div class="card">
				<div class="card-body">

					<div id="titlee">
						<h2>
							<span>학습.문화</span> 프로그램 - 강좌상세
						</h2>
					</div>
					<hr>

					<div class="container">
						<div class="row">


							<div class="col-lg-4">
								<div class="blog_right_sidebar">
									<aside class="single_sidebar_widget author_widget">
										<h3>${lecture.lec_nm}</h3>
										<p>${lecture.lec_tea}</p>
										<p>${lecture.lec_cont}</p>
										<div class="br"></div>
									</aside>
									<aside class="single_sidebar_widget popular_post_widget">

										<div class="media post_item">
											<img src="/image/dotdot.png">
											<div class="media-body">
											
												<p>강좌 시작일:<fmt:formatDate value="${lecture.lec_st_dt}"
															pattern="yyyy-MM-dd" /></p>
											</div>
										</div>
										<div class="media post_item">
											<img src="/image/dotdot.png">
											<div class="media-body">
												<p>강좌 종료일 :<fmt:formatDate value="${lecture.lec_end_dt}"
															pattern="yyyy-MM-dd" /></p>
											</div>
										</div>

										<div class="media post_item">
											<img src="/image/dotdot.png">
											<div class="media-body">
										
												<p>수강 시간 :${lecture.lec_time}</p>
											</div>
										</div>


										<div class="media post_item">
											<img src="/image/dotdot.png">
											<div class="media-body">
										
												<p>수강료:${lecture.lec_fee}</p>
											</div>
										</div>


										<div class="media post_item">
											<img src="/image/dotdot.png">
											<div class="media-body">
												<p>강의 요일: ${lecture.lec_day}</p>

											</div>
										</div>

										<div class="media post_item">
											<img src="/image/dotdot.png">
											<div class="media-body">
												<p>수강인원 :${lecture.lec_amount}</p>
												

											</div>
										</div>


										<div class="br"></div>
									</aside>



								</div>
							</div>




							<div class="col-lg-8 posts-list">
								<div class="single-post row">

									<div class="col-lg-12 blog_details">
										<h3>센터위치</h3>
										<div id="map" style="width: 100%; height: 600px;"></div>
										<div style=" position: absolute;">
								${culture.culture_type}: ${culture.culture_phone}
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






</body>
</html>
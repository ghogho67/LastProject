<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>간단한 지도 표시하기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dnxk8c7baj&submodules=geocoder"></script>
<script>
	$(document)
			.ready(
					function() {
						getLocation();

						var listData1 = [];
						$("input[name='cw_mem_id']").each(function(i) {
							listData1.push($(this).val());
						});

						var listData2 = [];
						$("input[name='add']").each(function(i) {
							listData2.push($(this).val());
						});

						var map;
						function getLocation() {
							if (navigator.geolocation) {
								navigator.geolocation
										.getCurrentPosition(showPosition);

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
															items[0].point.y,
															items[0].point.x);

													var marker = new naver.maps.Marker(
															{
																map : map,
																position : position,
																title : "123",
																icon : {
																	url : '/image/main.png',
																	size : new naver.maps.Size(
																			50,
																			52),
																	origin : new naver.maps.Point(
																			0,
																			0),
																	anchor : new naver.maps.Point(
																			25,
																			26)
																},
																zIndex : 100,
																animation : naver.maps.Animation.BOUNCE
															//id: 요양보호사 id listData1[i]
															});

													console.log("aaa");

													var infoWindow = new naver.maps.InfoWindow(
															{
																content : '<div style="width:150px;text-align:center;padding:10px;">The Letter is <b>"'
																		+ "1234"
																		+ '"</b>.</div>'
															});

													markers.push(marker);
													infoWindows
															.push(infoWindow);

												});

							}
							;

							naver.maps.Event.addListener(map, 'idle',
									function() {
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
								naver.maps.Event.addListener(markers[i],
										'click', getClickHandler(i));
							}
						}

					});

	var HOME_PATH = window.HOME_PATH || '.';

	var cityhall = new naver.maps.LatLng(37.5666805, 126.9784147), map = new naver.maps.Map(
			'map', {
				center : cityhall.destinationPoint(0, 500),
				zoom : 10
			}), marker = new naver.maps.Marker({
		map : map,
		position : cityhall
	});

	var contentString = [
			'<div class="iw_inner">',
			'   <h3>서울특별시청</h3>',
			'   <p>서울특별시 중구 태평로1가 31 | 서울특별시 중구 세종대로 110 서울특별시청<br />',
			'       <img src="'+ HOME_PATH +'/img/example/hi-seoul.jpg" width="55" height="55" alt="서울시청" class="thumb" /><br />',
			'       02-120 | 공공,사회기관 &gt; 특별,광역시청<br />',
			'       <a href="http://www.seoul.go.kr" target="_blank">www.seoul.go.kr/</a>',
			'   </p>', '</div>' ].join('');

	var infowindow = new naver.maps.InfoWindow({
		content : contentString
	});

	naver.maps.Event.addListener(marker, "click", function(e) {
		if (infowindow.getMap()) {
			infowindow.close();
		} else {
			infowindow.open(map, marker);
		}
	});

	infowindow.open(map, marker);
</script>
</head>
<body>
	<div id="map" style="width: 80%; height: 800px;"></div>
	<ul id="cwUl">
		<c:forEach items="${cwList }" var="cw">
			<input type="hidden" name="add" value="${cw.mem_add1 }">
			<input type="hidden" name="cw_mem_id" value="${cw.mem_id }">
		</c:forEach>
	</ul>
</body>
</html>
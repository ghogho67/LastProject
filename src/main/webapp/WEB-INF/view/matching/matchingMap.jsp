<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
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

						var cw_mem_id = [];

						$("input[name='cw_mem_id']").each(function(i) {
							cw_mem_id.push($(this).val());
						});

						var add = [];

						$("input[name='add']").each(function(i) {
							add.push($(this).val());
						});

						// 						MARKER_SPRITE_POSITION = [];
						// 						for (i = 0; i < $("input[name='cw_mem_id']").length; i++) {
						// 							MARKER_SPRITE_POSITION.push({
						// 								key: cw_mem_id[i],
						// 								value : 
						// 							})
						// 						}
						// 												var HOME_PATH = window.HOME_PATH || '.';
						// 												var MARKER_SPRITE_X_OFFSET = 29, MARKER_SPRITE_Y_OFFSET = 50,

						MARKER_SPRITE_POSITION = {

							"A0" : "대전 광역시 유성구 송강동"
						// 													"B0" : [ MARKER_SPRITE_X_OFFSET, 0 ],
						// 													"C0" : [ MARKER_SPRITE_X_OFFSET * 2, 0 ],
						// 													"D0" : [ MARKER_SPRITE_X_OFFSET * 3, 0 ],
						// 													"E0" : [ MARKER_SPRITE_X_OFFSET * 4, 0 ],
						// 													"F0" : [ MARKER_SPRITE_X_OFFSET * 5, 0 ],
						// 													"G0" : [ MARKER_SPRITE_X_OFFSET * 6, 0 ],
						// 													"H0" : [ MARKER_SPRITE_X_OFFSET * 7, 0 ],
						// 													"I0" : [ MARKER_SPRITE_X_OFFSET * 8, 0 ],

						// 													"A1" : [ 0, MARKER_SPRITE_Y_OFFSET ],
						// 													"B1" : [ MARKER_SPRITE_X_OFFSET,
						// 															MARKER_SPRITE_Y_OFFSET ],
						// 													"C1" : [ MARKER_SPRITE_X_OFFSET * 2,
						// 															MARKER_SPRITE_Y_OFFSET ],
						// 													"D1" : [ MARKER_SPRITE_X_OFFSET * 3,
						// 															MARKER_SPRITE_Y_OFFSET ],
						// 													"E1" : [ MARKER_SPRITE_X_OFFSET * 4,
						// 															MARKER_SPRITE_Y_OFFSET ],
						// 													"F1" : [ MARKER_SPRITE_X_OFFSET * 5,
						// 															MARKER_SPRITE_Y_OFFSET ],
						// 													"G1" : [ MARKER_SPRITE_X_OFFSET * 6,
						// 															MARKER_SPRITE_Y_OFFSET ],
						// 													"H1" : [ MARKER_SPRITE_X_OFFSET * 7,
						// 															MARKER_SPRITE_Y_OFFSET ],
						// 													"I1" : [ MARKER_SPRITE_X_OFFSET * 8,
						// 															MARKER_SPRITE_Y_OFFSET ],

						// 													"A2" : [ 0, MARKER_SPRITE_Y_OFFSET * 2 ],
						// 													"B2" : [ MARKER_SPRITE_X_OFFSET,
						// 															MARKER_SPRITE_Y_OFFSET * 2 ],
						// 													"C2" : [ MARKER_SPRITE_X_OFFSET * 2,
						// 															MARKER_SPRITE_Y_OFFSET * 2 ],
						// 													"D2" : [ MARKER_SPRITE_X_OFFSET * 3,
						// 															MARKER_SPRITE_Y_OFFSET * 2 ],
						// 													"E2" : [ MARKER_SPRITE_X_OFFSET * 4,
						// 															MARKER_SPRITE_Y_OFFSET * 2 ],
						// 													"F2" : [ MARKER_SPRITE_X_OFFSET * 5,
						// 															MARKER_SPRITE_Y_OFFSET * 2 ],
						// 													"G2" : [ MARKER_SPRITE_X_OFFSET * 6,
						// 															MARKER_SPRITE_Y_OFFSET * 2 ],
						// 													"H2" : [ MARKER_SPRITE_X_OFFSET * 7,
						// 															MARKER_SPRITE_Y_OFFSET * 2 ],
						// 													"I2" : [ MARKER_SPRITE_X_OFFSET * 8,
						// 															MARKER_SPRITE_Y_OFFSET * 2 ]
						};

						var map = new naver.maps.Map('map', {
							center : new naver.maps.LatLng(37.3595704,
									127.105399),
							zoom : 10
						});

						// 						for (i = 0; i < $("input[name='cw_mem_id']").length; i++) {
						// 							naver.maps.Service
						// 									.geocode(
						// 											{
						// 												address : MARKER_SPRITE_POSITION[i].split(":");
						// 											},
						// 											function(status, response) {
						// 												if (status !== naver.maps.Service.Status.OK) {
						// 													return alert('Something wrong!');
						// 												}

						// 												var result = response.result, // 검색 결과의 컨테이너
						// 												items = result.items; // 검색 결과의 배열
						// 												console.log(items);

						// 												var position = new naver.maps.LatLng(
						// 														items[0].point.y,
						// 														items[0].point.x);

						// 												var marker = new naver.maps.Marker(
						// 														{
						// 															map : map,
						// 															position : position,
						// 															title : "123",
						// 															icon : {
						// 																url : '/image/main.png',
						// 																size : new naver.maps.Size(
						// 																		50, 52),
						// 																origin : new naver.maps.Point(
						// 																		0, 0),
						// 																anchor : new naver.maps.Point(
						// 																		25, 26)
						// 															},
						// 															zIndex : 100,
						// 															animation : naver.maps.Animation.BOUNCE
						// 														//id: 요양보호사 id listData1[i]
						// 														});

						// 												console.log("aaa");

						// 												var infoWindow = new naver.maps.InfoWindow(
						// 														{
						// 															content : '<div style="width:150px;text-align:center;padding:10px;">The Letter is <b>"'
						// 																	+ "1234"
						// 																	+ '"</b>.</div>'
						// 														});

						// 												markers.push(marker);
						// 												infoWindows.push(infoWindow);

						// 											});

						// 						}
						// 						;
						var position;

						naver.maps.Service.geocode({
							address : MARKER_SPRITE_POSITION["A0"]
						}, function(status, response) {
							if (status !== naver.maps.Service.Status.OK) {
								return alert('Something wrong!');
							}

							var result = response.result, // 검색 결과의 컨테이너
							items = result.items; // 검색 결과의 배열

							position = new naver.maps.LatLng(items[0].point.y,
									items[0].point.x);
							alert(position)
						});

						var bounds = map.getBounds(), southWest = bounds
								.getSW(), northEast = bounds.getNE(), lngSpan = northEast
								.lng()
								- southWest.lng(), latSpan = northEast.lat()
								- southWest.lat();

						var markers = [], infoWindows = [];

						for ( var key in MARKER_SPRITE_POSITION) {

							alert(key);

							var position = new naver.maps.LatLng(southWest
									.lat()
									+ latSpan * Math.random(), southWest.lng()
									+ lngSpan * Math.random());

							// 							var marker = new naver.maps.Marker(
							// 									{
							// 										map : map,
							// 										position : position,
							// 										title : key,
							// 										icon : {
							// 											url : HOME_PATH
							// 													+ '/img/example/sp_pins_spot_v3.png',
							// 											size : new naver.maps.Size(24, 37),
							// 											anchor : new naver.maps.Point(12,
							// 													37),
							// 											origin : new naver.maps.Point(
							// 													MARKER_SPRITE_POSITION[key][0],
							// 													MARKER_SPRITE_POSITION[key][1])
							// 										},
							// 										zIndex : 100
							// 									});

							// 							var infoWindow = new naver.maps.InfoWindow(
							// 									{
							// 										content : '<div style="width:150px;text-align:center;padding:10px;">The Letter is <b>"'
							// 												+ key.substr(0, 1)
							// 												+ '"</b>.</div>'
							// 									});

							var marker = new naver.maps.Marker({
								map : map,
								position : position,
								title : key,
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

							var infoWindow = new naver.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:10px;">The Letter is <b>"'
												+ key + '"</b>.</div>'
									});

							markers.push(marker);
							infoWindows.push(infoWindow);
						}
						;

						naver.maps.Event.addListener(map, 'idle', function() {
							updateMarkers(map, markers);
						});

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

						// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
						function getClickHandler(seq) {
							alert(seq);
							return function(e) {
								var marker = markers[seq], infoWindow = infoWindows[seq];

								location.href = "meet?mem_id=ahri";

								if (infoWindow.getMap()) {
									infoWindow.close();
								} else {
									infoWindow.open(map, marker);
								}
							}
						}

						for (var i = 0, ii = markers.length; i < ii; i++) {
							naver.maps.Event.addListener(markers[i], 'click',
									getClickHandler(i));
						}
					});
</script>


<div class="container-fluid" id="map" style="width: 50%; height: 800px;">
	<ul id="cwUl">
		<c:forEach items="${cwList }" var="cw">
			<input type="hidden" name="add" value="${cw.mem_add1 }">
			<input type="hidden" name="cw_mem_id" value="${cw.mem_id }">
		</c:forEach>
	</ul>
</div>

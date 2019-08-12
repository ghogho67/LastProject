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
	$(document).ready(function() {
		getLocation();

		listData1 = [];
		$("input[name='cw_mem_id']").each(function(i) {
			listData1.push($(this).val());
		});
	});
	var map;
	var nLat;
	var nLng;
	var position;
	var markers = [];
	var infoWindows = [];
	var mapOptions;
	var mapBounds;

	function getLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition);

		} else {
			x.innerHTML = "Geolocation is not supported by this browser.";
		}
	}

	function showPosition(position) {

		nLat = position.coords.latitude;
		nLng = position.coords.longitude;

		var mapOptions = {
			center : new naver.maps.LatLng(nLat, nLng),
			zoom : 10
		};

		map = new naver.maps.Map('map', mapOptions);

		for (i = 0; i < address.length; i++) {
			FindLatLong(address[i], i, function(data) {
				updateMarkers(map, markers);
			});
		}

	}

	function FindLatLong(address, i, callback) {
		naver.maps.Service
				.geocode(
						{
							address : address
						},
						function(status, response) {
							if (status == naver.maps.Service.Status.OK) {
								var result = response.result, items = result.items;
								position = new naver.maps.LatLng(
										items[0].point.y, items[0].point.x);
								callback({
									Status : "OK",
									userquery : result.userquery,
									position : position
								});
								var marker = new naver.maps.Marker({
									map : map,
									position : position,
									title : listData1[i],
									icon : {
										url : '/image/main.png',
										size : new naver.maps.Size(50, 52),
										origin : new naver.maps.Point(0, 0),
										anchor : new naver.maps.Point(25, 26)
									},
									zIndex : 100,
									animation : naver.maps.Animation.BOUNCE
								});
								var infoWindow = new naver.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:10px;">The Letter is <b>"'
													+ listData1[i]
													+ '"</b>.</div>'
										});
								markers.push(marker);
								infoWindows.push(infoWindow);
							}
							naver.maps.Event.addListener(map, 'idle',
									function() {
										updateMarkers(map, markers);
									});

						})
	}

	//요양보호사 아이디
	// 	var listData1 = []
	// 	var str2 = '${list}';

	// 	var cw_mem_id = [];

	// 	$("input[name='cw_mem_id']").each(function(i) {
	// 		listData1.push($(this).val());
	// 	});

	// 	str2 = str2.replace("[", "");
	// 	str2 = str2.replace("]", "");
	// 	var listData1 = str2.split(",");
	// 	console.log(str2);

	//요양보호사 주소 
	var str = '${addrList}';
	str = str.replace("[", "");
	str = str.replace("]", "");

	console.log(str);
	var address = str.split(",");

	function updateMarkers(map, markers) {
		$("#htmltest").empty();
		var mapBounds = map.getBounds();
		var marker, position;

		for (var i = 0; i < markers.length; i++) {

			marker = markers[i]
			position = marker.getPosition();

			if (mapBounds.hasLatLng(position)) {
				showMarker(map, marker);
				var link = $("<a>");
				link.attr("href", "/matching/meet?mem_id=" + marker.title);
				link.attr("title", marker.title);
				link.text(marker.title);
				link.addClass("link");
				$("#htmltest").append(link);
				$("#htmltest").append("<br>");
			} else {
				hideMarker(map, marker);
			}
		}
	}

	function showMarker(map, marker) {

		if (marker.getMap())
			return;
		marker.setMap(map);
	}

	function hideMarker(map, marker) {

		if (!marker.getMap())
			return;
		marker.setMap(null);
	}

	//해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
	function getClickHandler(seq) {
		return function(e) {
			var marker = markers[seq], infoWindow = infoWindows[seq];
			location.href = "/matching/meet?mem_id=" + marker.title;
			// 			if (infoWindow.getMap()) {
			// 				infoWindow.close();
			// 			} else {
			// 				infoWindow.open(map, marker);
			// 			}
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
	<div class="container-fluid" id="map"
		style="width: 50%; height: 800px;"></div>
	<div>
		<ul id="cwUl">
			<c:forEach items="${cwList }" var="cw">
				<input type="hidden" name="cw_mem_id" value="${cw.mem_id }">
				<input type="hidden" name="add" value="${cw.mem_add1 }">
			</c:forEach>
		</ul>
	</div>
	<div id="htmltest"></div>
	<input type="button" id="btn1" value="btn1" onclick="cwListChange()">
	<input type="button" id="btn2" value="btn2">
	<br>
	<input type="button" id="btn3" value="btn3">
	<br>
	<input type="button" id="btn4" value="btn4">
	<br>
	<input type="button" id="btn5" value="btn5">
	<br>
</body>
</html>
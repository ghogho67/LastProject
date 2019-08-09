<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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
	var j = 0;
	var markers = [], infoWindows = [];
	//요양보호사 아이디
	var listData1 = []
	//요양보호사 주소 
	// var listData2 = '${addrList}';
	// 	  var data = [];

	var str = '${addrList}';
	str = str.replace("[", "");
	str = str.replace("]", "");

	console.log(str);
	var listData2 = str.split(",");

	var positionArray = new Array();
	var positionAddress = new Array();
	function position(add) {
		console.log(add);
		naver.maps.Service.geocode({
			address : add
		}, function(status, response) {
			if (status !== naver.maps.Service.Status.OK) {
				return alert('Something wrong!');
			}

			var result = response.result, // 검색 결과의 컨테이너
			items = result.items; // 검색 결과의 배열
			var position = new naver.maps.LatLng(items[0].point.y,
					items[0].point.x);
			positionArray.push(position);
			positionAddress.push(items[0].address);
		})
	}

	function drawMarker() {
		for (var i = 0; i < listData2.length; i++) {
			position(listData2[i]);
		}
		while (positionArray.length != 7) {
			if (positionArray.length != 7) {
				while (positionArray.length != 7) {
					console.log("a");
				}

			} else
				for (var i = 0; i < listData2.length; i++) {
					position = positionArray[i];
					address = positionArray[i];
					var marker = new naver.maps.Marker({
						map : map,
						position : position,
						title : address,
						icon : {
							url : '/image/main.png',
							size : new naver.maps.Size(50, 52),
							origin : new naver.maps.Point(0, 0),
							anchor : new naver.maps.Point(25, 26)
						},
						zIndex : 100,
						animation : naver.maps.Animation.BOUNCE
					});

					for (j; j < listData2.length; j++) {
						var infoWindow = new naver.maps.InfoWindow(
								{
									content : '<div style="width:150px;text-align:center;padding:10px;">The Letter is <b>"'
											+ listData2[j] + '"</b>.</div>'
								});
						break;
					}
					j++;
				}

			markers.push(marker);
			infoWindows.push(infoWindow);
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
	<div id="map" style="width: 100%; height: 400px;"></div>
</body>
</html>
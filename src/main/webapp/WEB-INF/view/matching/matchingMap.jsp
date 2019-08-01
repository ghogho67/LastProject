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
		var map = new naver.maps.Map('map', {
			center : new naver.maps.LatLng(37.3595704, 127.105399),
			zoom : 10
		});

		var marker = new naver.maps.Marker({
			position : new naver.maps.LatLng(37.3595704, 127.105399),
			map : map
		});

		// 				//지도를 삽입할 HTML 요소 또는 HTML 요소의 id를 지정합니다.
		// 				var mapDiv = document.getElementById('map'); // 'map'으로 선언해도 동일

		// 				//옵션 없이 지도 객체를 생성하면 서울 시청을 중심으로 하는 11 레벨의 지도가 생성됩니다.
		// 				var map = new naver.maps.Map(mapDiv);
		// 				getLocation();

		// 				var listData1 = [];
		// 				$("input[name='cw_mem_id']").each(function(i) {
		// 					listData1.push($(this).val());
		// 				});

		// 				var listData2 = [];
		// 				$("input[name='add']").each(function(i) {
		// 					listData2.push($(this).val());
		// 				});

		// 				var HOME_PATH = window.HOME_PATH || '.';
		// 				var map = new naver.maps.Map(document.getElementById('map'), {
		// 					zoom : 11
		// 				});

		// 				map.fitBounds(naver.maps.LatLngBounds.bounds(
		// 						new naver.maps.LatLng(37.3724620, 127.1051714),
		// 						new naver.maps.LatLng(37.3542795, 127.1174332)));

		// 				var urlMarker = new naver.maps.Marker({
		// 					position : new naver.maps.LatLng(37.3542795, 127.1072556),
		// 					map : map,
		// 					title : 'urlMarker',
		// 					icon : {
		// 						url : '/image/main.png',
		// 						size : new naver.maps.Size(50, 52),
		// 						origin : new naver.maps.Point(0, 0),
		// 						anchor : new naver.maps.Point(25, 26)
		// 					},
		// 					animation : naver.maps.Animation.DROP
		// 				});

		// 				naver.maps.Event.addListener(urlMarker, 'click', function() {
		// 					if (urlMarker.getAnimation() !== null) {
		// 						urlMarker.setAnimation(null);
		// 					} else {
		// 						urlMarker.setAnimation(naver.maps.Animation.BOUNCE);
		// 					}
		// 				});

		// 				var imageMarker = new naver.maps.Marker({
		// 					position : new naver.maps.LatLng(37.3637770, 127.1174332),
		// 					map : map,
		// 					title : 'imageMarker',
		// 					icon : {
		// 						url : '/image/main.png',
		// 						size : new naver.maps.Size(50, 52),
		// 						origin : new naver.maps.Point(0, 0),
		// 						anchor : new naver.maps.Point(25, 26)
		// 					},
		// 					animation : naver.maps.Animation.BOUNCE
		// 				});

		// 				var symbolMarker = new naver.maps.Marker({
		// 					map : map,
		// 					position : new naver.maps.LatLng(37.3692417, 127.1134740),
		// 					title : 'symbolMarker',
		// 					icon : {
		// 						url : '/image/main.png',
		// 						size : new naver.maps.Size(50, 52),
		// 						origin : new naver.maps.Point(0, 0),
		// 						anchor : new naver.maps.Point(25, 26)
		// 					},
		// 					shape : {
		// 						coords : [ 0, 70, 20, 100, 40, 70, 30, 70, 70, 0, 10,
		// 								70 ],
		// 						type : "poly"
		// 					},
		// 					animation : naver.maps.Animation.BOUNCE
		// 				});

		// 				var htmlMarker = new naver.maps.Marker({
		// 					position : new naver.maps.LatLng(37.3578575, 127.1063746),
		// 					map : map,
		// 					title : 'htmlMarker',
		// 					icon : {
		// 						url : '/image/main.png',
		// 						size : new naver.maps.Size(50, 52),
		// 						origin : new naver.maps.Point(0, 0),
		// 						anchor : new naver.maps.Point(25, 26)
		// 					},
		// 					animation : naver.maps.Animation.BOUNCE
		// 				});

		// 				var map = new naver.maps.Map('map', {
		// 					center : new naver.maps.LatLng(37.3595704, 127.105399),
		// 					zoom : 10
		// 				});

		// 				var marker = new naver.maps.Marker({
		// 					position : new naver.maps.LatLng(37.3595704, 127.105399),
		// 					map : map
		// 				});
	});
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
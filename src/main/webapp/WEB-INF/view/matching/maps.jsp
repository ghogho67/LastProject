<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<style>
a {
  width:100%;
  min-height:125px;
  padding:0px 3px 0px 0px;
  margin-bottom:10px;
  border:1px solid #d9d9d9;
  /*background-color:#fff;*/
  cursor:pointer;
}

.list {
    display: block;
    padding: 10px 15px;
    margin-bottom: -1px;
    background-color: #fff;
    border: 1px solid #ddd;
}

.btn {
	background-color: white;
    display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
}
</style>

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
				var div = $("<div>");
					div.attr("class", "list");
					div.attr("id", "div"+i);
					div.attr("style", "cursor: pointer;")
					div.attr("onclick", "location.href='/matching/meet?mem_id="+marker.title+"'")
				
				var p = $("<p>");
				var p2 = $("<p>");				
				p.text(marker.title);
				p2.text(marker.title2);
				
				$("#htmltest").append(div);
				$("#div"+i).append(p);
				$("#div"+i).append(p2);
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
			location.href = "/matching/meet?mem_id=" + marker.title
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
<div>
	<div class="container-fluid" style="width: 100%; height: auto; float:left;" >
		<div id = "map" style="width: 80%; height: 800px; float:left;">
		</div>
		<div>
			<ul id="cwUl">	
				<c:forEach items="${cwList }" var="cw">
					<input type="hidden" name="cw_mem_id" value="${cw.mem_id }">
					<input type="hidden" name="add" value="${cw.mem_add1 }">
					<input type="hidden" name="cw_driver" value="${cw.cw_driver }">
				</c:forEach>
			</ul>
		</div>
		<div id = "ch" style="width:20%; float:left; background-color : #f0f1f3;">
		<form id="choose" class="form-horizontal" role="form" action="${cp}/matching/gender" method="post" enctype="multipart/form-data" >
			<input type="button" class = "btn" value="전체"> 
			<input type="button" class = "btn" name="gender" value="남자" onclick="cwListChange()"> 
			<input type="button" class = "btn" value="여자"> <br><br>
			<input type="button" class = "btn" value="전체"> 
			<input type="button" value="가능" class = "btn" >
			<input type="button" value="불가능" class = "btn" >
		</form>
		</div>
		<div  id="htmltest" style ="float:left; width: 20%; height: 700px; background-color : #f0f1f3;">
		</div><br>
	</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<style>

#a {
	width: 100%;
	min-height: 125px;
	padding: 0px 3px 0px 0px;
	margin-bottom: 10px;
	border: 1px solid #d9d9d9;
	/*background-color:#fff;*/
	cursor: pointer;
}

.list {
	display: block;
	padding: 10px 15px;
	margin-bottom: -1px;
	background-color: #fff;
	border: 1px solid #ddd;
	height: 125px;
}

.mem_gender {
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
.mem_birth {
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
.cw_driver {
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
/* .career { */
/* 	background-color: white; */
/* 	display: inline-block; */
/* 	padding: 6px 12px; */
/* 	margin-bottom: 0; */
/* 	font-size: 14px; */
/* 	font-weight: 400; */
/* 	line-height: 1.42857143; */
/* 	text-align: center; */
/* 	white-space: nowrap; */
/* 	vertical-align: middle; */
/* 	-ms-touch-action: manipulation; */
/* 	touch-action: manipulation; */
/* 	cursor: pointer; */
/* 	user-select: none; */
/* 	background-image: none; */
/* 	border: 1px solid transparent; */
/* 	border-radius: 4px; */
/* } */

.change_color {
	background-color: #d9d9d9;
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

		address = [];
		$("input[name='add']").each(function(i) {
			address.push($(this).val());
		});

		listData2 = [];
		$("input[name='add']").each(function(i) {
			listData2.push($(this).val());
		});
		
		var mem_gender = $("#mem_gender").val();
		var cw_driver = $("#cw_driver").val();
		var mem_birth = $("#mem_birth").val();

		$("#GA").toggleClass("change_color");
		if(mem_gender=='M'){
		$("#GA").toggleClass("change_color");
		$("#GM").toggleClass("change_color");
		}
		if(mem_gender=='F'){
		$("#GA").toggleClass("change_color");
		$("#GF").toggleClass("change_color");
		}
		$("#DA").toggleClass("change_color");
		if(cw_driver=='Y'){
		$("#DA").toggleClass("change_color");
		$("#DY").toggleClass("change_color");
		}
		if(cw_driver=='N'){
		$("#DA").toggleClass("change_color");
		$("#DN").toggleClass("change_color");
		}
		$("#BA").toggleClass("change_color");
		if(mem_birth=='50'){
		$("#BA").toggleClass("change_color");
		$("#B50").toggleClass("change_color");
		}
		if(mem_birth=='5060'){
		$("#BA").toggleClass("change_color");
		$("B5060").toggleClass("change_color");
		}
		if(mem_birth=='60'){
		$("#BA").toggleClass("change_color");
		$("#B60").toggleClass("change_color");
		}
		
	
	$(".mem_gender").click(function(){
//			$(".bt").removeClass("change_color");
//			$(".bt").toggleClass("change_color");
//			$(this).toggleClass("change_color");
		$("#choose").submit();
	});
	$(".mem_birth").click(function(){
//			$(".bt").removeClass("change_color");
//			$(".bt").toggleClass("change_color");
//			$(this).toggleClass("change_color");
		$("#choose").submit();
	});
	$(".cw_driver").click(function(){
//			$(".bt").removeClass("change_color");
//			$(".bt").toggleClass("change_color");
//			$(this).toggleClass("change_color");
		$("#choose").submit();
	});
//		$(".career").click(function(){
//			$(".bt").removeClass("change_color");
//			$(".bt").toggleClass("change_color");
//			$(this).toggleClass("change_color");
//			$("#choose").submit();
//		});

	$("#GA").click(function(){
		$("#mem_gender").val("all");
		$("#choose").submit();
	});
	$("#GM").click(function(){
		$("#mem_gender").val("M");
		$("#choose").submit();
	});
	$("#GF").click(function(){
		$("#mem_gender").val("F");
		$("#choose").submit();
	});
	$("#DA").click(function(){
		$("#cw_driver").val("all");
		$("#choose").submit();
	});
	$("#DY").click(function(){
		$("#cw_driver").val("Y");
		$("#choose").submit();
	});
	$("#DN").click(function(){
		$("#cw_driver").val("N");
		$("#choose").submit();
	});
	$("#BA").click(function(){
		$("#mem_birth").val("all");
		$("#choose").submit();
	});
	$("#B50").click(function(){
		$("#mem_birth").val("50");
		$("#choose").submit();
	});
	$("#B5060").click(function(){
		$("#mem_birth").val("5060");
		$("#choose").submit();
	});
	$("#60").click(function(){
		$("#mem_birth").val("60");
		$("#choose").submit();
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
// 	var str = '${addrList}';
// 	str = str.replace("[", "");
// 	str = str.replace("]", "");

// 	console.log(str);
// 	var address = str.split(",");

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
				div.attr("onclick", "location.href='/matching/meet?cw_mem_id="	+ marker.title + "'")
				var img = $("<img>");
				img.attr("src","/image/dotdot.png");
				img.attr("alt","이미지가 없습니다");
				var p = $("<p>");
				p.attr("style", "float:left;")
				var p2 = $("<p>");
				p.text(marker.title);
				p2.text(marker.title2);
				$("#htmltest").append(div);
				$("#div"+i).append(img);
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
	<!--  style="width: 100%; height: auto; float:left;" -->
	<div class="container">
		<div id="map" style="width: 75%; height: 700px; float: left;"></div>
		<div>
			<ul id="cwUl">
				<c:forEach items="${cwList }" var="cw">	
					<input type="hidden" name="cw_mem_id" value="${cw.mem_id }">
					<input type="hidden" name="add" value="${cw.mem_add1 }">
					<input type="hidden" name="cw_driver" value="${cw.cw_driver }">
				</c:forEach>
			</ul>
		</div>
	</div>
		<div id="ch" style="width: 25%; height: 170px; float: left; background-color: #f0f1f3;">
				<input type="button" id = "GA"value="전체" class="mem_gender"> 
				<input type="button" id = "GM" value="남자" class="mem_gender"> 
				<input type="button" id = "GF" value="여자"class="mem_gender"> <br>
				<input type="button" id = "DA" value="전체" class="cw_driver" > 
				<input type="button" id = "DY" value="운전가능" class="cw_driver"> 
				<input type="button" id = "DN" value="운전불가" class="cw_driver"><br>
<!-- 				<input type="button" id = "BA" value="전체" class="mem_birth" > -->
<!-- 				<input type="button" id = "B50" value="50세↓" class="mem_birth">  -->
<!-- 				<input type="button" id = "B5060" value="50~60세" class="mem_birth"> -->
<!-- 				<input type="button" id = "B60" value="60세↑" class="mem_birth"><br> -->
<!-- 				<input type="button"  value="전체" class="career">  -->
<!-- 				<input type="button" value="3년이하" class="career">  -->
<!-- 				<input type="button" value="3~5년" class="career"> -->
<!-- 				<input type="button" value="5년 이상" class="career"> -->
				<form id="choose" class="form-horizontal" role="form" action="${cp}/matching/choose" method="post" enctype="multipart/form-data">
				<input type = "hidden" id="mem_gender" name="mem_gender" value = "${mem_gender }">
				<input type = "hidden" id="cw_driver" name="cw_driver" value = "${cw_driver }">
				<input type = "hidden" id="mem_birth" name="mem_birth" value = "${mem_birth }">
<!-- 				<input type = "hidden" id="career" name="career" value = "all"> -->
			</form>
		</div>
		<form>
		<div id="htmltest" style="overflow-y:scroll; float: left; width: 25%; height: 530px; background-color: #f0f1f3;"></div>
	</form>
	</div>
</body>
</html>
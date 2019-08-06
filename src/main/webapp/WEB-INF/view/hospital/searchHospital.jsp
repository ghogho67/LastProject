<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BasicSubPage</title>


<style type="text/css">
#titlee h2, #pzone h2 {
	font-size: 40px;
	font-weight: normal;
	letter-spacing: -1px;
}

#titlee h2 {
	padding: 25px 35px;
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

.title {
	background-color: transparent;
	width: 180px;
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
.for {
	position: relative;
	width: 250px;
	height: 30px;
	margin: 0 auto;
}

.d1 {
	height: 30px;
	background: white;
	position: absolute;
	right: 1%;
	top: 75px;
}

.d1 input {
	width: 100%;
	height: 30px;
	padding-left: 90px;
	border: 2px solid #7BA7AB;
	border-radius: 5px;
	outline: none;
	background: white;
	color: #9E9C9C;
	font-size: 13px;
}

.d1 button {
	position: absolute;
	top: 0;
	right: 0px;
	width: 32px;
	height: 30px;
	border: none;
	background: #7BA7AB;
	border-radius: 0 5px 5px 0;
	cursor: pointer;
}

.d1 button:before {
	content: "\f002";
	font-family: FontAwesome;
	font-size: 16px;
	color: #F9F0DA;
}

#searchType {
	height: 30px;
	width: 70px;
	font-size: 11px;
	border-radius: 5px 0px 0px 5px;
	border-top: 2px solid #7BA7AB;
	border-bottom: 2px solid #7BA7AB;
	border-left: 2px solid #7BA7AB;
	border-right: 2px solid #7BA7AB;
}

</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dnxk8c7baj&submodules=geocoder"></script>
<script>
$(document).ready(function(){
// 	$(".shTr").on("click", function(){
// 		console.log("shTr click");
		
// 		var sh_id = $(this).find(".sh_id").text();
// 		$("#sh_id").val(sh_id);
// 		$("#frm").attr("action", "${cp}/shelter/detailShelter");
// 		$("#frm").attr("method", "get");
// 		$("#frm").submit();
// 	});
	
	//지도
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
		zoom : 9
	};

	map = new naver.maps.Map('map', mapOptions);
	drawMarker();

}

var markers = [], 
infoWindows = [];
//요양보호사 아이디
var listData1 = []
var str2 ='${list}';

str2 = str2.replace("[", "");
str2 = str2.replace("]", "");
var listData1 = str2.split(",");
console.log(str2);





//요양보호사 주소 
var str = '${searchMapList}';
str = str.replace("[", "");
str = str.replace("]", "");

console.log(str);
var listData2 = str.split(",");


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
							console.log(result);

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
							var hos_nm;
							var hos_phone;

							for(var j=0; j<listData1.length; j++){
//									console.log(listData1);
//									console.log(listData1[j]);
//									console.log(result.userquery);
//									console.log(listData1[j].indexOf(result.userquery));
								if(listData1[j].indexOf(result.userquery)>0){
//										console.log();
									hos_nm=listData1[j].substring(0,listData1[j].indexOf(':'));
									console.log(hos_nm);
									hos_phone=listData1[j].substring(listData1[j].indexOf(':')+1,listData1[j].lastIndexOf(':'));
//										console.log(mem_nm);
									break;
								}
							}


							var infoWindow = new naver.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:10px;">The Letter is <b>"'+ hos_nm +'"</b>.</div>'
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
		<div style="padding-top: 50px; width: 1250px;">
			<div class="card">
				<div class="card-body">
							<div id="titlee">
						<h2>
							<span>병원, 요양원</span>
						</h2>
						</div>
					
						
					<hr>
					<form id="frm" action="${cp }/hospital/searchPagingList?hos_add=${hos_add}" method="post">
					 <input type="hidden" class="form-control" id="hos_add" name="hos_add" value="${hos_add}">
					<div class="table-responsive">
						<table class="table center-aligned-table">
						<thead>
							<tr>
								<th>병원아이디</th>
								<th>병원이름</th>
								<th>병원주소</th>
								<th>병원 전화번호</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${getSearchHosAdd}" var="vo" varStatus="status">
								<tr class="hosTr" data-hos_id="${vo.hos_id }">
									<td>${vo.hos_id }</td>
									<td>${vo.hos_nm }</td>
									<td>${vo.hos_add }</td>
									<td>${vo.hos_phone }</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
					
					<!-- 페이지네이션 -->
							<div class="text-center">
								<ul class="pagination">
									<c:choose>
										<c:when test="${pageVo.page == 1 }">
											<li class="disabled"><span>«</span></li>
										</c:when>
										<c:otherwise>
											<li><a href="${cp}/hospital/searchPagingList?page=${pageVo.page-1}&pageSize=${pageVo.pageSize}">«</a></li>
										</c:otherwise>
									</c:choose>
									
									<c:forEach begin="1" end="${paginationSize}" var="i">
										<c:choose>
											<c:when test="${pageVo.page == i}">
												<li class="active"><span>${i}</span></li>
											</c:when>
											<c:otherwise>
												<li><a href="${cp}/hospital/searchPagingList?page=${i}&pageSize=${pageVo.pageSize}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									
									<c:choose>
										<c:when test="${pageVo.page == paginationSize}">
											<li class="disabled"><span>»</span></li>
										</c:when>
										<c:otherwise>
											<li><a href="${cp}/hospital/searchPagingList?page=${pageVo.page+1}&pageSize=${pageVo.pageSize}">»</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
							
							
							<div id="map" style="width: 100%; height: 400px;"></div>
					
					</form>
					
	
					
					
				</div>
			</div>
		</div>
	</div>
	
	


</body>
</html>
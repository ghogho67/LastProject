<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
}

.pagination-outer {
	text-align: center;
}

.pagination {
	font-family: 'Rubik', sans-serif;
	padding: 0 30px;
	display: inline-flex;
	position: relative;
}

.pagination li a.page-link {
	color: #909090;
	background-color: transparent;
	font-size: 15px;
	line-height: 35px;
	height: 45px;
	width: 40px;
	margin: 0 3px;
	border: none;
	border-radius: 0;
	overflow: hidden;
	position: relative;
	transition: all 0.4s ease 0s;
}

.pagination li.active a.page-link, .pagination li a.page-link:hover,
	.pagination li.active a.page-link:hover {
	color: #5ab4dc;
	background-color: transparent;
}

.pagination li a.page-link span {
	display: block;
	transition: all 0.3s;
}

.pagination li a.page-link:hover span {
	transform: rotateY(360deg);
}

.pagination li a.page-link:before, .pagination li a.page-link:after {
	content: "";
	background-color: #5ab4dc;
	height: 3px;
	width: 0;
	opacity: 1;
	position: absolute;
	left: 0;
	bottom: 0;
	z-index: -1;
	transition: all 0.3s;
}

.pagination li a.page-link:before {
	background: linear-gradient(135deg, transparent 49%, #5ab4dc 50%);
	height: 15px;
	width: 15px;
	transform: translateX(-50%) rotate(45deg);
	bottom: auto;
	top: -20px;
	left: 50%;
}

.pagination li a.page-link:hover:after {
	width: 100%;
}

.pagination li a.page-link:hover:before {
	top: -10px;
}

.pagination li a.page-link:hover:before, .pagination li.active a.page-link:before
	{
	top: -10px;
}

.pagination li a.page-link:hover:after, .pagination li.active a.page-link:after
	{
	width: 100%;
}

@media only screen and (max-width: 480px) {
	.pagination {
		display: block;
	}
	.pagination li {
		margin-bottom: 10px;
		display: inline-block;
	}
}

.for {
	position: relative;
	width: 250px;
	height: 50px;
	margin: 0 auto;
}

.d1 {
	height: 30px;
	background: white;
	position: absolute;
	right: 5%;
	margin-top: 3%;
}

.d1 input {
	width: 110%;
	height: 20px;
	padding-left: 90px;
	border: 2px solid #5ab4dc;
	border-radius: 5px;
	outline: none;
	background: white;
	color: #9E9C9C;
	font-size: 13px;
}

.d1 button {
	position: absolute;
	top: 0;
	right: -25px;
	/* 	left : 2px; */
	width: 32px;
	height: 38px;
	border: none;
	background: #5ab4dc;
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
	height: 40px;
	width: 90px;
	font-size: 12px;
	border-radius: 5px 0px 0px 5px;
	border-top: 2px solid #5ab4dc;
	border-bottom: 2px solid #5ab4dc;
	border-left: 2px solid #5ab4dc;
	border-right: 2px solid #5ab4dc;
}
</style>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dnxk8c7baj&submodules=geocoder"></script>


<script>
$(document).ready(function(){
	$(".shTr").on("click", function(){
		console.log("shTr click");
		
		var sh_id = $(this).find(".sh_id").text();
		$("#sh_id").val(sh_id);
		$("#frm").attr("action", "${cp}/shelter/detailShelter");
		$("#frm").attr("method", "get");
		$("#frm").submit();
	});
	
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
//무더위 쉼터 아이디
var listData1 = []
var str2 ='${list}';

str2 = str2.replace("[", "");
str2 = str2.replace("]", "");
var listData1 = str2.split(",");
console.log(str2);





//무더위 쉼터 주소 
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
							var sh_nm;
							var sh_day_st;

							for(var j=0; j<listData1.length; j++){
//									console.log(listData1);
//									console.log(listData1[j]);
//									console.log(result.userquery);
//									console.log(listData1[j].indexOf(result.userquery));
								if(listData1[j].indexOf(result.userquery)>0){
//										console.log();
									sh_nm=listData1[j].substring(0,listData1[j].indexOf(':'));
									console.log(mem_id);
									sh_day_st=listData1[j].substring(listData1[j].indexOf(':')+1,listData1[j].lastIndexOf(':'));
//										console.log(mem_nm);
									break;
								}
							}
							console.log(sh_id);

							var infoWindow = new naver.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:10px;">The Letter is <b>"'+ sh_nm +'"</b>.</div>'
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

function boardPagingListAjaxHtml(page, pageSize) {
	$("#page").val(page);
	$("#pageSize").val(pageSize);
	$("#pageForm").submit();
	
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
							<span>무더위 쉼터</span> 지역검색
						</h2>
						</div>
					
						
					<hr>
					<form id="frm" action="${cp }/shelter/searchShelter?sh_add=${sh_add}" method="post">
					<input type="hidden" id="sh_id" class="sh_id" name="sh_id" value="${sh_id }">
					<div class="table-responsive">
						<table class="table center-aligned-table">
						<thead>
							<tr>
								<th>NO</th>
								<th>쉼터아이디</th>
								<th>쉼터이름</th>
								<th>쉼터주소</th>
								<th>운영시작일</th>
								<th>운영종료일</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${getAddShelterList }" var="vo" varStatus="status">
								<tr class="shTr" data-sh_id="${vo.sh_id }">
									<th>${vo.rn }</th>
									<td class="sh_id">${vo.sh_id }</td>
									<td>${vo.sh_nm }</td>
									<td>${vo.sh_add }</td>
									<td><fmt:formatDate value="${vo.sh_st_dt }" pattern="yyyy-MM-dd"/></td>
									<td><fmt:formatDate value="${vo.sh_end_dt }" pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						
						
					</div>
					
					
					
					
					<div id="map" style="width: 100%; height: 400px;"></div>
					
					</form>
					
					<!-- 뒤로가기 -->
						<a href="${cp}/shelter/pagingList?page=1&pageSize=10"><img  src="/image/backButton.svg" style="width: 50px;"></a>
					
					<!-- 페이지 네이션 -->
					<div class="demo" style="position: absolute; right: 20%;">
							<nav class="pagination-outer" aria-label="Page navigation">
								<ul class="pagination">
									<c:choose>
										<c:when test="${pageVo.page==1}">
											<li class="page-item prev disabled"><a href="#"
												class="page-link" aria-label="Previous"> <span
													aria-hidden="true">«</span>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												aria-hidden="Previous"
												href="javascript:boardPagingListAjaxHtml(1, ${pageVo.pageSize});"><span
													aria-hidden="true">«</span></a></li>

										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${pageVo.page==1}">
											<li class="page-item prev disabled"><a href="#"
												class="page-link" aria-label="Previous"> <span
													aria-hidden="true">‹</span>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												aria-label="Previous"
												href="javascript:boardPagingListAjaxHtml(${pageVo.page-1}, ${pageVo.pageSize});"><span
													aria-hidden="true">‹</span></a></li>
										</c:otherwise>
									</c:choose>

									<c:forEach begin="${startPage}" end="${paginationSize}" var="i">
										<c:choose>
											<c:when test="${pageVo.page == i}">
												<li class="page-item active"><a class="page-link"
													href="#">${i}</a></li>
											</c:when>
											<c:otherwise>
												<li><a class="page-link"
													href="javascript:boardPagingListAjaxHtml(${i}, ${pageVo.pageSize});">${i}</a></li>
											</c:otherwise>
										</c:choose>

									</c:forEach>

									<c:choose>
										<c:when test="${pageVo.page == lastpaginationSize}">
											<li class="page-item next disabled"><a href="#"
												class="page-link" aria-label="Next"> <span
													aria-hidden="true">›</span>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												aria-label="Next"
												href="javascript:boardPagingListAjaxHtml(${pageVo.page+1}, ${pageVo.pageSize});"><span
													aria-hidden="true">›</span></a></li>
										</c:otherwise>
									</c:choose>


									<c:choose>
										<c:when test="${pageVo.page == lastpaginationSize}">
											<li class="page-item next disabled"><a href="#"
												class="page-link" aria-label="Next"><span
													aria-hidden="true">»</span></a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												aria-label="Next"
												href="javascript:boardPagingListAjaxHtml(${lastpaginationSize}, ${pageVo.pageSize});"><span
													aria-hidden="true">»</span></a></li>
										</c:otherwise>
									</c:choose>

								</ul>
							</nav>
						</div>
					
					
				</div>
			</div>
		</div>
	</div>
	
	


</body>
</html>
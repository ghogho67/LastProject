<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무더위 쉼터 상세</title>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css); font-family: 'Noto Sans KR', sans-serif;
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

p {
font-family: 'Noto Sans KR', sans-serif;
letter-spacing: 1px;
line-height:1.6em
}
</style>


<script >
$(document).ready(function(){
	   <c:if test="${not empty msg}">
	      alert("${msg}");
	   </c:if>
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
                     <span>무더위 쉼터</span> 상세보기
                  </h2>
               </div>
               <hr>

				 <form class="form-horizontal" role="form" action="${cp }/shelter/detailShelter" method="get">
                           <input type="hidden" class="form-control" id="sh_id" name="sh_id" placeholder="무더위쉼터 아이디" value="${shelterVo.sh_id}">
				
               <div class="container">
                  <div class="row">


                     <div class="col-lg-4">
                        <div class="blog_right_sidebar">
<!--                            <aside class="single_sidebar_widget author_widget"> -->
<%--                               <h3>${lecture.lec_nm}</h3> --%>
<%--                               <h4>${lecture.lec_tea}</h4> --%>
<!--                                  <div class="media-body"> -->
<%--                               <p>${lecture.lec_cont}</p> --%>
<!--                               </div> -->
<!--                               <div class="br"></div> -->
<!--                            </aside> -->
                           <aside class="single_sidebar_widget popular_post_widget">

                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                                 
                                    <p>무더위쉼터 아이디 : <fmt:formatDate value="${shelterVo.sh_id }"/></p>
                                 </div>
                              </div>
                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                                    <p>무더위쉼터 이름 : <fmt:formatDate value="${shelterVo.sh_nm }"/></p>
                                 </div>
                              </div>

                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                              
                                    <p>무더위쉼터 주소: ${shelterVo.sh_add }</p>
                                 </div>
                              </div>


                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                              
                                    <p>무더위쉼터 운영시작일 : ${shelterVo.sh_st_dt }</p>
                                 </div>
                              </div>


                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                                    <p>무더위쉼터 운영종료일: ${shelterVo.sh_end_dt }</p>

                                 </div>
                              </div>

                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                                    <p>무더위쉼터 평일 시작시간 : ${shelterVo.sh_day_st }</p>
                                    

                                 </div>
                              </div>
                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                                    <p>무더위쉼터 평일 종료시간 : ${shelterVo.sh_day_end }</p>
                                    

                                 </div>
                              </div>
                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                                    <p>무더위쉼터 주말 시작시간 : ${shelterVo.sh_we_st }</p>
                                    

                                 </div>
                              </div>
                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                                    <p>무더위쉼터 주말 종료시간: ${shelterVo.sh_we_end }</p>
                                    

                                 </div>
                              </div>
                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                                    <p>무더위쉼터 담당자: ${shelterVo.sw_nm }</p>
                                    

                                 </div>
                              </div>
                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                                    <p>무더위쉼터 담당자 연락처 : ${shelterVo.sw_phone }</p>
                                    

                                 </div>
                              </div>


                              <div class="br"></div>
                           </aside>



                        </div>
                     </div>




                     <div class="col-lg-8 posts-list">
                        <div class="single-post row">

                           <div class="col-lg-12 blog_details">
                              <h3>무더위 쉼터</h3>
                              <div id="map" style="width: 100%; height: 500px;"></div>
                              <div style=" position: absolute;">
                        ${culture.culture_type}: &nbsp;${culture.culture_add}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${culture.culture_phone}
                           </div>
                           </div>
                           
                        </div>
                     </div>

                  </div>

               </div>
               
               </form> 
            </div>






         </div>
      </div>
   </div>






</body>
</html>
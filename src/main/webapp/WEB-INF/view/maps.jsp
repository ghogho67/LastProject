<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=dnxk8c7baj&submodules=geocoder"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dnxk8c7baj"></script>
<script>
$(document).ready(function() {
	getLocation();

});
//gps정보 얻어오기
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
	
	map_init(nLat, nLng);
	
	
}
	




var map;

function map_init(nLat, nLng){
	
	
	var mapOptions = {
		center: new naver.maps.LatLng(nLat, nLng),
		zoom: 10
	};

	map = new naver.maps.Map('map', mapOptions);
	
// 	drawMarker(nLat,nLng)
	
}






function initGeocoder() {
    var latlng = map.getCenter();
	
    var utmk = naver.maps.TransCoord.fromLatLngToUTMK(latlng); // 위/경도 -> UTMK
    var tm128 = naver.maps.TransCoord.fromUTMKToTM128(utmk);   // UTMK -> TM128
    var naverCoord = naver.maps.TransCoord.fromTM128ToNaver(tm128); // TM128 -> NAVER

    infoWindow = new naver.maps.InfoWindow({
        content: ''
    });

    map.addListener('click', function(e) {
        var latlng = e.coord,
            utmk = naver.maps.TransCoord.fromLatLngToUTMK(latlng),
            tm128 = naver.maps.TransCoord.fromUTMKToTM128(utmk),
            naverCoord = naver.maps.TransCoord.fromTM128ToNaver(tm128);

        utmk.x = parseFloat(utmk.x.toFixed(1));
        utmk.y = parseFloat(utmk.y.toFixed(1));

        infoWindow.setContent([
            '<div style="padding:10px;width:380px;font-size:14px;line-height:20px;">',
            '<strong>LatLng</strong> : '+ '좌 클릭 지점 위/경도 좌표' +'<br />',
            '<strong>UTMK</strong> : '+ '위/경도 좌표를 UTMK 좌표로 변환한 값' +'<br />',
            '<strong>TM128</strong> : '+ '변환된 UTMK 좌표를 TM128 좌표로 변환한 값' +'<br />',
            '<strong>NAVER</strong> : '+ '변환된 TM128 좌표를 NAVER 좌표로 변환한 값' +'<br />',
            '</div>'
        ].join(''));

        infoWindow.open(map, latlng);
        console.log('LatLng: ' + latlng.toString());
        console.log('UTMK: ' + utmk.toString());
        console.log('TM128: ' + tm128.toString());
        console.log('NAVER: ' + naverCoord.toString());
    });
}


naver.maps.onJSContentLoaded = initGeocoder;












function drawMarker(nLat, nLng){



var listData = [
	
	    {
	        groupAddress: '대전광역시 중구 중앙로76' 
	    },
	    {
	        groupAddress: '대전 중구 중앙로 77' 
	    },
	    {
	        groupAddress: '대전 유성구 유성대로654번길 130' 
	    }

];

var listData2 = [
	'대전광역시 중구 중앙로76', 
	'대전 중구 중앙로 77' , 
	'대전 유성구 유성대로654번길 130' 
    

];


	
	
for (var i=0; i < listData2.length ; i++) {
	// 주소로 좌표를 검색합니다
	
	naver.maps.Service.geocode({
        address: listData2[i]
    }, function(status, response) {
        if (status !== naver.maps.Service.Status.OK) {
            return alert('Something wrong!');
        }

        var result = response.result, // 검색 결과의 컨테이너
            items = result.items; // 검색 결과의 배열
		
        var position = new naver.maps.LatLng(item.point.x, item.point.y);
      
        var markerOptions = {
            position: position.destinationPoint(90, 15),
            map: map,
            icon: {
                url: '${cp}/img/place.png',
                size: new naver.maps.Size(50, 52),
                origin: new naver.maps.Point(0, 0),
                anchor: new naver.maps.Point(25, 26)
            }
        };
        var marker = new naver.maps.Marker(markerOptions);
        
        var contentString = [
            '<div class="iw_inner">',
            '   <h3>서울특별시청</h3>',
            '   <p>서울특별시 중구 태평로1가 31 | 서울특별시 중구 세종대로 110 서울특별시청<br />',
            '       <img src="'+ HOME_PATH +'/img/example/hi-seoul.jpg" width="55" height="55" alt="서울시청" class="thumb" /><br />',
            '       02-120 | 공공,사회기관 &gt; 특별,광역시청<br />',
            '       <a href="http://www.seoul.go.kr" target="_blank">www.seoul.go.kr/</a>',
            '   </p>',
            '</div>'
        ].join('');

    var infowindow = new naver.maps.InfoWindow({
        content: contentString,
        maxWidth: 140,
        backgroundColor: "#eee",
        borderColor: "#2db400",
        borderWidth: 5,
        anchorSize: new naver.maps.Size(30, 30),
        anchorSkew: true,
        anchorColor: "#eee",
        pixelOffset: new naver.maps.Point(20, -20)
    });

    naver.maps.Event.addListener(marker, "click", function(e) {
        if (infowindow.getMap()) {
            infowindow.close();
        } else {
            infowindow.open(map, marker);
        }
    });

        
        
        


    });
	



	} 
	
	

	
}





</script>
</head>
<body>
<div id="map" style="width:100%;height:400px;"></div>

</body>
</html>
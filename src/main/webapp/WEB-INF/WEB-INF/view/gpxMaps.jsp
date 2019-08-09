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
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dnxk8c7baj&submodules=geocoder"></script>
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
			center: new naver.maps.LatLng(37.30675, 126.94426),
		    zoom: 7,
		    mapTypeId: 'normal'
		};

	map = new naver.maps.Map('map', mapOptions);
	
}



$.ajax({
    url: '${cp}/data/move_gps.gpx',
    dataType: 'xml',
    success: startDataLayer
});

function startDataLayer(xmlDoc) {
    map.data.addGpx(xmlDoc);
}




</script>
</head>
<body>
<div id="map" style="width:100%;height:400px;"></div>

</body>
</html>
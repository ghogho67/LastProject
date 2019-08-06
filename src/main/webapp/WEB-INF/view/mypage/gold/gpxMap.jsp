<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/view/common/LibForMypage.jsp"%>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dnxk8c7baj&submodules=geocoder"></script>

<script>
$(document).ready(function() {
	getLocation();
	
	
	$('#date1').change(function() {
		console.log($('#date1').val());
		var time = $('#date1').val();
		time=time.replace(/-/gi, "");
		
		var mem_id = '${MEM_INFO.mem_id}';
		
		$.ajax({
		    url: '${cp}/data/'+time+'_'+mem_id+'.gpx',
		    dataType: 'xml',
		    success: startDataLayer
		});
	});
		
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
			center: new naver.maps.LatLng(nLat, nLng),
		    zoom: 7,
		    mapTypeId: 'normal'
		};

	map = new naver.maps.Map('map', mapOptions);
	
}



$.ajax({
    url: '${cp}/data/20190806_aha.gpx',
    dataType: 'xml',
    success: startDataLayer
});

function startDataLayer(xmlDoc) {
    map.data.addGpx(xmlDoc);
}


</script>

</head>
<body>
	<%@include file="/WEB-INF/view/common/mypage/navigationBar.jsp"%>
	<%@include file="/WEB-INF/view/common/mypage/sidebarP.jsp"%>


	<!-- partial -->
	<div class="content-wrapper">
		<h3> &nbsp;&nbsp;&nbsp;My Page</h3>
		<div class="row mb-4">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div id="map" style="width:100%;height:400px;"></div>
							<form id="frm" action="${cp}/mypage/stress">
								<input type="hidden" id="mem_id" value="${MEM_INFO.mem_id}" name="mem_id">
								<input type="date" id="date1" name="gps_time">
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>


	</div>


</body>
</html>
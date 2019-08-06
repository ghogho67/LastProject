<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html lang="ko">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>간단한 지도 표시하기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dnxk8c7baj&submodules=geocoder"></script>
<body>
	<div id="map" style="width: 80%; height: 800px;"></div>
	<ul id="cwUl">
		<c:forEach items="${cwList }" var="cw">
			<input type="hidden" name="add" value="${cw.mem_add1 }">
			<input type="hidden" name="cw_mem_id" value="${cw.mem_id }">
		</c:forEach>
	</ul>
</body>
<script>
	var map = new naver.maps.Map('map', {
		center : new naver.maps.LatLng(37.3595704, 127.105399),
		zoom : 10
	});

	MARKER_SPRITE_POSITION = {
		"송강동" : 'a',
		"대흥동" : 'a'
	};

	for (key in MARKER_SPRITE_POSITION) {

		naver.maps.Service.geocode({
			query : key
		}, function(status, response) {
			if (status !== naver.maps.Service.Status.OK) {
				return alert('Something wrong!');
			}

			response.v2.addresses[0].x;
			response.v2.addresses[0].y;

		});
	}
</script>
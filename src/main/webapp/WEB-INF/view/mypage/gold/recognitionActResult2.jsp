<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link href="csslinegraph/csslinegraph.css" rel="stylesheet"
	type="text/css" media="screen" />
<title>인지활동내역</title>
<meta charset="UTF-8">
<%@include file="/WEB-INF/view/common/LibForMypage.jsp"%>
<%@include file="/WEB-INF/view/common/LibForWebpage2.jsp"%>

<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>


<style>
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
</style>
<script>
window.onload = function () {
	var ex =[];
	ex.push({ x: new Date(2019, 0, 3), y: 40 ,indexLabel: "간이인지",markerColor: "red", markerType: "triangle"})
	ex.push({ x: new Date(2019, 0, 3), y: 40 })
	ex.push({ x: new Date(2019, 0, 4), y: 40 })
	ex.push({ x: new Date(2019, 0, 5), y: 44 })
	ex.push({ x: new Date(2019, 0, 6), y: 45 });
	
	
	var data = [];

	
	var resurtStr = "${sur_resultList}";
	resurtStr = resurtStr.replace("[", ""); 
	resurtStr = resurtStr.replace("]", ""); 

	var resultList = resurtStr.split(",");

	console.log("${sur_timeList}");
	
	var timetStr = "${sur_timeList}";
	timetStr = timetStr.replace("[", ""); 
	timetStr = timetStr.replace("]", ""); 

	var timeList = timetStr.split(",");
	
	for (var i = 0; i<timeList.length ; i++) {
		console.log(timeList[i])
		data.push({
			x: new Date(timeList[i]),
			y: parseInt(resultList[i].trim())
		});
	}
	console.log(ex);
	console.log(data);
	
	
	

	

var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light2",
// 	title:{
// 		text: "Site Traffic"
// 	},
	axisX:{
		valueFormatString: "M월  D일",
		crosshair: {
			enabled: true,
			snapToDataPoint: true
		}
	},
	axisY: {
		title: "인지 지수",
		crosshair: {
			enabled: true
		}
	},
	toolTip:{
		shared:true
	},  
	legend:{
		cursor:"pointer",
		verticalAlign: "bottom",
		horizontalAlign: "left",
		dockInsidePlotArea: true,
		itemclick: toogleDataSeries
	},
	data: [{
		type: "line",
		showInLegend: true,
		name: "인지 평가점수",
		markerType: "square",
		xValueFormatString: "YYYY MM DD",
		color: "#F08080",
		dataPoints: data
	},
	{
		type: "line",
		showInLegend: true,
		name: "회원 평균 인지점수",
		lineDashType: "dash",
		dataPoints: [
			{ x: new Date(2019, 0, 3), y: 50 },
			{ x: new Date(2019, 0, 4), y: 51 },
			{ x: new Date(2019, 0, 5), y: 54 },
			{ x: new Date(2019, 0, 6), y: 55 },
			{ x: new Date(2019, 0, 7), y: 54 },
			{ x: new Date(2019, 0, 8), y: 60 },
			{ x: new Date(2019, 0, 9), y: 57 },
			{ x: new Date(2019, 0, 10), y: 56 },
			{ x: new Date(2019, 0, 11), y: 55 },
			{ x: new Date(2019, 0, 12), y: 59 },
			{ x: new Date(2019, 0, 13), y: 64},
			{ x: new Date(2019, 0, 14), y: 67 },
			{ x: new Date(2019, 0, 15), y: 65 },
			{ x: new Date(2019, 0, 16), y: 67 }
		]
	}]

});
chart.render();

function toogleDataSeries(e){
	if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		e.dataSeries.visible = false;
	} else{
		e.dataSeries.visible = true;
	}
	chart.render();
}

}
</script>
</head>
<body>

	<div class="container-fluid"></div>

	<%@include file="/WEB-INF/view/common/mypage/navigationBar.jsp"%>



	<c:choose>

		<c:when test="${MEM_INFO.mem_grade==0}">
			<%@include file="/WEB-INF/view/common/mypage/sidebarA.jsp"%>

		</c:when>

		<c:when test="${MEM_INFO.mem_grade==3}">
			<%@include file="/WEB-INF/view/common/mypage/sidebarW.jsp"%>

		</c:when>

		<c:otherwise>
			<%@include file="/WEB-INF/view/common/mypage/sidebarP.jsp"%>

		</c:otherwise>

	</c:choose>





	<form id="frm" action="${cp}/report/report" method="get">
		<input type="hidden" id="reportId" name="reportId"> <input
			type="hidden" id="memid" name="memid" value="${MEM_INFO.mem_id}">
		<input type="hidden" id="memgrade" name="memgrade"
			value="${MEM_INFO.mem_grade}">
	</form>




	<div class="content-wrapper">

		<div class="row mb-4">


			<div class="col-lg-12" style="padding: 0 60px 0 60px;">
				<div class="card">



					<div class="card-body">
						<div id="titlee">
							<h2>
								<span>인지 활동 내역</span> 조회
							</h2>
						</div>



<div id="chartContainer" style="height: 500px; width: 100%;"></div>

					</div>

				</div>

			</div>
		</div>
	</div>





</body>
</html>
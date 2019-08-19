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
		dataPoints: [
			{ x: new Date(2017, 0, 3), y: 650 ,indexLabel: "간이인지",markerColor: "red", markerType: "triangle" },
			
			{ x: new Date(2017, 0, 4), y: 700 },
			{ x: new Date(2017, 0, 5), y: 710 },
			{ x: new Date(2017, 0, 6), y: 658 },
			{ x: new Date(2017, 0, 7), y: 734 },
			{ x: new Date(2017, 0, 8), y: 963 },
			{ x: new Date(2017, 0, 9), y: 847 },
			{ x: new Date(2017, 0, 10), y: 853 },
			{ x: new Date(2017, 0, 11), y: 869 },
			{ x: new Date(2017, 0, 12), y: 943 },
			{ x: new Date(2017, 0, 13), y: 970 },
			{ x: new Date(2017, 0, 14), y: 869 },
			{ x: new Date(2017, 0, 15), y: 890 },
			{ x: new Date(2017, 0, 16), y: 930 }
		]
	},
	{
		type: "line",
		showInLegend: true,
		name: "평균 인지점수",
		lineDashType: "dash",
		dataPoints: [
			{ x: new Date(2017, 0, 3), y: 510 },
			{ x: new Date(2017, 0, 4), y: 560 },
			{ x: new Date(2017, 0, 5), y: 540 },
			{ x: new Date(2017, 0, 6), y: 558 },
			{ x: new Date(2017, 0, 7), y: 544 },
			{ x: new Date(2017, 0, 8), y: 693 },
			{ x: new Date(2017, 0, 9), y: 657 },
			{ x: new Date(2017, 0, 10), y: 663 },
			{ x: new Date(2017, 0, 11), y: 639 },
			{ x: new Date(2017, 0, 12), y: 673 },
			{ x: new Date(2017, 0, 13), y: 660 },
			{ x: new Date(2017, 0, 14), y: 562 },
			{ x: new Date(2017, 0, 15), y: 643 },
			{ x: new Date(2017, 0, 16), y: 570 }
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
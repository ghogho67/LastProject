<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://cdn.jsdelivr.net/npm/moment@2.24.0/min/moment.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-streaming@1.8.0"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
var chartColors = {
		red: 'rgb(255, 99, 132)',
		orange: 'rgb(255, 159, 64)',
		yellow: 'rgb(255, 205, 86)',
		green: 'rgb(75, 192, 192)',
		blue: 'rgb(54, 162, 235)',
		purple: 'rgb(153, 102, 255)',
		grey: 'rgb(201, 203, 207)'
	};

	function getData(){
		var bpm=0;
		var mem_id= "brown";
		$.ajax({
			url: "${pageContext.request.contextPath}/gps/getCardiac",
			data : "mem_id="+mem_id,
			async:false,
			success :  function(data){
				bpm =data.bpm;
				console.log(bpm);
// 				return bpm;
			}
		});
// 		console.log(bpm);
		return bpm;
	}

	function onRefresh(chart) {
		chart.config.data.datasets.forEach(function(dataset) {
			dataset.data.push({
				x: Date.now(),
				y: getData()
			});
		});
	}

	var color = Chart.helpers.color;
	var config = {
		type: 'line',
		data: {
			datasets: [{
				label: 'Dataset 1 (linear interpolation)',
				backgroundColor: color(chartColors.red).alpha(0.5).rgbString(),
				borderColor: chartColors.red,
				fill: false,
				cubicInterpolationMode: 'monotone',
				data: [],
				radius	: 0,
				borderWidth: 0.5
				
			}]
		},
		options: {
			title: {
				display: true,
				text: 'Line chart (hotizontal scroll) sample'
			},
			scales: {
				xAxes: [{
					type: 'realtime',
					realtime: {
						duration: 10000,
						refresh: 1000,
						delay: 2000,
						onRefresh: onRefresh
					}
				}],
				yAxes: [{
					scaleLabel: {
						display: true,
						labelString: 'bpm'
					},
					ticks: {
						suggestedMax: 130,    // minimum will be 0, unless there is a lower value.
						beginAtZero: true 
					}

				}]
			},
			tooltips: {
				mode: 'nearest',
				intersect: false
			},
			hover: {
				mode: 'nearest',
				intersect: false
			}
		}
	};

	window.onload = function() {
		var ctx = document.getElementById('myChart').getContext('2d');
		window.myChart = new Chart(ctx, config);
		
		
		
	};

	
</script>

</head>
<body>

<div>
		<canvas id="myChart"></canvas>
	</div>


</body>
</html>
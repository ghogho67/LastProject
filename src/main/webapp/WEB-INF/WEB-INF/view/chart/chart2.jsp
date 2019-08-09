<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html>

<head>
	<title>Scatter Chart</title>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

	<style>
	canvas {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}
	</style>
</head>

<body>
	<div style="width:75%">
		<canvas id="canvas"></canvas>
	</div>

	<script>
	var chartColors = {
			red: 'rgb(255, 99, 132)',
			orange: 'rgb(255, 159, 64)',
			yellow: 'rgb(255, 205, 86)',
			green: 'rgb(75, 192, 192)',
			blue: 'rgb(54, 162, 235)',
			purple: 'rgb(153, 102, 255)',
			grey: 'rgb(201, 203, 207)'
		};
	
		var color = Chart.helpers.color;
		function generateData() {
			var data = [];
			
			
			var str = "${list}";
			str = str.replace("[", ""); 
			str = str.replace("]", ""); 
// 			list = ; 

   			 var list = str.split(",");
//   		   var result = arr[0];


				console.log(list);
				console.log(list.length);
				console.log(list[i]);
			
			for (var i = 1; i<list.length ; i++) {
				
				console.log(list[i]);
				data.push({
					x: list[i],
					y: list[i-1]
				});
			}
			return data;
			
		}
	

		var scatterChartData = {
			datasets: [{
				label: 'My First dataset',
				borderColor: window.chartColors.red,
				backgroundColor: color(window.chartColors.red).alpha(0.2).rgbString(),
				data: generateData()
			}]
		};
		
		
		var ctx = document.getElementById("canvas").getContext("2d");
		$(document).ready(function() {

		
		
		var img = new Image();
		img.src = '${cp}/image/elipse.png';
		var oClearRect = ctx.clearRect;
		ctx.clearRect = function(){
		    oClearRect.apply(this, arguments);
		    this.drawImage(img, 300, 100);
		};

		});

			  
			
			
		window.onload = function() {
			
			var myScatter = Chart.Scatter(ctx, {
				data: scatterChartData,
				options: {
					title: {
						display: true,
						text: 'Chart.js Scatter Chart'
					},scales: {
						xAxes: [{
							scaleLabel: {
								display: true,
								labelString: 'bpm'
							},
							ticks: {
								suggestedMax: 130,    // minimum will be 0, unless there is a lower value.
								beginAtZero: true 
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
					}
				}
			  
			  
			});

		};

	</script>
</body>

</html>

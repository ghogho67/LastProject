<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://cdn.jsdelivr.net/npm/moment@2.24.0/min/moment.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-streaming@1.8.0"></script>

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

	function randomScalingFactor() {
		return (Math.random() > 0.5 ? 1.0 : -1.0) * Math.round(Math.random() * 100);
	}
	function getData(){
		$.ajax({
			url: "${cp}/regist/idCheck",
			data : "mem_id="+data,
			success :  function(data){
				console.log(data);
				if(data.mem_id == "mem_id"){
					alert("아이디를 정규식에 맞게 입력해 주세요");
					$("#mem_id").val("");
					$("#mem_id").focus();
					return;
				}
				if(data.mem_id == "yes"){
					alert("사용가능한 아이디입니다");
				}else{
					alert("사용중인 아이디입니다");
					$('#mem_id').val("");
					$('#mem_id').focus();
				}
			}
		});
	}

	function onRefresh(chart) {
		chart.config.data.datasets.forEach(function(dataset) {
			dataset.data.push({
				x: Date.now(),
				y: randomScalingFactor()
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
				lineTension: 0,
				borderDash: [8, 4],
				data: []
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
						duration: 20000,
						refresh: 1000,
						delay: 2000,
						onRefresh: onRefresh
					}
				}],
				yAxes: [{
					scaleLabel: {
						display: true,
						labelString: 'value'
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

	document.getElementById('randomizeData').addEventListener('click', function() {
		config.data.datasets.forEach(function(dataset) {
			dataset.data.forEach(function(dataObj) {
				dataObj.y = randomScalingFactor();
			});
		});
		window.myChart.update();
	});

	var colorNames = Object.keys(chartColors);
	document.getElementById('addDataset').addEventListener('click', function() {
		var colorName = colorNames[config.data.datasets.length % colorNames.length];
		var newColor = chartColors[colorName];
		var newDataset = {
			label: 'Dataset ' + (config.data.datasets.length + 1),
			backgroundColor: color(newColor).alpha(0.5).rgbString(),
			borderColor: newColor,
			fill: false,
			lineTension: 0,
			data: []
		};

		config.data.datasets.push(newDataset);
		window.myChart.update();
	});

	document.getElementById('removeDataset').addEventListener('click', function() {
		config.data.datasets.pop();
		window.myChart.update();
	});

	document.getElementById('addData').addEventListener('click', function() {
		onRefresh(window.myChart);
		window.myChart.update();
	});
</script>

</head>
<body>

<div>
		<canvas id="myChart"></canvas>
	</div>
	<p>
		<button id="randomizeData">Randomize Data</button>
		<button id="addDataset">Add Dataset</button>
		<button id="removeDataset">Remove Dataset</button>
		<button id="addData">Add Data</button>
	</p>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/view/common/LibForMypage.jsp"%>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>

<!-- 	<script src="https://cdn.jsdelivr.net/npm/moment@2.24.0/min/moment.min.js"></script> -->
<!-- 	<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-streaming@1.8.0"></script> -->


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
#chart2 {
	background: url('${cp}/image/circle2.png') no-repeat 455px 142px;
	background-size: 22%;
	
}
</style>
</head>

<body>
	<%@include file="/WEB-INF/view/common/mypage/navigationBar.jsp"%>
	<%@include file="/WEB-INF/view/common/mypage/sidebarP.jsp"%>


	<!-- partial -->

	<div class="content-wrapper">
		<div class="col-lg-12">
			<div class="card">

				<div class="card-body">

					<div id="titlee">
						<h2>
							<span>스트레스 지수</span>&nbsp;
						</h2>
					</div>
					<hr>

					<div class="row" style="padding-left: 70px;">


						<div style="width: 75%; padding-left:130px; " id="chart2">
							<canvas id="canvas"></canvas>
							<form id="frm" action="${cp}/mypage/stress">
								<input type="hidden" id="mem_id" value="${MEM_INFO.mem_id}"
									name="mem_id"> <input
									style="position: absolute; top: 10%; right: 25%;" type="text"
									id="datepicker1" name="gps_time">
							</form>
						</div>
						<div>
							<img alt="" src="${cp}/image/state.PNG">
							<img alt="" src="${cp}/image/state2.png">
							
						</div>
					</div>
				</div>
			</div>


		</div>

	</div>


	<script>
		$(document)
				.ready(
						function() {
							$.datepicker
									.setDefaults({
										dateFormat : 'yymmdd',
										prevText : '이전 달',
										nextText : '다음 달',
										monthNames : [ '1월', '2월', '3월', '4월',
												'5월', '6월', '7월', '8월', '9월',
												'10월', '11월', '12월' ],
										monthNamesShort : [ '1월', '2월', '3월',
												'4월', '5월', '6월', '7월', '8월',
												'9월', '10월', '11월', '12월' ],
										dayNames : [ '일', '월', '화', '수', '목',
												'금', '토' ],
										dayNamesShort : [ '일', '월', '화', '수',
												'목', '금', '토' ],
										dayNamesMin : [ '일', '월', '화', '수',
												'목', '금', '토' ],
										showMonthAfterYear : true,
										yearSuffix : '년'
									});
							$(function() {
								$("#datepicker1").datepicker();
							});

							$('#datepicker1')
									.change(
											function() {
												console.log($('#datepicker1')
														.val());
												var frmData = $("#frm")
														.serialize();
												console.log(frmData);
												$
														.ajax({
															url : "${pageContext.request.contextPath}/mypage/reChart",
															data : frmData,
															async : false,
															success : function(
																	data) {
																console
																		.log(data.list)
																reData(data.list);
															}
														});

												//	 			$('#frm').submit();

												//	 			window.myScatter.update();
											});

						});

		var chartColors = {
			red : 'rgb(255, 99, 132)',
			orange : 'rgb(255, 159, 64)',
			yellow : 'rgb(255, 205, 86)',
			green : 'rgb(75, 192, 192)',
			blue : 'rgb(54, 162, 235)',
			purple : 'rgb(153, 102, 255)',
			grey : 'rgb(201, 203, 207)'
		};

		var color = Chart.helpers.color;
		function generateData() {
			var data = [];

			var str = "${list}";
			str = str.replace("[", "");
			str = str.replace("]", "");

			var list = str.split(",");
			//   		   var result = arr[0];

			console.log(list);
			console.log(list.length);
			console.log(list[i]);

			for (var i = 1; i < list.length; i++) {

				console.log(list[i]);
				data.push({
					x : list[i],
					y : list[i - 1]
				});
			}
			return data;

		}

		var scatterChartData = {
			datasets : [ {
				label : 'My First dataset',
				borderColor : window.chartColors.red,
				backgroundColor : color(window.chartColors.red).alpha(0.2)
						.rgbString(),
				data : generateData()
			} ]
		};

		var ctx = document.getElementById("canvas").getContext("2d");
		// 		$(document).ready(function() {

		// 		var img = new Image();
		// 		img.src = '${cp}/image/elipse.png';
		// 		var oClearRect = ctx.clearRect;
		// 		ctx.clearRect = function(){
		// 		    oClearRect.apply(this, arguments);
		// // 		    cosole.log(this);
		// 		    this.drawImage(img, 100, 100,700,700);
		// 		};

		// 		});

		function reData(list) {
			var data = [];

			var str = list;
			console.log(list);
			console.log(str);

			console.log(list);
			console.log(list.length);
			console.log(list[i]);

			// 			scatterChartData.datasets.forEach(function(dataset) {

			// 				dataset.data = dataset.data.map(function() {
			// 					return {

			// 						x: list[i],
			// 						y: list[i-1]
			// 					};
			// 				});
			// 			});
			// 			window.myScatter.update();

			for (var i = 1; i < list.length; i++) {

				console.log(list[i]);

				data.push({
					x : list[i],
					y : list[i - 1]
				});
			}

			var scatterChartData = {
				datasets : [ {
					label : 'My First dataset',
					borderColor : window.chartColors.red,
					backgroundColor : color(window.chartColors.red).alpha(0.2)
							.rgbString(),
					data : data
				} ]
			};
			console.log(scatterChartData.datasets)

			// 			window.myScatter.update();
			// 			return data;

			window.myScatter = Chart.Scatter(ctx, {
				data : scatterChartData,
				options : {
					title : {
						display : true,
						text : 'Chart.js Scatter Chart'
					},
					scales : {
						xAxes : [ {
							scaleLabel : {
								display : true,
								labelString : 'bpm'
							},
							ticks : {
								suggestedMax : 130, // minimum will be 0, unless there is a lower value.
								beginAtZero : true
							}
						} ],
						yAxes : [ {
							scaleLabel : {
								display : true,
								labelString : 'bpm'
							},
							ticks : {
								suggestedMax : 130, // minimum will be 0, unless there is a lower value.
								beginAtZero : true
							}

						} ]
					}
				}

			});

		}

		window.onload = function() {

			window.myScatter = Chart.Scatter(ctx, {
				data : scatterChartData,
				options : {
					title : {
						display : true,
						text : 'Chart.js Scatter Chart'
					},
					scales : {
						xAxes : [ {
							scaleLabel : {
								display : true,
								labelString : 'bpm'
							},
							ticks : {
								suggestedMax : 130, // minimum will be 0, unless there is a lower value.
								beginAtZero : true
							}
						} ],
						yAxes : [ {
							scaleLabel : {
								display : true,
								labelString : 'bpm'
							},
							ticks : {
								suggestedMax : 130, // minimum will be 0, unless there is a lower value.
								beginAtZero : true
							}

						} ]
					}
				}

			});

		};
	</script>


</body>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</html>
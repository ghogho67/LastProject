<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="ko">
<meta charset="utf-8" />
<head>

<style>
#calendar {
	width: 1000px;
	margin: 0 auto;
}
</style>

<style>
img {
	border-radius: 3%;
}

.M_btn {
	min-width: 150px;
	padding: 0 25px;
	width: 250px;
	height: 44px;
	text-align: center;
	background: #78d3f5;
	box-sizing: border-box;
	border-radius: 50px;
	color: #fff;
	font-size: 18px;
	font-weight: bold;
	border: 2px solid #78d3f5;
}

#button {
	vertical-align: middle;
	width: 300px;
}

table.cw {
	width: 1000px;
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	margin: 0 auto;
}

table.cw thead {
	border-right: 1px solid #ccc;
	border-left: 1px solid #ccc;
	background: #e7708d;
}

table.cw thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
}

table.cw tbody th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #fcf1f4;
}

table.cw td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
</style>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"
	type="text/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<link rel="stylesheet"
	href="/FullCalendar-Example-master/vendor/css/fullcalendar.min.css" />
<link rel="stylesheet"
	href="/FullCalendar-Example-master/vendor/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/FullCalendar-Example-master/vendor/css/select2.min.css" />
<link rel="stylesheet"
	href="/FullCalendar-Example-master/vendor/css/bootstrap-datetimepicker.min.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="/FullCalendar-Example-master/css/main.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f7a976957407edfce0f821ce36e56056&libraries=services,clusterer,drawing"></script>
<script>
	$(document).ready(function() {
		IMP.init("imp21318637");
	})
</script>

<script>
	$(document).ready(
			function() {

				$("#videochat").on("click", function() {

					window.open("${cp}/matching/webRtc")
				});
				var myDate = new Date();
				// 				alert("myDate : " + myDate);
				// 				alert("$('#edit-startDate').val() : "
				// 						+ $('#edit-startDate').val());
				$('#edit-startDate').val(myDate);
				// 				alert("$('#edit-startDate').val() : "
				// 						+ $('#edit-startDate').val());
				// 		$("#edit-startDate").datepicker().datepicker("setDate", new Date());
				$('#edit-startDate').val(
						$.datepicker.formatDate('YYYY-MM-DD', new Date()));
				// 				alert("$.datepicker.formatDate('YYYY-MM-DD', new Date()) : "
				// 						+ $.datepicker.formatDate('YYYY-MM-DD', new Date()));
			});
	// import결제 함수
</script>


</head>

<body>


	<div class="container" style="width: 1000px;">
		<div style="width: 50%; float: left; height: 350px;">
		
			<label for="userNm" class="col-sm-2 control-label">${path }</label>
			<%-- 			 <img id="img" src="${cp }/matching/photo?mem_id=ahri" --%>
			<!-- 				style="float: right; width: 400px; height: 400px;" /> -->
			<img id="img" src="${cp }/matching/photo?mem_id=${memVo.mem_id } "
				style="float: right; width: 400px; height: 300px;"
				alt="${cp}/image/cw.png" />
		</div>
			<input type="hidden" class="btn"><br> <br> <input
				type="button" id="app" class="M_btn" value="매칭신청"><br>
			<br> <input type="button" class="M_btn" value="화상채팅"
				id="videochat"><br> <br> <input type="button"
				class="M_btn" value="채팅"> <input type="hidden" name="mem_id"
				value="${mem_id}">
		</div>
	<!-- 일자 클릭시 메뉴오픈 -->
	<div id="contextMenu" class="dropdown clearfix">
		<ul class="dropdown-menu dropNewEvent" role="menu"
			aria-labelledby="dropdownMenu"
			style="display: block; position: static; margin-bottom: 5px;">
			<li><a tabindex="-1" href="#">방문간병</a></li>
			<li><a tabindex="-1" href="#">병원간병</a></li>
			<li><a tabindex="-1" href="#">운동도움</a></li>
			<li class="divider"></li>
			<li><a tabindex="-1" href="#" data-role="close">Close</a></li>
		</ul>
	</div>

	<div id="wrapper">
		<div>
			<table class="cw" border="1">
				<thead>
					<tr>
						<th>구분</th>
						<th>요양보호사</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>요양보호사명</th>
						<td>${memVo.mem_nm }</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>${memVo.mem_gender }</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${memVo.mem_phone }</td>
					</tr>
					<tr>
						<th>운전여부</th>
						<td>${memVo.cw_driver }</td>
					</tr>
					<tr>
						<th>서비스 가능 지역</th>
						<td><c:forEach items="${loList }" var="lo">
							${lo.loc_dong },							
							</c:forEach></td>
					</tr>

					<c:forEach items="${carList }" var="car" begin="1">
						<tr>
							<th>경력</th>
							<td>내용 : ${car.career_cont} 시작일 : ${car.career_st_dt } 종료일 :
								${car.career_end_dt } 소속 기관 : ${car.career_hos }</td>
						</tr>
					</c:forEach>

					<tr>
						<th>요양보호사 아이디</th>
						<td>${memVo.mem_id }</td>
						<%-- 						<td id="cw_mem_id">${memVo.mem_id }</td> --%>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="loading"></div>
		<div id="calendar"></div>
	</div>

	<!-- 일정 추가 MODAL -->
	<div class="modal fade" tabindex="-1" role="dialog" id="approvalModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">결제하기</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-12">
							<label class="col-xs-4" id="Ledit-title"></label><br>
						</div>
						<div class="col-xs-12">
							<label class="col-xs-4" id="Ledit-cont"></label><br>
						</div>
						<div class="col-xs-12">
							<label class="col-xs-4" id="Ledit-startDate"></label><br>
						</div>
						<div class="col-xs-12">
							<label class="col-xs-4" id="Ledit-endDate"></label><br>
						</div>
						<div class="col-xs-12">
							<label class="col-xs-4" id="Ledit-startTime"></label><br>
						</div>
						<!-- 							<div class="col-xs-12"> -->
						<!-- 								<label class="col-xs-4" id="Ledit-endTime"></label><br> -->
						<!-- 							</div> -->
						<div class="col-xs-12">
							<label class="col-xs-4" id="Ledit-type"></label><br>
						</div>
						<div class="col-xs-12">
							<label class="col-xs-4" id="Ledit-cost"></label><br>
						</div>
					</div>
				</div>
				<div class="modal-footer modalBtnContainer-addEvent">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="save-event">결제</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- 일정 추가 MODAL -->
	<div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body">

					<!-- 						<div class="row"> -->
					<!-- 							<div class="col-xs-12"> -->
					<!-- 								<label hidden="true" class="col-xs-4" for="edit-allDay">하루종일</label> -->
					<!-- 								<input class='allDayNewEvent' id="edit-allDay" type="checkbox" /> -->
					<!-- 							</div> -->
					<!-- 						</div> -->

					<div class="row">
						<div class="col-xs-12">
							<label class="col-xs-4" for="edit-title">일정명</label> <input
								class="inputModal" type="text" name="edit-title" id="edit-title"
								required="required" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<label class="col-xs-4" for="edit-startDate">시작날짜</label> <input
								class="inputModal" type="text" name="edit-startDate"
								id="edit-startDate" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<label class="col-xs-4" for="edit-endDate">종료날짜</label> <input
								class="inputModal" type="text" name="edit-endDate"
								id="edit-endDate" />
						</div>
					</div>
					<!-- 						<div class="row"> -->
					<!-- 							<div class="col-xs-12"> -->
					<!-- 								<label class="col-xs-4" for="edit-StartTime">시작시간</label> <input -->
					<!-- 									class="inputModal" type="text" name="edit-startTime" -->
					<!-- 									id="edit-startTime" /> -->
					<!-- 							</div> -->
					<!-- 						</div> -->
					<!-- 						<div class="row"> -->
					<!-- 							<div class="col-xs-12"> -->
					<!-- 								<label class="col-xs-4" for="edit-endTime">종료시간</label> <input -->
					<!-- 									class="inputModal" type="text" name="edit-endTime" -->
					<!-- 									id="edit-endTime" /> -->
					<!-- 							</div> -->
					<!-- 						</div> -->

					<div class="row" id="timeInfo">
						<div class="col-xs-12">
							<label class="col-xs-4" for="timeInfo">시간 선택</label>



							<div class="col-xs-7">
								<label> <input type="checkbox"
									name="timeInfo[]" value="1">09:00~10:00
								</label> <label> <input type="checkbox" name="timeInfo[]"
									value="2">10:30~11:30
								</label> <label> <input type="checkbox" name="timeInfo[]"
									value="3">12:00~13:00
								</label> <label> <input type="checkbox" name="timeInfo[]"
									value="4">13:30~14:30
								</label> <label> <input type="checkbox" name="timeInfo[]"
									value="5">15:00~16:00
								</label> <label> <input type="checkbox" name="timeInfo[]"
									value="6">16:30~17:00
								</label>

							</div>

						</div>
					</div>

					<div class="row" id="dayInfo">
						<div class="col-xs-12">
							<label class="col-xs-4" for="dayInfo[]">요일 선택</label> <label>
								<input type="checkbox" name="dayInfo[]" value="1">일요일
							</label> <label> <input type="checkbox" name="dayInfo[]"
								value="2">월요일
							</label> <label> <input type="checkbox" name="dayInfo[]"
								value="3">화요일
							</label> <label> <input type="checkbox" name="dayInfo[]"
								value="4">수요일
							</label> <label> <input type="checkbox" name="dayInfo[]"
								value="5">목요일
							</label> <label> <input type="checkbox" name="dayInfo[]"
								value="6">금요일
							</label> <label> <input type="checkbox" name="dayInfo[]"
								value="7">토요일
							</label>
						</div>
					</div>

					<div class="row">
						<div class="col-xs-12">
							<label class="col-xs-4" for="edit-type">구분</label> <select
								class="inputModal" type="text" name="edit-type" id="edit-type">
								<option value="방문간병">방문간병</option>
								<option value="병원간병">병원간병</option>
								<option value="운동도움">운동도움</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<label class="col-xs-4" for="edit-color">색상</label> <select
								class="inputModal" name="color" id="edit-color">
								<option value="#D25565" style="color: #D25565;">빨간색</option>
								<option value="#9775fa" style="color: #9775fa;">보라색</option>
								<option value="#ffa94d" style="color: #ffa94d;">주황색</option>
								<option value="#74c0fc" style="color: #74c0fc;">파란색</option>
								<option value="#f06595" style="color: #f06595;">핑크색</option>
								<option value="#63e6be" style="color: #63e6be;">연두색</option>
								<option value="#a9e34b" style="color: #a9e34b;">초록색</option>
								<option value="#4d638c" style="color: #4d638c;">남색</option>
								<option value="#495057" style="color: #495057;">검정색</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<label class="col-xs-4" for="edit-desc">설명</label>
							<textarea rows="4" cols="50" class="inputModal" name="edit-desc"
								id="edit-desc"></textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer modalBtnContainer-addEvent">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="save-event2">저장</button>
				</div>
				<!-- 					<div class="modal-footer modalBtnContainer-modifyEvent"> -->
				<!-- 						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button> -->
				<!-- 						<button type="button" class="btn btn-danger" id="deleteEvent">삭제</button> -->
				<!-- 						<button type="button" class="btn btn-primary" id="updateEvent">저장</button> -->
				<!-- 					</div> -->
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- /.container -->
	<input id="mem_id" type="hidden" value="${mem_id }">
	<input id="cw_mem_id" type="hidden" value="${memVo.mem_id }">

	<script src="/FullCalendar-Example-master/vendor/js/jquery.min.js"></script>
	<script src="/FullCalendar-Example-master/vendor/js/bootstrap.min.js"></script>
	<script src="/FullCalendar-Example-master/vendor/js/moment.min.js"></script>
	<script
		src="/FullCalendar-Example-master/vendor/js/fullcalendar.min.js"></script>
	<script src="/FullCalendar-Example-master/vendor/js/ko.js"></script>
	<script src="/FullCalendar-Example-master/vendor/js/select2.min.js"></script>
	<script
		src="/FullCalendar-Example-master/vendor/js/bootstrap-datetimepicker.min.js"></script>
	<script src="/FullCalendar-Example-master/js/mainCW.js"></script>
	<script src="/FullCalendar-Example-master/js/addEvent.js"></script>
	<script src="/FullCalendar-Example-master/js/editEvent.js"></script>
	<script src="/FullCalendar-Example-master/js/etcSetting.js"></script>

	<script>
		$("#app").click(function() {
			eventModal.modal('show');
		});
	</script>
</body>
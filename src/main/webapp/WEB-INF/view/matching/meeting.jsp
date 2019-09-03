<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- <html lang="ko"> -->
<meta charset="UTF-8" />
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
	width: 150px;
	height: 44px;
	text-align: center;
	background: #78d3f5;
	box-sizing: border-box;
	border-radius: 10px;
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
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	margin: 0 auto;
	border-collapse: collapse;
	border-left: 1px solid #f8f6ff;
	border-right: 1px solid #f8f6ff;
	border-top: 1px solid #f8f6ff;
	border-bottom: 1px solid #f8f6ff;
}

table.cw thead {
	border-right: 1px solid #f8f6ff;
	border-left: 1px solid #f8f6ff;
	border-top: 1px solid #f8f6ff;
	border-bottom: 1px solid #f8f6ff;
	/* 	background: #e7708d; */
	background: #6c7ae0;
	padding-left: 40px;
	padding-top: 20px;
	padding-bottom: 20px;
	height: 53px;
}

table.cw thead th {
	border-right: 1px solid #f8f6ff;
	border-left: 1px solid #f8f6ff;
	border-top: 1px solid #f8f6ff;
	border-bottom: 1px solid #f8f6ff;
	width: 100px;
	height: 53px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
	padding-top: 16px;
	padding-bottom: 16px;
	padding-left: 40px;
	width: 100px;
}

table.cw thead th:nth-child(1) {
	border-top-left-radius: 10px;
	border-right: 1px solid #6c7ae0;
}

table.cw thead th:nth-child(2) {
	border-top-right-radius: 10px;
	border-left: 1px solid #6c7ae0;
}

table.cw tbody th:nth-child(even) {
	border-right: 1px solid #f8f6ff;
	border-left: 1px solid #f8f6ff;
	border-top: 1px solid #f8f6ff;
	border-bottom: 1px solid #f8f6ff;
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f8f6ff;
	padding-top: 16px;
	padding-bottom: 16px;
	padding-left: 40px;
}

table.cw tbody th:nth-child(odd) {
	border-right: 1px solid white;
	border-left: 1px solid white;
	border-top: 1px solid white;
	border-bottom: 1px solid white;
}

table.cw tbody tr:nth-child(even) {
	border-right: 1px solid #f8f6ff;
	border-left: 1px solid #f8f6ff;
	border-top: 1px solid #f8f6ff;
	border-bottom: 1px solid #f8f6ff;
	background-color: #f8f6ff;
	padding-top: 16px;
	padding-bottom: 16px;
	padding-left: 40px;
}

table.cw tbody tr:nth-child(odd) {
	border-right: 1px solid #f8f6ff;
	border-left: 1px solid #f8f6ff;
	border-top: 1px solid #f8f6ff;
	border-bottom: 1px solid #f8f6ff;
}

table.cw tbody tr th {
	border-right: 1px solid #f8f6ff;
	border-left: 1px solid #f8f6ff;
	border-top: 1px solid #f8f6ff;
	border-bottom: 1px solid #f8f6ff;
	padding-top: 5px;
	padding-bottom: 5px;
	padding-left: 40px;
	color: #808080;
}

table.cw td {
	height: 53px;
	width: 350px;
	vertical-align: top;
	border-right: 1px solid #f8f6ff;
	padding-top: 16px;
	padding-bottom: 5px;
	padding-left: 40px;
	border-left: 1px solid #f8f6ff;
	border-top: 1px solid #f8f6ff;
	border-bottom: 1px solid #f8f6ff;
	color: #808080;
}
</style>

<style>
#emh4 {
	font-size: 30px;
	font-weight: 500;
	margin-right: 400px;
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
	$(document).ready(function() {

		$("#videochat").on("click", function() {

			window.open("${cp}/matching/webRtc")
		});
	});
	// import결제 함수

	function popup3() {
		window
				.open(
						"/chat/createChat2?chatmem_id=${memVo.mem_id}&mem_id=${MEM_INFO.mem_id}&chat_nm=${memVo.mem_id }님과 채팅",
						"thisTok!", "width=550, height=700, left=100, top=50");
	}
</script>

</head>

<body>

	<div class="container" style="width: 1000px;">
		<div style="width: 50%; float: left; height: 350px;">
			<div
				style="height: 700px; width: 600px; display: inline-block; position: absolute; left: 400px; top: 180px;"></div>
			<label for="userNm" class="col-sm-2 control-label">${path }</label>
			<!-- 			<img -->
			<%-- 				id="img" src="${cp }/matching/photo?mem_id=ahri" --%>
			<!-- 				style="float: right; width: 400px; height: 400px;" />  -->
			<img id="img" src="${cp }/matching/photo?mem_id=${memVo.mem_id }"
				style="width: 130px; height: 130px; position: absolute; left: 20%; top: 200px; border-radius: 100px;"
				alt="${cp}/image/logosam.png" />
			<p
				style="position: absolute; top: 260px; left: 540px; font-size: 30px; font-weight: 500; color: #4f91d4;">${memVo.mem_id},
				${memVo.mem_nm }</p>
			<div
				style="position: absolute; top: 320px; left: 550px; overflow: scroll; line-height: 2;">
				<p style="color: #bbbdca;">
					성별&nbsp; :&nbsp;&nbsp;<strong>${memVo.mem_gender }</strong>
				</p>
				<p style="color: #bbbdca;">
					전화번호&nbsp; :&nbsp;&nbsp; <strong>${memVo.mem_phone }</strong>
				</p>
				<p style="color: #bbbdca;">
					운전여부&nbsp; :&nbsp;&nbsp; <strong>${memVo.cw_driver }</strong>
				</p>
				<p style="color: #bbbdca;">
					서비스 가능 지역&nbsp; :&nbsp;&nbsp;
					<c:forEach items="${loList }" var="lo" varStatus="status">
						<c:choose>
							<c:when test="${ status.last}">
								<strong>${lo.loc_dong }</strong>
							</c:when>
							<c:otherwise>
								<strong>${lo.loc_dong },</strong>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</p>
				<c:forEach items="${carList}" var="car">
					<!-- 					<p style="color: #bbbdca;">경력</p> -->
					<fmt:parseDate value="${car.career_st_dt }"
						pattern="yyyy-MM-dd HH:mm:ss" var="st_dt" />
					<fmt:parseDate value="${car.career_end_dt }"
						pattern="yyyy-MM-dd HH:mm:ss" var="end_dt" />
					<p style="color: #bbbdca;">
						경력 시작일&nbsp; :&nbsp;&nbsp; <strong><fmt:formatDate
								pattern="yyyy-MM-dd" type="both" value="${st_dt}" /></strong> 종료일&nbsp;
						:&nbsp;&nbsp; <strong><fmt:formatDate
								pattern="yyyy-MM-dd" type="both" value="${end_dt}" /></strong>&nbsp;&nbsp;
						<br>
					</p>
					<p style="color: #bbbdca;">
						내용&nbsp; :&nbsp;&nbsp; <strong>${car.career_cont}</strong>
					</p>
					<p style="color: #bbbdca;">
						소속 기관&nbsp; :&nbsp;&nbsp; <strong>${car.career_hos }</strong>
					</p>
				</c:forEach>
			</div>
			<div style="margin-left: 500px;">
				<img id="img" src="${cp}/image/video chat.png"
					style="top: 500px; position: absolute; left: 500px; width: 100px; height: 100px; margin-left: 100px; margin-top: 100px;"
					alt="${cp}/image/videochat.png" /> <input type="hidden"
					class="btn"><br> <br> <input type="button"
					id="app" class="M_btn" value="매칭신청"
					style="position: absolute; left: 400px; top: 730px; background: white; color: #c8acd7; BORDER-BOTTOM: 3px solid #c8acd7; BORDER-LEFT: medium none; BORDER-RIGHT: medium none; BORDER-TOP: medium none;"><br>
				<br> <img id="img" src="${cp}/image/chat.png"
					style="top: 500px; position: absolute; left: 670px; top: 500px; width: 100px; height: 100px; margin-left: 100px; margin-top: 100px;"
					alt="${cp}/image/chat.png" /> <br> <input type="button"
					class="M_btn" value="화상채팅" id="videochat"
					style="position: absolute; left: 570px; top: 730px; background: white; color: #c8acd7; BORDER-BOTTOM: 3px solid #c8acd7; BORDER-LEFT: medium none; BORDER-RIGHT: medium none; BORDER-TOP: medium none;"><br>
				<br> <img id="img" src="${cp}/image/mat.png"
					style="position: absolute; top: 500px; left: 330px; width: 100px; height: 100px; margin-left: 100px; margin-top: 100px;"
					alt="${cp}/image/mat.png" /><br> <input type="button"
					class="M_btn" value="메신저" onclick="popup3()"
					style="position: absolute; left: 740px; top: 730px; background: white; color: #c8acd7; BORDER-BOTTOM: 3px solid #c8acd7; BORDER-LEFT: medium none; BORDER-RIGHT: medium none; BORDER-TOP: medium none;">
				<input type="hidden" name="mem_id" value="${mem_id}"> <input
					id="cw_mem_id" type="hidden" value="${memVo.mem_id }">
			</div>
			<div id="calendar"
				style="height: 700px; width: 700px; position: absolute; left: 1000px; top: 180px;"></div>
			<div style="height: 700px; width: 300px; display: inline-block;"></div>
		</div>

	</div>
	<!-- 일자 클릭시 메뉴오픈 -->
	<div id="contextMenu" class="dropdown clearfix">
		<ul class="dropdown-menu dropNewEvent" role="menu"
			aria-labelledby="dropdownMenu"
			style="display: block; position: static; margin-bottom: 5px;">
			<li><a tabindex="-1" href="#">방문요양</a></li>
			<li><a tabindex="-1" href="#">병원간병</a></li>
			<li><a tabindex="-1" href="#">운동도움</a></li>
			<li class="divider"></li>
			<li><a tabindex="-1" href="#" data-role="close">Close</a></li>
		</ul>
	</div>


	<div id="wrapper">
		<div style="display: none;">
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
						<td><c:forEach items="${loList }" var="lo" varStatus="status">
								<c:choose>
									<c:when test="${ status.last}">
											${lo.loc_dong }
												</c:when>
									<c:otherwise>
											${lo.loc_dong },
												</c:otherwise>
								</c:choose>
							</c:forEach></td>
					</tr>
					<c:forEach items="${carList}" var="car">
						<tr>
							<th>경력</th>
							<td style="padding-bottom: 16px;"><fmt:parseDate
									value="${car.career_st_dt }" pattern="yyyy-MM-dd HH:mm:ss"
									var="st_dt" /> 시작일 : <fmt:formatDate pattern="yyyy-MM-dd"
									type="both" value="${st_dt}" /> <br> ${car.career_end_dt}

								<fmt:parseDate value="${car.career_end_dt}"
									pattern="yyyy-MM-dd HH:mm:ss" var="end_dt" /> 종료일 : <fmt:formatDate
									pattern="yyyy-MM-dd" type="both" value="${end_dt}" /> 내용 :
								${car.career_cont} 소속 기관 : ${car.career_hos }</td>
						</tr>
					</c:forEach>

					<tr>
						<th>요양보호사 아이디</th>
						<td>${memVo.mem_id }</td>
						<td>${memVo.mem_id }</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="loading"></div>
		<div id="calendar" style="height: 300px; width: 1000px;"></div>
	</div>

	<!-- 일정 추가 MODAL -->
	<div class="modal fade" tabindex="-1" role="dialog" id="approvalModal"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="height: 500px; width: 400px;">
				<div class="modal-header">

					<!-- 					<button type="button" class="close" data-dismiss="modal" -->
					<!-- 						aria-label="Close"> -->
					<!-- 						<span aria-hidden="true">&times;</span> -->
					<!-- 					</button> -->
					<!-- 					<h4 class="modal-title">결제하기</h4> -->
				</div>
				<div class="modal-body" style="line-height: 3; width: 400px;">
					<div class="row">
						<div class="col-xs-12" style="width: 400px;">
							<label class="col-xs-4" id="Ledit-title"
								style="color: #adb7c1; width: 400px;"></label><br>
						</div>
						<div class="col-xs-12" style="width: 400px;">
							<label class="col-xs-4" id="Ledit-cont"
								style="color: #adb7c1; width: 400px;"></label><br>
						</div>
						<div class="col-xs-12" style="width: 400px;">
							<label class="col-xs-4" id="Ledit-startDate"
								style="color: #adb7c1; width: 400px;"></label><br>
						</div>
						<div class="col-xs-12" style="width: 400px;">
							<label class="col-xs-4" id="Ledit-endDate"
								style="color: #adb7c1; width: 400px;"></label><br>
						</div>
						<div class="col-xs-12" style="width: 400px;">
							<label class="col-xs-4" id="Ledit-startTime"
								style="color: #adb7c1; width: 400px;"></label><br>
						</div>
						<!-- 							<div class="col-xs-12"> -->
						<!-- 								<label class="col-xs-4" id="Ledit-endTime"></label><br> -->
						<!-- 							</div> -->
						<div class="col-xs-12" style="width: 400px;">
							<label class="col-xs-4" id="Ledit-type"
								style="color: #adb7c1; width: 400px;"></label><br>
						</div>
						<div class="col-xs-12" style="width: 400px;">
							<label class="col-xs-4" id="Ledit-cost"
								style="color: #adb7c1; width: 400px;"></label><br>
						</div>
					</div>
				</div>
				<div class="modal-footer modalBtnContainer-addEvent">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="cancel2">취소</button>
					<button type="button" class="btn btn-primary" id="save-event">결제</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- 일정 추가 MODAL -->
	<div class="modal fade" tabindex="-1" role="dialog" id="eventModal"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="width: 1000px; height: 700px;">
				<div class="modal-header">
					<span class="modal-title" id="emh4"
						style="color: #828c8f; font-size: 30px; margin-right: 600px; margin-top: 10px;">Matching
						Contact</span>
				</div>
				<div class="modal-body" style="width: 1200px; line-height: 3.5;">
					<div style="display: inline-block; height: 400px;">
						<label
							style="position: absolute; bottom: 510px; margin-left: 10px; margin-bottom: 30px; color: #05aff0; height: 50px; left: 70px; border: 1px solid #dedee5; border-top: 3px solid #05aff0; padding-bottom: 3px; padding-left: 60px; padding-right: 60px">PROFILE</label>
						<img id="img" src="${cp }/matching/photo?mem_id=${memVo.mem_id }"
							style="width: 200px; height: 200px; border-radius: 100%; margin-bottom: 500px; margin-left: 70px;"
							alt="${cp}/image/logosam.png" /> <label
							style="position: absolute; bottom: 238px; border-radius: 10px; color: #05aff0; height: 50px; left: 70px; border: 1px solid #dedee5; padding-bottom: 3px; padding-left: 90px; padding-right: 90px">${memVo.mem_nm }</label>
					</div>
					<div style="display: inline-block; margin-left: 50px">
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-title"
									style="color: #adb7c1; width: 170px; font-weight: 500">일정명</label>
								<input class="inputModal" type="text" name="edit-title"
									id="edit-title" required="required"
									style="BORDER-BOTTOM: #dedee5 1px solid; BORDER-LEFT: medium none; BORDER-RIGHT: medium none; BORDER-TOP: medium none; FONT-SIZE: 9pt; width: 400px;" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-startDate"
									style="color: #adb7c1; width: 170px; font-weight: 500">시작날짜</label>
								<input class="inputModal" type="text" name="edit-startDate"
									id="edit-startDate"
									style="BORDER-BOTTOM: #dedee5 1px solid; BORDER-LEFT: medium none; BORDER-RIGHT: medium none; BORDER-TOP: medium none; FONT-SIZE: 9pt; width: 400px;" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-endDate"
									style="color: #adb7c1; width: 170px; font-weight: 500">종료날짜</label>
								<input class="inputModal" type="text" name="edit-endDate"
									id="edit-endDate"
									style="BORDER-BOTTOM: #dedee5 1px solid; BORDER-LEFT: medium none; BORDER-RIGHT: medium none; BORDER-TOP: medium none; FONT-SIZE: 9pt; width: 400px;" />
							</div>
						</div>

						<div class="row" id="timeInfo">
							<div class="col-xs-12">
								<label class="col-xs-4" for="timeInfo"
									style="color: #adb7c1; width: 170px; font-weight: 500">시간
									선택</label>



								<div class="col-xs-7" style="padding-left: 0px;">
									<label style="font-weight: 300;"> <input
										type="checkbox" name="timeInfo[]" value="1">09:00~10:00
									</label> <label style="font-weight: 300;"> <input
										type="checkbox" name="timeInfo[]" value="2">10:30~11:30
									</label> <label style="font-weight: 300;"> <input
										type="checkbox" name="timeInfo[]" value="3">12:00~13:00
									</label> <label style="font-weight: 300;"> <input
										type="checkbox" name="timeInfo[]" value="4">13:30~14:30
									</label> <label style="font-weight: 300;"> <input
										type="checkbox" name="timeInfo[]" value="5">15:00~16:00
									</label> <label style="font-weight: 300;"> <input
										type="checkbox" name="timeInfo[]" value="6">16:30~17:30
									</label>

								</div>

							</div>
						</div>

						<div class="row" id="dayInfo">
							<div class="col-xs-12">
								<label class="col-xs-4" for="dayInfo[]"
									style="color: #adb7c1; width: 170px; font-weight: 500">요일
									선택</label> <label style="font-weight: 300;"> <input
									type="checkbox" name="dayInfo[]" value="0">일요일
								</label> <label style="font-weight: 300;"> <input
									type="checkbox" name="dayInfo[]" value="1">월요일
								</label> <label style="font-weight: 300;"> <input
									type="checkbox" name="dayInfo[]" value="2">화요일
								</label> <label style="font-weight: 300;"> <input
									type="checkbox" name="dayInfo[]" value="3">수요일
								</label> <label style="font-weight: 300;"> <input
									type="checkbox" name="dayInfo[]" value="4">목요일
								</label> <label style="font-weight: 300;"> <input
									type="checkbox" name="dayInfo[]" value="5">금요일
								</label> <label style="font-weight: 300;"> <input
									type="checkbox" name="dayInfo[]" value="6">토요일
								</label>
							</div>
						</div>

						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-type"
									style="color: #adb7c1; width: 170px; font-weight: 500">구분</label>
								<select class="inputModal" type="text" name="edit-type"
									id="edit-type"
									style="BORDER-BOTTOM: #dedee5 1px solid; BORDER-LEFT: medium none; BORDER-RIGHT: medium none; BORDER-TOP: medium none; FONT-SIZE: 9pt; width: 400px;">
									<option value="방문간병">방문간병</option>
									<option value="병원간병">병원간병</option>
									<option value="운동도움">운동도움</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-color"
									style="color: #adb7c1; width: 170px; font-weight: 500">색상</label>
								<select class="inputModal" name="color" id="edit-color"
									style="BORDER-BOTTOM: #dedee5 1px solid; BORDER-LEFT: medium none; BORDER-RIGHT: medium none; BORDER-TOP: medium none; FONT-SIZE: 9pt; width: 400px;">
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
								<label class="col-xs-4" for="edit-desc"
									style="color: #adb7c1; width: 170px; font-weight: 500">설명</label>
								<textarea rows="4" cols="50" class="inputModal" name="edit-desc"
									id="edit-desc"
									style="height: 39px; BORDER-BOTTOM: #dedee5 1px solid; BORDER-LEFT: medium none; BORDER-RIGHT: medium none; BORDER-TOP: medium none; FONT-SIZE: 9pt; width: 400px;"></textarea>


							</div>
						</div>
					</div>
					<div class="modal-footer modalBtnContainer-addEvent"
						style="width: 980px;">
						<button type="button" class="btn btn-default" id="cancel1"
							data-dismiss="modal"
							style="width: 300px; height: 50px; margin-right: 10px; margin-left: 480px;">취소</button>
						<button type="button" class="btn btn-primary" id="save-event2"
							style="background: #05aff0; width: 300px; height: 50px; margin-right: 70px;">저장</button>
					</div>
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
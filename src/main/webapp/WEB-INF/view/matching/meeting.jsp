<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="ko">
<head>
<meta charset="utf-8" />
<head>

<style>
#calendar {
	width: 1000px;
	margin: 0 auto;
}
</style>

<style>
.M_btn {
	left: 0px;
	bottom: 0px;
	width: 200px;
	height: 50px;
}

#button {
	vertical-align: middle;
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

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>FullCalendar Example</title>

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
	function requestPay() {
		var app_pay;
		var app_type;
		var mem_id;
		IMP.request_pay({
			// 결제회사
			pg : 'kakaopay', // version 1.1.0부터 지원.
			// 입급종류 ex)카드, 무통장 입금 등..
			pay_method : 'card',
			// 주문번호 -> seq로 대체
			merchant_uid : 'merchant_' + new Date().getTime(),
			// 주문명
			name : '주문명:결제테스트',
			// 가격 -> 게시글 가격으로 넣을 졔정
			amount : 1,
			// 구매자 이메일-> MemberVo값으로 넣을 예정
			buyer_email : 'alsckd123@naver.com',
			// 구매자 이름 -> MemberVo값으로 넣을 예정
			buyer_name : '구매자이름',
			// 구매자 전화번호 -> MemberVo값으로 넣을 예정
			buyer_tel : '010-1234-5678',
			// 구매자 집 주소 -> MemberVo값으로 넣을 예정
			buyer_addr : '서울특별시 강남구 삼성동',
			// 구매자 zipcode -> MemberVo값으로 넣을 예정
			buyer_postcode : '123-456',
		}, function(rsp) {
			if (rsp.success) {
				// [1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
				jQuery.ajax({
					url : "/approval/matching", // cross-domain error가 발생하지 않도록
					// 동일한 도메인으로 전송
					type : 'POST',
					data : {
						imp_uid : rsp.imp_uid,
						app_type : editType.val(),
						app_pay : 1,
						mem_id : rsp.buyer_name

					// 기타 필요한 데이터가 있으면 추가 전달
					}
				}).done(function(data) {
					// [2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
					// if ( everythings_fine ) {
					var msg = '결제가 완료되었습니다.';
					location.href = "/mypage/scheduleView";
					alert(data);
					// msg += '\n고유ID : ' + rsp.imp_uid;
					// msg += '\n상점 거래ID : ' + rsp.merchant_uid;
					// msg += '\결제 금액 : ' + rsp.paid_amount;
					// msg += '카드 승인번호 : ' + rsp.apply_num;
					//
					// } else {
					// // [3] 아직 제대로 결제가 되지 않았습니다.
					// // [4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
					// }
				});
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;

				alert(msg);
			}
		});
	}
</script>
</head>

<body>


	<div class="container style="width: 1000px; height: 1000px;">
		<div style="width: 50%; float: left; height: 350px;">
			<label for="userNm" class="col-sm-2 control-label">${path }</label> <img
				id="img" src="${cp }/matching/photo?mem_id=anni"
				style="float: right; width: 400px; height: 400px;" />
		</div>
		<!-- 		<div> -->
		<!-- 		<input type="button" class="btn" width="50px" value="매칭신청" style="float:left"> -->
		<%-- 		<input type="hidden" name="mem_id" value="${mem_id}"> --%>
		<!-- 	</div> -->
		<div id="button" style="width: 40%; float: right; height: 400px;">
			<input type="hidden" class="btn"><br> <br> <input
				type="button" id="app" class="M_btn" value="매칭신청"><br>
			<br> <input type="button" class="M_btn" value="화상채팅" id="videochat"><br>
			<br> <input type="button" class="M_btn" value="채팅"> <input
				type="hidden" name="mem_id" value="${mem_id}">
		</div>
	</div>
	<div class="container style="width: 1000px; height: 1000px;">
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
							<td>
							<c:forEach items="${loList }" var= "lo">
							${lo.loc_dong },							
							</c:forEach>
							</td>
						</tr>
							
							<c:forEach items="${carList }" var= "car" begin="1">
							<tr>
							<th>경력</th>
							<td>내용 : ${car.career_cont} 시작일 : ${car.career_st_dt } 종료일 : ${car.career_end_dt } 소속 기관 : ${car.career_hos }</td></tr>
							</c:forEach>
							
						<tr>
							<th>요양보호사 아이디</th>
							<td id="mem_id">${memVo.mem_id }</td>
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
							<div class="col-xs-12">
								<label class="col-xs-4" id="Ledit-endTime"></label><br>
							</div>
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
						<button type="button" class="btn btn-primary" id="save-event"
							onclick="requestPay()">결제</button>
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

						<div class="row">
							<div class="col-xs-12">
								<label hidden="true" class="col-xs-4" for="edit-allDay">하루종일</label>
								<input class='allDayNewEvent' id="edit-allDay" type="checkbox" />
							</div>
						</div>

						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-title">일정명</label> <input
									class="inputModal" type="text" name="edit-title"
									id="edit-title" required="required" />
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
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-StartTime">시작시간</label> <input
									class="inputModal" type="text" name="edit-startTime"
									id="edit-startTime" />
							</div>

						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-endTime">종료시간</label> <input
									class="inputModal" type="text" name="edit-endTime"
									id="edit-endTime" />
							</div>
						</div>

						<div class="row" id="timeInfo">
							<div class="col-xs-12">
								<label class="col-xs-4" for="timeInfo">시간 선택</label> 
								<label
									class="checkbox-inline"> 
									<input type="checkbox"
									name="timeInfo[]" value="1">09:00~10:00
								</label> <label class="checkbox-inline"> 
								<input type="checkbox"
									name="timeInfo[]" value="2">10:30~11:30
								</label> <label class="checkbox-inline"> 
								<input type="checkbox"
									name="timeInfo[]" value="3">12:00~13:00
								</label> <label class="checkbox-inline"> 
								<input type="checkbox"
									name="timeInfo[]" value="4">13:30~14:30
								</label> <label class="checkbox-inline"> 
								<input type="checkbox"
									name="timeInfo[]" value="5">15:00~16:00
								</label> <label class="checkbox-inline"> 
								<input type="checkbox"
									name="timeInfo[]" value="6">16:30~17:00
								</label>
							</div>
						</div>

						<div class="row" id="dayInfo">
							<div class="col-xs-12">
								<label class="col-xs-4" for="dayInfo[]">요일 선택</label> 
								<label
									class="checkbox-inline">
									<input type="checkbox"
									name="dayInfo[]" value="1">일요일</label> 
									<label
									class="checkbox-inline">
									<input type="checkbox"
									name="dayInfo[]" value="2">월요일</label> 
									<label
									class="checkbox-inline">
									<input type="checkbox"
									name="dayInfo[]" value="3">화요일</label> 
									<label
									class="checkbox-inline">
									<input type="checkbox"
									name="dayInfo[]" value="4">수요일</label> 
									<label
									class="checkbox-inline">
									<input type="checkbox"
									name="dayInfo[]" value="5">목요일</label> 
									<label
									class="checkbox-inline">
									<input type="checkbox"
									name="dayInfo[]" value="6">금요일</label> 
									<label
									class="checkbox-inline">
									<input type="checkbox"
									name="dayInfo[]" value="7">토요일</label>
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
					<div class="modal-footer modalBtnContainer-modifyEvent">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
						<button type="button" class="btn btn-primary" id="updateEvent">저장</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

	</div>
	<!-- /.container -->
	<input id="mem_id" type="hidden" value="${mem_id }">
	<input id="cw_mem_id" type="hidden" value="${cw_mem_id }">

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
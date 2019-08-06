//var eventModal = $('#eventModal');
//
//var modalTitle = $('.modal-title');
//var editAllDay = $('#edit-allDay');
//var editTitle = $('#edit-title');
//var editStart = $('#edit-start');
//var editEnd = $('#edit-end');
//var editType = $('#edit-type');
//var editColor = $('#edit-color');
//var editDesc = $('#edit-desc');
//
//var addBtnContainer = $('.modalBtnContainer-addEvent');
//var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');
//
///*******************************************************************************
// * 새로운 일정 생성 **************
// */
//var newEvent = function(start, end, eventType) {
//
//	$("#contextMenu").hide(); // 메뉴 숨김
//
//	modalTitle.html('새로운 일정');
//	editStart.val(start);
//	editEnd.val(end);
//	editType.val(eventType).prop("selected", true);
//
//	addBtnContainer.show();
//	modifyBtnContainer.hide();
//	eventModal.modal('show');
//
//	/** ****** 임시 RAMDON ID - 실제 DB 연동시 삭제 ********* */
//	var eventId = 1 + Math.floor(Math.random() * 1000);
//	/** ****** 임시 RAMDON ID - 실제 DB 연동시 삭제 ********* */
//
//	// 새로운 일정 저장버튼 클릭
//	$('#save-event').unbind();
//	$('#save-event').on(
//			'click',
//			function() {
//
//				// var eventData = {
//				// _id : eventId,
//				// title : editTitle.val(),
//				// start : editStart.val(),
//				// end : editEnd.val(),
//				// description : editDesc.val(),
//				// type : editType.val(),
//				// username : '사나',
//				// backgroundColor : editColor.val(),
//				// textColor : '#ffffff',
//				// allDay : false
//				// };
//
//				var eventData = [ {
//					// _id: 1,
//					title : editTitle.val(),
//					description : editDesc.val(),
//					startTime : editStart.val(),
//					endTime : editEnd.val(),
//					startDate : editStart.val(),
//					endDate : editEnd.val(),
//					// dow : dayInfo,
//					type : editType.val(),
//					c_mem_id : 'deft',
//					backgroundColor : editColor.val(),
//					textColor : '#ffffff',
//					allDay : false,
//					c_worker : 'trumph'
//
//				} ];
//
//				if (eventData.start > eventData.end) {
//					alert('끝나는 날짜가 앞설 수 없습니다.');
//					return false;
//				}
//
//				if (eventData.title === '') {
//					alert('일정명은 필수입니다.');
//					return false;
//				}
//
//				var realEndDay;
//
//				if (editAllDay.is(':checked')) {
//					eventData.start = moment(eventData.start).format(
//							'YYYY-MM-DD');
//					// render시 날짜표기수정
//					eventData.end = moment(eventData.end).add(1, 'days')
//							.format('YYYY-MM-DD');
//					// DB에 넣을때(선택)
//					realEndDay = moment(eventData.end).format('YYYY-MM-DD');
//
//					eventData.allDay = true;
//				}
//
//				$("#calendar").fullCalendar('renderEvent', eventData, true);
//				eventModal.find('input, textarea').val('');
//				editAllDay.prop('checked', false);
//				eventModal.modal('hide');
//
//				// 새로운 일정 저장
//
//				$.ajax({
//					type : "post",
//					contentType : 'application/json',
//					url : "/matching/insertCalendar",
//					data : JSON.stringify(eventData),
//					success : function(response) {
//						// DB연동시 중복이벤트 방지를 위한
//						// $('#calendar').fullCalendar('removeEvents');
//						// $('#calendar').fullCalendar('refetchEvents');
//						$.ajax({
//							type : "post",
//							contentType : 'application/json',
//							url : "/approval/show",
//							data : JSON.stringify(eventData),
//							success : function(response) {
//								// DB연동시 중복이벤트 방지를 위한
//								// $('#calendar').fullCalendar('removeEvents');
//								// $('#calendar').fullCalendar('refetchEvents');
//							}
//						});
//					}
//				});
//				// $.ajax({
//				// type: "POST",
//				// url : "${cp}/find/idFind",
//				// data : data,
//				// success : function(data){
//				// console.log(data);
//				// if(data.mem_id == null){
//				// $("#idresult1").css("color", "red");
//				// $("#idresult1").html("회원님이 기입하신 정보가 일치하지 않습니다.");
//				//							
//				// }else{
//				// $("#idresult1").css("color", "blue");
//				// $("#idresult1").html("회원님의 아이디는"+ data.mem_id +"입니다.");
//				//							
//				// }
//				//										
//				// },
//
//			});
//};

var eventModal = $('#eventModal');

var modalTitle = $('.modal-title');
var editAllDay = $('#edit-allDay');
var editTitle = $('#edit-title');
var editStart = $('#edit-start');
var editEnd = $('#edit-end');
var editType = $('#edit-type');
var editColor = $('#edit-color');
var editDesc = $('#edit-desc');

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');

/*******************************************************************************
 * 새로운 일정 생성 **************
 */
var newEvent = function(start, end, eventType) {

	$("#contextMenu").hide(); // 메뉴 숨김

	modalTitle.html('새로운 일정');
	editStart.val(start);
	editEnd.val(end);
	editType.val(eventType).prop("selected", true);

	addBtnContainer.show();
	modifyBtnContainer.hide();
	eventModal.modal('show');

	/** ****** 임시 RAMDON ID - 실제 DB 연동시 삭제 ********* */
	var eventId = 1 + Math.floor(Math.random() * 1000);
	/** ****** 임시 RAMDON ID - 실제 DB 연동시 삭제 ********* */

	// 새로운 일정 저장버튼 클릭
	$('#save-event').unbind();
	$('#save-event').on(
			'click',
			function() {

				var eventData = {
					_id : eventId,
					title : editTitle.val(),
					start : editStart.val(),
					end : editEnd.val(),
					description : editDesc.val(),
					type : editType.val(),
					username : '사나',
					backgroundColor : editColor.val(),
					textColor : '#ffffff',
					allDay : false
				};

				if (eventData.start > eventData.end) {
					alert('끝나는 날짜가 앞설 수 없습니다.');
					return false;
				}

				if (eventData.title === '') {
					alert('일정명은 필수입니다.');
					return false;
				}

				var realEndDay;

				if (editAllDay.is(':checked')) {
					eventData.start = moment(eventData.start).format(
							'YYYY-MM-DD');
					// render시 날짜표기수정
					eventData.end = moment(eventData.end).add(1, 'days')
							.format('YYYY-MM-DD');
					// DB에 넣을때(선택)
					realEndDay = moment(eventData.end).format('YYYY-MM-DD');

					eventData.allDay = true;
				}

				var data = [ {
					// _id: 1,
					title : editTitle.val(),
					description : editDesc.val(),
					startTime : editStart.val(),
					endTime : editEnd.val(),
					startDate : editStart.val(),
					endDate : editEnd.val(),
					// dow : dayInfo,
					type : editType.val(),
					c_mem_id : 'deft',
					backgroundColor : editColor.val(),
					textColor : '#ffffff',
					allDay : false,
					c_worker : 'trumph'

				} ];

				$("#calendar").fullCalendar('renderEvent', eventData, true);
				eventModal.find('input, textarea').val('');
				editAllDay.prop('checked', false);
				eventModal.modal('hide');

				// 새로운 일정 저장
				$.ajax({
					type : "post",
					contentType : 'application/json',
					url : "/matching/insertCalendar",
					data : JSON.stringify(data),
					success : function(response) {
						document.getElementById('text').textContent = 'Hello \nlcr World!';
						jQuery(document).ready(function() {
							$('#myModal').show();
						});
						// 팝업 Close 기능
						function close_pop(flag) {
							$('#myModal').hide();
						}
						;

						// h5bak.tistory.com/130 [이준빈은 호박머리]

						// DB연동시 중복이벤트 방지를 위한
						// $('#calendar').fullCalendar('removeEvents');
						// $('#calendar').fullCalendar('refetchEvents');
						// $.ajax({
						// type : "post",
						// contentType : 'application/json',
						// url : "/approval/show",
						// data : JSON.stringify(eventData),
						// success : function(response) {
						// // DB연동시 중복이벤트 방지를 위한
						// //
						// $('#calendar').fullCalendar('removeEvents');
						// //
						// $('#calendar').fullCalendar('refetchEvents');
						// }
						// });
					}
				});
			});
};
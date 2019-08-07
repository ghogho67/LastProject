var eventModal = $('#eventModal');
var approvalModal = $('#approvalModal');

var modalTitle = $('.modal-title');
var editAllDay = $('#edit-allDay');
var editTitle = $('#edit-title');

var editStartDate = $('#edit-startDate');
var editEndDate = $('#edit-endDate');
var editStartTime = $('#edit-startTime');
var editEndTime = $('#edit-endTime');

var dateDef = $('#edit-endDate')-$('#edit-startDate');
var timeDef = $('#edit-endTime')-$('#edit-startTime');
var pay = dateDef*timeDef;
// var dayInfo = $('input:checkbox[name="dayInfo[]"]:checked');

// var editStart = $('#edit-start');
// var editEnd = $('#edit-end');
var editType = $('#edit-type');
var editColor = $('#edit-color');
var editDesc = $('#edit-desc');


var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


/*******************************************************************************
 * 새로운 일정 생성 **************
 */
var newEvent = function (startDate, endDate, eventType) {
	$("#dayInfo").show();
    $("#contextMenu").hide(); // 메뉴 숨김
    editTitle.val("");

    modalTitle.html('새로운 일정');
    editStartDate.val(moment(startDate).format('YYYY-MM-DD'));
    editEndDate.val(moment(endDate).format('YYYY-MM-DD'));
    editStartTime.val(moment(startDate).format('HH:mm'));
    editEndTime.val(moment(endDate).format('HH:mm'));
    editType.val(eventType).prop("selected", true);
    
    var dayInfo = [];
    $('input:checkbox[name="dayInfo[]"]:checked').each(function () {
    	dayInfo.push(parseInt($(this).val()));
    });
    
    
    $('input:checkbox[name="dayInfo[]"]').on('click', function() {
    	if ( $(this).prop('checked') ) { 
    		dayInfo.push(parseInt($(this).val()));;
		} else { 
			dayInfo.splice(dayInfo.indexOf(parseInt($(this).val())),1);
		} 
    	dayInfo.sort();
    })


    

    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');

    /** ****** 임시 RAMDON ID - 실제 DB 연동시 삭제 ********* */
// var eventId = 1;
    /** ****** 임시 RAMDON ID - 실제 DB 연동시 삭제 ********* */

    
    $('#save-event2').on('click',function(){
    	  eventModal.modal('hide');
    	  $("#Ledit-title").text("매칭 이름 :"+editTitle.val());
    	  $("#Ledit-cont").text("매칭 내용 :"+editDesc.val());
    	  $("#Ledit-startDate").text("매칭 시작일 :"+editStartDate.val());
    	  $("#Ledit-endDate").text("매칭 종료일 :"+editEndDate.val());
    	  $("#Ledit-startTime").text("서비스 시작 시간 :"+editStartTime.val());
    	  $("#Ledit-endTime").text("서비스 종료 시간 :"+editEndTime.val());
    	  $("#Ledit-type").text("매칭 서비스 타입 :"+editType.val());
    	  
    	  approvalModal.modal('show');
    })
    
    // 새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    
    $('#save-event').on('click', function () {
    	approvalModal.modal('hide');

        var eventData = [{
// _id: 1,
            title: editTitle.val(),
            description: editDesc.val(),
			startTime: editStartTime.val(),
			endTime: editEndTime.val(),
			startDate: editStartDate.val() ,
			endDate: editEndDate.val(),
			dow:dayInfo,
            type: editType.val(),
            c_mem_id: 'brown',
            backgroundColor: editColor.val(),
            textColor: '#ffffff',
            allDay: false,
            c_worker:'anni'

        }];


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
            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
            // render시 날짜표기수정
            eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
            // DB에 넣을때(선택)
            realEndDay = moment(eventData.end).format('YYYY-MM-DD');

            eventData.allDay = true;
        }

        $("#calendar").fullCalendar('renderEvent', eventData, true);
        eventModal.find('input, textarea').val('');
        editAllDay.prop('checked', false);
        eventModal.modal('hide');

        console.log(eventData);
        console.log(dayInfo.class);
        // 새로운 일정 저장
        $.ajax({
            type: "post",
            contentType: 'application/json',
            url: "/matching/insertCalendar",
            data: JSON.stringify(eventData),
            success: function (response) {
            	$('input:checkbox[name="dayInfo[]"]').attr("checked", false);
            },
            error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }

        });
    });
};


	// import결제 함수
	function requestPay() {
	IMP.init("imp21318637");
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
		    if ( rsp.success ) {
		    	// [1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		    	jQuery.ajax({
		    		url: "/approval/matching", // cross-domain error가 발생하지 않도록
												// 동일한 도메인으로 전송
		    		type: 'POST',
		    		data: {
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
// msg += '\n고유ID : ' + rsp.imp_uid;
// msg += '\n상점 거래ID : ' + rsp.merchant_uid;
// msg += '\결제 금액 : ' + rsp.paid_amount;
// msg += '카드 승인번호 : ' + rsp.apply_num;
//
 alert(data);
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





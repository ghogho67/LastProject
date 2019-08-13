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
            c_worker:$("td#mem_id").text()

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





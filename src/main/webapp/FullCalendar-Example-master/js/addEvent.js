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

    var timeInfo = [];
    $('input:checkbox[name="timeInfo[]"]:checked').each(function () {
    	timeInfo.push(parseInt($(this).val()));
    });
    
    
    $('input:checkbox[name="dayInfo[]"]').on('click', function() {
    	if ( $(this).prop('checked') ) { 
    		dayInfo.push(parseInt($(this).val()));;
		} else { 
			dayInfo.splice(dayInfo.indexOf(parseInt($(this).val())),1);
		} 
    	dayInfo.sort();
    })

    $('input:checkbox[name="timeInfo[]"]').on('click', function() {
    	if ( $(this).prop('checked') ) { 
    		timeInfo.push(parseInt($(this).val()));;
    	} else { 
    		timeInfo.splice(timeInfo.indexOf(parseInt($(this).val())),1);
    	} 
    	timeInfo.sort();
    })


    

    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');

    /** ****** 임시 RAMDON ID - 실제 DB 연동시 삭제 ********* */
// var eventId = 1;
    /** ****** 임시 RAMDON ID - 실제 DB 연동시 삭제 ********* */

    
    $('#save-event2').on('click',function(){
    	
    	var myDate = new Date();
		var startDate = new Date(editStartDate.val());
		var endDate = new Date(editEndDate.val());
		myGetTime = myDate.getTime();
		startGetTime =startDate.getTime();
		if (myDate.getTime() - startDate.getTime() > 0) {
			alert("오늘 날짜 이후로 선택해주세요");
			return;
		}
		dif = startDate.getTime() - endDate.getTime();
		if (dif > 0) {
			alert("종료 날짜가 시작 날짜보다 앞섭니다 다시 선택해 주세요");
			return;
		}
		
    	 
    	  
    	  // 두 날짜 사이의 요일 수를 출력해준다 (금요일, 토요일, 일요일)
    	  // parm d1 : 20170101
    	  // parm d2 : 20171003
    	  // getSatSun(d1, d2)
// var sDate =new
// Date(d1.substr(0,4),Number(d1.substr(4,2))-1,Number(d1.substr(6)));
    	  var sDate = new Date(editStartDate.val());
// var eDate =new
// Date(d2.substr(0,4),Number(d2.substr(4,2))-1,Number(d2.substr(6)));
    	  var eDate = new Date(editEndDate.val());
    	  // alert(lcDateCountDay(sDate,eDate));
    	  var count=0;
    	  var tmp;
    	  for (var i=0; i<=(eDate-sDate)/1000/60/60/24; i++) {
// alert("i : "+ i);
// alert("(eDate-sDate)/1000/60/60/24 : "+(eDate-sDate)/1000/60/60/24);
    		  tmp=new Date(sDate);
// alert("tmp.getDate() : "+tmp.getDate());
    		  
    		  tmp.setDate(tmp.getDate()+i);
// alert("tmp.getDate(): "+tmp.getDate())
    		  // 0(일요일), 5(금요일), 6(토요일)
    		  for(j=0; j<dayInfo.length; j++){
    			  if(tmp.getDay() == dayInfo[j]){
    				  count++;
    			  }
    		  }
    		  
// if (tmp.getDay()==0 || tmp.getDay()==5 || tmp.getDay()==6) {
// count++;
// }
    	  }
    	  
// alert("'${list}'"+'${list}');
    	  alert("cw_mem_id: " +$("td#mem_id").text());
    	  
    	  var ajaxlist;
    	  $.ajax({
    		  type : "post",
              url: "/matching/dateCheck",
              data : {
            	  cw_mem_id : $("td#mem_id").text()
              },
              success: function (response) {
            	  ajaxlist = response.list;
            	  alert(ajaxlist);
              },
              error:function(request,status,error){
                  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
              }

          });
// $.ajax({
// type : "POST",
// url: "/matching/dateCheck?cw_mem_id='ahri'",
// dataType : "json",
// contentType: "application/json",
// success: function (data) {
// alert(data);
// },
// error:function(request,status,error){
// alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
// }
//
// });
    	  
    	  
    	  alert("ajaxlist.length"+ajaxlist.length);
    	  chooseStDate = new Date(editStartDate.val());
    	  chooseEndDate = new Date(editEndDate.val());
    	  
      	  for(i=0; i<ajaxlist.length; i++){
    		  listDateString = ajaxlist[i].c_start;
    		  listTimeString = ajaxlist[i].c_end;
    		  
    		  listDateDate = new Date(listDateString);
    		  console.log("chooseStDate : "+chooseStDate);
// for(j=0; j<)
// console.log("i : "+i);
// var string = [];
    		  chooseStDate.setDate(chooseStDate.getDate()+1);
    		  chooseStDate.getTime();
    		  console.log("선택날짜+1일 한 getTime : "+chooseStDate.getTime());
    		  console.log("선택날짜+1일 date : "+chooseStDate);
    		  console.log("가져온 list getTime() : "+listDateDate.getTime());

    		  if(chooseStDate.getTime() == listDateDate.getTime()){
    			  alert("same");
    			  alert("선택날짜+1일 date : "+chooseStDate);
    			  alert("가져온 date : "+listDateDate);
    			  alert(timeInfo);
    			  alert("시간 비교 돌입");
    			  alert("가져온 시간"+listTimeString);
        			  for(k=0; k<timeInfo.length; k++){
        				  alert("timeInfo[k] : "+timeInfo[k]);
        			  if(listTimeString == "09:00" && timeInfo[k]==1){
        				  console.log("timeInfo[k] : "+timeInfo[k]);
        				  alert("요양보호사의 기존 일정과 겹칩니다. 일정을 확인해주세요");
        				  return;
        			  }
        			  if(listTimeString == "10:30" && timeInfo[k]==2){
        				  alert("timeInfo[k] : "+timeInfo[k]);
        				  alert("요양보호사의 기존 일정과 겹칩니다. 일정을 확인해주세요");
        				  return;
        			  }
        			  if(listTimeString == "12:00" && timeInfo[k]==3){
        				  alert("timeInfo[k] : "+timeInfo[k]);
        				  alert("요양보호사의 기존 일정과 겹칩니다. 일정을 확인해주세요");
        				  return;
        			  }
        			  if(listTimeString == "13:30" && timeInfo[k]==4){
        				  alert("timeInfo[k] : "+timeInfo[k]);
        				  alert("요양보호사의 기존 일정과 겹칩니다. 일정을 확인해주세요");
        				  return;
        			  }
        			  if(listTimeString == "15:00" && timeInfo[k]==5){
        				  alert("timeInfo[k] : "+timeInfo[k]);
        				  alert("요양보호사의 기존 일정과 겹칩니다. 일정을 확인해주세요");
        				  return;
        			  }
        			  if(listTimeString == "16:30" && timeInfo[k]==6){
        				  alert("timeInfo[k] : "+timeInfo[k]);
        				  alert("요양보호사의 기존 일정과 겹칩니다. 일정을 확인해주세요");
        				  return;
        			  }
        			  }
    		  }
// var chooseDate = new Date(editStartDate.val());
// var startDate = new Date(startString);
    	  }
    	  
    	  eventModal.modal('hide');
    	  var sDate = new Date(editStartDate.val());
    	  
    	  var time =" ";
    	  for(k=0; k<timeInfo.length; k++){
    		  if(timeInfo[k]==1){
    			  time+= " 09:00~10:00";
    		  } 
    		  if(timeInfo[k]==2){
    			  time+= " 10:30~11:30";
    		  } 
    		  if(timeInfo[k]==3){
    			  time+= " 12:00~13:00";
    		  } 
    		  if(timeInfo[k]==4){
    			  time+= " 13:30~14:30";
    		  } 
    		  if(timeInfo[k]==5){
    			  time+= " 15:00~16:00";
    		  } 
    		  if(timeInfo[k]==6){http:// localhost/matching/meet?cw_mem_id=a!1$m#
    			  time+= " 16:30~17:30";
    		  } 
    	  }
    	  
    	  $("#Ledit-startTime").text("서비스 시간 :"+time);
    	  $("#Ledit-title").text("매칭 이름 :"+editTitle.val());
    	  $("#Ledit-cont").text("매칭 내용 :"+editDesc.val());
    	  $("#Ledit-startDate").text("매칭 시작일 :"+editStartDate.val());
    	  $("#Ledit-endDate").text("매칭 종료일 :"+editEndDate.val());
    	  $("#Ledit-type").text("매칭 서비스 타입 :"+editType.val());
    	  $("#Ledit-cost").text("매칭 비용 :"+count*timeInfo.length*10000);
    	  
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
			time:timeInfo,
            type: editType.val(),
            c_mem_id: $("td#mem_id").text(),
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
            	$('input:checkbox[name="timeInfo[]"]').attr("checked", false);
            },
            error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }

        });
    });
};





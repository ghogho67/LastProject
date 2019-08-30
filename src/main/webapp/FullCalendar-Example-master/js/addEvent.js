
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

var count=0;
var eventData;

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


var newEvent = function(startDate, endDate, eventType) {
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
	$('input:checkbox[name="dayInfo[]"]:checked').each(function() {
		dayInfo.push(parseInt($(this).val()));
	});

	$('input:checkbox[name="dayInfo[]"]').on('click', function() {
		if ($(this).prop('checked')) {
			dayInfo.push(parseInt($(this).val()));
			;
		} else {
			dayInfo.splice(dayInfo.indexOf(parseInt($(this).val())), 1);
		}
		dayInfo.sort();
	})

	addBtnContainer.show();
	modifyBtnContainer.hide();
	eventModal.modal('show');

	/** ****** 임시 RAMDON ID - 실제 DB 연동시 삭제 ********* */
	// var eventId = 1;
	/** ****** 임시 RAMDON ID - 실제 DB 연동시 삭제 ********* */

// 새로운 일정 저장버튼 클릭
// $('#save-event').unbind();
	 
	 $('#save-event').on('click', function () {
	 var eventData = [{
	 // _id: 1,
	 mat_title: editTitle.val(),
	 mat_cont: editDesc.val(),
	 startTime: editStartTime.val(),
	 endTime: editEndTime.val(),
	 startDate: editStartDate.val() ,
	 endDate: editEndDate.val(),
	 dow:dayInfo,
	 mat_type: editType.val(),
	 mem_id: 'brown',
	 mat_bc: editColor.val(),
	 mat_tc: '#ffffff',
	 mat_allday: false,
	 cw_mem_id:'ahri'
	 }];
	
// if (eventData.start > eventData.end) {
// alert('끝나는 날짜가 앞설 수 없습니다.');
// return false;
// }
//	
// if (eventData.title === '') {
// alert('일정명은 필수입니다.');
// return false;
// }
//	
	 var realEndDay;
	
	 if (editAllDay.is(':checked')) {
	 eventData.start = moment(eventData.start).format('YYYY-MM-DD');
	 // render시 날짜표기수정
	 eventData.end = moment(eventData.end).add(1,
	 'days').format('YYYY-MM-DD');
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
	 });
};

    /** ****** 임시 RAMDON ID - 실제 DB 연동시 삭제 ********* */
// var eventId = 1;
    /** ****** 임시 RAMDON ID - 실제 DB 연동시 삭제 ********* */

$('#cancel1').on('click', function(){
	count = 0;
})
$('#cancel2').on('click', function(){
	count = 0;
})
//
//
// $("input[name=dayInfo[]]:checked").each(function() {
// var test = $(this).val();
// alert("벨류값확인 : " + test);
// }
    

 
    $('#save-event2').off().on('click',function(){
// $("#dayInfo").show();
// alert($("input[name='dayInfo[]']:checked"));
 var dayInfo = [];
// $("input[name='dayInfo[]']:checked").each(function () {
// dayInfo.push(parseInt($(this).val()));
// });
// alert("dayInfo:"+parseInt($(this).val()));
    	  $("input[name='dayInfo[]']:checked").each(function() {
    			 var test = $(this).val();
    			 dayInfo.push(parseInt($(this).val()));
    		 });
    	  alert("dayInfo:"+dayInfo);
    	  var timeInfo = [];
    	  $("input[name='timeInfo[]']:checked").each(function() {
    		  var test = $(this).val();
    		  timeInfo.push(parseInt($(this).val()));
    	  });
    	  alert("timeInfo:"+timeInfo);
        
//        $('input:checkbox[name="timeInfo[]"]:checked').each(function () {
//        	timeInfo.push(parseInt($(this).val()));
//        });  
//        alert("timeInfo:"+parseInt($(this).val()));
        
        addBtnContainer.show();
        modifyBtnContainer.hide();
        eventModal.modal('show');
    	
    	var myDate = new Date();
		var startDate = new Date(editStartDate.val());
		var endDate = new Date(editEndDate.val());
		myGetTime = myDate.getTime();
		startGetTime =startDate.getTime();
		
		if (myDate.getTime() - startDate.getTime() > 0) {
			alert("오늘 날짜 이후로 선택해주세요");
			count=0;
			return;
		}
		dif = startDate.getTime() - endDate.getTime();
		if (dif > 0) {
			alert("종료 날짜가 시작 날짜보다 앞섭니다 다시 선택해 주세요");
			count=0;
			return;
		}
		
//    	 
		  var eDate = new Date(editEndDate.val());
		  console.log("eDate:"+eDate);
	  	  var sDate = new Date(editStartDate.val());
	  	  console.log("sDate:"+sDate);


// var count=0;
    	  var tmp;
    	  for (var i=0; i<=(eDate-sDate)/1000/60/60/24; i++) {
    		  tmp=new Date(sDate);
    		  console.log("tmp:"+tmp);
    		  console.log("sDate:"+sDate);
    		  console.log("dayInfo:"+dayInfo);
    		  console.log("dayInfo.length:"+dayInfo.length);
    		  
    		  for(j=0; j<dayInfo.length; j++){
    			  console.log("j:"+j);
    			  console.log("dayInfo:"+dayInfo);
    			  if(tmp.getDay() == dayInfo[j]){
    				  console.log("tmp.getDay()"+tmp.getDay());
    				  console.log("dayInfo[j]:"+dayInfo[j]);
    				  count++;
    			  }
    		  }
    		  console.log("tmp.getDay()"+tmp.getDay());
    		  console.log("count : "+count);
    		  tmp.setDate(tmp.getDate()+i);
    	  }
    	  alert("timeInfo : "+timeInfo.length);
    		if(count==0){
        		alert("지정된 기간의 요일 사이에 매칭이 없습니다 다시 선택해 주세요");
        		count=0;
        		return;
        	}
        	
    	  
// alert("'${list}'"+'${list}');
    	  chooseStDate = new Date(editStartDate.val());
    	  chooseEndDate = new Date(editEndDate.val());
    	  
    	  chooseStCal = new Date(chooseStDate.getFullYear(), chooseStDate.getMonth()+1, chooseStDate.getDate());
    	  chooseEndCal= new Date(chooseEndDate.getFullYear(), chooseEndDate.getMonth()+1, chooseEndDate.getDate());
    	 
    	  var diff = Math.abs(chooseEndCal.getTime() - chooseStCal.getTime());
    	  diff = Math.ceil(diff / (1000 * 3600 * 24));
    	  
    	  console.log("diff"+diff);
    	  var ajaxlist;
    	  $.ajax({
    		  type : "post",
              url: "/matching/dateCheck",
              data : {
            	  cw_mem_id : $("#cw_mem_id").val()
// cw_mem_id : $("td#mem_id").val()
              },
              success: function (response) {
            	  
            	  ajaxlist = response.list;
            	  
              	  for(i=0; i<ajaxlist.length; i++){
              		  
              		  listDateString = ajaxlist[i].c_start;
            		  listTimeString = ajaxlist[i].c_end;
            		  
            		  listDateDate = new Date(listDateString);
            		  
            		  for(j=0; j<diff; j++){
            			  
// console.log("chooseStDate",chooseStDate);
// console.log("listDateDate",listDateDate);
            			  if(chooseStDate.getTime() == listDateDate.getTime()){
            				  for(k=0; k<timeInfo.length; k++){
// alert("timeInfo[k] : "+timeInfo[k]);
            					  if(listTimeString == "09:00" && timeInfo[k]==1){
            						  alert("요양보호사의 09:00~10:00시간대는 일정이 겹칩니다. 일정을 확인해주세요");
            						  count=0;
            						  return;
            					  }
            					  if(listTimeString == "10:30" && timeInfo[k]==2){
            						  alert("요양보호사의 10:30~11:30시간대는 일정이 겹칩니다. 일정을 확인해주세요");
            						  count=0;
            						  return;
            					  }
            					  if(listTimeString == "12:00" && timeInfo[k]==3){
            						  alert("요양보호사의 12:00~13:00시간대는 일정이 겹칩니다. 일정을 확인해주세요");
            						  count=0;
            						  return;
            					  }
            					  if(listTimeString == "13:30" && timeInfo[k]==4){
            						  alert("요양보호사의 13:30~14:30시간대는 일정이 겹칩니다. 일정을 확인해주세요");
            						  count=0;
            						  return;
            					  }
            					  if(listTimeString == "15:00" && timeInfo[k]==5){
            						  alert("요양보호사의 15:00~16:00시간대는 일정이 겹칩니다. 일정을 확인해주세요");
            						  count=0;
            						  return;
            					  }
            					  if(listTimeString == "16:30" && timeInfo[k]==6){
            						  alert("요양보호사의 16:30~17:30시간대는 일정이 겹칩니다. 일정을 확인해주세요");
            						  count=0;
            						  return;
            					  }
            				  }
            			  }
            			  
            			  chooseStDate.setDate(chooseStDate.getDate()+1);
            		  }
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
            		  if(timeInfo[k]==6){
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
            	  
              },
              error:function(request,status,error){
                  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
              }

          });
    });
    
    
// $('#save-event').unbind();
    $('#save-event').off().on('click', function () {
    	approvalModal.modal('hide');
    	
    	   
        var dayInfo = [];
        $('input:checkbox[name="dayInfo[]"]:checked').each(function () {
        	dayInfo.push(parseInt($(this).val()));
        	alert("dayInfo:"+parseInt($(this).val()));
        });

        var timeInfo = [];
        $('input:checkbox[name="timeInfo[]"]:checked').each(function () {
        	timeInfo.push(parseInt($(this).val()));
        	alert(parseInt($(this).val()));
        });  
    	
        eventData = [{
        	title: editTitle.val(),
            description: editDesc.val(),
			startTime: editStartTime.val(),
			endTime: editEndTime.val(),
			startDate: editStartDate.val() ,
			endDate: editEndDate.val(),
			dow:dayInfo,
			time:timeInfo,
            type: editType.val(),
            c_mem_id: $("#mem_id").val(),
            backgroundColor: editColor.val(),
            textColor: '#ffffff',
            allDay: false,
            c_worker:$("#cw_mem_id").val()
        }];


        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            count=0;
            return false;
        }
  
        if (eventData.title === '') {
            alert('일정명은 필수입니다.');
            count=0;
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

        console.log(dayInfo.class);
        console.log(dayInfo.class);
        requestPay();
// var eDate = new Date(editEndDate.val());
// alert(editEndDate.val());
// var sDate = new Date(editStartDate.val());
// var eDate = new Date(editEndDate.val());
//  	    	  
// var tmp;
// for (var i=0; i<=(eDate-sDate)/1000/60/60/24; i++) {
// tmp=new Date(sDate);
//  	    		  
// tmp.setDate(tmp.getDate()+i);
// for(j=0; j<dayInfo.length; j++){
// if(tmp.getDay() == dayInfo[j]){
// count++;
// }
// }
//  	    		  
// // if (tmp.getDay()==0 || tmp.getDay()==5 || tmp.getDay()==6) {
// // count++;
// // }
// }
     
  	    	
// requestPay("requestPayPrice : "+price);
    });
    function requestPay() {
    	var timeInfo = [];
         $('input:checkbox[name="timeInfo[]"]:checked').each(function () {
         	timeInfo.push(parseInt($(this).val()));
         }); 

         var app_pay;
    	var app_type;
    	var mem_id;
    	
    	IMP.request_pay(
    	{
    		// 결제회사
    		pg : 'kakaopay', // version 1.1.0부터 지원.
    		// 입급종류 ex)카드, 무통장 입금 등..
    		pay_method : 'card',
    		// 주문번호 -> seq로 대체
    		merchant_uid : 'merchant_' + new Date().getTime(),
    		// 주문명
    		name : '주문명:결제테스트',
    		// 가격 -> 게시글 가격으로 넣을 졔정
    		amount : count*timeInfo.length*10000,
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
    					app_pay : count*timeInfo.length*10000,
    					mem_id : $("#mem_id").val(),
    					app_obj : $("#cw_mem_id").val()
    					
    					// 기타 필요한 데이터가 있으면 추가 전달
    				}
    			}).done(
    					function(data) {
    						$.ajax({
    							type : "post",
    							contentType : 'application/json',
    							url : "/matching/insertCalendar",
    							data : JSON.stringify(eventData),
    							success : function(response) {
    								
    								
    								$('input:checkbox[name="dayInfo[]"]').attr(
    										"checked", false);
    								$('input:checkbox[name="timeInfo[]"]')
    								.attr("checked", false);
    								var msg = '결제가 완료되었습니다.';
    								alert(msg);
    								location.href = "/mypage/scheduleView";
    								
    							},
    							error : function(request, status, error) {
    								alert("code:" + request.status + "\n"
    										+ "message:" + request.responseText
    										+ "\n" + "error:" + error);
    							}
    							
    						});
    					});
    		} else {
    			var msg = '결제에 실패하였습니다.';
    			msg += '에러내용 : ' + rsp.error_msg;
    			
    			alert(msg);
    		}
    	});
    };

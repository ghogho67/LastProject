<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>sms - jsp </title>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f7a976957407edfce0f821ce36e56056&libraries=services"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script type="text/javascript">
        
        
        $(document).ready(function() {
           	console.log("${gps}");
//            	alert("${gps}");
           	var lat = "${gps.lat}";
           	var lng = "${gps.lng}";
           	var mem_name = "${gps.mem_name}";

          	var address;
       		var road_address;
           	var geocoder = new kakao.maps.services.Geocoder();
//         	var lat = "${gpsVo.gps_la}";
//         	var lng = "${gpsVo.gps_lo}";
//         	var name = "${mem_name}";
         
           	console.log(lat);
           	function searchDetailAddrFromCoords(coords, callback) {
           	    // 좌표로 법정동 상세 주소 정보를 요청합니다
           	    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
           	}
           	var latLng  = new kakao.maps.LatLng(lat, lng); 
           	
           	    searchDetailAddrFromCoords(latLng, function(result, status) {
           	        if (status === kakao.maps.services.Status.OK) {
           	            console.log(result[0].address.address_name);
           	            console.log(result[0].road_address.address_name + " "+result[0].road_address.building_name);
           	            address = result[0].address.address_name;
           	        	road_address = result[0].road_address.address_name + " "+result[0].road_address.building_name;
           	    		console.log(str);
           	    		var str = mem_name+'님 응급발신\r\n위치\r\n';

           	    		$('#subject').val('How Care');
           	    		$('#msg').val(str+address+'\r\n'+road_address);
           	    		$('#frm').submit();

           	        }   
           	    });
           	    
           	   
           	    
           	
           });
        
        
        
        
            function setPhoneNumber(val) {
                var numList = val.split("-");
                document.smsForm.sphone1.value = numList[0];
                document.smsForm.sphone2.value = numList[1];
            if(numList[2] != undefined){
                    document.smsForm.sphone3.value = numList[2];
        }
            }

            function loadJSON() {
                var data_file = "/calljson.jsp";
                var http_request = new XMLHttpRequest();
                try {
                    // Opera 8.0+, Firefox, Chrome, Safari
                    http_request = new XMLHttpRequest();
                } catch (e) {
                    // Internet Explorer Browsers
                    try {
                        http_request = new ActiveXObject("Msxml2.XMLHTTP");

                    } catch (e) {

                        try {
                            http_request = new ActiveXObject("Microsoft.XMLHTTP");
                        } catch (e) {
                            // Eror
                            alert("지원하지 않는브라우저!");
                            return false;
                        }

                    }
                }
                http_request.onreadystatechange = function() {
                    if (http_request.readyState == 4) {
                        // Javascript function JSON.parse to parse JSON data
                        var jsonObj = JSON.parse(http_request.responseText);
                        if (jsonObj['result'] == "Success") {
                            var aList = jsonObj['list'];
                            var selectHtml = "<select name=\"sendPhone\" onchange=\"setPhoneNumber(this.value)\">";
                            selectHtml += "<option value='' selected>발신번호를 선택해주세요</option>";
                            for (var i = 0; i < aList.length; i++) {
                                selectHtml += "<option value=\"" + aList[i] + "\">";
                                selectHtml += aList[i];
                                selectHtml += "</option>";
                            }
                            selectHtml += "</select>";
                            document.getElementById("sendPhoneList").innerHTML = selectHtml;
                        }
                    }
                }

                http_request.open("GET", data_file, true);
                http_request.send();
            }
        </script>

    </head>

    <body onload="loadJSON()">
<%--     <form method="post" name="smsForm" action="${cp}/smssend.jsp"  accept-charset="UTF-8"> --%>
    <form method="post" id="frm" name="smsForm" action="${cp}/sos/sosSend"  accept-charset="UTF-8">
        <input type="hidden" name="action" value="go"> 발송타입
        <span>
          <input type="radio" name="smsType" value="S" checked="checked">단문(SMS)</span>
        <span>
          <input type="radio" name="smsType" value="L">장문(LMS)</span>
        <br /> 제목 :
        <input type="text" id="subject" name="subject" value="제목"> 장문(LMS)인 경우(한글30자이내)
        <br /> 전송메세지
        <textarea id="msg" name="msg" cols="30" rows="10" style="width:455px;">내용입력</textarea>
        <br />
        <br />
        <p>단문(SMS) : 최대 90byte까지 전송할 수 있으며, 잔여건수 1건이 차감됩니다.
            <br /> 장문(LMS) : 한번에 최대 2,000byte까지 전송할 수 있으며 1회 발송당 잔여건수 3건이 차감됩니다.
        </p>
        <br />받는 번호
        <input type="text" name="rphone" value="010-2849-0809"> 예) 011-011-111 , '-' 포함해서 입력.
        <br />이름삽입번호
        <input type="text" name="destination" value="" size=80> 예) 010-000-0000|홍길동
        <br /> 보내는 번호
        <input type="hidden" name="sphone1" value="010">
        <input type="hidden" name="sphone2" value="2849">
        <input type="hidden" name="sphone3" value="0809">
        <span id="sendPhoneList"></span>
        <br />예약 날짜
        <input type="text" name="rdate" maxlength="8"> 예)20090909
        <br />예약 시간
        <input type="text" name="rtime" maxlength="6"> 예)173000 ,오후 5시 30분,예약시간은 최소 10분 이상으로 설정.
        <br />return url
        <input type="text" name="returnurl" maxlength="64" value="">
        <br /> test flag
        <input type="text" name="testflag" maxlength="1"> 예) 테스트시: Y
        <br />nointeractive
        <input type="text" name="nointeractive" maxlength="1"> 예) 사용할 경우 : 1, 성공시 대화상자(alert)를 생략.
        <br />반복설정
        <input type="checkbox" name="repeatFlag" value="Y">
        <br /> 반복횟수
        <select name="repeatNum">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
        </select> 예) 1~10회 가능.
        <br />전송간격
        <select name="repeatTime"> 예)15분 이상부터 가능.
            <option value="15">15</option>
            <option value="20">20</option>
            <option value="25">25</option>
        </select>분마다
        <br>
        <input type="submit" value="전송">
        <br/>이통사 정책에 따라 발신번호와 수신번호가 같은 경우 발송되지 않습니다.
    </form>
    </body>

    </html>
            
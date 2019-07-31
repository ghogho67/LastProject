<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>뿌리오 문자연동서비스 테스트</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
     <style>
        form {
        margin: 0 auto;
        width: 400px;
        padding: 1em;
        border: 1px solid #CCC;
        border-radius: 1em;
        }

        form div + div {
        margin-top: 1em;
        }

        label {
        display: inline-block;
        width: 90px;
        text-align: right;
        }

        input, textarea {
        font: 1em sans-serif;

        width: 300px;
        box-sizing: border-box;

        border: 1px solid #999;
        }

        input:focus, textarea:focus {
        border-color: #000;
        }

        textarea {
        vertical-align: top;

        height: 5em;
        }

        .button {
        padding-left: 90px; 
        }

        button {
        margin-left: .5em;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f7a976957407edfce0f821ce36e56056&libraries=services"></script>
    <script type="text/javascript">
    $(document).ready(function() {
   	 var address;
	 var road_address;
    	var geocoder = new kakao.maps.services.Geocoder();

    	function searchDetailAddrFromCoords(coords, callback) {
    	    // 좌표로 법정동 상세 주소 정보를 요청합니다
    	    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
    	}
    	var latLng  = new kakao.maps.LatLng(36.3248693, 127.420162); 
    	
    	    searchDetailAddrFromCoords(latLng, function(result, status) {
    	        if (status === kakao.maps.services.Status.OK) {
    	            console.log(result[0].address.address_name);
    	            console.log(result[0].road_address.address_name + " "+result[0].road_address.building_name);
    	            address = result[0].address.address_name;
    	        	road_address = result[0].road_address.address_name + " "+result[0].road_address.building_name;
    	    		console.log(address);
    	    		
    	    		$('#userid').val('alsckd0147');
    	    		$('#callback').val('01028490809');
    	    		$('#phone').val('01097715447');
    	    		$('#names').val('How Care');
    	    		$('#msg').val('응급발신 \r\n위치\r\n'+address+'\r\n'+road_address);

    	        }   
    	    });
    	    
    	    
//     		$('#userid').val('alsckd0147');
//     		$('#callback').val('01028490809');
//     		$('#phone').val('01097715447');
//     		$('#names').val('How Care');
//     		$('#msg').val('응급발신 \r\n위치\r\n'+address+'\r\n'+road_address);
    	    
    	
    });
    
    window.onload = function(){
		$('#userid').val('alsckd0147');
		$('#callback').val('01028490809');
		$('#phone').val('01097715447');
		$('#names').val('How Care');
		$('#msg').val('응급발신 \r\n위치\r\n'+address+'\r\n'+road_address);
		console.log("onload");
    }
    </script>
</head>
<body>

<form id="send" name="sendText" action="https://www.ppurio.com/api/send_utf8_json.php" method="post" enctype="multipart/form-data">
    <div>
        <label for="userid">* userid</label>
        <input type="text" id="userid" name="userid" maxlength="20" value="">
    </div>
    <div>
        <label for="callback">* callback</label>
        <input type="text" id="callback" name="callback" maxlength="11" value="">
    </div>
    <div>
        <label for="phone">* phone</label>
        <input type="text" id="phone" name="phone" maxlength="1000" value="">
    </div>
    <div>
        <label for="names">names</label>
        <input type="text" id="names" name="names" maxlength="1000" value="">
    </div>
    <div>
        <label for="appdate">appdate</label>
        <input type="text" id="appdate" name="appdate" maxlength="14" value="">
    </div>
    <div>
        <label for="subject">subject</label>
        <input type="text" id="subject" name="subject" maxlength="60" value="">
    </div>
    <div>
        <label for="msg">* msg</label>
        <textarea id="msg" rows="10" name="msg"></textarea>
    </div>
    <div>
        <label for="file1">file1</label>
        <input type="file" id="file1" name="file1">
    </div>
    <div class="button">
        <button type="submit">문자발송하기</button>
    </div>
</form>

</body>
</html>
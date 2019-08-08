<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script>
var socket;
function initSocket() {

	socket = new SockJS("/socket/chat");
	
	socket.onopen = onOpen;
	socket.onmessage = onMessage; 
	socket.onclose = onClose;
	
	$(function(){
		$("#message").focus();
		
		$("#sendBtn").click(function(){
			console.log('send message...');
	        sendMessage();
	        $('#message').val('');
	        $("#chatdata").scrollTop($("#chatdata")[0].scrollHeight);
	        $("#message").focus();
	    });
		
		$("#message").keypress(function() {
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13') {
				console.log('send message...');
				sendMessage();
				$('#message').val('');
				$("#chatdata").scrollTop($("#chatdata")[0].scrollHeight);
				$("#message").focus();
			}
		});
	});
	
	function onOpen(evt) {
		$("#chatdata").append("연결 됨.");
	}
	
	function sendMessage(){      
		//websocket으로 메시지를 보내겠다.
	  	socket.send($("#message").val());     
	}
	
	//evt 파라미터는 websocket이 보내준 데이터다.
	function onMessage(evt){  //변수 안에 function자체를 넣음.
		var data = evt.data;
		var sessionName = null;
		var message = null;
		var sessionId = null;
		
		
		console.log("data : " + data);
		//문자열을 splite//
		var strArray = data.split(':');
		
		for(var i=0; i<strArray.length; i++){
			console.log('str['+i+']: ' + strArray[i]);
		}
		
		//current session id//
		var currentusersession = $('#sessionuserid').val();
		var currentuser_name = $('#sessionname').val();
		console.log('current session id: ' + currentusersession);
		console.log('current session name: ' + currentuser_name);
		
		sessionName = strArray[0]; //현재 메세지를 보낸 사람의 세션 등록//
		console.log("sessionName : " + sessionName);
		message = strArray[1]; //현재 메세지를 저장//
		console.log("message : " + message);
		sessionId = strArray[2];
		console.log("sessionId : " + sessionId);
			
		//나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
		if(currentusersession == sessionName.trim()){
			var printHTML = "<div class='well' style='text-align:right'>";
			printHTML += "<div class='alert alert-info'>";
			printHTML += "<strong >"+message+" <- ["+sessionName+"]</strong>";
			printHTML += "</div>";
			printHTML += "</div>";  
			
			$("#chatdata").append(printHTML);
			$("#chatdata").scrollTop($("#chatdata")[0].scrollHeight);
			
		} else{
			var printHTML = "<div class='well' style='text-align:left>";
			printHTML += "<div class='alert alert-warning'>";
			printHTML += "<strong'>["+sessionName+"] -> "+message+"</strong>";
			printHTML += "</div>";
			printHTML += "</div>";
			
			$("#chatdata").append(printHTML);
			$("#chatdata").scrollTop($("#chatdata")[0].scrollHeight);
		}
	
		
		console.log('chatting data: ' + data);
		
	  	/* sock.close(); */
	}
	    
	function onClose(evt){
		$("#chatdata").append("연결 끊김");
	}    


	
	  
}
$(document).ready(function() {
	var userId = "${mem_id}";	//사용자 아이디를 파라미터로 받는다
	$("#userId").text(userId);
		
	initSocket();	//websocket 연결
});
</script>
<style type="text/css">
#chatdata{
	overflow:scroll;
	border: solid;
	overFlow: scroll;
	border:1px solid black;
	height: 400px;
	width: 30%;
}

.alert alert-warning{
	text-align : right;
}

.alert alert-info{
	text-align: left;
}
</style>
</head>
<body>
   <h1 id="userId"></h1>
	<table class="container-fluid" style="width: 80%;">
		<tr>
			<td>
				<div class="container-fluid">
					<h2>ThisTok! (id: ${mem_id})</h2>
				</div>

				<div>

					<br>
					<div class="well" id="chatdata">
						<!-- User Session Info Hidden -->
						<input type="hidden" value='${mem_id}' id="sessionuserid">
					</div>
					<br>
					<div>
						<input type="text" id="message" size="50" /> 
						<input type="button" id="sendBtn" value="전송" />
					</div>

				</div>
			</td>
		</tr>
	</table>
	
	
</body>
</html>

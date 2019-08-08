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
	
	socket.onmessage = function(evt) {
		$("#data").append(evt.data + "<br/>");
	};
	
	socket.onclose = function(evt) {
		$("#data").append("연결 종료");
	}
	
	$("#sendBtn").on("click", function() {
		var msg = $("#message").val();
		socket.send(msg);
	});
}
$(document).ready(function() {
	var userId = "${mem_id}";	//사용자 아이디를 파라미터로 받는다
	$("#userId").text(userId);
		
	initSocket();	//websocket 연결
});
</script>
</head>
<body>
	<h1 id="userId"></h1>
	<div id="data" style=" width:500px; height:500px; border:1px solid black;"></div><br>
	<input type="text" id="message"/> <br>
	<button id="sendBtn">전송</button><br>
	
	
</body>
</html>


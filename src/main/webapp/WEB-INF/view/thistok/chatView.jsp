<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${cp}/resource/wrap/css/ThisTok.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<style type="text/css">
#chatdata {
	overflow: scroll;
	border-top: 1px solid #f6f6f6;
	height: 455px;
	width: 99%;
	background: #fff;
	border-radius: 5px;
	box-shadow: 10px 10px 15px 0 rgba(0, 0, 0, 0.3);
	-ms-overflow-style: none;
	margin: 0 auto;
}



#logo {
	height: 90px;
	width: 250px;
}

#connectionDiv {
	margin-left: 10px;
}

#connection {
	border: 1px solid gold;
	width: 100px;
	height: 200px;
	margin-left: 10px;
}
</style>
<script>
	var socket;

	function initSocket() {

		socket = new SockJS("/socket/chat");

		socket.onopen = onOpen;
		socket.onmessage = onMessage;
		socket.onclose = onClose;

		$(function() {
			$("#message").focus();

			$("#sendBtn").click(function() {
				console.log('send message...');
				sendMessage();
				$('#message').val('');
				$("#chatdata").scrollTop($("#chatdata")[0].scrollHeight);
				$("#message").focus();
			});

			$("#message").keypress(function() {
				var keycode = (event.keyCode ? event.keyCode : event.which);
				if (keycode == '13') {
					console.log('send message...');
					sendMessage();
					$('#message').val('');
					$("#chatdata").scrollTop($("#chatdata")[0].scrollHeight);
					$("#message").focus();
				}
			});
		});

		function onOpen(evt) {
			$("#chatdata").append("채팅이 시작되었습니다. 즐거운 하루 되십시요");

		}

		function sendMessage() {
			//websocket으로 메시지를 보내겠다.
			if ($("#message").val() == '') {
				return;
			}
			socket.send($("#message").val());
		}

		//evt 파라미터는 websocket이 보내준 데이터다.
		function onMessage(evt) { //변수 안에 function자체를 넣음.
			var data = evt.data;
			var sessionName = null;
			var message = null;
			var sessionId = null;
			var division = null;

			console.log("data : " + data);
			//문자열을 splite//
			var strArray = data.split(':');

			for (var i = 0; i < strArray.length; i++) {
				console.log('str[' + i + ']: ' + strArray[i]);
			}

			//current session id//
			var currentusersession = $('#sessionuserid').val();
			var currentuser_name = $('#sessionname').val();
			console.log('current session id: ' + currentusersession);
			console.log('current session name: ' + currentuser_name);

			division = strArray[0];
			console.log(division);

			if (division == 'msg') {
				sessionName = strArray[1]; //현재 메세지를 보낸 사람의 세션 등록//
				console.log("sessionName : " + sessionName);
				message = strArray[2]; //현재 메세지를 저장//
				console.log("message : " + message);
				sessionId = strArray[3];
				console.log("sessionId : " + sessionId);

				var todate = new Date();
				var year = todate.getFullYear();
				var month = todate.getMonth() + 1;
				var date = todate.getDate();
				var hours = todate.getHours();
				var mins = todate.getMinutes();
				var seconds = todate.getSeconds();

				var today = year + "." + month + "." + date + " " + hours + ":"
						+ mins + ":" + seconds;

				//나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
				if (currentusersession == sessionName.trim()) {
					var printHTML = "<li class='chat'>";
					printHTML += "<li class='self'>";
					printHTML += "<div class='msg'>";
					printHTML += "<div class='user'>" + sessionName + "</div>";
					printHTML += "<p>" + message + "</p>";
					printHTML += "<p class='nt'>" + today + "</p>";
					printHTML += "</div>";
					printHTML += "</li>";
					printHTML += "</li>";

					$("#chatdata").append(printHTML);
					$("#chatdata").scrollTop($("#chatdata")[0].scrollHeight);

				} else {
					var printHTML = "<li class='chat' >";
					printHTML += "<li class='other'>";
					printHTML += "<div class='msg'>";
					printHTML += "<div class='user'>" + sessionName + "</div>";
					printHTML += "<p>" + message + "</p>";
					printHTML += "<p class='nt'>" + today + "</p>";
					printHTML += "</div>";
					printHTML += "</li>";
					printHTML += "</li>";

					$("#chatdata").append(printHTML);
					$("#chatdata").scrollTop($("#chatdata")[0].scrollHeight);
				}

				console.log('chatting data: ' + data);

				/* sock.close(); */
			}
		}

		function onClose(evt) {
			$("#chatdata").append("연결 끊김");
		}

	}

	$(document).ready(function() {
		var userId = "${mem_id}"; //사용자 아이디를 파라미터로 받는다
		$("#userId").text(userId);
		initSocket(); //websocket 연결
		$(".msg").attr("tabindex", -1).focus();

		$("#delBtn").on("click", function() {

			$("#deledte").submit();
		});

	});

	function back() {
		window.open("/chat/thistok?mem_id=${mem_id}", "thisTok!",
				"width=400, height=700, left=100, top=50");
	}
</script>

</head>
<body>

	<img id="logo" alt="" src="/image/logosam2.png">
	<table class="container-fluid" style="width: 80%;">
		<tr>
			<td>
				<div class=chat-header style="width: 530px;">
					<h2 id="chat-header__name">ThisTok! (id: ${mem_id})</h2>
				</div>
				<div>




					<div class="chat" id="chatdata">

						<c:forEach items="${chatTextList }" var="chatText"
							varStatus="status">

							<c:choose>
								<c:when test="${mem_id eq chatText.mem_id }">
									<li class='chat'>
									<li class='self'>
										<div class='msg'>
											<div class='user'>${mem_id }</div>
											<p>${chatText.chattext_cont }</p>
											<p class="nt">
												<fmt:formatDate value="${chatText.chattext_time }"
													pattern="YYYY.MM.dd HH:mm:ss" />
											</p>
										</div>
									</li>

									</li>

								</c:when>

								<c:otherwise>
									<li class='chat'>
									<li class='other'>
										<div class='msg'>
											<div class='user'>${chatText.mem_id }</div>
											<p>${chatText.chattext_cont }</p>
											<p class="nt">
												<fmt:formatDate value="${chatText.chattext_time }"
													pattern="YYYY.MM.dd HH:mm:ss" />
											</p>
										</div>
									</li>
									</li>

								</c:otherwise>
							</c:choose>
						</c:forEach>

						<!-- User Session Info Hidden -->
						<input type="hidden" value='${mem_id}' id="sessionuserid">
					</div>






					<input type="text" id="message" size="50" />
					<div id="buttonCol">
						<input class="btn" type="button" id="sendBtn" value="Send" /> <input
							class="btn" type="button" id="backBtn" value="Back"
							onclick="back()" /> <input class="btn" type="button" id="delBtn"
							value="Delete" />
					</div>

					<form id="deledte" action="/chat/chatDelete"></form>





				</div>
			</td>

<!-- 			<td id="connectionDiv"> -->
<!-- 				<div id="connection"></div> -->
<!-- 			</td> -->


		</tr>
	</table>



</body>
</html>

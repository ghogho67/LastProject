<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<link rel="stylesheet" href="/css/index.css">
<script src="/js/index.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<style>
/* 메인 */
#main {
  margin: auto;
  margin-top: 100px;
  border-radius: 20px;
  background-color: lightblue;
  text-align: center;
  width: 500px;
  height: 800px;
}

/* 채팅 영역 */
#chat {
  height: 90%;
  width: 100%;
  overflow-y: auto;
}


/* 사용자가 보낸 메세지*/
.user {
  width: 90%;
  margin: auto;
  background-color: lemonchiffon;
  border-radius: 5px;
  margin-top: 10px;
}

/* 챗봇이 대답한 메세지 */
.chatbot {
  width: 90%;
  margin: auto;
  background-color: white;
  border-radius: 5px;
  margin-top: 10px;
}
</style>

<script>

/* 메시지 전송 함수 */
// function send() {
//   // 입력되어있는 데이터 가져오기
//   var message = document.getElementById('test').value
  
//   // 가져왔으니 데이터 빈칸으로 변경
//   document.getElementById('test').value = ''

//   // 내가 전송할 메시지 클라이언트에게 표시
//   var chat = document.getElementById('chat')
//   var msg = document.createElement('div')
//   var node = document.createTextNode(message)
//   msg.classList.add('user')
//   msg.appendChild(node)
//   chat.appendChild(msg)
// }


$(document).ready(function(){
	$("#sendBtn").on("click", function(){
		var userquestion= $("#user").val();
		console.log("userquestion");
		
		var chatbotSay = $("#chat").append(chatbotSay);
		console.log("chatbotSay");
		
// 		var answer = $("#chat").append(chatbotSay);
		
		if(userquestion == '가입' || userquestion == '회원가입' || userquestion == '회원 가입'){
			chatbotSay == '회원가입'; 
		}else if(userquestion == '매칭' || userquestion == '요양보호사 선택' || userquestion == '요양보호사선택' || userquestion == '요양 보호사 선택'){
			chatbotSay == '매칭';
		}else if(userquestion == '골드회원' || userquestion == '골드 회원' || userquestion == '골드 회원 서비스' || userquestion == '골드회원서비스' || userquestion == '등급변경' || userquestion == '등급 변경'){
			chatbotSay == '골드회원 등급변경';
		}else if(userquestion == '내정보' || userquestion == '회원정보' || userquestion == '회원 정보' || userquestion =='마이페이지' || userquestion == '마이 페이지'){
			chatbotSay == '마이페이지';
		}else if(userquestion == '무더위 쉼터' || userquestion == '무더위쉼터' || userquestion == '더위' || userquestion == '더위대피소' || userquestion == '더위 대피소'){
			chatbotSay == '무더위 쉼터';
		}else if(userquestion == '문화센터' || userquestion == '문화 센터' || userquestion == '강좌' || userquestion =='강의' || userquestion == '교육'){
			chatbotSay == '문화강좌';
		}else{
			chatbotSay == '다시 입력해 주세요';
		} 
		
		
		
		$("#user").val("");
		$("frm").submit();

		
	});
	
});

</script>

</head>
<body>
	<form id="frm" action="${cp}/chatbot">
	<div id="main">
		<div id="chat">
			<!-- 채팅 메시지 영역 -->
		</div>
		<div>
			<!--         <input type="text" id="test" placeholder="메시지를 입력해주세요.."> -->
			<input type="text" id="user" name="user">
			<button type="button" id="sendBtn" name="sendBtn">전송</button>
		</div>
	</div>
	</form>
</body>


</body>
</html>
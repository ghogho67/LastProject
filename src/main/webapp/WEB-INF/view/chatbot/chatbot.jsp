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


$(document).ready(function(){
	$("#sendBtn").on("click", function(){
		var userquestion= $("#user").val();
		console.log("userquestion");
		
// 		var chatbotSay = $("#chat").append(chatbotSay);
// 		console.log("chatbotSay");
		
// 		var answer = $("#chat").append(chatbotSay);
		
		if(userquestion == '매칭' || userquestion == '요양보호사' || userquestion == '요양 보호사'  || userquestion == '요양보호사선택' || 
				userquestion == '요양 보호사 선택' || userquestion == '요양보호사 선택'){
			$("#chat").append(userquestion+'<br><br>'); 
			$("#chat").append('매칭<br><br><br>'); 
		}else if(userquestion == '골드회원' || userquestion == '골드 회원'  || userquestion == '등급변경' || userquestion == '등급 변경' ||
				userquestion == '유료회원' || userquestion == '유료 회원'){
			$("#chat").append(userquestion+'<br><br>'); 
			$("#chat").append('골드회원서비스<br><br><br>');
		}else if(userquestion == '내정보' || userquestion == '내 정보' || userquestion == '회원정보' || userquestion == '회원 정보' || 
				userquestion =='마이페이지' || userquestion == '마이 페이지'){
			$("#chat").append(userquestion+'<br><br>'); 
			$("#chat").append('마이페이지<br><br><br>');
		}else if(userquestion == '무더위 쉼터' || userquestion == '무더위쉼터' || userquestion == '더위' || userquestion == '더위대피소' ||
				userquestion == '더위 대피소' || userquestion == '폭염' || userquestion == '양로원'){
			$("#chat").append(userquestion+'<br><br>'); 
			$("#chat").append('무더위쉼터<br><br><br>');
		}else if(userquestion == '문화센터' || userquestion == '문화 센터' || userquestion == '강좌' || userquestion =='강의' || 
				userquestion == '교육' || userquestion =='문화' || userquestion =='수업'){
			$("#chat").append(userquestion+'<br><br>'); 
			$("#chat").append('문화강좌정보<br><br><br>');
		}else if(userquestion == '메신저' || userquestion == '메세지' || userquestion == '쪽지'){
			$("#chat").append(userquestion+'<br><br>'); 
			$("#chat").append('메신저<br><br><br>');
		}else if(userquestion == ' '){
			$("#chat").append('다시 입력해 주세요<br><br><br>');
		}else{
			$("#chat").append('다시 입력해 주세요<br><br><br>');
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
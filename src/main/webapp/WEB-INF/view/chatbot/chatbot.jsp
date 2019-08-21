<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type='text/javascript' src='${cp }/dist/annyang.min.js'></script>
<link rel="stylesheet" href="/css/index.css">
<script src="/js/index.js"></script>
<head>
<meta charset="UTF-8">
<title>챗봇</title>



<style>
/* 메인 */
#main {
  margin: auto;
  margin-top: 100px;
  border-radius: 20px;
  background-color: #E1F6FA;
/*   text-align: center; */
  width: 500px;
  height: 700px;
}

/* 채팅 영역 */
#result {
  height: 90%;
  width: 100%;
  overflow-y: auto;
  -ms-overflow-style: none; 
}
::-webkit-scrollbar {
   display:none;
}


/*  input테그 */
.user { 
   width: 85%; 
   margin: auto; 
   background-color: lemonchiffon; 
   border-radius: 5px; 
   margin-top: 10px; 

 } 
 
/*  버튼 */
#sendBtn{
 	width: 10%;
 	margin: 5px;
 }


#userSay{
	text-align : left;
	margin-left: 15px;
}

#chatBotSay{
	text-align : right;
	margin-left: 15px;
}

#chatBotSay1{
	text-align : right;
	margin-right: 15px;
}


</style>

<script>


$(document).ready(function(){
	$("#sendBtn").on("click", function(){
		//지울것
		var userquestion= $("#user").val();
		console.log("userquestion");

		if(userquestion == '매칭' || userquestion == '요양보호사' || userquestion == '요양보호사선택' || 
				userquestion == '요양사' || userquestion =='보호사'){
			$("#result").append("<div id='userSay'> user :"+ userquestion+"</div><br>");
			
			$("#result").append("<div id='chatBotSay'> 매칭 : chatbot "+"</div><br>"); 
			$("#frm").attr("action", "${cp}/matching/map");
			$("#result").scrollTop($("#result")[0].scrollHeight);
			$("#user").val("");
			$("#user").focus();
			$("#frm").submit();
		}else if(userquestion == '골드회원' || userquestion == '등급변경' || userquestion == '유료회원'){
			$("#result").append("<div id='userSay'> user :"+ userquestion+"</div><br>"); 
			$("#result").append("<div id='chatBotSay'> 골드회원서비스 : chatbot "+"</div><br>");
// 			$("#frm").attr("action", "${cp}");
			$("#result").scrollTop($("#result")[0].scrollHeight);
			$("#user").val("");
			$("#user").focus();
			$("#frm").submit();
		}else if(userquestion == '내정보' || userquestion == '회원정보' || userquestion =='마이페이지'){
			$("#result").append("<div id='userSay'> user :"+ userquestion+"</div><br>")
			$("#result").append("<div id='chatBotSay'> 마이페이지 : chatbot "+"</div><br>");
			$("#frm").attr("action", "${cp}/mypage/Patient_Info");
			$("#result").scrollTop($("#result")[0].scrollHeight);
			$("#user").val("");
			$("#user").focus();
			$("#frm").submit();
		}else if(userquestion == '무더위쉼터' || userquestion == '더위' || userquestion == '더위대피소' 
				|| userquestion == '무더위' || userquestion == '폭염' || userquestion == '양로원'){
			$("#result").append("<div id='userSay'> user :"+ userquestion+"</div><br>"); 
			$("#chresultat").append("<div id='chatBotSay'> 무더위쉼터 : chatbot "+"</div><br>");
			$("#result").scrollTop($("#result")[0].scrollHeight);
			$("#user").val("");
			$("#user").focus();
			$("#frm").attr("action", "${cp}/shelter/pagingList");
			$("#frm").submit();
		}else if(userquestion == '문화센터' || userquestion == '강좌' || userquestion =='강의' || 
				userquestion == '교육' || userquestion =='문화' || userquestion =='수업'){
			$("#result").append("<div id='userSay'> user :"+ userquestion+"</div><br>"); 
			$("#result").append("<div id='chatBotSay'> 문화강좌정보  : chatbot "+"</div><br>");
			$("#frm").attr("action", "${cp}/lecture/lectureMain");
			$("#result").scrollTop($("#result")[0].scrollHeight);
			$("#user").val("");
			$("#user").focus();
			$("#frm").submit();
		}else if(userquestion == '메신저' || userquestion == '메세지' || userquestion == '쪽지'){
			$("#result").append("<div id='userSay'> user :"+ userquestion+"</div><br>"); 
			$("#result").append("<div id='chatBotSay'> 메신저 : chatbot"+"</div><br>");
// 			$("#frm").attr("action", "/chat/thistok?mem_id=${mem_id}");
			$("#result").scrollTop($("#result")[0].scrollHeight);
			$("#user").val("");
			$("#user").focus();
			$("#frm").submit();
		}else if(userquestion == ''){
			$("#result").append("<div id='chatBotSay1'> 다시 입력해 주세요 : chatbot"+"</div><br>");
			$("#result").scrollTop($("#result")[0].scrollHeight);
			$("#user").val("");
			$("#user").focus();
		}else{
			$("#result").append("<div id='chatBotSay1'> 다시 입력해 주세요 : chatbot"+"</div><br>");
			$("#result").scrollTop($("#result")[0].scrollHeight);
			$("#user").val("");
			$("#user").focus();
		} 					
		
	});
	
	$("#start").on("click", function(){
		
		start();
		
	});
	
	$("#end").on("click", function(){
		end();
		
	});



	
});


function start(){
	annyang.start({autoRestart:false, continuous:true})  // 음성요청을 시작 자동시작 끄고 계속적으로 동작할수 있게 함.
	var recognition = annyang.getSpeechRecognirzer();
	var final_transcript = '';
	var result = '';
	recognition.lang = 'ko';	//한국어
	recognition.interimResults = true;
	recognition.onresult = function(event){  // 음성 데이터의 결과를 리턴받음.
		var interim_transcript = '';
		final_transcript = '';
		for(var i = event.resultIndex; i<event.results.length; ++i){// 반복문 작업을 통해 들어온 음성 데이터를 
			if(event.results[i].isFinal){							// final_transcript에 계속적으로 붙여줌.
				final_transcript += event.results[i][0].transcript;
			}
		}
		result = final_transcript.replace(/(\s*)/g,"");  // 음성 데이터를 result에 넣고 출력함
		document.getElementById('result').innerHTML = result;  
	};
}
function end(){
	annyang.abort(); // 음성요청을 중지시킴
}

</script>


</head>
<body>
	<form id="frm" action="${cp}/chatbot">
	<div id="main">
		<div id="result">
			<!-- 채팅 메시지 영역 -->
		</div>
			<input type = "button" value = "시작" id = "start"/>
 			<input type = "button" value = "멈춤" id = "end"/><br/>
		<div>
			<!--         <input type="text" id="test" placeholder="메시지를 입력해주세요.."> -->
			<input type="text" id="user" name="user" autofocus="autofocus">
			<button type="button" id="sendBtn" name="sendBtn">전송</button><br>
		</div>
	</div>
	</form>
	
</body>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type='text/javascript' src='${cp }/dist/annyang.min.js'></script>
	<script type="text/javascript">
	$(document).ready(function(){
	$("#start").on("click", function(){
		
		start();
		
	});
	
	$("#end").on("click", function(){
		end();
		
	});
});
	function start(){
		annyang.start({autoRestart:false, continuous:true})  // 음성요청을 시작 자동시작 끄고 계속적으로 동작할수 있게 함.
		var recognition = annyang.getSpeechRecognizer();
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
			
			//----
			if(result == '홈' || result == '메인' || result =='메인화면' || result == '메인 화면' || result == '홈 화면' ||
					result == '홈화면' || result == '시작화면' || result == '시작 화면' || result == '처음' || result == '처음화면'){
				$("#result").append("home"); 
				$("#frm").attr("action", "${cp}/matching/map");
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
				$("#frm").submit();
			}else{
				$("#result").append("<br>다시 입력해 주세요 ");
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
			} 	
			
			
		};
	}

	function end(){
		annyang.abort(); // 음성요청을 중지시킴
		
		//---
// 		$("#frm").attr("action", "${cp}/matching/map");
// 		$("#frm").submit();
	}
	</script>
</head>
<body class = "" id = "grid">
 <br/><br/>
 한국어 음성 처리 테스트 <br/><br/>

 <input type = "button" value = "시작" id = "start" onclick="start();"/><br/>
 <input type = "submit" value = "멈춤" id = "end"  onclick="end();"/><br/>
 <form id=frm>
 <div id = 'result'>
	<!-- 음성영역 -->
 </div>
 </form>
</body>
</html>
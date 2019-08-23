<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type='text/javascript' src='${cp }/dist/annyang.min.js'></script>
	<script type="text/javascript">
	function start(){
		annyang.start({autoRestart:false, continuous:true})  // 음성요청을 시작 자동시작 끄고 계속적으로 동작할수 있게 함.
		var recognition = annyang.getSpeechRecognizer();
		var final_transcript = '';
		var result = '';
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
<body class = "" id = "grid">
 <br/><br/>
 한국어 음성 처리 테스트 <br/><br/>
 <input type = "button" value = "시작" id = "start" onclick="start();"/><br/>
 <input type = "button" value = "멈춤" id = "end" onclick="end();"/><br/>
 <div id = 'result'>
 결과가 없습니다.
 </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='${cp }/dist/annyang.min.js'></script>
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



<script type="text/javascript">
	$(document).ready(function(){
		
		
		$("#sendBtn").on("click", function(){
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
//	 			$("#frm").attr("action", "${cp}");
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
				$("#frm").attr("action", "${cp}/shelter/pagingList?page=1&pageSize=10");
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
			}else if(userquestion == '전국 행사 정보' || userquestion == '전국 행사정보' || userquestion == '전국행사 정보' || userquestion == '전국행사정보' ||
					userquestion == '문화정보' || userquestion == '문화 정보' || userquestion == '문화 게시판' || userquestion == '문화게시판' || 
					userquestion == '행사' | userquestion == '행사 정보' || userquestion == '축제' || userquestion == '축제 정보' || userquestion == '축제 게시판'){
				$("#result").append("<div id='userSay'> user :"+ userquestion+"</div><br>"); 
				$("#result").append("<div id='chatBotSay'> 전국행사정보  : chatbot "+"</div><br>");
				$("#frm").attr("action", "${cp}/post/ImageBoard2");
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
				$("#frm").submit();
			}else if(userquestion == '기부' || userquestion == '기부 하기' || userquestion == '도네이션' || userquestion == '도내이션' ||
					userquestion == '도네' || userquestion == '도네'){
				$("#result").append("<div id='userSay'> user :"+ userquestion+"</div><br>"); 
				$("#result").append("<div id='chatBotSay'> 기부하기  : chatbot "+"</div><br>");
				$("#frm").attr("action", "${cp}/donation/memberDonation");
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
				$("#frm").submit();
			}else if(userquestion == '메신저' || userquestion == '메세지' || userquestion == '쪽지' || userquestion == 'thistolk' || 
					userquestion == 'thistok' || userquestion == 'THISTOLK' || userquestion == 'THISTOK' || userquestion == '디스톡'){
				$("#result").append("<div id='userSay'> user :"+ userquestion+"</div><br>"); 
				$("#result").append("<div id='chatBotSay'> thisTok : chatbot"+"</div><br>");
				$("#frm").attr("action", "chat/thistok?mem_id=${mem_id}");
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
				$("#frm").submit();
			}else if(userquestion == '병원' || userquestion == '요양원' || userquestion == '요양병원' || userquestion == '요양 병원'){
				$("#result").append("<div id='userSay'> user :"+ userquestion+"</div><br>"); 
				$("#result").append("<div id='chatBotSay'> 요양원/요양병원 찾기 : chatbot"+"</div><br>");
				$("#frm").attr("action", "${cp}/hospital/pagingList?page=1&pageSize=10");
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
				$("#frm").submit();
			}else if(userquestion == '간이테스트' || userquestion == '간이 테스트' || userquestion == '인지능력테스트' || userquestion == '인지능력 테스트'){
				$("#result").append("<div id='userSay'> user :"+ userquestion+"</div><br>"); 
				$("#result").append("<div id='chatBotSay'> 인지능력테스트 : chatbot"+"</div><br>");
				$("#frm").attr("action", "${cp}/recognition/semiTestStart");
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
				$("#frm").submit();
			}else if(userquestion == '인지능력향상' || userquestion == '인지능력 향상' || userquestion == '인지 능력 향상' || userquestion == '치매' ||
					userquestion == '치매검사' || userquestion == '치매 검사' || userquestion == '인지능력 향상 프로그램' || userquestion == '인지능력향상프로그램' ||
					userquestion == '인지능력향상 프로그램' || userquestion == '인지 능력향상 프로그램' ){
				$("#result").append("<div id='userSay'> user :"+ userquestion+"</div><br>"); 
				$("#result").append("<div id='chatBotSay'> 인지능력향상프로그램 : chatbot"+"</div><br>");
				$("#frm").attr("action", "${cp}/recognitionImp/impStart");
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
				$("#frm").submit();
			}else if(userquestion == '공지' || userquestion == '공지 사항' || userquestion == '공지사항게시판' || userquestion == '공지사항 게시판'){
				$("#result").append("<div id='userSay'> user :"+ userquestion+"</div><br>"); 
				$("#result").append("<div id='chatBotSay'> 공지사항 게시판 : chatbot"+"</div><br>");
				$("#frm").attr("action", "${cp}/post/pagingList?searchType=a&cate_id=30011");
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
				$("#frm").submit();
			}else if(userquestion == '자유' || userquestion == '자유 게시판' || userquestion == '자유게시판'){
				$("#result").append("<div id='userSay'> user :"+ userquestion+"</div><br>"); 
				$("#result").append("<div id='chatBotSay'> 자유 게시판 : chatbot"+"</div><br>");
				$("#frm").attr("action", "${cp}/post/pagingList?searchType=a&cate_id=30012");
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
				$("#frm").submit();
			}else if(userquestion == 'QnA' || userquestion == 'Q&A' || userquestion == 'qna' || userquestion == 'q&a' ||
					userquestion == '질문' || userquestion == '질문게시판' || userquestion == '질문 게시판'){
				$("#result").append("<div id='userSay'> user :"+ userquestion+"</div><br>"); 
				$("#result").append("<div id='chatBotSay'> 자유 게시판 : chatbot"+"</div><br>");
				$("#frm").attr("action", "${cp}/post/pagingList?searchType=a&cate_id=30013");
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
				$("#frm").submit();
			}else if(userquestion == '홈' || userquestion == '메인' || userquestion =='메인화면' || userquestion == '메인 화면' || userquestion == '홈 화면' ||
					userquestion == '홈화면' || userquestion == '시작화면' || userquestion == '시작 화면' || userquestion == '처음' || userquestion == '처음화면'){
				$("#result").append("<div id='userSay'> user :"+ userquestion+"</div><br>"); 
				$("#result").append("<div id='chatBotSay'> 자유 게시판 : chatbot"+"</div><br>");
				$("#frm").attr("action", "${cp}/main");
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
		
		//iframe
// 		parent.document.getElementById("chatbot1").
		
});
	function start(){
		var cnt =0;
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
			
			//부모창 이동
// 			window.opener.location.href="action";	
			
			if(event.results[0].isFinal==true){
// 				annyang.abort();
				
				if(result == '매칭' || result == '요양보호사' || result == '요양보호사선택' || 
						result == '요양사' || result =='보호사'){
					$("#result").append("매칭");
// 					$("#frm").attr("action", "${cp}/matching/map");
					window.opener.location.href="${cp}/matching/map";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					annyang.abort();
				}else if(result == '골드회원' || result == '등급변경' || result == '유료회원'){
					$("#result").append("골드회원서비스"); 
//		 			$("#frm").attr("action", "${cp}");
// 					window.opener.location.href=
					$("#result").scrollTop($("#result")[0].scrollHeight);
					annyang.abort();
				}else if(result == '내정보' || result == '회원정보' || result =='마이페이지'){
					$("#result").append("마이페이지");
// 					$("#frm").attr("action", "${cp}/mypage/Patient_Info");
					window.opener.location.href="${cp}/mypage/Patient_Info";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					annyang.abort();
				}else if(result == '무더위쉼터' || result == '더위' || result == '더위대피소' 
						|| result == '무더위' || result == '폭염' || result == '양로원'){
					$("#result").append("무더위쉼터");
					$("#result").scrollTop($("#result")[0].scrollHeight);
// 					$("#frm").attr("action", "${cp}/shelter/pagingList?page=1&pageSize=10");
					window.opener.location.href="${cp}/shelter/pagingList?page=1&pageSize=10";
					annyang.abort();
				}else if(result == '문화센터' || result == '강좌' || result =='강의' || 
						result == '교육' || result =='문화' || result =='수업'){
					$("#result").append("문화강좌정보");
// 					$("#frm").attr("action", "${cp}/lecture/lectureMain");
					window.opener.location.href="${cp}/lecture/lectureMain";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					annyang.abort();
				}else if(result == '전국 행사 정보' || result == '전국 행사정보' || result == '전국행사 정보' || result == '전국행사정보' ||
						result == '문화정보' || result == '문화 정보' || result == '문화 게시판' || result == '문화게시판' || 
						result == '행사' | result == '행사 정보' || result == '축제' || result == '축제 정보' || result == '축제 게시판'){
					$("#result").append("전국행사정보");
// 					$("#frm").attr("action", "${cp}/post/ImageBoard2");
					window.opener.location.href="${cp}/post/ImageBoard2";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					annyang.abort();
				}else if(result == '기부' || result == '기부 하기' || result == '도네이션' || result == '도내이션' ||
						result == '도네' || result == '도네'){
					$("#result").append("기부하기");
// 					$("#frm").attr("action", "${cp}/donation/memberDonation");
					window.opener.location.href="${cp}/donation/memberDonation";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					annyang.abort();
				}else if(result == '메신저' || result == '메세지' || result == '쪽지' || result == 'thistolk' || 
						result == 'thistok' || result == 'THISTOLK' || result == 'THISTOK' || result == '디스톡'){
					$("#result").append("thisTok");
// 					$("#frm").attr("action", "chat/thistok?mem_id=${mem_id}");
					window.opener.location.href="chat/thistok?mem_id=${mem_id}";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					annyang.abort();
				}else if(result == '병원' || result == '요양원' || result == '요양병원' || result == '요양 병원'){
					$("#result").append("요양원/요양병원 찾기");
// 					$("#frm").attr("action", "${cp}/hospital/pagingList?page=1&pageSize=10");
					window.opener.location.href="${cp}/hospital/pagingList?page=1&pageSize=10";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					annyang.abort();
				}else if(result == '간이테스트' || result == '간이 테스트' || result == '인지능력테스트' || result == '인지능력 테스트'){
					$("#result").append("인지능력테스트");
// 					$("#frm").attr("action", "${cp}/recognition/semiTestStart");
					window.opener.location.href="${cp}/recognition/semiTestStart";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					annyang.abort();
				}else if(result == '인지능력향상' || result == '인지능력 향상' || result == '인지 능력 향상' || result == '치매' ||
						result == '치매검사' || result == '치매 검사' || result == '인지능력 향상 프로그램' || result == '인지능력향상프로그램' ||
						result == '인지능력향상 프로그램' || result == '인지 능력향상 프로그램' ){
					$("#result").append("인지능력향상프로그램");
// 					$("#frm").attr("action", "${cp}/recognitionImp/impStart");
					window.opener.location.href="${cp}/recognitionImp/impStart";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					annyang.abort();
				}else if(result == '공지' || result == '공지 사항' || result == '공지사항게시판' || result == '공지사항 게시판'){
					$("#result").append("공지사항");
// 					$("#frm").attr("action", "${cp}/post/pagingList?searchType=a&cate_id=30011");
					window.opener.location.href="${cp}/post/pagingList?searchType=a&cate_id=30011";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					annyang.abort();
				}else if(result == '자유' || result == '자유 게시판' || result == '자유게시판'){
					$("#result").append("자유 게시판");
// 					$("#frm").attr("action", "${cp}/post/pagingList?searchType=a&cate_id=30012");
					window.opener.location.href="${cp}/post/pagingList?searchType=a&cate_id=30012";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					annyang.abort();
				}else if(result == 'QnA' || result == 'Q&A' || result == 'qna' || result == 'q&a' ||
						result == '질문' || result == '질문게시판' || result == '질문 게시판'){
					$("#result").append("Q&A 게시판");
// 					$("#frm").attr("action", "${cp}/post/pagingList?searchType=a&cate_id=30013");
					window.opener.location.href="${cp}/post/pagingList?searchType=a&cate_id=30013";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					annyang.abort();
				}else if(result == '홈' || result == '메인' || result =='메인화면' || result == '메인 화면' || result == '홈 화면' ||
						result == '홈화면' || result == '시작화면' || result == '시작 화면' || result == '처음' || result == '처음화면'){
					$("#result").append("메인화면");
// 					$("#frm").attr("action", "${cp}/main");
					window.opener.location.href="${cp}/main";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					annyang.abort();
				}else if(userquestion == ''){
					$("#result").append("<div id='chatBotSay1'> 다시 입력해 주세요 : chatbot"+"</div><br>");
					$("#result").scrollTop($("#result")[0].scrollHeight);
					$("#user").val("");
					$("#user").focus();
					annyang.abort();
				}else{
					$("#result").append("<div id='chatBotSay1'> 다시 입력해 주세요 : chatbot"+"</div><br>");
					$("#result").scrollTop($("#result")[0].scrollHeight);
					$("#user").val("");
					$("#user").focus();
					annyang.abort();
				}
				
				
			}
			
			//부모창 닫기
// 			window.close();
			
		};
	}
	
	
	
</script>
	
	
</head>
<body class = "" id = "grid">


 <br/><br/>
 한국어 음성 처리 테스트 <br/><br/>

 <input type = "button" value = "시작" id = "start" onclick="start();"/><br/>
 <input type = "submit" value = "멈춤" id = "end"  onclick="end();"/><br/>
 
 
 <input type="text" id="user" name="user">
 <button type="button" id="sendBtn" name="sendBtn">전송</button><br>
 <form id=frm action="${cp}/chatbot">
 <div id = 'result'>
	<!-- 음성영역 -->
 </div>
 </form>
</body>
</html>
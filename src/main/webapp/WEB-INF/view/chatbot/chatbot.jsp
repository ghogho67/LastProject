<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ThisCareChatBot</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type='text/javascript' src='${cp }/dist/annyang.min.js'></script>
<%@include file="/WEB-INF/view/common/LibForMypage.jsp"%>
<style>
/* 메인 */
#frm {
margin: auto;
  border-radius: 10px;
  background-color: #e5e5e5;
 text-align: center;
  height: 420px;
}

/* 채팅 영역 */
#result {
  height: 390px;
  width: 100%;
  overflow-y: auto;
  -ms-overflow-style: none; 
}
::-webkit-scrollbar {
   display:none;
}


input {
    font-size: 14px;
    color: black;
     font-weight: 600;
     min-height: 20px;
    border-radius: 6px;
     padding: 1px 1px;
     border: 1px gray;    background-color: #f3f3f3;
}


/*  input테그 */
.user { 
   width: 150px; 
   height : 50px;
   margin: auto; 
   background-color: lemonchiffon; 
   border-radius: 5px; 
   margin-top: 10px; 

 } 
 

.btn{
  background: #787878;
  border: 0;
  color: #fff;
  cursor: pointer;
  display: inline-block;  
  font-size: 13px;
  height: 30px;
  
  min-width: 110px;
  text-align: center;
/*   margin-top: 5px; */
  
}


#userSay{
	text-align : right;
	margin-right: 15px;
	font-size: 20px;
}

#chatBotSay{
	text-align : left;
	margin-left: 15px;
font-size: 20px;
}

#chatBotSay1{
	text-align : left;
	margin-left: 15px;
		font-size: 20px;

}

#logo{
	height: 70px;
	width: 200px;
/* 	margin-bottom: 10px; */
}

#chatONOff{
	height: auto;
	width: 40px;
}


</style>



<script type="text/javascript">
	$(document).ready(function(){
		
		
		$("#sendBtn").on("click", function(){
			var result= $("#user").val();
			console.log("userquestion");

			if(result == '매칭' || result == '요양보호사' || result == '요양보호사선택' || 
					result == '요양사' || result =='보호사'){
				$("#result").append("<div id='userSay'>"+ result+" : user </div><br>");
				$("#result").append("<div id='chatBotSay'> chatbot : 요양보호사찾기<br>페이지로 이동하겠습니다"+"</div><br>"); 
// 				$("#frm").attr("action", "${cp}/matching/map");
				window.opener.location.href="${cp}/matching/map";
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
				
			}else if(result == '골드회원' || result == '등급변경' || result == '유료회원'){
				$("#result").append("<div id='userSay'>"+ result+" : user </div><br>"); 
				$("#result").append("<div id='chatBotSay'> chatbot : 골드회원서비스<br>페이지로 이동하겠습니다 "+"</div><br>");
//	 			$("#frm").attr("action", "${cp}");
// 				window.opener.location.href=;
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
			}else if(result == '내정보' || result == '회원정보' || result =='마이페이지'){
				$("#result").append("<div id='userSay'>"+ result+" : user </div><br>")
				$("#result").append("<div id='chatBotSay'> chatbot : 마이페이지<br>로 이동하겠습니다 "+"</div><br>");
// 				$("#frm").attr("action", "${cp}/mypage/Patient_Info");
				window.opener.location.href="${cp}/mypage/Patient_Info";
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
			}else if(result == '무더위쉼터' || result == '더위' || result == '더위대피소' 
					|| result == '무더위' || result == '폭염' || result == '양로원'){
				$("#result").append("<div id='userSay'>"+ result+" : user </div><br>"); 
				$("#result").append("<div id='chatBotSay'> chatbot : 무더위쉼터<br>페이지로 이동하겠습니다 "+"</div><br>");
// 				$("#frm").attr("action", "${cp}/shelter/pagingList?page=1&pageSize=10");
				window.opener.location.href="${cp}/shelter/pagingList?page=1&pageSize=10";
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
			}else if(result == '문화센터' || result == '강좌' || result =='강의' || 
					result == '교육' || result =='문화' || result =='수업'){
				$("#result").append("<div id='userSay'>"+ result+" : user </div><br>"); 
				$("#result").append("<div id='chatBotSay'> chatbot : 문화강좌정보<br>페이지로 이동하겠습니다 "+"</div><br>");
// 				$("#frm").attr("action", "${cp}/lecture/lectureMain");
				window.opener.location.href="${cp}/lecture/lectureMain";
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
			}else if(result == '전국 행사 정보' || result == '전국 행사정보' || result == '전국행사 정보' || result == '전국행사정보' ||
					result == '문화정보' || result == '문화 정보' || result == '문화 게시판' || result == '문화게시판' || 
					result == '행사' | result == '행사 정보' || result == '축제' || result == '축제 정보' || result == '축제 게시판'){
				$("#result").append("<div id='userSay'>"+ result+" : user </div><br>"); 
				$("#result").append("<div id='chatBotSay'> chatbot : 전국행사정보<br>페이지로 이동하겠습니다"+"</div><br>");
// 				$("#frm").attr("action", "${cp}/post/ImageBoard2");
				window.opener.location.href="${cp}/post/ImageBoard2";
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
			}else if(result == '기부' || result == '기부 하기' || result == '도네이션' || result == '도내이션' ||
					result == '도네' || result == '도네'){
				$("#result").append("<div id='userSay'>"+ result+" : user </div><br>"); 
				$("#result").append("<div id='chatBotSay'> chatbot : 기부하기<br>페이지로 이동하겠습니다 "+"</div><br>");
// 				$("#frm").attr("action", "${cp}/donation/memberDonation");
				window.opener.location.href="${cp}/donation/memberDonation";
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
			}else if(result == '메신저' || result == '메세지' || result == '쪽지' || result == 'thistolk' || 
					result == 'thistok' || result == 'THISTOLK' || result == 'THISTOK' || result == '디스톡'){
				$("#result").append("<div id='userSay'>"+ result+" : user </div><br>"); 
				$("#result").append("<div id='chatBotSay'> chatbot : thisTok"+"</div><br>");
// 				$("#frm").attr("action", "chat/thistok?mem_id=${mem_id}");
				window.opener.location.href="chat/thistok?mem_id=${mem_id}";
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
			}else if(result == '병원' || result == '요양원' || result == '요양병원' || result == '요양 병원'){
				$("#result").append("<div id='userSay'>"+ result+" : user </div><br>"); 
				$("#result").append("<div id='chatBotSay'> chatbot : 요양원/요양병원 찾기<br>페이지로 이동하겠습니다"+"</div><br>");
// 				$("#frm").attr("action", "${cp}/hospital/pagingList?page=1&pageSize=10");
				window.opener.location.href="${cp}/hospital/pagingList?page=1&pageSize=10";
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
			}else if(result == '간이테스트' || result == '간이 테스트' || result == '인지능력테스트' || result == '인지능력 테스트'){
				$("#result").append("<div id='userSay'>"+ result+" : user </div><br>"); 
				$("#result").append("<div id='chatBotSay'> chatbot : 인지능력테스트<br>페이지로 이동하겠습니다"+"</div><br>");
// 				$("#frm").attr("action", "${cp}/recognition/semiTestStart");
				window.opener.location.href="${cp}/recognition/semiTestStart";
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
			}else if(result == '인지능력향상' || result == '인지능력 향상' || result == '인지 능력 향상' || result == '치매' ||
					result == '치매검사' || result == '치매 검사' || result == '인지능력 향상 프로그램' || result == '인지능력향상프로그램' ||
					result == '인지능력향상 프로그램' || result == '인지 능력향상 프로그램' ){
				$("#result").append("<div id='userSay'>"+ result+" : user </div><br>"); 
				$("#result").append("<div id='chatBotSay'> chatbot : 인지능력향상프로그램<br>페이지로 이동하겠습니다"+"</div><br>");
// 				$("#frm").attr("action", "${cp}/recognitionImp/impStart");
				window.opener.location.href="${cp}/recognitionImp/impStart";
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
			}else if(result == '공지' || result == '공지 사항' || result == '공지사항게시판' || result == '공지사항 게시판'){
				$("#result").append("<div id='userSay'>"+ result+" : user </div><br>"); 
				$("#result").append("<div id='chatBotSay'> chatbot : 공지사항 게시판<br>페이지로 이동하겠습니다"+"</div><br>");
// 				$("#frm").attr("action", "${cp}/post/pagingList?searchType=a&cate_id=30011");
				window.opener.location.href="${cp}/post/pagingList?searchType=a&cate_id=30011";
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
			}else if(result == '자유' || result == '자유 게시판' || result == '자유게시판'){
				$("#result").append("<div id='userSay'>"+ result+" : user </div><br>"); 
				$("#result").append("<div id='chatBotSay'> chatbot : 자유 게시판<br>페이지로 이동하겠습니다"+"</div><br>");
// 				$("#frm").attr("action", "${cp}/post/pagingList?searchType=a&cate_id=30012");
				window.opener.location.href="${cp}/post/pagingList?searchType=a&cate_id=30012";
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
			}else if(result == 'QnA' || result == 'Q&A' || result == 'qna' || result == 'q&a' ||
					result == '질문' || result == '질문게시판' || result == 'QnA게시판'){
				$("#result").append("<div id='userSay'>"+ result+" : user </div><br>"); 
				$("#result").append("<div id='chatBotSay'> chatbot : QnA게시판<br>페이지로 이동하겠습니다"+"</div><br>");
// 				$("#frm").attr("action", "${cp}/post/pagingList?searchType=a&cate_id=30013");
				window.opener.location.href="${cp}/post/pagingList?searchType=a&cate_id=30013";
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
			}else if(result == '홈' || result == '메인' || result =='메인화면' || result == '메인 화면' || result == '홈 화면' ||
					result == '홈화면' || result == '시작화면' || result == '시작 화면' || result == '처음' || result == '처음화면'){
				$("#result").append("<div id='userSay'>"+ result+" : user </div><br>"); 
				$("#result").append("<div id='chatBotSay'> chatbot : 메인화면<br>페이지로 이동하겠습니다"+"</div><br>");
// 				$("#frm").attr("action", "${cp}/main");
				window.opener.location.href="${cp}/main";
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
			}else if(result == ''){
				$("#result").append("<div id='chatBotSay1'> chatbot : 다시 입력해 주세요"+"</div><br>");
				$("#result").scrollTop($("#result")[0].scrollHeight);
				$("#user").val("");
				$("#user").focus();
			}else{
				$("#result").append("<div id='chatBotSay1'> chatbot : 다시 입력해 주세요"+"</div><br>");
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
		$('#chatONOff').attr('src','/image/chatOn.gif');
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
// 			document.getElementById('result').innerHTML = result;  
			
			//부모창 이동
// 			window.opener.location.href="action";	
			
			if(event.results[0].isFinal==true){
// 				annyang.abort();
				
				if(result == '매칭' || result == '요양보호사' || result == '요양보호사선택' || 
						result == '요양사' || result =='보호사'){
					$("#result").append("<div id='userSay'>"+ result+" : user </div><br>");
					$("#result").append("<div id='chatBotSay'> chatbot : 매칭<br>페이지로 이동하겠습니다"+"</div><br>");
// 					$("#frm").attr("action", "${cp}/matching/map");
					window.opener.location.href="${cp}/matching/map";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					$("#user").focus();
				}else if(result == '골드회원' || result == '등급변경' || result == '유료회원'){
					$("#result").append("<div id='userSay'>"+ result+" : user </div><br>"); 
					$("#result").append("<div id='chatBotSay'> chatbot : 골드회원서비스<br>페이지로 이동하겠습니다"+"</div><br>");
					$("#result").scrollTop($("#result")[0].scrollHeight);
					$("#user").focus();
				}else if(result == '내정보' || result == '회원정보' || result =='마이페이지'){
					$("#result").append("<div id='userSay'>"+ result+" : user </div><br>");
					$("#result").append("<div id='chatBotSay'> chatbot : 마이페이지<br>로 이동하겠습니다"+"</div><br>");
// 					$("#frm").attr("action", "${cp}/mypage/Patient_Info");
					window.opener.location.href="${cp}/mypage/Patient_Info";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					$("#user").focus();
				}else if(result == '무더위쉼터' || result == '더위' || result == '더위대피소' 
						|| result == '무더위' || result == '폭염' || result == '양로원'){
					$("#result").append("<div id='userSay'>"+ result+" : user </div><br>");
					$("#result").append("<div id='chatBotSay'> chatbot : 무더위쉼터<br>페이지로 이동하겠습니다"+"</div><br>"); 
// 					$("#frm").attr("action", "${cp}/shelter/pagingList?page=1&pageSize=10");
					window.opener.location.href="${cp}/shelter/pagingList?page=1&pageSize=10";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					$("#user").focus();
				}else if(result == '문화센터' || result == '강좌' || result =='강의' || 
						result == '교육' || result =='문화' || result =='수업'){
					$("#result").append("<div id='userSay'>"+ result+" : user </div><br>");
					$("#result").append("<div id='chatBotSay'> chatbot : 문화강좌정보<br>페이지로 이동하겠습니다"+"</div><br>");
// 					$("#frm").attr("action", "${cp}/lecture/lectureMain");
					window.opener.location.href="${cp}/lecture/lectureMain";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					$("#user").focus();
				}else if(result == '전국 행사 정보' || result == '전국 행사정보' || result == '전국행사 정보' || result == '전국행사정보' ||
						result == '문화정보' || result == '문화 정보' || result == '문화 게시판' || result == '문화게시판' || 
						result == '행사' | result == '행사 정보' || result == '축제' || result == '축제 정보' || result == '축제 게시판'){
					$("#result").append("<div id='userSay'>"+ result+" : user </div><br>");
					$("#result").append("<div id='chatBotSay'> chatbot : 전국행사정보<br>페이지로 이동하겠습니다"+"</div><br>");
// 					$("#frm").attr("action", "${cp}/post/ImageBoard2");
					window.opener.location.href="${cp}/post/ImageBoard2";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					$("#user").focus();
				}else if(result == '기부' || result == '기부 하기' || result == '도네이션' || result == '도내이션' ||
						result == '도네' || result == '도네'){
					$("#result").append("<div id='userSay'>"+ result+" : user </div><br>");
					$("#result").append("<div id='chatBotSay'> chatbot : 기부하기<br>페이지로 이동하겠습니다"+"</div><br>");
// 					$("#frm").attr("action", "${cp}/donation/memberDonation");
					window.opener.location.href="${cp}/donation/memberDonation";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					$("#user").focus();
				}else if(result == '메신저' || result == '메세지' || result == '쪽지' || result == 'thistolk' || 
						result == 'thistok' || result == 'THISTOLK' || result == 'THISTOK' || result == '디스톡'){
					$("#result").append("<div id='userSay'>"+ result+" : user </div><br>");
					$("#result").append("<div id='chatBotSay'> chatbot : thisTok"+"</div><br>");
// 					$("#frm").attr("action", "chat/thistok?mem_id=${mem_id}");
					window.opener.location.href="chat/thistok?mem_id=${mem_id}";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					$("#user").focus();
				}else if(result == '병원' || result == '요양원' || result == '요양병원' || result == '요양 병원'){
					$("#result").append("<div id='userSay'>"+ result+" : user </div><br>");
					$("#result").append("<div id='chatBotSay'> chatbot : 요양원/요양병원 찾기<br>페이지로 이동하겠습니다"+"</div><br>");
// 					$("#frm").attr("action", "${cp}/hospital/pagingList?page=1&pageSize=10");
					window.opener.location.href="${cp}/hospital/pagingList?page=1&pageSize=10";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					$("#user").focus();
				}else if(result == '간이테스트' || result == '간이 테스트' || result == '인지능력테스트' || result == '인지능력 테스트'){
					$("#result").append("<div id='userSay'>"+ result+" : user </div><br>");
					$("#result").append("<div id='chatBotSay'> chatbot : 인지능력테스트<br>페이지로 이동하겠습니다"+"</div><br>");
// 					$("#frm").attr("action", "${cp}/recognition/semiTestStart");
					window.opener.location.href="${cp}/recognition/semiTestStart";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					$("#user").focus();
				}else if(result == '인지능력향상' || result == '인지능력 향상' || result == '인지 능력 향상' || result == '치매' ||
						result == '치매검사' || result == '치매 검사' || result == '인지능력 향상 프로그램' || result == '인지능력향상프로그램' ||
						result == '인지능력향상 프로그램' || result == '인지 능력향상 프로그램' ){
					$("#result").append("<div id='userSay'>"+ result+" : user </div><br>");
					$("#result").append("<div id='chatBotSay'> chatbot : 인지능력향상프로그램<br>페이지로 이동하겠습니다"+"</div><br>");
// 					$("#frm").attr("action", "${cp}/recognitionImp/impStart");
					window.opener.location.href="${cp}/recognitionImp/impStart";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					$("#user").focus();
				}else if(result == '공지' || result == '공지 사항' || result == '공지사항게시판' || result == '공지사항 게시판'){
					$("#result").append("<div id='userSay'>"+ result+" : user </div><br>");
					$("#result").append("<div id='chatBotSay'> chatbot : 공지사항게시판<br>페이지로 이동하겠습니다"+"</div><br>");
// 					$("#frm").attr("action", "${cp}/post/pagingList?searchType=a&cate_id=30011");
					window.opener.location.href="${cp}/post/pagingList?searchType=a&cate_id=30011";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					$("#user").focus();
				}else if(result == '자유' || result == '자유 게시판' || result == '자유게시판'){
					$("#result").append("<div id='userSay'>"+ result+" : user </div><br>");
					$("#result").append("<div id='chatBotSay'> chatbot : 자유 게시판<br>페이지로 이동하겠습니다"+"</div><br>");
// 					$("#frm").attr("action", "${cp}/post/pagingList?searchType=a&cate_id=30012");
					window.opener.location.href="${cp}/post/pagingList?searchType=a&cate_id=30012";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					$("#user").focus();
				}else if(result == 'QnA' || result == 'Q&A' || result == 'qna' || result == 'q&a' ||
						result == '질문' || result == '질문게시판' || result == '질문 게시판'){
					$("#result").append("<div id='userSay'>"+ result+" : user </div><br>");
					$("#result").append("<div id='chatBotSay'> chatbot : Q&A 게시판<br>페이지로 이동하겠습니다 "+"</div><br>");
// 					$("#frm").attr("action", "${cp}/post/pagingList?searchType=a&cate_id=30013");
					window.opener.location.href="${cp}/post/pagingList?searchType=a&cate_id=30013";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					$("#user").focus();
				}else if(result == '홈' || result == '메인' || result =='메인화면' || result == '메인 화면' || result == '홈 화면' ||
						result == '홈화면' || result == '시작화면' || result == '시작 화면' || result == '처음' || result == '처음화면'){
					$("#result").append("<div id='userSay'>"+ result+" : user </div><br>");
					$("#result").append("<div id='chatBotSay'> chatbot : 메인화면<br>페이지로 이동하겠습니다"+"</div><br>");
// 					$("#frm").attr("action", "${cp}/main");
					window.opener.location.href="${cp}/main";
					$("#result").scrollTop($("#result")[0].scrollHeight);
					$("#user").focus();
				}else if(result == ''){
					$("#result").append("<div id='chatBotSay1'> chatbot : 다시 입력해 주세요"+"</div><br>");
					$("#result").scrollTop($("#result")[0].scrollHeight);
					$("#user").val("");
					$("#user").focus();
				}else{
					$("#result").append("<div id='chatBotSay1'> chatbot : 다시 입력해 주세요"+"</div><br>");
					$("#result").scrollTop($("#result")[0].scrollHeight);
					$("#user").val("");
					$("#user").focus();
				}
				
				annyang.abort();
				$('#chatONOff').attr('src','/image/chatOff.png');	
			}
			
			//부모창 닫기
// 			window.close();
			
		};
	}
	
	
</script>
	
	
</head>
<body>
<div style="margin: 0 auto;">

<img id="logo" alt="" src="/image/logosam2.png">

 <form id=frm action="${cp}/chatbot">
 <p style="font-size: 20px; margin: 5px;">이동하고 싶은 메뉴를 입력하세요</p>
 <div id = 'result'>
	<!-- 음성영역 -->
 </div>
 
 <div id="chatDiv" style=" margin-top: 10px;">
 <div id="comment" class="comment" style="text-align: center;">

</div>
 <input type="text" id="user" name="user" style="font-size: 15px;">
 <button type="button" class="btn" id="sendBtn" name="sendBtn">전송</button>
 <img id="chatONOff" src="/image/chatOff.png" onclick="start();">
<!-- <input type = "button" class="btn" value = "음성인식" id = "start" onclick="start();"/> -->
<!--  <input type = "submit" class="btn" value = "멈춤" id = "end"  onclick="end();"/><br/> -->
 </div>
 </form>
</div>
</body>
</html>
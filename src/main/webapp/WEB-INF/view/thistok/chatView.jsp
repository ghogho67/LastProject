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
         var printHTML = "<li class='chat'>";
         printHTML += "<li class='self'>";
         printHTML += "<div class='msg'>";
         printHTML += "<div class='user'>"+sessionName+"</div>";
         printHTML += "<p>"+message+"</p>";
         printHTML += "</div>";
         printHTML += "</li>";
         printHTML += "</li>";  
         
         $("#chatdata").append(printHTML);
         $("#chatdata").scrollTop($("#chatdata")[0].scrollHeight);
         
      } else{
         var printHTML = "<li class='chat' >";
         printHTML += "<li class='other'>";
         printHTML += "<div class='msg'>";
         printHTML += "<div class='user'>"+sessionName+"</div>";
         printHTML += "<p>"+message+"</p>";
         printHTML += "</div>";
         printHTML += "</li>";
         printHTML += "</li>"; 
         
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
   var userId = "${mem_id}";   //사용자 아이디를 파라미터로 받는다
   $("#userId").text(userId);
   initSocket();   //websocket 연결
   $(".msg").attr("tabindex", -1).focus();
   
   
   $("#delBtn").on("click", function(){
	   
	   $("#deledte").submit();
   });
   
});

function back(){
	window.open("http://192.168.0.32/chat/thistok?mem_id=${mem_id}", "thisTok!", "width=400, height=700, left=100, top=50");
}
</script>
</head>
<body>
<%@include file="/WEB-INF/view/common/ChatView.jsp"%>

   <img id="logo" alt="" src="/image/logosam2.png">
   <table class="container-fluid" style="width: 80%;">
      <tr>
         <td>
            <div class=chat-header style="width: 100%;">
               <h2 id="chat-header__name">ThisTok! (id: ${mem_id})</h2>
            </div>
            <div>
            
            
            
            
               <div class="chat" id="chatdata">
               
               <c:forEach items="${chatTextList }" var="chatText" varStatus="status">
              
               	<c:choose>
	               		<c:when test="${mem_id eq chatText.mem_id }">
	              		 <li class='chat'>
	              		  <li class='self'>
							         <div class='msg'>
								       	 <div class='user'>${mem_id }</div>
								         <p>${chatText.chattext_cont }</p>
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
                  <input class="btn" type="button" id="sendBtn" value="Send" />
                  <input class="btn" type="button" id="backBtn" value="Back" onclick="back()" />
                  <input class="btn" type="button" id="delBtn" value="Delete"/>
               </div>
              
              <form id="deledte" action="/chat/chatDelete"></form>
               
            



            </div>
         </td>
      </tr>
   </table>
   

   
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.fixalram {
	position: fixed;
	right: 45px;
	bottom: 79px;
	z-index: 1000;
	background: red;
	border-radius: 50%;
	width: 25px;
	height: 25px;
	display: none;
}

.display {
	display: block;
}

#alramCount {
	/* 	display: none; */
	
}

#alramCount {
	color: white;
	font-size: 7px;
	font-style: italic;
	text-align: center;
	margin-top: 3px;
}

#fixedbtn {
	position: fixed;
	right: 10px;
	bottom: 50px;
	z-index: 999
}


</style>
	<script type="text/javascript">

$(document).ready(function() {
	initSocket(); //websocket 연결
});

var socket;

function initSocket() {

   socket = new SockJS("/alram");
   
   socket.onopen = function(evt){
      onOpen(evt);
   }
   
   socket.onmessage = function(evt){
      onMessage(evt); 
   }
   
   socket.onclose = function(evt){
      onClose(evt);
   }
} 
   function onOpen(evt) {
         socket.send("${mem_id}"); 
   }
   
   function sendMessage(){      
   }
   //evt 파라미터는 websocket이 보내준 데이터다.
   function onMessage(evt){  //변수 안에 function자체를 넣음.
      
      var data = evt.data;
      console.log("data : " + data);
      
      if(data == "NEW"){
         console.log("if");
         $(".fixalram").addClass("display");   
      }
      else{
         console.log("else");
         $(".fixalram").removeClass("display");
      }
      
      var strArray = data.split('[');
       $('#alramCount').html(strArray[0]);
       console.log(strArray[0]);
       
         
   }
       
   function onClose(evt){

   } 
	
   function popup() {
	      //       window.open("http://192.168.0.32/chat/thistok?mem_id=${mem_id}",
	      //             "thisTok!", "width=400, height=700, left=100, top=50");
	      window.open("http://192.168.0.32/chat/thistok?mem_id=${mem_id}", "thisTok!",
	            "width=550, height=700, left=100, top=50");
	   }
	</script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form id="chatCnt" action="">

			<div class="fixalram">
				<p id="alramCount"></p>
				<input type="hidden" id="chatCounter">
			</div>
			<img src="/image/1419496.svg" style="width: 50px; height: auto;"
				id="fixedbtn" onclick="popup()">
		</form>
	</div>





</body>
</html>
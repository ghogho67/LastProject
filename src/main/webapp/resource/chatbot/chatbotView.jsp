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

#fixedbtn2 {
	position: fixed;
	right: 10px;
	bottom: 120px;
	z-index: 998
}



</style>



<script type="text/javascript">

function chatbotPopup() {
      window.open("/chatbot", "chatbot",
            "width=400, height=590, left=100, top=50");
   }
	
	
	</script>
</head>
<body class = "" id = "grid">

<div>

			<img src="/image/bot.svg" style="width: 50px; height: auto;" onclick="chatbotPopup()"
				id="fixedbtn2">

			
	</div>

</body>
</html>
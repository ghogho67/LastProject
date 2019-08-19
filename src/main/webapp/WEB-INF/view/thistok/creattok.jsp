<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${cp}/resource/wrap/css/ThisTok.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style type="text/css">
#logo{
	height: 70px;
	width: 200px;
}

body {
  font-family: 'Exo', "Open Sans";
  background: #e5e5e5;
}

 table {
    width: 100%;
    border-collapse: collapse;
    border-radius: 10em;
  }
  
    th, td {
    border-bottom: 2px solid #e5e5e5;
    padding: 10px;
  
  }
  
  
  #profileimg {
    width: 90px;
    height:90px;
    border-radius: 50px; /* 이미지 반크기만큼 반경을 잡기*/
} 

#chat{
	overflow:scroll;
	border-top: 1px solid #f6f6f6;
	height: 550px;
  width: 100%;
  background: #fff;
  border-radius: 20px;
  box-shadow: 10px 10px 15px 0 rgba(0, 0, 0, 0.3
  );
	-ms-overflow-style: none; 
	margin: 0 auto;
}
::-webkit-scrollbar {
	display:none;
}

.hidden{
display:none;
}

#myBtn{
  background: #4A8CF6;
  border: 0;
  color: #fff;
  cursor: pointer;
  display: inline-block;  
  font-size: 13px;
  height: 30px;
  line-height: 20px;
  min-width: 100px;
  text-align: center;
  margin-right: 5px;
  margin-left: 5px;
  border-radius: 20px;
}


.leftmargin{
	margin-left: 20px;
}

#backBtn{
	margin-left: 130px;
	margin-top: 20px;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#myBtn").on("click",function(){
		var data = $("#searchId").serialize();
		$.ajax({
			type: "GET",
			url : "${cp}/chat/searchId",
			data : data,
			success : function(data){
//	 			console.log(data);
				if(data.cm_id == 0){
					
					$("#idresult1").css("color", "red");
					$("#idresult1").html("기입하신 ID가 없습니다.");
					
				}else{
					$("#idresult1").css("color", "blue");
					$("#idresult1").html("ID가 있습니다.");
					
				}
								
			},
		error : function(xhr){
				alert(xhr.status);
		}
			
			
		});
	});
	
	
	$("#creatBtn").on("click",function(){
		
		$("#searchId").submit();
		
	});
	
});
function back(){
	window.open("http://192.168.0.32/chat/thistok?mem_id=${mem_id}", "thisTok!", "width=400, height=700, left=100, top=50");
}
//
</script>

</head>
<body>
	<br>
<!-- 	action="/chat/searchId" -->
	<form id="searchId" action="${cp}/chat/createChat" method="POST">
		<div class="leftmargin" >
			<p>대상자 아이디 :</p><input type="text" name="chatmem_id"><button id="myBtn" type="button">대상자확인</button>
			<p id="idresult1" class="idpw-txt">채팅을 같이 하실 회원의 아이디를 입력하세요</p>
			<p>채팅방 이름 :</p><input type="text" name="chat_nm">
			
			<button id="creatBtn" type="button">채팅방 개설</button>
		</div>
	</form>
		
		<div>
			 <input class="btn" type="button" id="backBtn" value="Back" onclick="back()" />
		</div>
		
			
	
</body>
</html>
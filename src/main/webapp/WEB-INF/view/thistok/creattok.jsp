<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


</style>
<script type="text/javascript">
$("#myBtn").on("click",function(){
	var data = $("#searchId").serialize();
	console.log(data);
	$.ajax({
		type: "GET",
		url : "${cp}/chat/searchId",
		data : data,
		success : function(data){
			console.log(data);
			if(data.mem_id == null){
				$("#idLabel").css("color", "red");
				$("#idLabel").html("기입하신 ID가 없습니다.");
				
			}else{
				$("#idLabel").css("color", "blue");
				$("#idLabel").html("ID가 있습니다.");
				
			}
							
		},
	error : function(xhr){
			alert(xhr.status);
	}
		
		
	});
});
//
</script>

</head>
<body>
	<br>
	<form id="searchId" action="">
		<div class="leftmargin" >
			<p>대상자 아이디 :</p><input type="text" name="chatmem_id" value=""><button id="myBtn">대상자확인</button>
			<label id="idLabel"></label>
			<p>채팅방 이름 :</p><input type="text" name="chat_nm" value="">
			
			<button id="creatBtn">채팅방 개설</button>
		</div>
		
			
	</form>
</body>
</html>
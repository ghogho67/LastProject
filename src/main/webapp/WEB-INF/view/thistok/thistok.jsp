<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
  float:right;
  margin-top: 40px;
  margin-right: 5px;
  border-radius: 20px;
}

#chatTime{
	font-size: 3px;
}

.alaramImg{
	width: 80px;
	height: 80px;
}
</style>


<script type="text/javascript">
$(document).ready(function(){
	$(".detailTr").on("click",function(){
		console.log("detailTr");
		window.open("", "thisTok!", "width=400, height=700, left=100, top=50"); 
		
		var chat_id = $(this).find(".hidden").text();
		
		$("#chat_id").val(chat_id);
		
		$("#for").submit();
	});
	
	$("#myBtn").on("click",function(){
		$("#createChat").submit();
	});
	
	
});
//
</script>

</head>
<body>
   	
	 <img id="logo" alt="" src="/image/logosam2.png">
	 <button id="myBtn" type="submit" >CreateChat</button>
	 <form id="for" action="/socket/view" method="post">
		<div id="chat">
		   <table>
				<c:forEach items="${chatList }" var="chat" varStatus="status">
					<c:if test="${chat.chat_del eq 'N' }">
					<tr class="detailTr">
						<th><img id="profileimg" src="${cp }/chat/tokProfileView?mem_id=${chat.mem_id}"></th>
						<th class="hidden">${chat.chat_id}</th>
						<c:choose>
							<c:when test="${chat.newmsgyn eq 'Y'}">	
								<th><img class="alaramImg" alt="" src="/image/alaram.gif"></th>
								<th>[${chat.mem_id }]<br>${chat.chat_nm }</th>
							</c:when>
							<c:otherwise>
								<th><img class="alaramImg" alt="" src="/image/alaramNo.jpg"></th>
								<th>${chat.mem_id }<br>${chat.chat_nm }</th>
							</c:otherwise>
						</c:choose>
						<th id="chatTime"><fmt:formatDate value="${chat.chat_dt }" pattern="yyyy-MM-dd"/></th>
					</tr>
					</c:if>
				</c:forEach>
		   </table>
		</div>
		<input type="hidden" name="mem_id" value="${mem_id}">
		<input type="hidden" id="chat_id" name="chat_id">
	</form>
	
	
	
		
		
	<form id="createChat" action="/chat/createChatView" method="get">
	</form>
	
	  

</body>
</html>
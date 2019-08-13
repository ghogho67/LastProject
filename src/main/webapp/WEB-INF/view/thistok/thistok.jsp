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
});

</script>

</head>
<body>
   	<form id="for" action="http://192.168.0.32/socket/view" method="post">
	 <img id="logo" alt="" src="/image/logosam2.png">
	 
		<div id="chat">
		   <table>
				<c:forEach items="${chatList }" var="chat" varStatus="status">
					<tr class="detailTr">
						<th><img id="profileimg" src="${cp }/chat/tokProfileView?mem_id=${chat.mem_id}"></th>
						<th class="hidden">${chat.chat_id}</th>				
						<th>${chat.mem_id }<br>${chat.chat_nm }</th>
						<th><fmt:formatDate value="${chat.chat_dt }" pattern="yyyy-MM-dd HH:mm:ss"/></th>
					</tr>
				</c:forEach>
		   </table>
		</div>
		<input type="hidden" name="mem_id" value="${mem_id}">
		<input type="hidden" id="chat_id" name="chat_id" value="">
  		
	</form>
	  

</body>
</html>
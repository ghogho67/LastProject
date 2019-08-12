<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

$(document).ready(function(){
	$("#submitBtn").on(click,function(){
		window.open("", "thisTok!", "width=400, height=700, left=100, top=50"); 
		$("#for").submit();
	});
});


</script>


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
  }


</style>
</head>
<body>
	 <img id="logo" alt="" src="/image/logosam2.png">
	   <table>
			<c:forEach items="${chatList }" var="chat" varStatus="status">
				<tr>
					<th><img id="profileimg" src="${cp }/TokProfileView?mem_id=${chat.mem_id}"></th>
						<%-- <div class="form-group">
									<label for="userNm" class="col-sm-2 control-label">사용자이미지</label>
									<div class="col-sm-10">
										
									</div>
								</div> --%>
					<th>${chat.mem_id }<br>${chat.chat_nm }</th>
					<th><fmt:formatDate value="${chat.chat_dt }" pattern="yyyy-MM-dd HH:mm:ss"/></th>
				</tr>
			</c:forEach>
			
			
	   </table>
	   <form id="for" action="http://192.168.0.32/socket/view" method="post">
	      <button id="submitBtn" type="submit">테스트전송</button>
	      <input name="mem_id"  type="hidden" value="${mem_id }">
   	  </form>

</body>
</html>
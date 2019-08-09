<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body>
	   <table>
			<tr>
				<td></td>
			</tr>
			
	   </table>
	   <form id="for" action="http://192.168.0.32/socket/view" method="post">
	      <button id="submitBtn" type="submit">테스트전송</button>
	      <input name="mem_id"  type="hidden" value="${mem_id }">
   	  </form>

</body>
</html>
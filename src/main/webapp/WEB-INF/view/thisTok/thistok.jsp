<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function showPopup() { 
	window.open("http://192.168.0.32/socket/view", "a", "width=400, height=700, left=100, top=50"); 
// 	action="http://192.168.0.32/socket/view"
}
</script>
</head>
<body>
	
	   <form>
	      <button onclick="showPopup();"  type="button">테스트전송</button>
	      <input name="mem_id"  type="hidden" value="${mem_id }">
   	  </form>

</body>
</html>
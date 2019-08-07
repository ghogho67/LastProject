<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function showPopup() { 
	window.open("/socket/view", "ThisTok!", "width=400, height=700, left=100, top=50"); 
}
</script>
</head>
<body>
	
	<input type="button" value="팝업창 호출" onclick="showPopup();" />

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

$(document).ready(function(){
    $("#checkBoxId").change(function(){
        if($("#checkBoxId").is(":checked")){
            alert("체크박스 체크했음!");
        }else{
            alert("체크박스 체크 해제!");
        }
    });
});
</script>


</head>
<body>

</body>
</html>
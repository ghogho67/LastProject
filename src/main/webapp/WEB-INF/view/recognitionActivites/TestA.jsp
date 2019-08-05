<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function ajaxExample(){
    // 사용자 ID를 갖고 온다.
    var userId = $("#userId").val();
 
    // name이 같은 체크박스의 값들을 배열에 담는다.
    var checkboxValues = [];
    $("input[name='hobby']:checked").each(function(i) {
        checkboxValues.push($(this).val());
    });
     
    // 사용자 ID(문자열)와 체크박스 값들(배열)을 name/value 형태로 담는다.
    var allData = { "userId": userId, "checkArray": checkboxValues };
     
    $.ajax({
        url:"goUrl.do",
        type:'GET',
        data: allData,
        success:function(data){
            alert("완료!");
            window.opener.location.reload();
            self.close();
        },
        error:function(jqXHR, textStatus, errorThrown){
            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
            self.close();
        }
    });
}
</script>




</head>
<body>



<div>보람이는 운동을 하고 싶어 합니다 </div>


 다음중 보람이가 고를 활동은
<input type="hidden" id="userId" value="전화하기">
<input type="checkbox" name="hobby" value="독서하기">
<input type="checkbox" name="hobby" value="사과깍기">
<input type="checkbox" name="hobby" value="축구">








</body>
</html>
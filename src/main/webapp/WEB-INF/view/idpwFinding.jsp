<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
<%@include file="/WEB-INF/view/common/joinCare.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$("#idBtn").on("click",function(){
		var data = $("#idSearch").serialize();
		console.log(data);
		$.ajax({
			type: "POST",
			url : "${cp}/find/idFind",
			data : data,
			success : function(data){
				console.log(data);
				if(data.mem_id == null){
					$("#idresult1").css("color", "red");
					$("#idresult1").html("회원님이 기입하신 정보가 일치하지 않습니다.");
					
				}else{
					$("#idresult1").css("color", "blue");
					$("#idresult1").html("회원님의 아이디는"+ data.mem_id +"입니다.");
					
				}
								
			},
		error : function(xhr){
// 			alert(xhr.status);
			$("#idresult1").css("color", "red");
			$("#idresult1").html("회원님이 기입하신 정보가 일치하지 않습니다.");
			
		}
			
			
		});
	});
	
	var data = $("#passSend").serialize();
	$("#passBtn").on("click",function(){
		var data = $("#passSend").serialize();
		console.log(data);
		$.ajax({
			type: "POST",
			url : "${cp}/find/passFind",
			data : data,
			success : function(data){
				console.log(data);
				if(data.a == null){
					$("#idresult2").css("color", "blue");
					$("#idresult2").html("임시비밀번호가 메일로 발송됬습니다.");
				}else{
					$("#idresult2").css("color", "red");	
					$("#idresult2").html(data.a);
				}
			},
		error : function(xhr){
// 			alert(xhr.status);
			$("#idresult2").css("color", "red");	
			$("#idresult2").html("회원님이 기입하신 정보가 일치하지 않습니다.");
			
		}
			
			
		});
	});
});
</script>

</head>
<body>



<br>
<a href="${cp }/login" style="font-size: 25px; color: black; font-weight: 800;" >&nbsp;&nbsp; &nbsp;HOME</a>

<div id="template-idpw-find" class="ng-scope">
  <section id="contents" class="login-idpwfind-contents">
    <section id="login-idpwfind" class="login-idpwfind">
      <div class="login-idpwfind-in">
        <h4 class="login-idpwfind-title">아이디/비밀번호 찾기</h4>
       
        <ul>
       	
            <li class="form-inline">
            <h4 class="idpw-title id-title">아이디찾기</h4>
            <form id="idSearch" action="/find/idFind" method="post">
	            <p class="mt20">
	              <input type="text" name="mem_mail" maxlength="20" size="30"  value="" class="form-control ng-pristine ng-untouched ng-valid ng-empty ng-valid-maxlength" placeholder="회원 이메일 입력">
	            </p>
	             <p class="mt20">
	              <input type="text" name="mem_nm" maxlength="20" size="30"  value="" class="form-control ng-pristine ng-untouched ng-valid ng-empty ng-valid-maxlength" placeholder="회원 이름 입력">
	            </p>
          	</form>
            	
            		<p id="idresult1" class="idpw-txt"></p>
           
            <div class="find-btn-div">
              <button id="idBtn" type="button" class="hp-btn" ng-click="hpAuthCheck('pw');">본인인증 확인</button>
            </div>
          </li>
        
          
          <li class="form-inline">
            <h4 class="idpw-title pw-title">비밀번호찾기</h4>
	            <form id="passSend" action="/find/idFind" method="post">
		            <p class="mt20">
		              <input type="text" name="mem_id" maxlength="20" size="30" value="" class="form-control ng-pristine ng-untouched ng-valid ng-empty ng-valid-maxlength" placeholder="회원 아이디 입력">
		            </p>
		             <p class="mt20">
		              <input type="text" name="mem_mail" maxlength="20" size="30"  value="" class="form-control ng-pristine ng-untouched ng-valid ng-empty ng-valid-maxlength" placeholder="회원 이메일 입력">
		            </p>
	            </form>
	            <p id="idresult2" class="idpw-txt"></p>
            <div class="find-btn-div">
              <button id="passBtn" type="button" class="hp-btn">임시비밀번호발송</button>
                  <p class="idpw-txt">이메일로 임시 비밀번호가 발송됩니다.</p>
            </div>
          </li>
        </ul>
        <p class="idpw-txt dot">
          아이디/비밀번호 찾기가 진행되지 않을 경우
          <a href="doadoa88@naver.com">doadoa88@naver.com</a>로 메일  주시기 바랍니다.
        </p>
      </div>
    </section>

  </section>
  <!-- contents 종료 -->

  
</div>



</body>
</html>
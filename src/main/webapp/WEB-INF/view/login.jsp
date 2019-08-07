<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${cp}/resource/wrap/css/login/default.css" />
<link rel="stylesheet" type="text/css"
	href="${cp}/resource/wrap/css/login/member.css" />
<link rel="stylesheet" type="text/css"
	href="${cp}/resource/wrap/css/login/style.css" />
<style type="text/css">

#img{
	width: 400px;
	height: 300px;
}

/* .lk{ */
/* margin: 10px 10px 10px 0; */
/* height: 300px; */
/* width: 100%; */
/* } */


.lk{
margin: 30px 10px 10px 0;
height: 300px;
width: 100%;
}


</style>

<script type="text/javascript">

</script>

</head>
<body>

<br>
<br>



	<form id="frmSignin" name="frmSignin" role="form" class="form-signin"
		action="/login" method="post">
		<input type="hidden" id="status" name="status" value="">
		<div id="login">
		
		
<div class="lk" style="background-image: url('/image/tes6.png');  
background-position:center; background-size: 280px; background-repeat: no-repeat;">
			</div> 


			<ul>
				<li><input type="text" name="mem_id" id="mem_id"
					placeholder="아이디" value="dkskqk00" tabindex="1"><a href="#a"><img
						src="/img/mypage/btn_del.png" alt="삭제"></a></li>
				<li><input type="password" name="mem_pass" id="mem_pass"
					placeholder="비밀번호" value="dkskqk00" tabindex="2"></li>
				<li><p style="color:red">${fail}</p></li>
				<li class="log">
				<button class="btn type1" id="btnLogin"
					tabindex="3">로그인</button></li>
				<li class="log">
				<a class="btn type6" href="/regist/regist1" tabindex="3">회원가입</a></li>
					
			</ul>
			<br>
			
			<div class="both">
				<div>
					<input type="checkbox" value="remember"
						name="remember"><label for="chk1">아이디
						저장</label>
				</div>
				<div style="padding-right: 5px;">
					<a id="passwordSerch" style="cursor: pointer;" href="/find/idpwFind">
					<span style="color: #4ea5fc;">비밀번호/아이디재설정</span></a>
				</div>
			</div>
		<div class="info"> 
<!-- 				<p>	언제나 내 부모처럼 모시겠습니다<br> -->
			
<!-- 	고객센터 -->
<!-- 					평일 09:00 ~ 18:00<br>(점심시간 12:30 ~ 13:30) -->
<!-- 				</p> -->
<br>
 			</div> 
		</div>
		
	</form>
	
	<br>
	<br>
	<br>
	<br>
	<br>

</body>
</html>
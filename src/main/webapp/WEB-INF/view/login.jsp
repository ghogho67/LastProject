<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>This Care</title>

<link rel="shortcut icon" href="${cp}/image/Htes3.png">

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
height: 200px;
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
		
		
<div class="lk" style="background-image: url('/image/logosam.png');  
background-position:center; background-size: 200px; background-repeat: no-repeat;">
			</div> 


			<ul>
				<li><input type="text" name="mem_id" id="mem_id"
					placeholder="아이디" value="sona" tabindex="1"><a href="#a"><img
						src="/img/mypage/btn_del.png" alt="삭제"></a></li>
				<li><input type="password" name="mem_pass" id="mem_pass"
					placeholder="비밀번호" value="1234" tabindex="2"></li>
				<li><p style="color:red">${fail}</p></li>
				<li class="log">
				<button class="btn type1" id="btnLogin"
					tabindex="3">로그인</button></li>
					
			</ul>
			<br>
			
			<div class="both">
				<div>
					<a style="cursor: pointer;"  href="/regist/regist1"">
					<span>회원가입</span></a>
				</div>
				<div style="padding-right: 5px;">
					<a id="passwordSerch" style="cursor: pointer;" href="/find/idpwFind">
					<span style="color: #4ea5fc;">비밀번호/아이디재설정</span></a>
				</div>
			</div>
		<div class="info"> 
		
		<a class="btn type12" 
 href="/donation/nonmemberDonation" tabindex="3"> <img src="/image/donation.png" style="width: 50px;"/>기부하기</a>
		

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
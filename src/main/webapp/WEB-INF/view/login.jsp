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
</style>

</head>
<body>

	<form id="frmSignin" name="frmSignin" role="form" class="form-signin"
		action="/login" method="post">
		<input type="hidden" id="status" name="status" value="">
		<div id="login">
			<h2>
				환영합니다.
			</h2>
			<ul>
				<li><input type="text" autofocus="" name="mem_id" id="mem_id"
					placeholder="아이디" value="anni" tabindex="1"><a href="#a"><img
						src="/img/mypage/btn_del.png" alt="삭제"></a></li>
				<li><input type="password" name="mem_pass" id="mem_pass"
					placeholder="비밀번호" value="1234" tabindex="2"></li>
				<li class="log"><button class="btn type1" id="btnLogin"
					tabindex="3">로그인</button></li>
			</ul>
			<div class="both">
				<div>
					<input type="checkbox" value="remember"
						name="remember"><label for="chk1">아이디
						저장</label>
				</div>
				<div style="padding-right: 5px;">
					<a href="/regist/regist1">회원가입</a> <br>
					<a id="passwordSerch"
					style="cursor: pointer;" href="/find/idpwFind"> <span style="color: #4ea5fc;">비밀번호/아이디재설정</span></a>
				</div>
			</div>
			<div class="info">
			
				<p>			언제나 내 부모처럼 모시겠습니다<br>
			
	고객센터
					평일 09:00 ~ 18:00<br>(점심시간 12:30 ~ 13:30)
				</p>
			</div>
		</div>
		
	</form>

</body>
</html>
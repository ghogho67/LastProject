<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>



<style>


@import "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.7.2/css/all.min.css";
@import "https://fonts.googleapis.com/css?family=Open+Sans:400,600|Raleway";
@import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);

* {
  margin:0px;
  padding:0px;
  box-sizing:border-box;
  font-family: 'NanumGothic', '나눔고딕','NanumGothicWeb', '맑은 고딕', 'Malgun Gothic', Dotum;
}

body {
  background:white;
}
.login-form {
  position:absolute;
  top:45%;
  left:50%;
  transform:translate(-50%,-50%);
  width:550px;
  height:550px;
  background:#f5f5f5;
  overflow:hidden;
  box-shadow:10px 6px 10px #555;
}

.login-form:before,.login-form:after {
  content:"";
  position:absolute;
  top:0px;
  width:150%;
  height:150px;
} 

/* .login-form:before { */
/*   background:#375fbb; */
/*   height:180px; */
/*   transform: translate(-80px,-100px) rotate(-28deg); */
/* } */
/* .login-form:after { */
/*   background:rgba(0,0,0,0.38); */
/*   transform: translate(0px,-55px) rotate(20deg); */
/*   z-index:2; */
/* } */

.form-container {
  margin-top:80px;
  height:calc(100% - 180px);
  padding:0px 40px;
  text-align:center;
}
.form-container .form-element {
  position:relative;
  margin:15px 0px;
}

.form-container .form-heading {
  margin-bottom:30px;
  font-size:32px;
  font-weight:600;
  color:#375fbb;
  font-family:"Open Sans","Raleway",sans-serif;  
}
.form-container .form-element input {
  width:100%;
  font-size:18px;
  padding:12px;
  text-indent:50px;
  background:#ddd;
  border:none;
  outline:none;
}
.form-container .form-element label {
  position:absolute;
  top:50%;
  left:15px;
  transform:translateY(-50%);
  color:#888;
}
.form-container .form-element label:after {
  content:"";
  position:absolute;
  top:-5px;
  left:30px;
  width:2px;
  height:25px;
  background:#aaa;
 }

.form-container .form-element button {
  width:100%;
  padding:12px;
  font-size:18px;
  border:none;
  outline:none;
  background:#0fb1f7;
  color:#f5f5f5;
  cursor:pointer;
  text-transform:uppercase;
  font-family:"Open Sans","Raleway",sans-serif;
  font-weight:600;  
}

.form-container .form-element a {
  color:gray;
  font-weight:600;
  font-size:15px;
  font-family:"Open Sans","Raleway",sans-serif;
  text-decoration:none;
}
.form-container .form-element.signup-link {
  position:absolute;
  width:calc(100% - 80px);
  bottom:5px;
}

</style>

<meta charset="UTF-8">
<title>로그인</title>
<body>


<div class="login-form">
  <div class="form-container">
    <div class="form-heading">
      Login
    </div>
    <br>
    <div class="form-element">
      <label class="fa fa-user" for="login-username"></label>
      <input type="text" placeholder="Username" id="login-username"/> 
    </div>
    <div class="form-element">
      <label class="fa fa-lock" for="login-password"></label>
      <input type="password" placeholder="Password" id="login-password"/> 
    </div> 
    <div class="form-element">
      <button id="login-submit">Login</button>
    </div>   
    <br>
    <div class="form-element login-forgot-password">
      <a href="${cp}/basicU/main">아이디/비밀번호 찾기</a>  <span>|</span>  <a href="#">회원가입</a>
    </div>

  </div>

</div>

</body>
</html>
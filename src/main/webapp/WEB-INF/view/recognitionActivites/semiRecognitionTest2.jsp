<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@include file="/WEB-INF/view/common/joinCare.jsp"%>

<style>
.container {
	background-color: #eee;
	width: 1005px;
	margin: 30px auto;
	height: 600px;
	display: grid;
	grid-template-rows: repeat(2, 2fr);
	grid-template-columns: repeat(3, 1fr);
}

.item {
	font-size: 30px;
	padding: 20px;
	color: #fff;
	font-family: sans-serif;
}

.item1 {
	background-color: gray;
}

.item2 {
	background-color: yellowgreen;
}

.item3 {
	background-color: blueviolet;
}

.item4 {
	background-color: palevioletred;
}

.item5 {
	background-color: royalblue;
}

.item6 {
	background-color: tomato;
}

.end-div {
	text-align: center;
	height: 70px;
	background-color: #f6f6f6;
	padding: 5px 0px;
	border-radius: 5px
}

.end-txt1 {
	font-family: 'NanumSquare', gulim;
	font-size: 50px;
	font-weight: 700;
	color: #3b3b3b;
}


























#navi {
  width: 300px;
  background: rgba(0, 0, 0, 0.9);
  height: 100vh;
  position: absolute;
  left: -300px;
  top: 0;
  z-index: 9;
  transition: 0.4s;
  &.open {
    left: 0;
  }
}

#choice-login {
  background: red;
  width: 50vw;
  height: 100vh;
  position: absolute;
  left: 0;
  top: 0;
  z-index: 3;
  transition: 0.4s;
}
#choice-register {
  background: blue;
  width: 50vw;
  height: 100vh;
  position: absolute;
  right: 0;
  top: 0;
  z-index: 3;
  transition: 0.4s;
}
#login {
  background: orange;
  width: 50vw;
  height: 100vh;
  position: absolute;
  left: 0;
  top: 0;
  z-index: 2;
}
#register {
  background: pink;
  width: 50vw;
  height: 100vh;
  position: absolute;
  right: 0;
  top: 0;
  z-index: 2;
  transition: 0.4s;
}
#left-bg {
  background: cornflowerblue;
  width: 50vw;
  height: 100vh;
  position: absolute;
  left: 0;
  top: 0;
  z-index: 1;
  background-image: url("http://i1.adis.ws/i/petsathome/breed-shiba-inu-2.jpg?qlt=75");
  background-repeat: no-repeat;
  background-size: cover;
}
#right-bg {
  background: purple;
  width: 50vw;
  height: 100vh;
  position: absolute;
  right: 0;
  top: 0;
  z-index: 1;
  background-image: url("http://i1.adis.ws/i/petsathome/breed-shiba-inu-2.jpg?qlt=75");
  background-repeat: no-repeat;
  background-size: cover;
}

button {
  padding: 8px 16px;
  font-size: 22px;
  border: none;
  color: #444;
  border-radius: 8px;
  transform: translate(50%, -50%);
  position: absolute;
  top: 50%;
  right: 50%;
  cursor: pointer;
  &:hover {
    background: black;
    color: white;
  }
  &.reset {
    top: 16px;
    right: 16px;
    transform: translate(0, 0);
  }
}

span.menu {
  position: absolute;
  left: 150%;
  top: 7px;
  font-size: 22px;
  font-family: "Comfortaa", cursive, sans-serif;
  letter-spacing: 1px;
  color: #fafafa;
}

.burger-sauce {
  position: absolute;
  top: 16px;
  left: 16px;

  width: 130px;
  height: 40px;
  z-index: 10;
}

.burger-sauce input {
  display: none;
}

.burger-sauce label {
  position: relative;
  width: 40px;
  height: 40px;
  display: block;
  cursor: pointer;
  background: transparent;
}

/* Exit Icon */

.burger-sauce label:before,
.burger-sauce input:checked + label:before {
  content: "";
  position: absolute;
  top: 50%;
  margin-top: -2px;
  width: 40px;
  height: 4px;
  border-radius: 2px;
  background: #fafafa;
}

.burger-sauce label:before {
  -webkit-animation: animationOneReverse 1s ease forwards;
  animation: animationOneReverse 1s ease forwards;
}

@-webkit-keyframes animationOneReverse {
  0% {
    -webkit-transform: rotate(315deg);
  }
  25% {
    -webkit-transform: rotate(360deg);
  }
  50%,
  100% {
    -webkit-transform: rotate(0deg);
  }
}
@keyframes animationOneReverse {
  0% {
    transform: rotate(315deg);
  }
  25% {
    transform: rotate(360deg);
  }
  50%,
  100% {
    transform: rotate(0deg);
  }
}

.burger-sauce input:checked + label:before {
  -webkit-animation: animationOne 1s ease forwards;
  animation: animationOne 1s ease forwards;
}

@-webkit-keyframes animationOne {
  0%,
  50% {
    -webkit-transform: rotate(0deg);
  }
  75% {
    -webkit-transform: rotate(360deg);
  }
  100% {
    -webkit-transform: rotate(315deg);
  }
}
@keyframes animationOne {
  0%,
  50% {
    transform: rotate(0deg);
  }
  75% {
    transform: rotate(360deg);
  }
  100% {
    transform: rotate(315deg);
  }
}

.burger-sauce label:after,
.burger-sauce input:checked + label:after {
  content: "";
  position: absolute;
  top: 50%;
  margin-top: -2px;
  width: 40px;
  height: 4px;
  border-radius: 2px;
  background: #fafafa;
}

.burger-sauce label:after {
  -webkit-animation: animationTwoReverse 1s ease forwards;
  animation: animationTwoReverse 1s ease forwards;
}

@-webkit-keyframes animationTwoReverse {
  0% {
    -webkit-transform: rotate(405deg);
  }
  25% {
    -webkit-transform: rotate(450deg);
  }
  50%,
  100% {
    -webkit-transform: rotate(0deg);
  }
}
@keyframes animationTwoReverse {
  0% {
    transform: rotate(405deg);
  }
  25% {
    transform: rotate(450deg);
  }
  50%,
  100% {
    transform: rotate(0deg);
  }
}

.burger-sauce input:checked + label:after {
  -webkit-animation: animationTwo 1s ease forwards;
  animation: animationTwo 1s ease forwards;
}

@-webkit-keyframes animationTwo {
  0%,
  50% {
    -webkit-transform: rotate(0deg);
  }
  75% {
    -webkit-transform: rotate(450deg);
  }
  100% {
    -webkit-transform: rotate(405deg);
  }
}
@keyframes animationTwo {
  0%,
  50% {
    transform: rotate(0deg);
  }
  75% {
    transform: rotate(450deg);
  }
  100% {
    transform: rotate(405deg);
  }
}

/* Burger Icon */

.burger-sauce label .burger:before {
  content: "";
  position: absolute;
  top: 6px;
  width: 40px;
  height: 4px;
  border-radius: 2px;
  background: #fafafa;
  -webkit-animation: animationBurgerTopReverse 1s ease forwards;
  animation: animationBurgerTopReverse 1s ease forwards;
}

@-webkit-keyframes animationBurgerTopReverse {
  0%,
  50% {
    -webkit-transform: translateY(12px);
    opacity: 0;
  }
  51% {
    -webkit-transform: translateY(12px);
    opacity: 1;
  }
  100% {
    -webkit-transform: translateY(0px);
    opacity: 1;
  }
}
@keyframes animationBurgerTopReverse {
  0%,
  50% {
    transform: translateY(12px);
    opacity: 0;
  }
  51% {
    transform: translateY(12px);
    opacity: 1;
  }
  100% {
    transform: translateY(0px);
    opacity: 1;
  }
}

.burger-sauce input:checked + label .burger:before {
  -webkit-animation: animationBurgerTop 1s ease forwards;
  animation: animationBurgerTop 1s ease forwards;
}

@-webkit-keyframes animationBurgerTop {
  0% {
    -webkit-transform: translateY(0px);
    opacity: 1;
  }
  50% {
    -webkit-transform: translateY(12px);
    opacity: 1;
  }
  51%,
  100% {
    -webkit-transform: translateY(12px);
    opacity: 0;
  }
}
@keyframes animationBurgerTop {
  0% {
    transform: translateY(0px);
    opacity: 1;
  }
  50% {
    transform: translateY(12px);
    opacity: 1;
  }
  51%,
  100% {
    transform: translateY(12px);
    opacity: 0;
  }
}

.burger-sauce label .burger:after {
  content: "";
  position: absolute;
  bottom: 6px;
  width: 40px;
  height: 4px;
  border-radius: 2px;
  background: #fafafa;
  -webkit-animation: animationBurgerBottomReverse 1s ease forwards;
  animation: animationBurgerBottomReverse 1s ease forwards;
}

@-webkit-keyframes animationBurgerBottomReverse {
  0%,
  50% {
    -webkit-transform: translateY(-12px);
    opacity: 0;
  }
  51% {
    -webkit-transform: translateY(-12px);
    opacity: 1;
  }
  100% {
    -webkit-transform: translateY(0px);
    opacity: 1;
  }
}
@keyframes animationBurgerBottomReverse {
  0%,
  50% {
    transform: translateY(-12px);
    opacity: 0;
  }
  51% {
    transform: translateY(-12px);
    opacity: 1;
  }
  100% {
    transform: translateY(0px);
    opacity: 1;
  }
}

.burger-sauce input:checked + label .burger:after {
  -webkit-animation: animationBurgerBottom 1s ease forwards;
  animation: animationBurgerBottom 1s ease forwards;
}

@-webkit-keyframes animationBurgerBottom {
  0% {
    -webkit-transform: translateY(0px);
    opacity: 1;
  }
  50% {
    -webkit-transform: translateY(-12px);
    opacity: 1;
  }
  51%,
  100% {
    -webkit-transform: translateY(-12px);
    opacity: 0;
  }
}
@keyframes animationBurgerBottom {
  0% {
    transform: translateY(0px);
    opacity: 1;
  }
  50% {
    transform: translateY(-12px);
    opacity: 1;
  }
  51%,
  100% {
    transform: translateY(-12px);
    opacity: 0;
  }
}



</style>



</head>
<body>



	<div>


		<div class="memberkind-in">
			<div class="end-div">
				<p class="end-txt1">1. 보라색을 고르세요</p>
			</div>
		</div>




		<div class="container">
		<div class="wrapper">
  <div class="burger-sauce" id="nav-butt">
  <input id="click" name="exit" type="checkbox" />
  <label for="click"><span class="burger"></span></label>		
</div>
  <div id="navi" class="closed"></div>
  <div id="left">
    <div id="choice-login">
      <button>Login</button>
    </div>
    <div id="login">
      <button>This is a login form</button>
      <button class="reset">X</button>
    </div>
    <div id="left-bg">
    </div>
  </div>
    <div id="right">
    <div id="choice-register">
            <button>Register</button>
    </div>
          <div id="register">
          <button>This is a registration form</button>
                  <button class="reset">X</button>
    </div>
          <div id="right-bg">
    </div>
  </div>
</div>
		</div>

	</div>


</body>
</html>
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
	height: 500px;
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
</style>



</head>
<body>



	<section class="memberjoin">
		<div class="memberjoin-in">
			<h4 class="memberjoin-title ng-binding">회원가입(일반회원)</h4>
			<ul>
				<li class="memberjoin01 ">01.가입종류선택</li>
				<li class="right-arrow"></li>
				<li class="memberjoin02 ">02.약관동의</li>
				<li class="right-arrow"></li>
				<li class="memberjoin03 ">03.정보입력</li>
				<li class="right-arrow"></li>
				<li class="memberjoin04 active">04.가입완료</li>
			</ul>
		</div>

	</section>



	<div class="memberkind-in">
		<div class="end-div">
			<p class="end-txt1">
			<h2>보다나은 서비스 제공을 위해 인지능력 테스트를 진행합니다</h2>
			</p>
		</div>
	</div>



	<br>
	<br>
	<br>
	<br>
	<div class="container">


					

	</div>




</body>
</html>
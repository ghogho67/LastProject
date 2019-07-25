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
			<div class="item item1">1: 회색</div>
			<div class="item item2">2: 초록색</div>
			<div class="item item3">3: 보라색</div>
			<div class="item item4">4: 분홍색</div>
			<div class="item item5">5: 파란색</div>
			<div class="item item6">6: 주황색</div>
		</div>

	</div>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<style type="text/css">
#titlee h2, #pzone h2 {
	font-size: 40px;
	font-weight: normal;
	letter-spacing: -1px;
}

#titlee h2 {
	padding: 25px 35px;
}

#titlee h2 span {
	font-weight: bold;
	color: #473fa0;
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

.itemcontainer {
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

.ac {
	width: 340px;
	height: 300px;
	display: block;
	text-align: center;
	vertical-align: top;
	font-size: 25px;
	font-weight: bold;
	background-position: center 100px;
	background-repeat: no-repeat;
}
</style>




<script>
	
</script>

</head>
<body>


	<%@include file="/WEB-INF/view/common/subPageheader.jsp"%>
	<%@include file="/WEB-INF/view/common/subPagesideBar.jsp"%>

	<div class="container">




		<div style="padding-top: 50px; width: 1350px;">



			<div class="card">
				<div class="card-body">

					<div id="titlee">
						<h2>
							<span>인지력</span> 간이 측정 프로그램
						</h2>
					</div>

					<hr>



					<div class="memberkind-in">
						<div class="end-div">
							<p class="end-txt1">
							<h2>2.보라색을 클릭해 주세요</h2>
							</p>
						</div>
					</div>



					<div class="itemcontainer">
						<div class="item item1">
							<a class="ac" href="${cp}/recognition/semiTestQ3?sur_ans_cont=1"></a>
						</div>
						<div class="item item2">
							<a class="ac" href="${cp}/recognition/semiTestQ3?sur_ans_cont=2"></a>
						</div>
						<div class="item item3">
							<a class="ac" href="${cp}/recognition/semiTestQ3?sur_ans_cont=3"></a>
						</div>
						<div class="item item4">
							<a class="ac" href="${cp}/recognition/semiTestQ3?sur_ans_cont=4"></a>
						</div>
						<div class="item item5">
							<a class="ac" href="${cp}/recognition/semiTestQ3?sur_ans_cont=5"></a>
						</div>
						<div class="item item6">
							<a class="ac" href="${cp}/recognition/semiTestQ3?sur_ans_cont=6"></a>
						</div>
					</div>




				</div>
			</div>
		</div>
	</div>






</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@page import="java.util.Date" %>
    <%@page import="java.text.SimpleDateFormat" %>
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







ul, li, dl, dd {
	list-style-type: none;
}


#program {
	width: 100%;
    height :600px;
	margin-right: 3%;
}



#program ul {
	overflow: hidden;
	
}

#program ul li {
	overflow: hidden;
	float: left;
	width: 50%;
	height: 300px;
	border-top: 1px solid #e6e6e6;
	box-sizing: border-box;
}

#program ul li {
	border: 0.5px solid #e6e6e6;
}


#program ul li a {
	height: 300px;
	display: block;
	text-align: center;
	vertical-align:top;
	font-size: 25px;
	font-weight: bold;
	background-position: center 100px;
	background-repeat: no-repeat;
}

#program ul li:nth-child(1) a { 
 background-image: url('/image/lec.svg'); 
 background-size: 150px;
} 


#program ul li:nth-child(2) a { 
	background-image: url('/image/1943032.svg'); 
	background-size: 150px;
 } 
 
 #program ul li:nth-child(3) a { 
	background-image: url('/image/167720.svg'); 
  background-size: 150px;
} 

#program ul li:nth-child(4) a { 
 background-image: url('/image/ex.png'); 
	background-size: 150px;
 } 

#program ul li a:hover {
	background-color: #e1e9f8;
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
		<h2>3.도아가 운동을하러 간다고 합니다. 도아가 들고 나갈 물건을 골라주세요</h2>
			</p>
		</div>
	</div>
	
	<br>
	<br>
					
					
					
					
					
		<div id="program">
						<ul>
							<li><a href="${cp}/recognition/semiTestQ4?sur_ans_cont=1&sur_part_id=${sur_part_id}&ques_id=2003">책</a></li>
							<li><a href="${cp}/recognition/semiTestQ4?sur_ans_cont=2&sur_part_id=${sur_part_id}&ques_id=2003">계란후라이</a></li>
							<li><a href="${cp}/recognition/semiTestQ4?sur_ans_cont=3&sur_part_id=${sur_part_id}&ques_id=2003">가위</a></li>
							<li><a href="${cp}/recognition/semiTestQ4?sur_ans_cont=4&sur_part_id=${sur_part_id}&ques_id=2003">농구공</a></li>
						</ul>
					</div>
					
					
					
					
					
					
				</div>
			</div>
		</div>
	</div>






</body>
</html>
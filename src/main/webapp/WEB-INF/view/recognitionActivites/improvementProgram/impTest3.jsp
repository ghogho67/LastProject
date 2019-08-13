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
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 50px;
	font-weight: 700;
	color: #3b3b3b;
}




.itemcontainer {
	width: 1005px;
	margin: 30px auto;
	height: 500px;
	grid-template-columns: repeat(3, 3fr);
	
}

.item {
	font-size: 35px;
	font-weight:300;
	padding: 10px;
	color: black;
	font-family: sans-serif;
	text-align: center;
	border: 3px solid #c7c7c7;
	border-radius: 20px;
	margin: 10px 0 0 10px;
	

}

.itemcontainer div:hover {
	background-color: #e1e9f8;
}
	


.item1 {
	background-color: white;
}

.item2 {
	background-color: white;
}

.item3 {
	background-color: white;
}

.item4 {
	background-color: white;
}

.item5 {
	background-color: white;
}

.item6 {
	background-color: white;
}


.ac {
	width: 990px;
	height: 50px;
	display: block;
	text-align: center;
	vertical-align: top;
	font-size: 35px;
	color:black;
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
		<h2>${ques.ques} </h2>
			</p>
		</div>
	</div>
					
					
					
					
					
		<div class="itemcontainer">
			<div class="item item1"><a class="ac" href="${cp}/recognitionImp/impTestQ4?ques_id=${ques.ques_id}&sur_ans_cont=1&sur_part_id=${sur_part_id}&sur_id=${sur_id}">${ques.choice_ct1}</a></div>
	<div class="item item2"><a class="ac" href="${cp}/recognitionImp/impTestQ4?ques_id=${ques.ques_id}&sur_ans_cont=2&sur_part_id=${sur_part_id}&sur_id=${sur_id}">${ques.choice_ct2}</a></div>
			<div class="item item3"><a class="ac" href="${cp}/recognitionImp/impTestQ4?ques_id=${ques.ques_id}&sur_ans_cont=3&sur_part_id=${sur_part_id}&sur_id=${sur_id}">${ques.choice_ct3}</a></div>
			<div class="item item4"><a class="ac" href="${cp}/recognitionImp/impTestQ4?ques_id=${ques.ques_id}&sur_ans_cont=4&sur_part_id=${sur_part_id}&sur_id=${sur_id}">${ques.choice_ct4}</a></div>
		
		
		</div>
					
					
					
					
				</div>
			</div>
		</div>
	</div>






</body>
</html>
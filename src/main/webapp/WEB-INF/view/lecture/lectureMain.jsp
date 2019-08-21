<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
@charset "UTF-8";

#content .wrap>div {
	background-color: #fff;
	box-sizing: border-box;
}

@import
	url(http://api.mobilis.co.kr/webfonts/css/?fontface=NanumGothicWeb);

#content .btm_con>div {
	float: left;
	margin-bottom: 40px;
	border: 1px solid #e6e6e6;
}


html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd,
	q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li,
	fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr,
	th, td, article, aside, canvas, details, figcaption, figure, footer,
	header, hgroup, menu, nav, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
}

div {
	display: block;
}

body, textarea {
	margin: 0;
	padding: 0;
	font-size: 15px;
	font-family: 'Malgun Gothic', '맑은고딕', 'Noto Sans KR', sans-serif;
	color: #111;
	font-weight: 500;
	letter-spacing: -.4px;
	word-break: keep-all !important;
}

h2 {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

ul, li, dl, dd {
	list-style-type: none;
}

ul {
	display: block;
	list-style-type: disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

a:link, a:visited {
	color: #111;
	text-decoration: none;
}

a:-webkit-any-link {
	cursor: pointer;
}

ul, li, dl, dd {
	list-style-type: none;
}


#program {
	width: 100%;
    height :900px;
	margin-right: 3%;
}


#program h2, #pzone h2 {
	font-size: 40px;
	font-weight: normal;
	letter-spacing: -1px;
}

#program h2 {
	padding: 25px 35px;
}

#program h2 span {
	font-weight: bold;
	color: #473fa0;
}

#program ul {
	overflow: hidden;
	
}

#program ul li {
	overflow: hidden;
	float: left;
	width: 33%;
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
	padding-top: 50px;
	text-align: center;
	vertical-align:top;
	font-size: 25px;
	font-weight: bold;
	letter-spacing: -1px;
	background-position: center 140px;
	background-repeat: no-repeat;
}

#program ul li:nth-child(1) a { 
 background-image: url('/image/lec.svg'); 
  background-size: 100px;
} 

#program ul li:nth-child(2) a { 
	background-image: url('/image/lang.png'); 
	  background-size: 100px;
 } 

#program ul li:nth-child(3) a { 
 background-image: url('/image/th.svg'); 
  background-size: 100px;
} 

#program ul li:nth-child(4) a { 
	background-image: url('/image/food.png'); 
	  background-size: 100px;
 } 
 
 #program ul li:nth-child(5) a { 
	background-image: url('/image/art.png'); 
  background-size: 100px;
} 

#program ul li:nth-child(6) a { 
 background-image: url('/image/ex.png'); 
	  background-size: 100px;
 } 

#program ul li a:hover {
	background-color: #e1e9f8;
}



#middle{
margin-top:50px;
position:absolute;
left:22%;
width: 70%
}

</style>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>
<%@include file="/WEB-INF/view/common/LibForMypage.jsp"%>


</head>
<body>

	<%@include file="/WEB-INF/view/common/subPageheader.jsp"%>
	<%@include file="/WEB-INF/view/common/subPagesideBar.jsp"%>


<div id="middle">

					<div id="program">
						<h2>
							<span>학습.문화</span> 프로그램
						</h2>
						
						<ul>
							<li><a href="${cp}/lecture/lectureList?lec_type=601&page=1&pageSize=10">순수학문</a></li>
							<li><a href="${cp}/lecture/lectureList?lec_type=602&page=1&pageSize=10">외국어</a></li>
							<li><a href="${cp}/lecture/lectureList?lec_type=603&page=1&pageSize=10">생활기술</a></li>
							<li><a href="${cp}/lecture/lectureList?lec_type=604&page=1&pageSize=10">요리</a></li>
							<li><a href="${cp}/lecture/lectureList?lec_type=605&page=1&pageSize=10">미술/음악</a></li>
							<li><a href="${cp}/lecture/lectureList?lec_type=606&page=1&pageSize=10">건강/생활체육</a></li>
						</ul>
			
	<a href="${cp}/lecture/lectureListALL?page=1&pageSize=10" style=" position:absolute; left:86%; font-size:2em; font-weight: bold; color: #473fa0; ">전체 강좌 보기 </a>
						
						
					</div>


</div>
</body>
</html>
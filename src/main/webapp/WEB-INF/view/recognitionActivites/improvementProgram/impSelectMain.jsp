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
    height :750px;
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
	text-align: center;
	vertical-align:top;
	font-size: 25px;
	font-weight: bold;
	letter-spacing: -1px;
	background-position: center 40px;
	background-repeat: no-repeat;
}

#program ul li:nth-child(1) a { 
 background-image: url('/image/nunmul.PNG');  
  background-size: 300px;
 
} 

#program ul li:nth-child(2) a { 
background-image: url('/image/nunmul.PNG'); 
	  background-size: 300px;
 } 

#program ul li:nth-child(3) a { 
 background-image: url('/image/kong.PNG'); 
   background-size: 300px;
} 

#program ul li:nth-child(4) a { 
	background-image: url('/image/kongbu.PNG'); 
	    background-size: 300px;
 } 
 
 #program ul li:nth-child(5) a { 
	background-image: url('/image/crape.PNG'); 
    background-size: 300px;
} 

#program ul li:nth-child(6) a { 
 background-image: url('/image/nunmul.PNG'); 
	    background-size: 300px;
 } 

#program ul li a:hover {
	background-color: #e1e9f8;
}



#middle{
margin-top:20px;
position:absolute;
left:22%;
width: 70%
}





.pagination-outer {
	text-align: center;
}

.pagination {
	font-family: 'Rubik', sans-serif;
	padding: 0 30px;
	display: inline-flex;
	position: relative;
}

.pagination li a.page-link {
	color: #909090;
	background-color: transparent;
	font-size: 20px;
	line-height: 35px;
	height: 45px;
	width: 40px;
	margin: 0 3px;
	border: none;
	border-radius: 0;
	overflow: hidden;
	position: relative;
	transition: all 0.4s ease 0s;
}

.pagination li.active a.page-link, .pagination li a.page-link:hover,
	.pagination li.active a.page-link:hover {
	color: #006266;
	background-color: transparent;
}

.pagination li a.page-link span {
	display: block;
	transition: all 0.3s;
}

.pagination li a.page-link:hover span {
	transform: rotateY(360deg);
}

.pagination li a.page-link:before, .pagination li a.page-link:after {
	content: "";
	background-color: #006266;
	height: 3px;
	width: 0;
	opacity: 1;
	position: absolute;
	left: 0;
	bottom: 0;
	z-index: -1;
	transition: all 0.3s;
}

.pagination li a.page-link:before {
	background: linear-gradient(135deg, transparent 49%, #006266 50%);
	height: 15px;
	width: 15px;
	transform: translateX(-50%) rotate(45deg);
	bottom: auto;
	top: -20px;
	left: 50%;
}

.pagination li a.page-link:hover:after {
	width: 100%;
}

.pagination li a.page-link:hover:before {
	top: -10px;
}

.pagination li a.page-link:hover:before, .pagination li.active a.page-link:before
	{
	top: -10px;
}

.pagination li a.page-link:hover:after, .pagination li.active a.page-link:after
	{
	width: 100%;
}

@media only screen and (max-width: 480px) {
	.pagination {
		display: block;
	}
	.pagination li {
		margin-bottom: 10px;
		display: inline-block;
	}
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
						<span>학습할 프로그램을 선택해 주세요</span>
						</h2>
						<hr>
						
					
						<ul>
							<li><a href="${cp}/recognitionImp/impVideo?sur_id=902">콩국수에는 슬픈 전설이 하나 있어</a></li>
							<li><a href="${cp}/recognitionImp/impVideo?sur_id=903">미선이의 ‘미달이 공부시키기’</a></li>
							<li><a href="${cp}/recognitionImp/impVideo?sur_id=907">아홉 살 해리에겐 너무 힘든 이별</a></li>
							<li><a href="${cp}/recognitionImp/impVideo?sur_id=904">화가나는 교감의 반어법</a></li>
							<li><a href="${cp}/recognitionImp/impVideo?sur_id=905">뛰는 남자들 위해 나는 이순재?!</a></li>
							<li><a href="${cp}/recognitionImp/impVideo?sur_id=906">동대문 할부지 크레페 근황</a></li>
						
						</ul>
			
					</div>



	<div class="demo" style="position: absolute; right: 40%;">
									<nav class="pagination-outer" aria-label="Page navigation">
										<ul class="pagination">
											<li class="page-item"><a href="#" class="page-link"
												aria-label="Previous"> <span aria-hidden="true">«</span>
											</a></li>
											<li class="page-item  active"><a class="page-link"
												href="#">1</a></li>
											<li class="page-item"><a class="page-link" href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item"><a class="page-link" href="#">4</a></li>
											<li class="page-item"><a class="page-link" href="#">5</a></li>
											<li class="page-item"><a href="#" class="page-link"
												aria-label="Next"> <span aria-hidden="true">»</span>
											</a></li>
										</ul>
									</nav>
								</div>



</div>
</body>
</html>
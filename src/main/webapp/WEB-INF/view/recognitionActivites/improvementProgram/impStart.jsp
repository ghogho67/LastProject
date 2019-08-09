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
	font-size: 18px;
}

#program {
	width: 100%;
	height: 900px;
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


#middle {
	margin-top: 10px;
	position: absolute;
	left: 22%;
	width: 70%
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
				<span>인지 능력</span> 향상 프로그램
			</h2>

<hr>

        <div class="container">
            <div class="row">
                <div class="col-lg-5 align-self-center">
                    <div class="welcome-img">
                       <img src="${pageContext.request.contextPath}/resource/medino/images/403.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="welcome-text mt-5 mt-lg-0">
                        <h2 style="text-align: center;"> <span>유의사항</span></h2>
                        
                        <ul>
                        <li> 약 5분간 영상을 시청합니다</li>
                        <li> 영상이 종료되면 시청한 영상과 관련된 문제가 제공됩니다</li>
                        <li> 영상의 내용을 상기하면서 문제를 푸세요</li>
                        <li> 꼭 본인의 힘으로 프로그램을 완료해주세요 </li>
                         </ul>
                        <br>
                        <p style="font-size: 12px;">검사 후 의심자는 치매상담실에 상담 또는 전문의의 정확한 진단을 받아보시길 권합니다.</p>
                        <a class="btn btn-primary mr-2" style="color: white; letter-spacing: 3px; float: right;" href="${cp}/recognitionImp/impSelectMain">진행하기</a>
                    </div>
                </div>
            </div>
        </div>




		</div>


	</div>
</body>
</html>
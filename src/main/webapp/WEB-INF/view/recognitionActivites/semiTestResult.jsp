<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	font-size: 18px;
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
	margin-top: 50px;
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
				<span>인지력</span> 간이 측정 프로그램
			</h2>

			<hr>

			<div class="container">
				<div class="row">
					<div class="col-lg-5 align-self-center">
						<div class="welcome-img">





							<c:choose>
								<c:when test="${checkScore==5}">
								
							<img
								src="${pageContext.request.contextPath}/resource/medino/images/620.jpg"
								alt="">

								</c:when>

								<c:when test="${checkScore==4}">
									
							<img
								src="${pageContext.request.contextPath}/resource/medino/images/620.jpg"
								alt="">

								</c:when>

								<c:when test="${checkScore==3}">
									
							<img
								src="${pageContext.request.contextPath}/resource/medino/images/621.jpg"
								alt="">

								</c:when>

								
								<c:otherwise>
								<img
								src="${pageContext.request.contextPath}/resource/medino/images/603.jpg"
								alt="">

								</c:otherwise>
							</c:choose>






						</div>
					</div>
					<div class="col-lg-7">
						<div class="welcome-text mt-5 mt-lg-0">




							<c:choose>
								<c:when test="${  checkScore==5}">
									<h2 style="text-align: center;">
										치매 <span style="color: red;">고위험군</span> 입니다
									</h2>
								</c:when>

								<c:when test="${checkScore==4}">
									<h2 style="text-align: center;">
										치매 <span style="color: red;">고위험군</span> 입니다
									</h2>
								</c:when>

								<c:when test="${checkScore==3}">
									<h2 style="text-align: center;">
										약간<span style="color: red;">위험</span>하네요
									</h2>
								</c:when>

								<c:when test="${checkScore==2}">
									<h2 style="text-align: center;">비교적 <span style="color:#ea309f;">건강한</span> 인지력을 지니셨네요</h2>
								</c:when>

								<c:otherwise>
									<h2 style="text-align: center;">
										<span style="color: #ea309f;">건강한 </span>인지력을 지니셨군요
									</h2>
								</c:otherwise>
							</c:choose>



							<p class="pt-3">
							<ul>





<c:choose>
								<c:when test="${  checkScore==5}">
									
								<li>빠른시일내에 치매상담실에 상담 또는 전문의의 정확한 진단을 받아보시길 권합니다.</li>
								<li>디스케어는 긴급 호출, 인지능력 향상 프로그램 등의 프리미엄 서비스를 제공하고 있습니다</li>
								<li> 프리미엄 서비스를 이용해 보시는건 어떨까요? .</li>
								</c:when>

								<c:when test="${checkScore==4}">
									
								<li>빠른시일내에 치매상담실에 상담 또는 전문의의 정확한 진단을 받아보시길 권합니다.</li>
								<li>디스케어는 긴급 호출ㄷ, 인지능력 향상 프로그램 등의 프리미엄 서비스를 제공하고 있습니다</li>
								<li> 프리미엄 서비스를 이용해 보시는건 어떨까요? .</li>
								</c:when>

								<c:when test="${checkScore==3}">
									
								<li>빠른시일내에 치매상담실에 상담 또는 전문의의 정확한 진단을 받아보시길 권합니다.</li>
								<li>언제 발생할지 모르는 위급상황을 대비해 디스케어의 프리미엄 서비스를 이용해 보시는건 어떨까요? .</li>
								</c:when>

								<c:when test="${checkScore==2}">
									
								<li>하지만 긴장의 끈을 놓으셔선 안됩니다! 디스케어의 프리미엄 서비스를 이용해 보시는건 어떨까요? .</li>
								</c:when>

								<c:otherwise>
									<li>하지만 긴장의 끈을 놓으셔선 안됩니다! 디스케어의 프리미엄 서비스를 이용해 보시는건 어떨까요? .</li>
								</c:otherwise>
							</c:choose>




							</ul>
							
							
							</p>

							<a href="${cp}/main">처음으로 돌아가기</a>
						</div>
					</div>
				</div>
			</div>




		</div>


	</div>
</body>
</html>
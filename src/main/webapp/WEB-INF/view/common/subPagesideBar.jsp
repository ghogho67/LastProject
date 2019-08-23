<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이드페이지</title>

<style>
.sidebarTitle {
	color: #455a64;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 30px !important;
	font-weight: 600;
	line-height: 36px;
}

.priSurvice {
	color: white !important;
	margin-left: 20px;
	text-decoration: none;
	background: #24d2b5;
	border: 1px solid #24d2b5;
	transition: 0.2s ease-in;
	padding: .75rem 1.5rem;
	font-size: 1.25rem;
	cursor: pointer;
	margin-right: .5rem !important;
	line-height: 1.5;
	border-radius: .3rem;
	display: inline-block;
	font-weight: 400;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	user-select: none;
	box-shadow: none;
	text-shadow: none;
	margin-left: 20px;
}
</style>


</head>

<aside class="left-sidebar">

	<div class="lk"
		style="background-image: url('/image/logosam2.png'); margin-top: 20px; height: 130px; width: 100%; background-size: 230px; background-repeat: no-repeat;">
	</div>


	<div class="scroll-sidebar" style="text-align: center;">
		<nav class="sidebar-nav" style="text-align: center;">
			<c:forEach items="${sideBar}" var="sideBar">
				<c:if test="${sideBar.cate_paerent_id eq 0}">
					<h2 class="sidebarTitle">${sideBar.cate_title}</h2>
				</c:if>
			</c:forEach>

			<ul id="sidebarnav" style="text-align: center;">



				<br>
				<c:forEach items="${sideBar}" var="sideBar">
					<c:if test="${sideBar.cate_paerent_id ne 0}">
						<li style="text-align: center;"><a
							href="${cp}/re/cate?cate_id=${sideBar.cate_id}"><span
								class="hide-menu">${sideBar.cate_title}</span></a></li>
					</c:if>
				</c:forEach>



			</ul>

		</nav>
		<br> <br> <br> <br> <br> <br> <br>

		<br>
		<div>
			<c:if test="${MEM_INFO.mem_grade==1}">


				<a data-toggle="modal" data-target="#myModalGrade"><img
					src="/image/membershipjoin2.png"
					style="width: 200px; height: auto;" /> </a>
			</c:if>


			<%-- 		<c:if test="${MEM_INFO.mem_grade==1}"> --%>
			<!-- 				<a  class="priSurvice"  data-toggle="modal" data-target="#myModalGrade">프리미엄 서비스 이용</a> -->
			<%-- 			</c:if> --%>

		</div>
	</div>







</aside>
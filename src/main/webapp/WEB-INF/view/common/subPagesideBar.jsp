<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<aside class="left-sidebar">

	<div class="lk"
		style="background-image: url('/image/logosam2.png'); margin-top:20px; height: 130px; width: 100%; background-size: 230px;  background-repeat: no-repeat;">
	</div>


	<div class="scroll-sidebar">
		<nav class="sidebar-nav">
		<c:forEach items="${sideBar}" var="sideBar">
			<c:if test="${sideBar.cate_paerent_id eq 0}">
				<h2 style="letter-spacing: 5px;">${sideBar.cate_title}</h2>
			</c:if>
		</c:forEach>
				
			<ul id="sidebarnav" style="text-align: center;">



				<br>
				<c:forEach items="${sideBar}" var="sideBar">
					<c:if test="${sideBar.cate_paerent_id ne 0}">
						<li><a href="${cp}/re/cate?cate_id=${sideBar.cate_id}"><span class="hide-menu">${sideBar.cate_title}</span></a></li>
					</c:if>
				</c:forEach>

<!-- 				<li><a href="pages-profile.html"><span class="hide-menu">인지 -->
<!-- 							향상 프로그램</span></a></li> -->
<!-- 				<li><a href="table-basic.html"><span -->
<!-- 						class="hide-menu">간이 질환 테스트</span></a></li> -->
<!-- 				<li><a href="icon-fontawesome.html"><span -->
<!-- 						class="hide-menu">스트레스 지수</span></a></li> -->
<!-- 				<li><a href="map-google.html"><span class="hide-menu">수면상태</span></a></li> -->
<!-- 				<li><a href="pages-blank.html"><span -->
<!-- 						class="hide-menu">GPS위치정보</span></a></li> -->
				
			</ul>

		</nav>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	
		<br>
		<div >
		
		<c:if test="${MEM_INFO.mem_grade==1}">
				<<a  class="btn btn-success btn-lg mr-2"  data-toggle="modal" data-target="#myModalGrade" style="color: white">프리미엄 서비스 이용</a>
		

			</c:if>
		
		</div>
	</div>
	
	
	

	
	
	
</aside>

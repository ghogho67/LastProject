<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<aside class="left-sidebar">

	<div class="lk"
		style="background-image: url('/image/logosam2.png'); margin-top:20px; height: 130px; width: 100%; background-size: 230px;  background-repeat: no-repeat;">
	</div>


	<div class="scroll-sidebar"  style="text-align: center;">
		<nav class="sidebar-nav" style="text-align: center;">
		<c:forEach items="${sideBar}" var="sideBar">
			<c:if test="${sideBar.cate_paerent_id eq 0}">
	<h2 >${sideBar.cate_title}</h2> 
			</c:if>
		</c:forEach>
				
			<ul id="sidebarnav" style="text-align: center;">



				<br>
				<c:forEach items="${sideBar}" var="sideBar">
					<c:if test="${sideBar.cate_paerent_id ne 0}">
						<li style="text-align: center;"><a href="${cp}/re/cate?cate_id=${sideBar.cate_id}"><span class="hide-menu">${sideBar.cate_title}</span></a></li>
					</c:if>
				</c:forEach>


				
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
				<a  class="btn btn-success btn-lg mr-2"  data-toggle="modal" data-target="#myModalGrade" style="color: white;margin-left: 20px;">프리미엄 서비스 이용</a>
			</c:if>
		
		</div>
	</div>
	
	
	

	
	
	
</aside>

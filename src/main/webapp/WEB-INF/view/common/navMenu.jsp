<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<nav id="nav-menu-container">
	<ul class="nav-menu">
		<li class="menu-active"><a href="${cp}/crawling">Home</a></li>
<!-- 		<li><a href="departments.html">회사소개</a></li> -->
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${MEM_INFO.mem_grade==0}"> --%>
<%-- 				<li><a href="${cp}mypage/Admin_Info">마이페이지</a></li> --%>
<%-- 			</c:when> --%>
<%-- 			<c:when test="${MEM_INFO.mem_grade==1 || MEM_INFO.mem_grade==2}"> --%>
<%-- 				<li><a href="${cp}mypage/Patient_Info">마이페이지</a></li> --%>
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<%-- 				<li><a href="${cp}mypage/Worker_Info">마이페이지</a></li> --%>
<%-- 			</c:otherwise> --%>
		
<%-- 		</c:choose> --%>
	
		<c:forEach items="${categoryList}" var="category">
			<c:if test="${category.cate_usage =='Y'}">
				<c:if test="${category.cate_paerent_id==0}">
				
				<c:set var="count" value="0" />
				<c:forEach items="${categoryList}" var="categoryOne">
					<c:if test="${categoryOne.cate_paerent_id eq category.cate_id}">
						<c:set var="count" value="${count+1}" />
					</c:if>
				</c:forEach>
				<c:choose>
					<c:when test="${count==0}">
						<li class="menu-active"><a href="${cp}/re/cate?cate_id=${category.cate_id}">${category.cate_title}</a></li>
					</c:when>
					<c:otherwise>
					 	<li class="menu-has-children"><a >${category.cate_title}</a>
				
				
						<ul>

					<c:forEach items="${categoryList}" var="categoryCh">
						 <c:if test="${categoryCh.cate_paerent_id eq category.cate_id}">
						 	<c:if test="${categoryCh.cate_usage =='Y'}">
								<li><a href="${cp}/re/cate?cate_id=${categoryCh.cate_id}">${categoryCh.cate_title}</a></li>
						 	</c:if>
						 </c:if>
					</c:forEach>
							</ul>
							</li>
					
					</c:otherwise>
				</c:choose>

				</c:if>
		
			</c:if>
		</c:forEach>




		<c:choose>

			<c:when test="${MEM_INFO.mem_grade==0}">

				<li class="menu-has-children"><a>관리자 메뉴 </a>
					<ul>
						<li><a href="${cp}/category/categoryList">카테고리 메뉴관리</a></li>
						<li><a href="${cp}/lecture/lectureListManagement">강좌관리</a></li>
						


					</ul>
				</li>



			</c:when>


		</c:choose>









	</ul>
</nav>

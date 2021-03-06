<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<style>

.btn-logout:hover {
    color: #fff;
    background-color: #d3d1da;
    border-color: #f0f2fb;
}
</style>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BASIC</title>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>
<%@include file="/WEB-INF/view/common/gradeChange.jsp"%>
<%@include file="/resource/chat/chatAlram.jsp" %>
<%@include file="/resource/chatbot/chatbotView.jsp" %>
</head>




<div id="header" class="header-scrolled2">
		<div class="row">
			<nav id="nav-menu-container" style="padding-left: 900px;">
				<ul class="nav-menu">
				<li class=""><a href="${cp}/crawling?mem_id=${MEM_INFO.mem_id}">Home</a></li> 
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
						<li><a href="${cp}/re/cate?cate_id=${category.cate_id}">${category.cate_title}</a></li>
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
					
					</c:otherwise>
				</c:choose>

				</c:if>
			</c:if>
		</c:forEach>

		<c:choose>
			<c:when test="${MEM_INFO.mem_grade==0}">
				<li class="menu-has-children"><a>관리자 메뉴 </a>
					<ul>
							<li><a href="${cp}/category/categoryList">카테고리 관리</a></li>
						<li><a href="${cp}/lecture/lectureListManagement"> 강좌 관리</a></li>
						<li><a href="${cp}/lecture/cultureListManagement"> 문화센터 관리</a></li>
					</ul>
				</li>



			</c:when>


		</c:choose>

<li style=" position: absolute;
    left: 93%;"><a class="btn-logout" href="/logout"  style="
display: inline-block;
    font-weight: 600;
    text-align: center;
    vertical-align: middle;
    user-select: none;
    border: 3px solid transparent;
    padding: .175rem .95rem;
    font-size: 13px;
    line-height: 1.5;
    border-radius: .25rem;
    transition: color .15s ease-in-out, background-color .15s ease-in-out;
    background-color: #ffffff00;
    border-color: #8094ab82;
    color: gray;
   
">로그아웃 </a>
				 </li>


				</ul>
			</nav>
		</div>
	</div>
<br>
<br>
<hr>

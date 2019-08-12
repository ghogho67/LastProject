<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/view/common/gradeChange.jsp"%>
<meta charset="UTF-8">
<style type="text/css">
span.silver {
	border-radius: 3px;
	background: #9bb3c9;
	text-align: center;
	color: #fff;
	display: block;
	font-size: 10.5px;
}



span.gold {
	border-radius: 3px;
	background: #ffa242bf;
	text-align: center;
	color: #fff;
	display: block;
	font-size: 10.5px;
}


span.emp {
	border-radius: 3px;
	background: #ff80c0;
	text-align: center;
	color: #fff;
	display: block;
	font-size: 10.5px;
}



span.admin {
	border-radius: 3px;
	background: #02a9f9;
	text-align: center;
	color: #fff;
	display: block;
	font-size: 10.5px;
}


</style>

</head>



<div class="header-top">
	<div class="container">
		<div class="row">
			<div>
				<ul>

					<li>${MEM_INFO.mem_nm} 님 환영합니다
							<c:choose>
						<c:when test="${MEM_INFO.mem_grade==0}">
						<span class="admin">관리자 </span>
						</c:when>
						<c:when test="${MEM_INFO.mem_grade==1}">
						<span class="silver">일반 회원 </span>
						</c:when>
						<c:when test="${MEM_INFO.mem_grade==2}">
						<span class="gold">골드회원 </span>
						</c:when>
						<c:otherwise>
					<span class="emp">요양보호사 </span>
						</c:otherwise>
					</c:choose>
					
					</li>
				</ul>
			</div>
			<a  class="btn-logout" style="position: absolute; left: 90%;" href="/logout">로그아웃</a>
			<c:if  test="${MEM_INFO.mem_grade==1}">
		<a  class="btn-pri"  data-toggle="modal" data-target="#myModalGrade" style="position: absolute; left: 81%;">프리미엄 서비스 이용</a>
			
			</c:if>
		</div>
	</div>
</div>
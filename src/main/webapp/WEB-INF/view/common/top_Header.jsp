<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
span.silver {
	border-radius: 3px;
	background: #58d8a3;
	text-align: center;
	color: #fff;
	display: block;
	font-size: 10.5px;
}



span.gold {
	border-radius: 3px;
	background: #f3dd98;
	text-align: center;
	color: #fff;
	display: block;
	font-size: 13px;
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
			<div class="col-lg-9 d-md-flex">
				<ul>

					<li>${MEM_INFO.mem_nm}님환영합니다
					&nbsp;&nbsp;&nbsp;&nbsp;
					
							<c:choose>
						<c:when test="${MEM_INFO.mem_grade==0}">
						<span class="admin">관리자 </span>
						</c:when>
						<c:when test="${MEM_INFO.mem_grade==1}">
						<span class="silver">일반회원 </span>
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
			<a  class="btn btn-primary" style="position: absolute; left: 90%;" href="/logout">로그아웃</a>

		</div>
	</div>
</div>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>기부관리</title>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>
<%@include file="/WEB-INF/view/common/LibForMypage.jsp"%>


<style type="text/css">


#titlee h2, #pzone h2 {
	font-size: 40px;
	font-weight: normal;
	letter-spacing: -1px;
}

#titlee h2 {
	padding: 25px 35px;
}

#titlee h2 span {
	font-weight: bold;
	color: #473fa0;
}

tr {
	text-align: center;
	font-weight: 500;
}

td {
	text-align: center;
}

.title {
	background-color: transparent;
	width: 180px;
	padding: 3px;
	font-size: 8pt;
	text-align: center;
}

.kkk {
	background-color: transparent;
	border-color: transparent;
	width: 30px;
	padding: 3px;
	font-size: 9pt;
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
	font-size: 15px;
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
	color: #5ab4dc;
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
	background-color: #5ab4dc;
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
	background: linear-gradient(135deg, transparent 49%, #5ab4dc 50%);
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

.for {
	position: relative;
	width: 250px;
	height: 50px;
	margin: 0 auto;
}

.d1 {
	height: 30px;
	background: white;
	position: absolute;
	right: 5%;
	margin-top: 3%;
}

.d1 input {
	width: 110%;
	height: 20px;
	padding-left: 90px;
	border: 2px solid #5ab4dc;
	border-radius: 5px;
	outline: none;
	background: white;
	color: #9E9C9C;
	font-size: 13px;
}

.d1 button {
	position: absolute;
	top: 0;
	right: -25px;
/* 	left : 2px; */
	width: 32px;
	height: 38px;
	border: none;
	background: #5ab4dc;
	border-radius: 0 5px 5px 0;
	cursor: pointer;
}

.d1 button:before {
	content: "\f002";
	font-family: FontAwesome;
	font-size: 16px;
	color: #F9F0DA;
}

#searchType {
	height: 40px;
	width: 90px;
	font-size: 12px;
	border-radius: 5px 0px 0px 5px;
	border-top: 2px solid #5ab4dc;
	border-bottom: 2px solid #5ab4dc;
	border-left: 2px solid #5ab4dc;
	border-right: 2px solid #5ab4dc;
}
</style>


<script>

$(document).ready(function() {
	
	//검색
	$("#searchBtn").on("click", function() {
		console.log("searchBtn click");
		console.log($("#mem_yn").val());
		
//			var mem_yn = $(this).find("#mem_yn").text();
//			$("#mem_yn").val(mem_yn);
		
		$("#frm2").submit();
	});

});

function boardPagingListAjaxHtml(page, pageSize) {
	$("#page").val(page);
	$("#pageSize").val(pageSize);
	$("#pageForm").submit();
	
	}

</script>

</head>

<body>

<%-- 	<%@include file="/WEB-INF/view/common/subPageheader.jsp"%> --%>
<%-- 	<%@include file="/WEB-INF/view/common/subPagesideBar.jsp"%> --%>
	
	 <form id="pageForm" action="${cp}/donation/pagingList">
	 	<input type="hidden" name = "page" id="page">
	 	<input type="hidden" name = "pageSize" id="pageSize">
	 </form>

	<div class="container">
		<div style="padding-top: 50px; width: 1250px;">
			<div class="card">
				<div class="card-body">
							
						<!-- 검색 -->
<!-- 						<div class="d1"> -->
<%-- 							<form class="for" id="frm2" action="${cp}/donation/searchDonation" method="post"> --%>
<!-- 								<select id="searchType" name="mem_yn" -->
<!-- 									style="position: absolute; z-index: 999;"> -->
<!-- 									<option value="all">회원/비회원</option> -->
<!-- 								</select> <input type="text" placeholder="회원:Y, 비회원:N" name="hos_add" id="hos_add"> -->
<!-- 								<button type="button" id="searchBtn"></button> -->
<!-- 							</form> -->
<!-- 						</div> -->

						
						<div id="titlee">
						<h2>
							<span>기부자 목록</span>
						</h2>
						</div>
						
						
					<hr>
<%-- 					<form id="frm" action="${cp}/donation/searchPagingList" method="get"> --%>
<!-- 						<input type="hidden" class="app_id" id="app_id" name="app_id"> -->
<!-- 						<input type="hidden" class="mem_yn" id="mem_yn" name="mem_yn"> -->
					<div class="table-responsive">
						<table class="table center-aligned-table">
							<thead>
							<tr>
								<th scope="col">NO</th>
<!-- 		                        <th scope="col">기부 아이디</th> -->
		                        <th scope="col">기부자 이름</th>
		                        <th scope="col">회원 아이디</th>
		                        <th scope="col">전화번호</th>
		                        <th scope="col">기부 날자</th>
		                        <th scope="col">기부 금액</th>
		                        <th scope="col">기부 사유</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${getAllDonerList }" var="vo" varStatus="status">
								<tr class="donTr" data-app_id="${vo.app_id }">
		                           <td>${vo.rn }</td>
<%-- 		                           <td class="app_id">${vo.app_id }</td> --%>
		                           <td>${vo.doner }</td>
		                           <td>${vo.mem_id }</td>
		                           <td>${vo.doner_phone }</td>
		                           <td>${vo.app_time }</td>
		                           <td>${vo.app_pay }</td>
		                           <td>${vo.doner_comment }</td>
								</tr>
							</c:forEach>
							</tbody>
							
						</table>
					</div>
					
<!-- 					</form> -->
					
				<div class="demo" style="position: absolute; right: 34%; top: 91%;">
				<nav class="pagination-outer" aria-label="Page navigation">
					<ul class="pagination">
						<c:choose>
							<c:when test="${pageVo.page==1}">
								<li class="page-item prev disabled"><a href="#"
									class="page-link" aria-label="Previous"> <span
										aria-hidden="true">«</span>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									aria-hidden="Previous"
									href="javascript:boardPagingListAjaxHtml(1, ${pageVo.pageSize});"><span
										aria-hidden="true">«</span></a></li>

							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${pageVo.page==1}">
								<li class="page-item prev disabled"><a href="#"
									class="page-link" aria-label="Previous"> <span
										aria-hidden="true">‹</span>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									aria-label="Previous"
									href="javascript:boardPagingListAjaxHtml(${pageVo.page-1}, ${pageVo.pageSize});"><span
										aria-hidden="true">‹</span></a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach begin="${startPage}" end="${paginationSize}" var="i">
							<c:choose>
								<c:when test="${pageVo.page == i}">
									<li class="page-item active"><a class="page-link"
										href="#">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li><a class="page-link"
										href="javascript:boardPagingListAjaxHtml(${i}, ${pageVo.pageSize});">${i}</a></li>
								</c:otherwise>
							</c:choose>

						</c:forEach>

						<c:choose>
							<c:when test="${pageVo.page == lastpaginationSize}">
								<li class="page-item next disabled"><a href="#"
									class="page-link" aria-label="Next"> <span
										aria-hidden="true">›</span>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									aria-label="Next"
									href="javascript:boardPagingListAjaxHtml(${pageVo.page+1}, ${pageVo.pageSize});"><span
										aria-hidden="true">›</span></a></li>
							</c:otherwise>
						</c:choose>


						<c:choose>
							<c:when test="${pageVo.page == lastpaginationSize}">
								<li class="page-item next disabled"><a href="#"
									class="page-link" aria-label="Next"><span
										aria-hidden="true">»</span></a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									aria-label="Next"
									href="javascript:boardPagingListAjaxHtml(${lastpaginationSize}, ${pageVo.pageSize});"><span
										aria-hidden="true">»</span></a></li>
							</c:otherwise>
						</c:choose>

					</ul>
				</nav>
			</div>
					
					
				</div>
				
				
				
				
			</div>
			
			
			
		</div>
		
		
	</div>
	

</body>
</html>
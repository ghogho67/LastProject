<%@page import="kr.or.ddit.page.model.PageVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>reportPagingList</title>

<!-- css, js -->
<style>
.postTr:hover {
	cursor: pointer;
}

<
style type ="text /css">#titlee h2, #pzone h2 {
	font-size: 40px;
	font-weight: normal;
	letter-spacing: -1px;
}

#titlee h2 {
	padding: 5px 35px;
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
	left: 40%;
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
	right: 17%;
	top: 228px;
}

.d1 input {
	width: 110%;
	height: 30px;
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
	height: 30px;
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
	height: 30px;
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
	});
</script>
</head>

<body>
	<div class="content-wrapper">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div id="titlee">
						<h2>보고서 확인&nbsp;</h2>
					</div>
					<hr>
					<div class="row">

						<div class="table-responsive">
							<table class="table center-aligned-table">
								<tr class="text-primary">
									<th>매칭 번호</th>
									<th>매칭일</th>
									<th>매칭 시작시간</th>
									<th>매칭 종료시간</th>
									<th>매칭 유형</th>
									<th>매칭 대상자</th>
									<th>요양보호사</th>
									<c:if test="${mem_grade eq 3}">
										<th>보고서 작성</th>
									</c:if>
									<th>보고서 확인</th>
								</tr>
								<c:set var="number" value="0" />
								<c:forEach items="${reportList }" var="report"
									varStatus="status">
									<tr class="Category" id="${report.mat_id }"
										data-post_id="${report.mat_id }">
										<%--<td class="CategoryId">${post.post_id }</td> --%>
										<td class="CategoryId">
											<%-- 														${matchingCnt } --%> <%-- 														${status.index } --%>
											<%-- 
											${current } --%> <%-- 											${(((matchingCnt-1)-status.index+1))-((current-1)*10)} --%>
											${report.rn }
										</td>
										<%--${(postCnt - status.index)-((current-1)*10)} --%>
										<td>${report.day }</td>
										<td>${report.stTime }</td>
										<td>${report.endTime }</td>
										<td>${report.mat_type }</td>
										<td>${report.mem_nm }</td>
										<td>${report.cw_mem_nm }</td>


										<c:choose>
											<c:when test="${report.check eq 1 && mem_grade eq 3}">
												<td><a
													href="${cp}/report/modifyView?mat_id=${report.mat_id }"
													class="btn btn-primary btn-sm">보고서 수정</a></td>
											</c:when>
											<c:otherwise>
												<c:if test="${mem_grade eq 3}">
													<td><a
														href="${cp}/report/reportWrite?mat_id=${report.mat_id }"
														class="btn btn-primary btn-sm">보고서 작성</a></td>
												</c:if>

											</c:otherwise>
										</c:choose>

										<td><c:choose>
												<c:when test="${report.check eq 1 }">
													<a href="${cp}/report/detail?mat_id=${report.mat_id }"
														class="btn btn-success btn-sm">보고서 확인</a>
												</c:when>
												<c:otherwise>
													<a class="btn btn-secondary btn-sm">보고서 미작성</a>
												</c:otherwise>
											</c:choose></td>
									</tr>
									<input type="hidden" class="mat_id" value="${report.mat_id }">
								</c:forEach>
							</table>
						</div>



						<div class="demo" style="position: relative; left: 30%">
							<ul class="pagination" style="margin-left: 180px;">
								<c:choose>
									<c:when test="${pageVo.page == 1 }">
										<li class="page-item prev disabled"><a href="#"
											class="page-link" aria-label="Previous"><span
												aria-hidden="true">«</span> </a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											aria-label="Next"
											href="${cp}/report/pagingList?page=${pageVo.page-1}&pageSize=${pageVo.pageSize}"><span
												aria-hidden="true">«</span></a></li>
									</c:otherwise>
								</c:choose>

								<c:forEach begin="1" end="${paginationSize}" var="i">
									<c:choose>
										<c:when test="${pageVo.page == i}">
											<li class="page-item active"><a class="page-link"
												href="#">${i}</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="${cp}/report/pagingList?page=${i}&pageSize=${pageVo.pageSize}&current=${i}&matchingCnt=${matchingCnt}">${i}</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<c:choose>
									<c:when test="${pageVo.page == paginationSize}">
										<li class="page-item next disabled"><a href="#"
											class="page-link" aria-label="Next"> <span
												aria-hidden="true">»</span></a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											aria-label="Next"
											href="${cp}/report/pagingList?page=${pageVo.page+1}&pageSize=${pageVo.pageSize}">
												<span aria-hidden="true">»</span>
										</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>

					</div>


				</div>
			</div>
		</div>


	</div>

</body>
</html>

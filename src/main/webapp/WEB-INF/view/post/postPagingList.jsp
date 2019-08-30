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
<meta name="description" content="">
<meta name="author" content="">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>postPagingList</title>

<!-- css, js -->


<style type="text/css">
#titlee h2, #pzone h2 {
	font-size: 40px;
	font-weight: normal;
	letter-spacing: -1px;
}

#titlee h2 {
	padding: 20px 20px 1px 30px;
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
	width: 25%;
}

th {
	width: 25%;
	text-align: center;
}

.inputTitle {
	border-radius: 6px;
	background-color: transparent;
	width: 180px;
	height: 30px;
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
	width: 30px;
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
	height: 30px;
	margin: 0 auto;
}

.d1 {
	height: 30px;
	background: white;
	position: absolute;
	right: 13%;
	top: 228px;
}

.d1 input {
	width: 100%;
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
	right: 0px;
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
	width: 70px;
	font-size: 11px;
	border-radius: 5px 0px 0px 5px;
	border-top: 2px solid #5ab4dc;
	border-bottom: 2px solid #5ab4dc;
	border-left: 2px solid #5ab4dc;
	border-right: 2px solid #5ab4dc;
}

.title {
	background-color: transparent;
	width: 180px;
	padding: 3px;
	font-size: 8pt;
	text-align: center;
	color: black;
	font-weight: 700;
	min-height: 40px;
	border-radius: 6px;
}
</style>


<script>
	$(document).ready(function() {
		$(".Category").on("click", function() {
			var post_id = $(this).find(".post_id").text();
			$("#post_id").val(post_id);
			$("#frm").submit();
		});

		$("#searchBtn").on("click", function() {
			$("#frm2").submit();
		});

		var searchType = $("#searchType").val();

		if (searchType == null || searchType == 'a') {

			$('#searchType option[value=title]').attr('selected', 'selected');

		} else {

			$("#searchType").val(searchType).prop("selected", true);
			$("#searchType").val().prop("selected", true);

		}

	});
</script>
</head>


<div class="container">

	<div style="padding-top: 100px; width: 1350px;">

		<div class="card">
			<div class="card-body">
				<div class="d1">
					<form class="for" id="frm2" action="${cp}/post/pagingList"
						method="post">
						<select id="searchType" name="searchType"
							style="position: absolute; z-index: 999;">
							<option value="title">제목 검색</option>
							<option value="cont">내용 검색</option>
							<option value="id">아이디 검색</option>
						</select> <input type="hidden" name="cate_id" id="cate_id"
							value="${cate_id}"> <input type="text" name="search"
							id="search">
						<button type="button" id="searchBtn"></button>
					</form>
				</div>


				<div id="titlee">


					<!-- 					<h2> -->
					<%-- 						<c:choose> --%>
					<%-- 							<c:when test="${cate_id eq 30011"> --%>
					<!-- 								<span>공지사항</span> -->
					<%-- 							</c:when> --%>
					<%-- 							<c:when test="${cate_id eq 30012"> --%>
					<!-- 								<span>자유게시판</span> -->
					<%-- 							</c:when> --%>
					<%-- 							<c:otherwise> --%>
					<!-- 								<span>QNA</span> -->
					<%-- 							</c:otherwise> --%>
					<%-- 						</c:choose> --%>
					<!-- 					</h2> -->
					<c:if test="${cate_id eq 30011 }">

						<h2>
							<span>공지사항</span>
							<%-- 							프로그램_관리 cate_id : ${cate_id } --%>
						</h2>

					</c:if>
					<c:if test="${cate_id eq 30012 }">

						<h2>
							<span>자유게시판</span>
							<%-- 							프로그램_관리 cate_id : ${cate_id } --%>
						</h2>

					</c:if>
					<c:if test="${cate_id eq 30013 }">

						<h2>
							<span>QNA</span>
							<%-- 							프로그램_관리 cate_id : ${cate_id } --%>
						</h2>

					</c:if>
				</div>
				<div style="text-align: right; padding-right: 10px;">
					<a class="btn btn-primary btn-sm"
						href="${cp}/post/register?cate_id=${cate_id}">글쓰기</a>&nbsp;

				</div>
				<hr>

				<div class="table-responsive">
					<form id="frm" action="${cp}/post/detail" method="post"
						enctype="multipart/form-data">
						<table class="table center-aligned-table">
							<tr class="text-primary">
								<th>게시글 번호</th>
								<th style="text-align: left;">제목</th>
								<th>작성자 아이디</th>
								<th>작성일시</th>
							</tr>
							<c:set var="number" value="0" />
							<c:forEach items="${postList }" var="post" varStatus="status">
								<c:choose>
									<c:when test="${post.post_del eq 'N' }">
										<tr class="Category" id="${post.post_id }"
											data-post_id="${post.post_id }" style="text-align: center">
											<td class="CategoryId"
												style="text-align: center; width: 200px;"><c:if
													test="${post.post_par eq 0}">
														${((postCnt-status.index+1))-((current-1)*10)}
													</c:if> <c:if test="${post.post_par ne 0 }">
													<c:forEach var="i" begin="0" end="0">
														<c:set var="number" value="${number+1 }" />
													</c:forEach>
												</c:if></td>
											<td style="text-align: left;"><c:if
													test="${post.level > 1 }">
													<c:forEach var="i" begin="1" end="${post.level+1 }"
														step="1">
															&nbsp;&nbsp;
														</c:forEach>
												</c:if>${post.post_nm }</td>
											<td style="text-align: center;">${post.mem_id }</td>
											<td><fmt:formatDate value="${post.post_time }"
													pattern="yyyy-MM-dd" /></td>
											<td class="post_id" style="display: none;">${post.post_id }</td>
										</tr>

										<input type="hidden" name="cate_id" value="${cate_id }">
										<input type="hidden" id="post_id" name="post_id"
											value="${post_id}">

									</c:when>
									<c:otherwise>
										<c:forEach var="i" begin="0" end="0">
											<c:set var="number" value="${number+1 }" />
										</c:forEach>
										<tr>
											<td></td>
											<%-- <td>${post.post_id }</td> --%>
											<td colspan="3">삭제된 게시글입니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</table>

						<input type="hidden" id=searchType value="${searchType}">
					</form>



				</div>
			</div>
		</div>
	</div>
</div>


<div class="demo" style="position: absolute; right: 40%; margin: 10px;">
	<ul class="pagination">
		<c:choose>
			<c:when test="${pageVo.page == 1 }">
				<li class="page-item prev disabled"><a href="#"
					class="page-link" aria-label="Previous"><span
						aria-hidden="true">«</span> </a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link" aria-label="Next"
					href="${cp}/post/pagingList?page=${pageVo.page-1}&pageSize=${pageVo.pageSize}&cate_id=${cate_id}&searchType=${searchType }&search=${search}"><span
						aria-hidden="true">«</span></a></li>
			</c:otherwise>
		</c:choose>

		<c:forEach begin="1" end="${paginationSize}" var="i">
			<c:choose>
				<c:when test="${pageVo.page == i}">
					<li class="page-item active"><a class="page-link" href="#">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="${cp}/post/pagingList?page=${i}&pageSize=${pageVo.pageSize}&cate_id=${cate_id}&current=${i}&postCnt=${postCnt}&searchType=${searchType }&search=${search}">${i}</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${pageVo.page == paginationSize}">
				<li class="page-item next disabled"><a href="#"
					class="page-link" aria-label="Next"><span aria-hidden="true">»</span></a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link" aria-label="Next"
					href="${cp}/post/pagingList?page=${pageVo.page+1}&pageSize=${pageVo.pageSize}&cate_id=${cate_id}&searchType=${searchType }&search=${search}"><span
						aria-hidden="true">»</span></a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>




</body>
</html>

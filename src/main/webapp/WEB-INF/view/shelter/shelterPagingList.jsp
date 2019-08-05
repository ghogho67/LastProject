<%@page import="kr.or.ddit.page.model.PageVo"%>
<%@page import="kr.or.ddit.category.others.shelter.model.ShelterVo"%>
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
<link rel="icon" href="../../favicon.ico">

<title>hospitalPagingList</title>

<!-- css, js -->

<style>
.shTr:hover {
	cursor: pointer;
}
</style>
<script>
	$(document).ready(function() {
		$("#searchBtn").on("click", function() {
			console.log("searchBtn click");
			console.log($("#sh_add").val());
			
// 			var sh_add = $(this).find("#sh_add").text();
// 			$("#sh_add").val(sh_add);
			
			$("#frm2").submit();
		});
		
		$(".shTr").on("click", function(){
			console.log("shTr click");
			
			var sh_id = $(this).find(".sh_id").text();
			$("#sh_id").val(sh_id);
			$("#frm").attr("action", "${cp}/shelter/detailShelter");
			$("#frm").attr("method", "get");
			$("#frm").submit();
		});


	});




</script>
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="row">
					<div class="col-sm-8 blog-main">
						<h2 class="sub-header">무더위 쉼터 <br> <br></h2>
							
					      <!-- 검색 -->
		                  <div class="d1">
		                  	<form id="frm2" action="${cp}/shelter/searchShelter" method="post" >
							 		<input type="text" placeholder="동 단위로 검색하세요" name="sh_add" id="sh_add">
							  	<button type="button" id="searchBtn"></button>
							  </form>
						  </div>
					
					
						<form id="frm" action="${cp}/shelter/searchShelter" method="get">
							<input type="hidden" class="sh_id" id="sh_id" name="sh_id">

							<div class="table-responsive">
								<table class="table table-striped">
									<tr>
										<th>쉼터아이디</th>
										<th>쉼터이름</th>
										<th>쉼터주소</th>
										<th>운영시작일</th>
										<th>운영종료일</th>
									</tr>
									<c:forEach items="${cwMatList }" var="vo" varStatus="status">
										<tr class="shTr" data-sh_id="${vo.sh_id }">
											<td class="sh_id">${vo.sh_id }</td>
											<td>${vo.sh_nm }</td>
											<td>${vo.sh_add }</td>
											<td>${vo.sh_st_dt }</td>
											<td>${vo.sh_end_dt }</td>
										</tr>
									</c:forEach>
								</table>
							</div>
							
						
						<!-- 페이지네이션 -->
							<div class="text-center">
								<ul class="pagination">
									<c:choose>
										<c:when test="${pageVo.page == 1 }">
											<li class="disabled"><span>«</span></li>
										</c:when>
										<c:otherwise>
											<li><a href="${cp}/shelter/pagingList?page=${pageVo.page-1}&pageSize=${pageVo.pageSize}">«</a></li>
										</c:otherwise>
									</c:choose>
									
									<c:forEach begin="1" end="${paginationSize}" var="i">
										<c:choose>
											<c:when test="${pageVo.page == i}">
												<li class="active"><span>${i}</span></li>
											</c:when>
											<c:otherwise>
												<li><a href="${cp}/shelter/pagingList?page=${i}&pageSize=${pageVo.pageSize}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									
									<c:choose>
										<c:when test="${pageVo.page == paginationSize}">
											<li class="disabled"><span>»</span></li>
										</c:when>
										<c:otherwise>
											<li><a href="${cp}/shelter/pagingList?page=${pageVo.page+1}&pageSize=${pageVo.pageSize}">»</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

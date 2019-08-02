<%@page import="kr.or.ddit.page.model.PageVo"%>
<%@page import="kr.or.ddit.member.careWorker.hospital.model.HospitalVo"%>
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

<script>
	$(document).ready(function() {
		$("#searchBtn").on("click", function() {
			console.log("searchBtn click");
			console.log($("#hos_add").val());
			
// 			var hos_add = $(this).find("#hos_add").text();
// 			$("#hos_add").val(hos_add);
			
			$("#frm2").submit();
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
						<h2 class="sub-header">
							요양기관, 병원 정보 <br> <br>
						</h2>
							
					      <!-- 검색 -->
		                  <div class="d1">
		                  	<form id="frm2" action="${cp}/hospital/searchHospital" method="post" >
							 		<input type="text" placeholder="구 단위로 검색하세요" name="hos_add" id="hos_add">
							  	<button type="button" id="searchBtn"></button>
							  </form>
						  </div>
					
					
						<form id="frm" action="${cp}/hospital/searchHospital" method="get">
<!-- 							<input type="hidden" class="hos_id" id="hos_id" name="hos_id"> -->
<%-- 							<input type="hidden" name="hos_add" id="hos_add" value="${hos_add }"> --%>

							<div class="table-responsive">
								<table class="table table-striped">
									<tr>
										<th>병원아이디</th>
										<th>병원이름</th>
										<th>병원주소</th>
										<th>병원 전화번호</th>
									</tr>
									<c:forEach items="${hosList }" var="vo" varStatus="status">
										<tr class="hosTr" data-hos_id="${vo.hos_id }">
											<td calss="hos_id">${vo.hos_id }</td>
											<td>${vo.hos_nm }</td>
											<td>${vo.hos_add }</td>
											<td>${vo.hos_phone }</td>
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
											<li><a href="${cp}/hospital/pagingList?page=${pageVo.page-1}&pageSize=${pageVo.pageSize}">«</a></li>
										</c:otherwise>
									</c:choose>
									
									<c:forEach begin="1" end="${paginationSize}" var="i">
										<c:choose>
											<c:when test="${pageVo.page == i}">
												<li class="active"><span>${i}</span></li>
											</c:when>
											<c:otherwise>
												<li><a href="${cp}/hospital/pagingList?page=${i}&pageSize=${pageVo.pageSize}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									
									<c:choose>
										<c:when test="${pageVo.page == paginationSize}">
											<li class="disabled"><span>»</span></li>
										</c:when>
										<c:otherwise>
											<li><a href="${cp}/hospital/pagingList?page=${pageVo.page+1}&pageSize=${pageVo.pageSize}">»</a></li>
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

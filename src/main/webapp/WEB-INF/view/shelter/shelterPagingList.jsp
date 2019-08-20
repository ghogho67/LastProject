<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BasicSubPage</title>
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
	color: #006266;
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
	background-color: #006266;
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
	background: linear-gradient(135deg, transparent 49%, #006266 50%);
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
	border: 2px solid #7BA7AB;
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
	background: #7BA7AB;
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
	border-top: 2px solid #7BA7AB;
	border-bottom: 2px solid #7BA7AB;
	border-left: 2px solid #7BA7AB;
	border-right: 2px solid #7BA7AB;
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
	
	function boardPagingListAjaxHtml(page, pageSize) {
		$("#page").val(page);
		$("#pageSize").val(pageSize);
		$("#pageForm").submit();
		
		}
</script>

</head>

<body>

	<%@include file="/WEB-INF/view/common/subPageheader.jsp"%>
	<%@include file="/WEB-INF/view/common/subPagesideBar.jsp"%>
	
	<form id="pageForm" action="${cp}/shelter/pagingList">
	 	<input type="hidden" name = "page" id="page">
	 	<input type="hidden" name = "pageSize" id="pageSize">
	 </form>

	<div class="container">
		<div style="padding-top: 50px; width: 1250px;">
			<div class="card">
				<div class="card-body">
					
					<div class="d1">
							<form class="for" id="frm2" action="${cp}/shelter/searchShelter" method="post">
								<select id="searchType" name="searchType"
									style="position: absolute; z-index: 999;">
									<option value="all">동 검색</option>
								</select> <input type="text" placeholder="동을 입력해 주세요" name="sh_add" id="sh_add">
								<button type="button" id="searchBtn"></button>
							</form>
						</div>
					
					<div id="titlee">
						<h2>
							<span>무더위 쉼터</span>
						</h2>
					</div>
						
						
					<hr>
					<form id="frm" action="${cp}/shelter/searchShelter" method="get">
						<input type="hidden" class="sh_id" id="sh_id" name="sh_id">
					<div class="table-responsive">
						<table class="table center-aligned-table">
							<thead>
							<tr>
								<th>NO</th>
<!-- 								<th>쉼터아이디</th> -->
								<th>쉼터이름</th>
								<th>쉼터주소</th>
								<th>운영시작일</th>
								<th>운영종료일</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${shelterList }" var="vo" varStatus="status">
								<tr class="shTr" data-sh_id="${vo.sh_id }">
									<td>${vo.rn }</td>
<%-- 									<td class="sh_id">${vo.sh_id }</td> --%>
									<td>${vo.sh_nm }</td>
									<td>${vo.sh_add }</td>
									<td>${vo.sh_st_dt }</td>
									<td>${vo.sh_end_dt }</td>
								</tr>
							</c:forEach>
							</tbody>
							
						</table>
						
					</div>
					
					
			
					
					</form>
					
					
				</div>
			</div>
			
			<!-- 페이지 네이션 -->
			<div class="demo" style="position: absolute; right: 20%;">
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
	

</body>
</html>
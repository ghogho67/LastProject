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
}

.pagination li a.page-link {
	color: #5ab4dc;
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
		background-color: transparent;
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
	/*    left : 2px; */
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

		$("#searchType").val("${searchType}").prop("selected", true);
		$("#searchVal").val("${searchVal}");

		$("#searchType").change("on", function() {

			$("#saerchVal").attr("placeholder", "/19/07/30형식으로 기입");

		});

		$("#searchBtn").on("click", function() {
			// 				var data = $("#searchList").serialize();
			// 				console.log(data);
			// 				$.ajax({
			// 					type: "POST",
			// 					url : "${cp}/approval/search",
			// 					data : data,
			// 					success : function(data){
			// 						alert("success");
			// 						console.log(data);
			// 					},
			// 				error : function(xhr){
			// 						alert(xhr.status);

			// 				}
			// 			 });
			$("#searchList").submit();

		});
		$("#searchType").change(function(){
			
			 var a = this.value;
			 if(a == 'type'){
				 $("#searchVal").attr('placeholder','Ex)매칭,기부,골드(가입)');
			 }else{
				 $("#searchVal").attr('placeholder','Ex)19/07/30');
			 }

		});

	});

	function boardPagingListAjaxHtml(page, pageSize) {
		$("#page").val(page);
		$("#pageSize").val(pageSize);
		$("#searchList").submit();

	}
</script>




</head>

<body>


	<div class="content-wrapper">

		<div class="col-lg-12">

			<div class="card">
				<div class="card-body">

					<div class="d1">
						<form id="searchList" class="for"
							action="${cp}/approval/approvalCheck">

							<select id="searchType" name="searchType"
								style="position: absolute; z-index: 999;">
								<option value="day">날짜</option>
								<option value="type">결제구분</option>
							</select> <input id="searchVal" name="searchVal" type="text"
								placeholder="Ex)매칭,기부,골드(가입)"><br> <input
								type="hidden" name="page" id="page" value="1"> <input
								type="hidden" name="pageSize" id="pageSize" value="10">
							<button id="searchBtn" name="searchBtn" type="button"></button>
						</form>
					</div>

					<div id="titlee">
						<h2>
							<span>결재내역</span>&nbsp;골드회원 및 일반회원
						</h2>
					</div>
					<hr>
					<div class="table-responsive">
						<table class="table center-aligned-table">
							<thead>
								<tr class="text-primary">
									<th>NO.</th>
									<th>결제구분</th>
									<th>결제금액</th>
									<th>결제시간</th>
									<th>결제자</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${appVo }" var="vo" varStatus="status">
									<tr>
										<td>${vo.rn}</td>
										<td><c:choose>
												<c:when test="${vo.app_type eq 1}">
													매칭
												</c:when>
												<c:when test="${vo.app_type eq 2}">
												 	골드가입
												</c:when>
												<c:when test="${vo.app_type eq 3}">
												 	기부
												</c:when>

											</c:choose></td>
											<td><c:choose>
												<c:when test="${vo.app_type eq 1}">
													${vo.app_pay *10}
												</c:when>
												<c:when test="${vo.app_type eq 2}">
												 	${vo.app_pay}
												</c:when>
												<c:when test="${vo.app_type eq 3}">
												 	${vo.app_pay}
												</c:when>

											</c:choose></td>
										
										<td><fmt:formatDate value="${vo.app_time }"
												pattern="yyyy.MM.dd HH:mm:ss" /></td>
										<td>${vo.mem_id }</td>
									</tr>
								</c:forEach>


							</tbody>
						</table>




					</div>
				</div>
				</div>

		<div class="demo" style="position: absolute; right: 38%;">
			<nav class="pagination-outer" aria-label="Page navigation">
				<ul class="pagination">
					<c:choose>
						<c:when test="${pageVo.page==1 || pageVo.page==0}">
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
								<li class="page-item active"><a class="page-link" href="#">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li><a class="page-link"
									href="javascript:boardPagingListAjaxHtml(${i}, ${pageVo.pageSize});">${i}</a></li>
							</c:otherwise>
						</c:choose>

					</c:forEach>

					<c:choose>
						<c:when test="${pageVo.page == lastpaginationSize || lastpaginationSize==0}">
							<li class="page-item next disabled"><a href="#"
								class="page-link" aria-label="Next"> <span
									aria-hidden="true">›</span>
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" aria-label="Next"
								href="javascript:boardPagingListAjaxHtml(${pageVo.page+1}, ${pageVo.pageSize});"><span
									aria-hidden="true">› </span></a></li>
						</c:otherwise>
					</c:choose>


					<c:choose>
						<c:when test="${pageVo.page == lastpaginationSize || lastpaginationSize==0}">
							<li class="page-item next disabled"><a href="#"
								class="page-link" aria-label="Next"><span aria-hidden="true">»</span></a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" aria-label="Next"
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
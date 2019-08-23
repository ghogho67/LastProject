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
	padding: 5px 25px;
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



<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	//구글 chart API
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {

		var data = google.visualization.arrayToDataTable([
				[ 'member', 'mem_grade' ], [ '관리자', parseInt("${manager}") ],
				[ '일반회원', parseInt("${nomalMember}") ],
				[ '골드회원', parseInt("${goldMember}") ],
				[ '요양보호사', parseInt("${careWorker}") ] ]);

		var options = {
			title : '회원 분류 pie Chart'
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('piechart'));

		chart.draw(data, options);
	}

	//pagenation
	function boardPagingListAjaxHtml(page, pageSize) {
		$("#page").val(page);
		$("#pageSize").val(pageSize);
		$("#pageForm").submit();

	}
</script>

</head>

<body>

	<form id="pageForm" action="${cp}/mypage/pagingList">
		<input type="hidden" name="page" id="page"> <input
			type="hidden" name="pageSize" id="pageSize">
	</form>


	<div class="content-wrapper">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">

					<div id="titlee">
						<h2>
							<span>회원관리</span>&nbsp;
						</h2>
					</div>
					<hr>

					<div class="row">

						<div class="col-lg-7" style="margin-left: 10px;">


							<div class="table-responsive">
								<table class="table center-aligned-table">
									<thead>
										<tr>
											<th>NO</th>
											<th>회원아이디</th>
											<th>회원이름</th>
											<th>생년월일</th>
											<th>성별</th>
											<th>연락처</th>
											<th>회원등급</th>
											<th>탈퇴여부</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${getMemList }" var="vo" varStatus="status">
											<tr class="memTr" data-mem_id="${vo.mem_id }">
												<th>${vo.rn }</th>
												<td class="mem_id">${vo.mem_id }</td>
												<td>${vo.mem_nm }</td>
												<td>${vo.mem_birth }</td>
												<td>${vo.mem_gender }</td>
												<td>${vo.mem_phone }</td>
												<td>${vo.mem_grade }</td>
												<td>${vo.mem_del}</td>
											</tr>
										</c:forEach>
									</tbody>

								</table>
							</div>
						</div>
						<div class="col-lg-4 posts-list">
							<div id="piechart" style="width: 600px; height: 400px; background-color: transparent;">
								<input type="hidden" name="manager" id="manager"> <input
									type="hidden" name="nomalMember" id="nomalMember"> <input
									type="hidden" name="goldMember" id="goldMember"> <input
									type="hidden" name="careWorker" id="careWorker">

							</div>
						</div>



					</div>
				</div>
				<div class="demo" style="position: absolute; right: 30%; top: 91%">
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
</body>
</html>
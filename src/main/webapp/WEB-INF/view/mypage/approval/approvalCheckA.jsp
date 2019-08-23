<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강좌상세</title>

<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>
<%@include file="/WEB-INF/view/common/LibForMypage.jsp"%>


<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);

font-family: 'Noto Sans KR ', sans-serif ; #titlee h2, #pzone h2 {
	font-size: 40px;
	font-weight: normal;
	letter-spacing: -1px;
}

#titlee h2 {
	padding: 5px 5px;
}

#titlee h2 span {
	font-weight: bold;
	color: #473fa0;
}

p {
	font-family: 'Noto Sans KR', sans-serif;
	letter-spacing: 1px;
	line-height: 1.6em
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
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dnxk8c7baj&submodules=geocoder"></script>

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
				[ 'member', 'mem_grade' ],
				[ '일반회원', parseInt("${nomalMember}") ],
				[ '골드회원', parseInt("${goldMember}") ],
				[ '요양보호사', parseInt("${careWorker}") ] ]);

		var options = {
			title : '회원 분류별 결제 금액 pie Chart'
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('piechart'));

		chart.draw(data, options);

	}

	//-----------------------

	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart1);

	function drawChart1() {

		var data1 = google.visualization.arrayToDataTable([
				[ 'totalCount', 'mem_grade' ],
				[ '일반회원', parseInt("${nomalmember}") ],
				[ '골드회원', parseInt("${goldmember}") ],
				[ '요양보호사', parseInt("${careworker}") ] ]);

		var options1 = {
			title : '전체 매출중 등급별 비율 pie Chart'
		};

		var chart1 = new google.visualization.PieChart(document
				.getElementById('piechart1'));

		chart1.draw(data1, options1);

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



	<div class="content-wrapper">
		<div class="col-lg-12">
			<div class="card">
				>
				<div class="card-body">

					<div id="titlee">
						<h2>
							<span>결산 관리</span>&nbsp;
						</h2>
					</div>
					<hr>

					<div class="row">


						<div class="col-lg-7" style="margin-left: 10px;">
							<div class="blog_right_sidebar">


								<form id="searchList" class="for"
									action="${cp}/approval/approvalCheckA" method="get">
									<input type="hidden" class="app_id" id="app_id" name="app_id">
									<input type="hidden" class="mem_id" id="mem_id" name="mem_id">
									<div class="table-responsive">
										<table class="table center-aligned-table">
											<thead>
												<tr>
													<th>NO.</th>
													<th>결제자 아이디</th>
													<th>결제자 이름</th>
													<th>결제금액</th>
													<th>회원등급</th>
													<th>결제시간</th>
													<th>결제구분</th>
													<th>결제 대상자</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${memberApprovalAllList }" var="vo"
													varStatus="status">
													<tr>
														<td>${vo.rn}</td>
														<td>${vo.mem_id }</td>
														<td>${vo.mem_nm }</td>
														<td>${vo.app_pay}</td>
														<td>${vo.mem_grade}</td>
														<td><fmt:formatDate value="${vo.app_time }"
																pattern="yyyy.MM.dd HH:mm:ss" /></td>
														<td>${vo.app_type}</td>
														<td>${vo.app_obj}</td>
													</tr>
												</c:forEach>
											</tbody>

										</table>
									</div>



								</form>

							</div>




						</div>




						<div class="col-lg-4 posts-list">
							<div class="single-post row">

								<!-- 구글Chart API - 회원별 비중-->
								<div id="piechart" style="width: 470px; height: 350px;"></div>
								<input type="hidden" name="manager" id="manager"> <input
									type="hidden" name="nomalMember" id="nomalMember"> <input
									type="hidden" name="goldMember" id="goldMember"> <input
									type="hidden" name="careWorker" id="careWorker">


								<!-- 구글Chart API 매출중 회원별 비율(관리자)-->
								<div id="piechart1" style="width: 470px; height: 350px;"></div>
								<input type="hidden" name="nomalmember" id="nomalmember">
								<input type="hidden" name="goldMember" id="goldmember">
								<input type="hidden" name="careWorker" id="careworker">

							</div>
						</div>

					</div>

				</div>

				<div class="demo" style="position: absolute; right: 29%; top: 93%;">
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






</body>
</html>
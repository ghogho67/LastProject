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
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css); font-family: 'Noto Sans KR', sans-serif;
#titlee h2, #pzone h2 {
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
line-height:1.6em
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dnxk8c7baj&submodules=geocoder"></script>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

//구글 chart API
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
	
 
	var data = google.visualization.arrayToDataTable([
		['member', 'mem_grade'],
		 ['일반회원',  parseInt("${nomalMember}")],
		 ['골드회원', parseInt("${goldMember}")],
		 ['요양보호사',    parseInt("${careWorker}")]
	]
  );

  var options = {
		  title: '회원 분류별 결제 금액 pie Chart'
  };

  var chart = new google.visualization.PieChart(document.getElementById('piechart'));

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


	<%@include file="/WEB-INF/view/common/subPageheader.jsp"%>
	<%@include file="/WEB-INF/view/common/subPagesideBar.jsp"%>

	<div class="container">
		<div style="padding-top: 50px; width: 1350px;">

			<div class="card">
				<div class="card-body">

					<div id="titlee">
							<h2>
								<span>결산 관리</span>&nbsp;
							</h2>
						</div>
					<hr>

					<div class="container">
						<div class="row">


							<div class="col-lg-7">
								<div class="blog_right_sidebar">
						
						
								<form id="searchList" class="for" action="${cp}/approval/approvalCheckA" method="get">
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
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${memberApprovalAllList }" var="vo" varStatus="status">
								<tr>
									<td>${vo.rn}</td>
									<td>${vo.mem_id }</td>
									<td>${vo.mem_nm }</td>
									<td>${vo.app_pay}</td>
									<td>${vo.mem_grade}</td>
									<td><fmt:formatDate value="${vo.app_time }"
											pattern="yyyy.MM.dd HH:mm:ss" /></td>
									<td>${vo.app_type}</td>
								</tr>
							</c:forEach>
							</tbody>
							
						</table>
					</div>
					
					
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

					</form>

				</div>
				
				
				
			</div>




							<div class="col-lg-5 posts-list">
								<div class="single-post row">

									<!-- 구글Chart API -->
<!-- 									<div id="piechart" style="width: 1000px; height: 500px;"></div> -->
									<div id="piechart" style="width: 470px; height: 500px;"></div>
									<input type="hidden" name = "manager" id="manager">
									<input type="hidden" name = "goldMember" id="goldMember">
									<input type="hidden" name = "careWorker" id="careWorker">
									
								</div>
							</div>

						</div>

					</div>
				</div>






			</div>
		</div>
	</div>






</body>
</html>
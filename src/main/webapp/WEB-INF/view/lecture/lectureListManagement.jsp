<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<style type="text/css">
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

tr {
	text-align: center;
	font-weight: 500;
}

td {
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
	height: 30px;
	margin: 0 auto;
}

.d1 {
	height: 30px;
	background: white;
	position: absolute;
	right: 1%;
	top: 75px;
}

.d1 input {
	width: 100%;
	height: 30px;
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
	right: 0px;
	width: 32px;
	height: 30px;
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
	height: 30px;
	width: 70px;
	font-size: 11px;
	border-radius: 5px 0px 0px 5px;
	border-top: 2px solid #7BA7AB;
	border-bottom: 2px solid #7BA7AB;
	border-left: 2px solid #7BA7AB;
	border-right: 2px solid #7BA7AB;
}
</style>




<script>
	$(document).ready(function() {

		$(".kkk").on("click", function() {

			$("#frm").submit();
		});

	});
</script>

</head>
<body>


	<%@include file="/WEB-INF/view/common/subPageheader.jsp"%>
	<%@include file="/WEB-INF/view/common/subPagesideBar.jsp"%>


<form id="frm" action="${cp}/lecture/lecture" method="get">
		<input type="hidden" id="lectureId" name="lectureId">
	</form>


	<div class="container">




		<div style="padding-top: 50px; width: 1350px;">



			<div class="card">
				<div class="card-body">

					<div id="titlee">
						<h2>
							<span>학습.문화</span> 프로그램_관리
						</h2>
					</div>
						<div style="text-align: right;">
							<a class="btn btn-warning btn-sm" href="${cp}/lecture/Insertlecture">강좌추가
									</a>
							
    </div>

				
					<hr>

					<div class="table-responsive">
						<table class="table center-aligned-table">
							<thead>
								<tr class="text-primary">
									<th>강좌코드</th>
									<th>강좌 명</th>
									<th>강사명</th>
									<th>수강료</th>
									<th>학습 시작일</th>
									<th>학습 종료일</th>
									<th>학습 시간</th>
									<th>수강인원</th>
									<th>&nbsp;&nbsp;사용상태&nbsp;&nbsp;</th>
									<th>&nbsp;&nbsp;관리&nbsp;&nbsp;</th>
									<th>&nbsp;&nbsp;사용여부변경&nbsp;&nbsp;</th>
								</tr>
							</thead>


							<tbody>
								<c:forEach items="${LList}" var="LTList">
									<tr class="Lecture" data-userid="lectureId">

										<td class="LectureId" id="LectureId" name="LectureId">${LTList.lec_id}</td>
										<td>${LTList.lec_nm}</td>
										<td>${LTList.lec_tea}</td>
										<td>${LTList.lec_fee}</td>
										<td><fmt:formatDate value="${LTList.lec_st_dt}"
												pattern="yyyy-MM-dd" /></td>
										<td><fmt:formatDate value="${LTList.lec_end_dt}"
												pattern="yyyy-MM-dd" /></td>
										<td>${LTList.lec_time}</td>
										<td>${LTList.lec_amount}</td>
										
												<c:choose>
												<c:when test="${LTList.lec_use=='Y'}">
													<td><label class="badge badge-success">&nbsp;&nbsp;&nbsp;사용&nbsp;&nbsp;&nbsp;</label></td>
												</c:when>
												<c:otherwise>
													<td><label class="badge badge-danger">사용안함</label></td>
												</c:otherwise>
											</c:choose>
											<td><a
												href="${cp}/lecture/modifyLecture?lec_id=${LTList.lec_id}"
												class="btn btn-primary btn-sm">강좌수정</a></td>
											<c:choose>
												<c:when test="${LTList.lec_use=='Y'}">
													<td><a
														href="${cp}/lecture/lectureDelete?lec_id=${LTList.lec_id}"
														onclick="return confirm('해당강좌를  삭제하시겠습니까?')"
														class="btn btn-outline-danger btn-sm">&nbsp;&nbsp;&nbsp;삭제&nbsp;&nbsp;&nbsp;</a></td>
												</c:when>
												<c:otherwise>
													<td><a
														href="${cp}/lecture/lectureUse?lec_id=${LTList.lec_id}"
														onclick="return confirm('해당강좌를 사용 하시겠습니까?')"
														class="btn btn-outline-primary btn-sm">&nbsp;&nbsp;&nbsp;사용&nbsp;&nbsp;&nbsp;</a></td>
												</c:otherwise>
											</c:choose>
												
									</tr>

								</c:forEach>

							</tbody>


						</table>


				

					

					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="demo" style="position: absolute; right: 40%;">
		<nav class="pagination-outer" aria-label="Page navigation">
			<ul class="pagination">
				<li class="page-item"><a href="#" class="page-link"
					aria-label="Previous"> <span aria-hidden="true">«</span>
				</a></li>
				<li class="page-item  active"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">4</a></li>
				<li class="page-item"><a class="page-link" href="#">5</a></li>
				<li class="page-item"><a href="#" class="page-link"
					aria-label="Next"> <span aria-hidden="true">»</span>
				</a></li>
			</ul>
		</nav>
	</div>




</body>
</html>
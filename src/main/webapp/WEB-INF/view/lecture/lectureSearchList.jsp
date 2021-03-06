<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@page import="java.util.Date" %>
    <%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감좌 검색목록</title>



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
	right: 10%;
	top: 175px;
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
</style>


</head>
<body>



	<form id="pageForm" action="${cp}/lecture/lectureListALL">
	 	<input type="hidden" name = "page" id="page">
	 	<input type="hidden" name = "pageSize" id="pageSize">
	 </form>

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
							강좌[<span>${keyword}</span>] 검색결과
						</h2>
					</div>

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
								</tr>
							</thead>


							<tbody>
								<c:forEach items="${LList}" var="LTList">
									<tr class="lectureTr" data-userid="${LTList.lec_id}">
										<td class="lectureId" id="lectureId" name="lectureId">${LTList.lec_id}</td>
										<td>${LTList.lec_nm}</td>
										<td>${LTList.lec_tea}</td>
										<td>${LTList.lec_fee}</td>
										<td><fmt:formatDate value="${LTList.lec_st_dt}"
												pattern="yyyy-MM-dd" /></td>
										<td><fmt:formatDate value="${LTList.lec_end_dt}"
												pattern="yyyy-MM-dd" /></td>
										<td>${LTList.lec_time}</td>
										<td>${LTList.lec_amount}</td>
										
										

									
									
									</tr>

								</c:forEach>

							</tbody>


						</table>
						
						
						<c:if test="${memgrade==0}">
						<div style="text-align: right;">
							<a class="btn btn-warning btn-sm" href="${cp}/lecture/lectureListManagement">강좌관리
									</a>
							
</div>

						</c:if>
						
						




					</div>
				</div>
			</div>
		</div>
	</div>





<script>
	
		
		$(".lectureTr").on("click", function() {
			var lectureId = $(this).find(".lectureId").text();
			$("#lectureId").val(lectureId);
			$("#frm").submit();
		});

	
		
		function boardPagingListAjaxHtml(page, pageSize) {
			$("#page").val(page);
			$("#pageSize").val(pageSize);
			$("#pageForm").submit();
			
			}
		
		
		$("#searchBtn").on("click", function() {
			if ($('#keyword').val().length == 0) {
				alert("검색어를 입력해주세요");
				return;
			} else {  
				$("#form3").submit();
			}
		});
		
</script>



</body>
</html>
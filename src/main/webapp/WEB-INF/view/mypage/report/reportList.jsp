
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<%@include file="/WEB-INF/view/common/LibForMypage.jsp"%>
<%@include file="/WEB-INF/view/common/LibForWebpage2.jsp"%>


<style>

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
	right: 21%;
}

.d1 input {
	width: 100%;
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
	right: 0px;
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
	width: 70px;
	font-size: 15px;
	border-radius: 5px 0px 0px 5px;
	border-top: 2px solid #7BA7AB;
	border-bottom: 2px solid #7BA7AB;
	border-left: 2px solid #7BA7AB;
	border-right: 2px solid #7BA7AB;
}
</style>



<script>
	$(document).ready(function() {

		//사용자 테그 이벤트 등록
		$(".reportTr").on("click", function() {
			var reportId = $(this).find(".reportId").text();
			$("#reportId").val(reportId);
			$("#frm").submit();
		});

		
		//보고서 작성용
// 		$("#post").on("click", function() {
// 			$("#frm2").submit();
// 		})

		$("#searchBtn").on("click", function() {
			if ($('#keyword').val().length == 0) {
				alert("검색어를 입력해주세요");
				return;
			} else {
				$("#frm3").submit();
			}
		});

	});
</script>

</head>
<body>
	<%@include file="/WEB-INF/view/common/mypage/navigationBar.jsp"%>



<c:choose>
 
    <c:when test="${MEM_INFO.mem_grade==0}">
      <%@include file="/WEB-INF/view/common/mypage/sidebarA.jsp"%>

    </c:when>
 
    <c:when test="${MEM_INFO.mem_grade==3}">
     <%@include file="/WEB-INF/view/common/mypage/sidebarW.jsp"%>

    </c:when>
 
    <c:otherwise>
       <%@include file="/WEB-INF/view/common/mypage/sidebarP.jsp"%>

    </c:otherwise>
 
</c:choose>





	<form id="frm" action="${cp}/report/report" method="get">
		<input type="hidden" id="reportId" name="reportId">
		<input type="hidden" id="memid" name="memid" value="${MEM_INFO.mem_id}">
		<input type="hidden" id="memgrade" name="memgrade" value="${MEM_INFO.mem_grade}">
	</form>


<!-- 글쓰기용 -->
<%-- 	<form id="frm2" action="${cp}/report/reportForm" method="get"> --%>
<%-- 		<input type="hidden" id="boardid" name="boardid" value="${boardid}"> --%>
<!-- 	</form> -->



	<div class="content-wrapper">

		<div class="row mb-4">


			<div class="col-lg-12">
				<h3 class="accept-title">&nbsp;&nbsp;&nbsp;내 보고서조회</h3>
				<div class="card">
					<div class="card-body">
						<div class="row">

							<section class="board-list">

								<div class="board-top">
		

									<p class="board-count" style="margin-left: 200px;">
										총 <span class="education-board-cnt ng-binding">24</span>개의 보고서
									</p>



									<div class="d1">
										<form class="for">

											<select id="searchType" name="searchType"
												style="position: absolute; z-index: 999;">
												<option value="all">전체</option>
												<option value="title">제목</option>
												<option value="content">내용</option>
												<option value="writer">작성자</option>
												<option value="tc">제목+내용</option>
											</select> <input type="text" placeholder="검색어 입력"
												style="position: absolute; top: 0px; right: 0px;">
											<button type="submit"></button>
										</form>
									</div>

								</div>

								<!-- 게시글리스트 시작 -->
								<div class="board-list-in">
									<table class="education-table" style="margin-left: 200px;">


										<colgroup>
											<col style="width: 10%">
											<col style="width: 40%" class="ng-scope">
											<col style="width: 20%">
											<col style="width: 20%">
											<col style="width: 10%">
										</colgroup>

										<thead>
											<tr>
												<th scope="col">보고서 아이디</th>
												<th scope="col">제목</th>
												<th scope="col" class="hidden-xs">담당요양보호사</th>
												<th scope="col">매칭시작일</th>
												<th scope="col" class="border-no1 hidden-xs">등록일</th>
											</tr>
										</thead>

										<tbody>







											<c:forEach items="${reportlist}" var="report">

												<tr class="reportTr" data-userid="${report.rep_id}">
													<td class="reportId">${report.rep_id}</td>
													<td>${report.rep_title}</td>
													<td>${report.cw_mem_id}</td>
													<td>${report.mat_st}</td>
													<td>${report.rep_time}</td>
												</tr>
											</c:forEach>








										</tbody>
									</table>
								</div>

								<br> <a href="#" class="genric-btn success medium"
									style="position: absolute; left: 74%;">글쓰기</a> <br> <br>


								<div class="demo" style="position: absolute; right: 40%;">
									<nav class="pagination-outer" aria-label="Page navigation">
										<ul class="pagination">
											<li class="page-item"><a href="#" class="page-link"
												aria-label="Previous"> <span aria-hidden="true">«</span>
											</a></li>
											<li class="page-item  active"><a class="page-link"
												href="#">1</a></li>
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

								<br> <br> <br>


							</section>














						</div>
					</div>
				</div>

			</div>
		</div>
	</div>





</body>
</html>
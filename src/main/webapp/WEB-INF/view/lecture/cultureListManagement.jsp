<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>문화센터관리</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style type="text/css">
#titlee h2, #pzone h2 {
	font-size: 40px;
	font-weight: normal;
	letter-spacing: -1px;
}

#titlee h2 {
	padding: 20px 20px 1px 30px;
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
	right: 1%;
	top: 75px;
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

.title {
	background-color: transparent;
	width: 180px;
	padding: 3px;
	font-size: 8pt;
	text-align: center;
	color: black;
	font-weight: 700;
	min-height: 40px;
	border-radius: 6px;
}
</style>



</head>
<body>


	<%@include file="/WEB-INF/view/common/subPageheader.jsp"%>
	<%@include file="/WEB-INF/view/common/subPagesideBarADMIN.jsp"%>


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
					<div style="text-align: right; padding-right: 10px;">

						<button type="button" class="btn btn-warning btn-sm"
							data-toggle="modal" data-target="#myModalCulture">문화센터
							추가</button>

					</div>


					<hr>

					<div class="table-responsive">
						<table class="table center-aligned-table">
							<thead>
								<tr class="text-primary">
									<th>문화센터 코드</th>
									<th>문화센터 명</th>
									<th>문화센터 주소</th>
									<th>번호</th>
									<th>&nbsp;&nbsp;사용여부변경&nbsp;&nbsp;</th>
								</tr>
							</thead>


							<tbody>
								<c:forEach items="${LList}" var="LTList">
									<tr class="culture" data-userid="cultureId">

										<td class="cultureId" id="LectureId" name="cultureId">${LTList.culture_id}</td>
										<td>${LTList.culture_type}</td>
										<td>${LTList.culture_add}</td>
										<td>${LTList.culture_phone}</td>
										<td><a
											href="${cp}/lecture/cultureDelete?culture_id=${LTList.culture_id}"
											onclick="return confirm('해당 문화센터를 삭제하시겠습니까? 삭제하시면 절대 복구가 불가능 합니다')"
											class="btn btn-outline-danger btn-sm">&nbsp;&nbsp;&nbsp;삭제&nbsp;&nbsp;&nbsp;</a></td>


									</tr>

								</c:forEach>

							</tbody>


						</table>






					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- Modal -->

	<form id="frm2" action="/lecture/InsertCulture" method="post">
		<div class="modal fade" id="myModalCulture" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel"
			style="padding: 50px; z-index: 1400">
			<div class="modal-dialog" role="document">
				<div class="modal-content3">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">문화센터 추가</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>


					<div >
						<div>
							<table>

								<tr>
									<td><span>문화센터명</span></td>
									<td><input type="text" id="culture_type" class="title"
										name="culture_type"> <br></td>


								</tr>
								<tr>
									<td><span>문화센터 번호</span></td>
									<td><input class="title" type="text" id="culture_phone"
										name="culture_phone"> <br></td>



								</tr>
								<tr>
									<td><span>문화센터주소</span></td>
									<td><input class="title" type="text" id="cultureadd"
										name="cultureadd" readonly="readonly"></td>
									<td>
										<button type="button" id="addrSearchbtn"
											class="btn btn-default pull-right">주소 검색</button>
									</td>


								</tr>

							</table>





						</div>

						<div class="col-sm-2"></div>

					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-outline-danger" id="inserBtn" data-dismiss="modal">추가</button>
					</div>
				</div>
			</div>
		</div>

	</form>

	<script>
		$(".kkk").on("click", function() {

			$("#frm").submit();
		});

		$("#inserBtn").on("click", function() {

			$("#frm2").submit();
		});

		$('#addrSearchbtn').on('click', function() {
			new daum.Postcode({
				oncomplete : function(data) {
					$('#cultureadd').val(data.roadAddress);
				}
			}).open();
		});
	</script>



</body>
</html>
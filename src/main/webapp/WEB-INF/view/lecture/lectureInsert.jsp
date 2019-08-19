<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


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

	<form action="${cp}/lecture/Insertlecture" method="post">

		<div class="container">

			<div style="padding-top: 50px; width: 1350px;">

				<div class="card">
					<div class="card-body">

						<div id="titlee">
							<h2>
								<span>학습.문화</span> 프로그램_등록
							</h2>
						</div>
						<hr>



						<div class="row">

							<div class="col-lg-6 col-xlg-6 col-md-7">
								<div class="card">
									<div class="card-body">
										<div class="form-horizontal form-material">



											<div class="form-group">
												<label class="col-md-12">강좌명</label>
												<div class="col-md-12">
													<input type="text" value="${lecture.lec_nm}" name="lec_nm"
														id="lec_nm" class="form-control form-control-line">
												</div>
											</div>

											<div class="form-group">
												<label class="col-md-12">강사명</label>
												<div class="col-md-12">
													<input type="text" value="${lecture.lec_tea}"
														name="lec_tea" id="lec_tea"
														class="form-control form-control-line">
												</div>
											</div>

											<div class="form-group">
												<label class="col-md-12">강의소개</label>
												<div class="col-md-12">
													<input type="text" style="" value="${lecture.lec_cont}"
														class="form-control form-control-line" name="lec_cont"
														id="lec_cont">
												</div>
											</div>



											<div class="form-group">
												<label class="col-md-12">강좌 시작일</label>
												<div class="col-md-12">
													<input type="date"
														value="<fmt:formatDate value="${lecture.lec_st_dt}"  pattern="yyyy-MM-dd" />"
														class="form-control form-control-line" name="lec_st_dt"
														id="lec_st_dt">
												</div>
											</div>



											<div class="form-group">
												<label class="col-md-12">강좌 종료일</label>
												<div class="col-md-12">
													<input type="date"
														value="<fmt:formatDate value="${lecture.lec_end_dt}"
												pattern="yyyy-MM-dd" />"
														class="form-control form-control-line" name="lec_end_dt"
														id="lec_end_dt">
												</div>
											</div>


											<div class="form-group">
												<label for="birth" class="col-md-12">강좌시간</label>
												<div class="col-md-12">
													<input type="text" value="${lecture.lec_time}"
														class="form-control form-control-line" name="lec_time"
														id="lec_time">
												</div>
											</div>


										</div>
									</div>
								</div>
							</div>




							<div class="col-lg-5 col-xlg-6 col-md-7">
								<div class="card">
									<div class="card-body">
										<div class="form-horizontal form-material">


											<div class="form-group">
												<label for="birth" class="col-md-12">수강가능인원</label>
												<div class="col-md-12">
													<input type="text" value="${lecture.lec_amount}"
														class="form-control form-control-line" name="lec_amount"
														id="lec_amount">
												</div>


											</div>




											<div class="form-group">
												<label class="col-md-12">강좌료</label>
												<div class="col-md-12">
													<input type="text" value="${lecture.lec_fee}"
														class="form-control form-control-line" name="lec_fee"
														id="lec_fee">
												</div>
											</div>


											<div class="form-group">
												<label class="col-md-12">강좌요일</label>
												<div class="col-md-12">
													<input type="text" value="${lecture.lec_day}"
														class="form-control form-control-line" name="lec_day"
														id="lec_day">
												</div>
											</div>



											<div class="form-group">
												<label class="col-md-12">강좌분류&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select
													id="lec_type" name="lec_type" style="width: 400px;">
														<option value="601">순수학문</option>
														<option value="602">외국어</option>
														<option value="603">생활기술</option>
														<option value="604">요리</option>
														<option value="605">미술/음악</option>
														<option value="606">건강/생활체육</option>


												</select>
												</label>

											</div>


<hr>



										<div class="form-group">
											<label for="birth" class="col-md-12">문화센터명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select
												id="searchType" name="searchType" style="width: 400px;">
													<c:forEach items="${cultureVo}" var="culture">
														<option value="${culture.culture_id}" id="culture_id"
															name="culture_id">${culture.culture_type}</option>
													</c:forEach>


											</select>
											</label>
										</div>
									</div>
								</div>
							</div>



							<div class="col-sm-12" style="text-align: right;">
								<button class="btn btn-success" id="kkk" type="submit">강좌
									등록</button>
							</div>
						</div>

					</div>



				</div>
			</div>
		</div>
		</div>
	</form>
</body>
</html>
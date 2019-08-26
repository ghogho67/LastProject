<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>강좌 수정</title>

<style type="text/css">
#titlee h2, #pzone h2 {
	font-size: 40px;
	font-weight: normal;
	letter-spacing: -1px;
}

#titlee h2 {
	padding: 15px 5px;
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

	<form action="${cp}/lecture/modifyLecture" method="post">


		<div class="container">

			<div style="padding-top: 50px; width: 1350px;">

				<div class="card">
					<div class="card-body" style="margin: 20px;">

						<div id="titlee">
							<h2>
								<span>학습.문화</span> 프로그램_수정
							</h2>
						</div>
						<hr>



						<div class="row">

							<div class="col-lg-6 col-xlg-6 col-md-7">
								<div class="card">
									<div class="card-body">
										<div class="form-horizontal form-material">


											<div class="form-group">
												<label class="col-md-12">강좌아이디</label>
												<div class="col-md-12">
													<input type="text" value="${lecture.lec_id}"
														class="form-control form-control-line" name="lec_id"
														id="lec_id" readonly="readonly">

												</div>
											</div>





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
												<label class="col-md-12">강좌분류</label>
												<div class="col-md-12" style="text-align: right;">






													<select id="lec_type" name="lec_type">
														<option value="601"
															<c:if test="${lecture.lec_type==601}">selected='selected'</c:if>>순수학문</option>
														<option value="602"
															<c:if test="${lecture.lec_type==602}">selected='selected'</c:if>>외국어</option>
														<option value="603"
															<c:if test="${lecture.lec_type==603}">selected='selected'</c:if>>생활기술</option>
														<option value="604"
															<c:if test="${lecture.lec_type==604}">selected='selected'</c:if>>요리</option>
														<option value="605"
															<c:if test="${lecture.lec_type==605}">selected='selected'</c:if>>미술
															음악</option>
														<option value="606"
															<c:if test="${lecture.lec_type==606}">selected='selected'</c:if>>검강생활체육</option>
													</select>




												</div>
											</div>





											<div class="form-group">
												<label class="col-md-12"></label>
												<div class="col-md-12" style="padding-left: 170px;">문화센터정보는
													부가제공 사항이며 수정이 불가합니다</div>
											</div>



											<div class="form-group">
												<label for="birth" class="col-md-12">문화센터명</label>
												<div class="col-md-12">
													<input type="text" placeholder="${culture.culture_type}"
														class="form-control form-control-line" readonly="readonly"
														name="culture_id" id="culture_id">
												</div>
											</div>




											<div class="form-group">

												<label class="col-md-12">문화센터 주소</label>
												<div class="col-md-12">
													<input type="text" value="${culture.culture_add}"
														class="form-control form-control-line" readonly="readonly">
												</div>
											</div>



											<div class="form-group">

												<label class="col-md-12">문화센터 전화번호 </label>
												<div class="col-md-12">
													<input type="text" value="${culture.culture_phone}"
														class="form-control form-control-line" readonly="readonly">
												</div>
											</div>

										</div>
									</div>
								</div>



								<div class="col-sm-12" style="text-align: right;">
									<button class="btn btn-success" id="kkk" type="submit">강좌정보수정</button>
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
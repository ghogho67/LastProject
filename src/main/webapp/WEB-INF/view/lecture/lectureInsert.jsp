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
</style>




<script>
	
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
							<span>학습.문화</span> 프로그램_등록
						</h2>
					</div>
				




<div class="row">

							<div class="col-lg-6 col-xlg-6 col-md-7">
								<div class="card">
									<div class="card-body">
										<div class="form-horizontal form-material">


											<div class="form-group">
												<label class="col-md-12">사용자 사진</label>
												<div class="col-md-12">
													<input type="text" placeholder="${MEM_INFO.mem_photo_path}"
														class="form-control form-control-line" readonly="readonly">

												</div>
											</div>





											<div class="form-group">
												<label class="col-md-12">아이디</label>
												<div class="col-md-12">
													<input type="text" placeholder="${MEM_INFO.mem_id}"
														class="form-control form-control-line" readonly="readonly">
												</div>
											</div>

											<div class="form-group">
												<label class="col-md-12">성함</label>
												<div class="col-md-12">
													<input type="text" placeholder="${MEM_INFO.mem_nm}"
														class="form-control form-control-line" readonly="readonly">
												</div>
											</div>


											<div class="form-group">
												<label class="col-md-12">비밀번호</label>
												<div class="col-md-12">
													<input type="password" value="${MEM_INFO.mem_pass}"
														class="form-control form-control-line" readonly="readonly">
												</div>
											</div>



											<div class="form-group">
												<label for="email" class="col-md-12">이메일</label>
												<div class="col-md-12">
													<input type="text" placeholder="${MEM_INFO.mem_mail}"
														class="form-control form-control-line" name="email"
														id="email" readonly="readonly">
												</div>
											</div>


											<div class="form-group">
												<label for="birth" class="col-md-12">생년월일</label>
												<div class="col-md-12">
													<input type="text" value="${MEM_INFO.mem_birth}"
														class="form-control form-control-line" name="birth"
														id="birth" readonly="readonly">
												</div>
											</div>






											<div class="form-group">
												<label class="col-md-12">연락처</label>
												<div class="col-md-12">
													<input type="text" placeholder="${MEM_INFO.mem_phone}"
														class="form-control form-control-line" readonly="readonly">
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
												<label for="birth" class="col-md-12">우편번호</label>
												<div class="col-md-12">
													<input type="text" placeholder="${MEM_INFO.mem_zipcd}"
														class="form-control form-control-line" name="zipcd"
														id="zipcd" readonly="readonly">
												</div>


											</div>



											<div class="form-group">
												<label for="birth" class="col-md-12">주소</label>
												<div class="col-md-12">
													<input type="text" placeholder="${MEM_INFO.mem_add1}"
														class="form-control form-control-line" name="addr1"
														id="addr1" readonly="readonly">
												</div>
											</div>



											<div class="form-group">
												<label for="birth" class="col-md-12">상세주소</label>
												<div class="col-md-12">
													<input type="text" placeholder="${MEM_INFO.mem_add2}"
														class="form-control form-control-line" name="addr2"
														id="addr2" readonly="readonly">
												</div>
											</div>



											<div class="form-group">

												<label class="col-md-12">보호자 성함</label>
												<div class="col-md-12">
													<input type="text" placeholder="${MEM_INFO.pro_nm}"
														class="form-control form-control-line" readonly="readonly">
												</div>
											</div>



											<div class="form-group">

												<label class="col-md-12">보호자와의 관계</label>
												<div class="col-md-12">
													<input type="text" placeholder="${MEM_INFO.pro_relation}"
														class="form-control form-control-line" readonly="readonly">
												</div>
											</div>


											<div class="form-group">
												<label class="col-md-12">긴급연락처</label>
												<div class="col-md-12">
													<input type="text" placeholder="${MEM_INFO.pro_phone}"
														class="form-control form-control-line" readonly="readonly">
												</div>
											</div>



										</div>
									</div>
								</div>

								<div class="col-sm-12" style="text-align: right;">
									<a class="btn btn-success" style="color: white;" href="${cp}/mypage/Patient_InfoModification">회원정보수정 </a>
								</div>
							</div>
						</div>

				</div>
			</div>
		</div>
		</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<%@include file="/WEB-INF/view/common/LibForMypage.jsp"%>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>

<style>
input[readonly="readonly"] {
	color: #000 !important;
	opacity:2 !important;
}

input[type="text"]::-webkit-input-placeholder {
	font-size: 110%;
}
</style>

</head>
<body>
	<%@include file="/WEB-INF/view/common/mypage/navigationBar.jsp"%>
	<%@include file="/WEB-INF/view/common/mypage/sidebarP.jsp"%>



	<div class="content-wrapper">

		<div class="row mb-4">

			<div class="col-lg-12">
				<h3 class="accept-title">&nbsp;&nbsp;&nbsp;내 정보 조회</h3>
				<div class="card">
					<div class="card-body">
						<div class="row">

							<div class="col-lg-6 col-xlg-6 col-md-7">
								<div class="card">
									<div class="card-body">
										<div class="form-horizontal form-material">






											<div class="form-group">
												<label class="col-md-12">사용자 사진</label>
												<div class="col-md-12">
													<img src="${cp }/user/profile?userId=${userVo.userId}"
														class="form-control form-control-line">
												</div>
											</div>





											<div class="form-group">
												<label class="col-md-12">아이디</label>
												<div class="col-md-12">
													<input type="text" placeholder="dkskqk00"
														class="form-control form-control-line" readonly="readonly">
												</div>
											</div>

											<div class="form-group">
												<label class="col-md-12">성함</label>
												<div class="col-md-12">
													<input type="text" placeholder="김 노인"
														class="form-control form-control-line" readonly="readonly">
												</div>
											</div>


											<div class="form-group">
												<label class="col-md-12">비밀번호</label>
												<div class="col-md-12">
													<input type="password" value="password"
														class="form-control form-control-line" readonly="readonly">
												</div>
											</div>



											<div class="form-group">
												<label for="email" class="col-md-12">이메일</label>
												<div class="col-md-12">
													<input type="text" placeholder="HowCare@admin.com"
														class="form-control form-control-line" name="email"
														id="email" readonly="readonly">
												</div>
											</div>


											<div class="form-group">
												<label for="birth" class="col-md-12">생년월일</label>
												<div class="col-md-12">
													<input type="date" placeholder="1994-09-22"
														class="form-control form-control-line" name="birth"
														id="birth" readonly="readonly">
												</div>
											</div>




											<div class="form-group">
												<label for="birth" class="col-md-12">우편번호</label>
												<div class="col-md-12">
													<input type="text" placeholder="30589"
														class="form-control form-control-line" name="zipcd"
														id="zipcd" readonly="readonly">
												</div>


											</div>



											<div class="form-group">
												<label for="birth" class="col-md-12">주소</label>
												<div class="col-md-12">
													<input type="text" placeholder="대전 중구 대흥동"
														class="form-control form-control-line" name="addr1"
														id="addr1" readonly="readonly">
												</div>
											</div>



											<div class="form-group">
												<label for="birth" class="col-md-12">상세주소</label>
												<div class="col-md-12">
													<input type="text" placeholder="영민빌딩 2층"
														class="form-control form-control-line" name="addr2"
														id="addr2" readonly="readonly">
												</div>
											</div>


											<div class="form-group">
												<label class="col-md-12">연락처</label>
												<div class="col-md-12">
													<input type="text" placeholder="010-2114-2539"
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

												<label class="col-md-12">보호자 성함</label>
												<div class="col-md-12">
													<input type="text" placeholder="김양배추" value=""
														class="form-control form-control-line" readonly="readonly">
												</div>
											</div>

											<div class="form-group">

												<label class="col-md-12">보호자와의 관계</label>
												<div class="col-md-12">
													<input type="text" placeholder="자녀"
														class="form-control form-control-line" readonly="readonly">
												</div>
											</div>


											<div class="form-group">
												<label class="col-md-12">긴급연락처</label>
												<div class="col-md-12">
													<input type="text" placeholder="010-2114-2539"
														class="form-control form-control-line" readonly="readonly">
												</div>
											</div>




										</div>
									</div>
								</div>


								<div class="col-sm-12" style="text-align: right;">
									<a class="btn btn-success" style="color: white;">회원 정보 수정 </a>
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
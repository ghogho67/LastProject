<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<%@include file="/WEB-INF/view/common/LibForMypage.jsp"%>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>


<style>
input[readonly="readonly"] {
	color: #000 !important;
	opacity: 2 !important;
}

input[type="text"]::-webkit-input-placeholder {
	font-size: 110%;
}
</style>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
	$(document).ready(function() {

		var msg = '${msg}';
		if (msg != '')
			alert(msg);

		$('#addrSearchbtn').on('click', function() {
			new daum.Postcode({
				oncomplete : function(data) {
					$('#zipcd').val(data.zonecode);
					$('#addr1').val(data.roadAddress);
				}
			}).open();
		});

		$("#modificationComplete").on('click', function() {

			$("#frm").submit();

		});

	});
</script>

</head>
<body>
	<%@include file="/WEB-INF/view/common/mypage/navigationBar.jsp"%>
	<%@include file="/WEB-INF/view/common/mypage/sidebarP.jsp"%>

	<form action="${cp }/user/form" method="post"
		enctype="multipart/form-data">
		<div class="content-wrapper">
			<h3>&nbsp;&nbsp;&nbsp;내 정보 조회</h3>
			<div class="row mb-4">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div class="row">

								<div class="col-lg-6 col-xlg-6 col-md-7">
									<div class="card">
										<div class="card-body">
											<div class="form-horizontal form-material">

												<div class="form-group">
													<label class="col-md-12">프로필사진</label>
													<div class="col-md-12">
														<div style="position: absolute; left: 73%;">

															<input type="file" class="form-control form-control-line" />

														</div>
														<br>
													</div>
												</div>


												<div class="form-group">
													<label class="col-md-12">아이디</label>
													<div class="col-md-12">
														<input type="text" placeholder="dkskqk00"
															class="form-control form-control-line"
															readonly="readonly">
													</div>
												</div>

												<div class="form-group">
													<label class="col-md-12">성함</label>
													<div class="col-md-12">
														<input type="text" placeholder="김 노인"
															class="form-control form-control-line"
															readonly="readonly">
													</div>
												</div>


												<div class="form-group">
													<label class="col-md-12">비밀번호</label>
													<div class="col-md-12">
														<input type="password" value="password"
															class="form-control form-control-line">
													</div>
												</div>




												<div class="form-group">
													<label for="email" class="col-md-12">이메일</label>
													<div class="col-md-12">
														<input type="email" placeholder="johnathan@admin.com"
															class="form-control form-control-line" name="eemail"
															id="email">
													</div>
												</div>


												<div class="form-group">
													<label for="birth" class="col-md-12">생년월일</label>
													<div class="col-md-12">
														<input type="date" placeholder="19940922" value="19940922"
															class="form-control form-control-line" name="birth"
															id="birth">
													</div>
												</div>








												<div class="form-group">
													<label class="col-md-12">연락처</label>
													<div class="col-md-12">
														<input type="text" placeholder="123 456 7890"
															class="form-control form-control-line">
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
													<div class="col-md-10">
														<input type="text" placeholder="30589"
															class="form-control form-control-line" name="zipcd"
															id="zipcd">
													</div>

													<button style="position: absolute; left: 85%; top: 30px;"
														type="button" id="addrSearchbtn" class="btn btn-default ">주소
														검색</button>


												</div>



												<div class="form-group">
													<label for="birth" class="col-md-12">주소</label>
													<div class="col-md-12">
														<input type="text" placeholder="대전 중구 대흥동"
															class="form-control form-control-line" name="addr1"
															id="addr1">
													</div>
												</div>



												<div class="form-group">
													<label for="birth" class="col-md-12">상세주소</label>
													<div class="col-md-12">
														<input type="text" placeholder="영민빌딩 2층"
															class="form-control form-control-line" name="addr2"
															id="addr2">
													</div>
												</div>



												<div class="form-group">

													<label class="col-md-12">보호자 성함</label>
													<div class="col-md-12">
														<input type="text" placeholder="김양배추" value=""
															class="form-control form-control-line">
													</div>
												</div>

												<div class="form-group">

													<label class="col-md-12">보호자와의 관계</label>
													<div class="col-md-12">
														<input type="text" placeholder="자녀"
															class="form-control form-control-line">
													</div>
												</div>


												<div class="form-group">
													<label class="col-md-12">긴급연락처</label>
													<div class="col-md-12">
														<input type="text" placeholder="123 456 7890"
															class="form-control form-control-line">
													</div>
												</div>

											</div>

										</div>

									</div>

									<div class="col-sm-12" style="text-align: right;">
										<a class="btn btn-success" id="modificationComplete"
											style="color: white;">수정 내용 등록 </a>
									</div>
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
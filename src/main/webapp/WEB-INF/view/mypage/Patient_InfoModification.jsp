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
input[] {
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
														<input type="text" placeholder="${MEM_INFO.mem_id}"
															class="form-control form-control-line"
															readonly="readonly">
													</div>
												</div>

												<div class="form-group">
													<label class="col-md-12">성함</label>
													<div class="col-md-12">
														<input type="text" placeholder="${MEM_INFO.mem_nm}"
															class="form-control form-control-line"
															readonly="readonly">
													</div>
												</div>


												<div class="form-group">
													<label class="col-md-12">비밀번호</label>
													<div class="col-md-12">
														<input type="password" value="${MEM_INFO.mem_pass}"
															class="form-control form-control-line"  id="pass" name="pass">
													</div>
												</div>




												<div class="form-group">
													<label for="email" class="col-md-12">이메일</label>
													<div class="col-md-12">
														<input type="text" placeholder="${MEM_INFO.mem_mail}"
															class="form-control form-control-line" name="email"
															id="email">
													</div>
												</div>


												<div class="form-group">
													<label for="birth" class="col-md-12">생년월일</label>
													<div class="col-md-12">
														<input type="date" placeholder="${MEM_INFO.mem_birth}" 
															class="form-control form-control-line" name="birth"
															id="birth" readonly="readonly">
													</div>
												</div>








												<div class="form-group">
													<label class="col-md-12">연락처</label>
													<div class="col-md-12">
														<input type="text" placeholder="${MEM_INFO.mem_phone}"
															class="form-control form-control-line"   name="phone"
															name="phone">
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
														<input type="text" placeholder="${MEM_INFO.mem_zipcd}"
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
														<input type="text" placeholder="${MEM_INFO.mem_add1}"
															class="form-control form-control-line" name="addr1"
															id="addr1">
													</div>
												</div>



												<div class="form-group">
													<label for="birth" class="col-md-12">상세주소</label>
													<div class="col-md-12">
														<input type="text" placeholder="${MEM_INFO.mem_add2}"
															class="form-control form-control-line" name="addr2"
															id="addr2">
													</div>
												</div>



												<div class="form-group">

													<label class="col-md-12">보호자 성함</label>
													<div class="col-md-12">
														<input type="text" placeholder="${MEM_INFO.pro_nm}" 
															class="form-control form-control-line"  name="pro_nm"
															id="pro_nm">
													</div>
												</div>

												<div class="form-group">

													<label class="col-md-12">보호자와의 관계</label>
													<div class="col-md-12">
														<input type="text" placeholder="${MEM_INFO.pro_relation}"
															class="form-control form-control-line"  name="pro_relation"
															id="pro_relation">
													</div>
												</div>


												<div class="form-group">
													<label class="col-md-12">긴급연락처</label>
													<div class="col-md-12">
														<input type="text" placeholder="${MEM_INFO.pro_phone}"
															class="form-control form-control-line"  name="pro_phone"
															id="pro_phone">
													</div>
												</div>

											</div>

										</div>

									</div>

									<div class="col-sm-12" style="text-align: right;">
										<button class="btn btn-success" id="modificationComplete"
											>수정 내용 반영 </button>
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
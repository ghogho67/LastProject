<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">


<style>
input[readonly="readonly"] {
	color: #000 !important;
	opacity: 2 !important;
}

input[type="text"]::-webkit-input-placeholder {
	font-size: 110%;
}




#titlee h2 {
	font-size: 40px;
	font-weight: normal;
	letter-spacing: -1px;
	width: 50%
}


#titlee h2 {
	padding: 10px 5px;
}

#titlee h2 span {
	font-weight: bold;
	color: #473fa0;
}


.inin{
font-size: 15px
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	console.log("${MEM_INFO}");
});
</script>

</head>
<body>



	<div class="content-wrapper">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
					<div id="titlee">
							<h2>
								<span>내 정보</span> 조회<span class="inin">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내 평가점수(${grades})</span>
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

												<label class="col-md-12">운전면허</label>
												<div class="col-md-12">
													<input type="text"
														placeholder="<c:choose><c:when test="${MEM_INFO.cw_driver==Y}">2종 보통 소지</c:when><c:otherwise>미자격</c:otherwise></c:choose>"
														class="form-control form-control-line" readonly="readonly">
												</div>
											</div>

											<div class="form-group">

												<label class="col-md-12">요양보호사 자격번호</label>
												<div class="col-md-12">
													<input type="text" placeholder="${MEM_INFO.cw_lic}"
														class="form-control form-control-line" readonly="readonly">
												</div>
											</div>


										</div>
									</div>
								</div>

								<div class="col-sm-12" style="text-align: right;">
									<a class="btn btn-success" style="color: white;"
										href="${cp}Worker_InfoModification">회원정보수정 </a>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>

</body>

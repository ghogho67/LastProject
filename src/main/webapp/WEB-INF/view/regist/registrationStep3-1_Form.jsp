<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@include file="/WEB-INF/view/common/joinCare.jsp"%>
<link rel="stylesheet"
	href="${cp}/resource/wrap/Test/bootstrap-rtl.min.css" />
<link rel="stylesheet" href="${cp}/resource/wrap/Test/bootstrap.min.css" />
<link rel="stylesheet"
	href="${cp}/resource/wrap/Test/flat-forms-plus.css" />
<link rel="stylesheet" href="${cp}/resource/wrap/Test/style-rtl.css" />
<link rel="stylesheet"
	href="${cp}/resource/wrap/Test/modern-forms-plus.css" />
<link rel="stylesheet" href="${cp}/resource/wrap/Test/livepreview.css" />
<link rel="stylesheet" href="${cp}/resource/wrap/Test/orange.css" />
<link rel="stylesheet" href="${cp}/resource/wrap/Test/cadetBlue.css" />
<link rel="stylesheet"
	href="${cp}/resource/wrap/Test/font-awesome.min.css" />
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">


</head>

<script>
$(document).ready(function() {
	var msg = '${msg}'; //메세지이므로 ''로 묶여야된다
	if (msg != '')
		alert(msg);
	
	//등록
	$("#submit").on("click", function(){
		$("#frm").attr("action", "${cp}/regist/regist4");
		$("#frm").attr("method", "get");
		$("#frm").submit();
		
	});
	
	//home
	$("#home").on("click", function(){
		$("#frm").attr("action", "${cp}/login");
		$("#frm").attr("method", "get");
		$("#frm").submit();
		
	});
	
});

</script>


<body>


	<section class="memberjoin">
		<div class="memberjoin-in">
			<h5 class="memberjoin-title ng-binding">회원가입(요양보호사)</h5>
			<ul>
				<li class="memberjoin01 ">01.가입종류선택</li>
				<li class="right-arrow"></li>
				<li class="memberjoin02 ">02.약관동의</li>
				<li class="right-arrow"></li>
				<li class="memberjoin03 active ">03.정보입력</li>
				<li class="right-arrow"></li>
				<li class="memberjoin04">04.가입완료</li>
			</ul>
		</div>


		<div class="wrap-offset">
			<div class="container-fluid">
				<form id="p-form-skin" method="post" action="${cp}/regist/regist3-1 }"
					class="modern-p-form modern-ao-form-rtl p-form-modern-cadetBlue">
					<div data-base-class="p-form" class="p-form p-shadowed p-form-md">

						<div class="p-title" data-base-class="p-title">
							<span data-p-role="title" class="p-title-line">회원가입&nbsp;&nbsp;<i
								class="fa fa-list"></i></span>
						</div>

						<div class="p-subtitle text-right" data-base-class="p-subtitle">
							<span data-p-role="subtitle" class="p-title-side">필수입력 사항</span>
						</div>
						<div>

							<div class="col-sm-6">
								<div class="form-group">
									<label for="url">프로필 사진</label>
									<div class="p-file-wrap" style="direction: rtl">
										<input type="file" id="fileupload1" name="fileupload1"
											placeholder="select file..."
											onchange="document.getElementById('fileupload1-fake').value = this.value">
										<div class="input-group">
											<span class="input-group-btn"><button type="button"
													class="btn">browse</button></span> <input type="text"
												id="fileupload1-fake" placeholder="프로필 사진을 등록하세요"
												readonly="readonly" class="form-control p-ignore-field">
											<span class="input-group-state"><span
												class="p-position"><span class="p-text"><span
														class="p-valid-text"><i class="fa fa-check"></i></span> <span
														class="p-error-text"><i class="fa fa-times"></i></span></span></span></span> <span
												class="p-field-cb"></span>
										</div>
									</div>
								</div>
							</div>


							<div class="row">

								<div class="col-sm-6">
									<div class="form-group">
										<label for="text">Id</label>
										<div class="input-group" style="direction: rtl">
											<span class="input-group-btn"><button type="button"
													class="btn">중복확인</button></span> <input type="text" id="id"
												name="id" placeholder="영어, 숫자, 특수기호 사용가능  4~8글자까지"
												class="form-control"> <span
												class="input-group-state"><span class="p-position"><span
													class="p-text"><span class="p-valid-text"><i
															class="fa fa-check"></i></span> <span class="p-error-text"><i
															class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
										</div>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label for="password">비밀번호</label>
										<div class="input-group p-has-icon">
											<input type="password" id="password" name="password"
												placeholder="영문 숫자 특수문자 조합 8글자이상" class="form-control">
											<span class="input-group-state"><span
												class="p-position"><span class="p-text"><span
														class="p-valid-text"><i class="fa fa-check"></i></span> <span
														class="p-error-text"><i class="fa fa-times"></i></span></span></span></span> <span
												class="p-field-cb"></span> <span class="input-group-icon"><i
												class="fa fa-lock"></i></span>
										</div>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label for="email1">이름</label>
										<div class="input-group p-has-icon">
											<input type="text" id="email1" name="email1"
												placeholder="이름을 입력하세요 (2-5글자)" class="form-control">
											<span class="input-group-state"><span
												class="p-position"><span class="p-text"><span
														class="p-valid-text"><i class="fa fa-check"></i></span> <span
														class="p-error-text"><i class="fa fa-times"></i></span></span></span></span> <span
												class="p-field-cb"></span> <span class="input-group-icon"><i
												class="fa fa-check"></i></span>
										</div>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label for="email1">핸드폰 번호</label>
										<div class="input-group p-has-icon">
											<input type="tel" id="phone" name="phone"
												placeholder="핸드폰 번호를 입력하세요" class="form-control"> <span
												class="input-group-state"><span class="p-position"><span
													class="p-text"><span class="p-valid-text"><i
															class="fa fa-check"></i></span> <span class="p-error-text"><i
															class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
											<span class="input-group-icon"><i class="fa fa-check"></i></span>
										</div>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label for="email1">이메일</label>
										<div class="input-group p-has-icon">
											<input type="email" id="email" name="email"
												placeholder="이메일을 입력해 주세요" class="form-control"> <span
												class="input-group-state"><span class="p-position"><span
													class="p-text"><span class="p-valid-text"><i
															class="fa fa-check"></i></span> <span class="p-error-text"><i
															class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
											<span class="input-group-icon"><i class="fa fa-check"></i></span>
										</div>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label for="email1">주민번호 앞자리</label>
										<div class="input-group p-has-icon">
											<input type="text" id="addr" name="addr"
												placeholder="주민번호 앞자리를 입력해 주세요" class="form-control">
											<span class="input-group-state"><span
												class="p-position"><span class="p-text"><span
														class="p-valid-text"><i class="fa fa-check"></i></span> <span
														class="p-error-text"><i class="fa fa-times"></i></span></span></span></span> <span
												class="p-field-cb"></span> <span class="input-group-icon"><i
												class="fa fa-check"></i></span>
										</div>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label for="email1">요양보호사 라이센스번호</label>
										<div class="input-group p-has-icon">
											<input type="text" id="cw_lic" name="cw_lic" 
											placeholder="라이센스 번호를 입력해 주세요"class="form-control"> <span
												class="input-group-state"><span class="p-position"><span
													class="p-text"><span class="p-valid-text"><i
															class="fa fa-check"></i></span> <span class="p-error-text"><i
															class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
											<span class="input-group-icon"><i class="fa fa-check"></i></span>
										</div>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label for="email1">운전가능 여부</label>
										<div class="input-group p-has-icon">
											<input type="text" id="diver" name="diver"
												placeholder="유 or 무" class="form-control"> <span
												class="input-group-state"><span class="p-position"><span
													class="p-text"><span class="p-valid-text"><i
															class="fa fa-check"></i></span> <span class="p-error-text"><i
															class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
											<span class="input-group-icon"><i class="fa fa-check"></i></span>
										</div>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label for="email1">서비스 가능 지역</label>
										<div class="input-group p-has-icon">
											<input type="text" id="locate" name="locate"
												placeholder="동 만 입력해 주세요" class="form-control"> <span
												class="input-group-state"><span class="p-position"><span
													class="p-text"><span class="p-valid-text"><i
															class="fa fa-check"></i></span> <span class="p-error-text"><i
															class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
											<span class="input-group-icon"><i class="fa fa-check"></i></span>
										</div>
									</div>
								</div>
							</div>
							
							
							<div class="col-sm-6">
									<div class="form-group">
										<label for="email1">성별</label>
										<div class="checkbox">

											<label><input type="checkbox" name="gender" value="M">
												<span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">남</span></label>

											<label><input type="checkbox" name="gender" value="F">
												<span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">여</span></label>

										</div>

									</div>
								</div>
							
							
							
							
							<div>
								<div class="p-subtitle text-right" data-base-class="p-subtitle">
									<span data-p-role="subtitle" class="p-title-side">서비스 가능 요일</span>
								</div>
								<div class="col-sm-13">
									<div class="p-form-cg pt-form-inline">
									
										<div class="checkbox">
											<label><input type="checkbox" name="ser_type"
												value="sun"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">일</span></label>
										</div>
									
										<div class="checkbox">

											<label><input type="checkbox" name="ser_type"
												value="mon"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">월</span></label>
										</div>

										<div class="checkbox">
											<label><input type="checkbox" name="ser_type"
												value="the"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">화</span></label>
										</div>

										<div class="checkbox">
											<label><input type="checkbox" name="ser_type"
												value="wed"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">수</span></label>
										</div>
										
										<div class="checkbox">
											<label><input type="checkbox" name="ser_type"
												value="thu"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">목</span></label>
										</div>
										
										<div class="checkbox">
											<label><input type="checkbox" name="ser_type"
												value="fri"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">금</span></label>
										</div>
										
										<div class="checkbox">
											<label><input type="checkbox" name="ser_type"
												value="sat"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">토</span></label>
										</div>
										
									</div>

								</div>
							</div>
							
							
							
							
							
							
							


							<div>
								<div class="p-subtitle text-right" data-base-class="p-subtitle">
									<span data-p-role="subtitle" class="p-title-side">서비스 종류</span>
								</div>
								<div class="col-sm-13">
									<div class="p-form-cg pt-form-inline">
										<div class="checkbox">

											<label><input type="checkbox" name="ser_type"
												value="visit"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">방문간병</span></label>
										</div>

										<div class="checkbox">
											<label><input type="checkbox" name="ser_type"
												value="hospital"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">병원간병</span></label>
										</div>

										<div class="checkbox">
											<label><input type="checkbox" name="ser_type"
												value="health"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">운동도움</span></label>
										</div>
									</div>

								</div>
							</div>

						</div>


						<div class="clearfix">
							<div class="p-subtitle text-right" data-base-class="p-subtitle">
								<span data-p-role="subtitle" class="p-title-side">보호경력</span>
							</div>


							<div>

								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<div class="input-group p-has-icon">
												<input type="text" id="hos_id" name="hos_id"
													placeholder="기관명" class="form-control"> <span
													class="input-group-state"><span class="p-position"><span
														class="p-text"><span class="p-valid-text"><i
																class="fa fa-check"></i></span> <span class="p-error-text"><i
																class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
												<span class="input-group-icon"><i class="fa fa-check"></i></span>
											</div>
										</div>
									</div>

									<div class="col-sm-6">
										<div class="form-group">
											<div class="input-group p-has-icon">
												<input type="date" id="career_end" name="career_end"
													placeholder="종료날자" class="form-control"> <span
													class="input-group-state"><span class="p-position"><span
														class="p-text"><span class="p-valid-text"><i
																class="fa fa-check"></i></span> <span class="p-error-text"><i
																class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
												<span class="input-group-icon"><i class="fa fa-check"></i></span>
											</div>
										</div>

									</div>



									<div class="col-sm-6">
										<div class="form-group">
											<div class="input-group p-has-icon">
												<input type="date" id="career_st" name="career_st"
													placeholder="시작날자" class="form-control"> <span
													class="input-group-state"><span class="p-position"><span
														class="p-text"><span class="p-valid-text"><i
																class="fa fa-check"></i></span> <span class="p-error-text"><i
																class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
												<span class="input-group-icon"><i class="fa fa-check"></i></span>
											</div>
										</div>

									</div>



									<div class="col-sm-6">
										<div class="form-group">
											<div class="input-group p-has-icon">
												<input type="text" id="career_content" name="career_content"
													placeholder="내용" class="form-control"> <span
													class="input-group-state"><span class="p-position"><span
														class="p-text"><span class="p-valid-text"><i
																class="fa fa-check"></i></span> <span class="p-error-text"><i
																class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
												<span class="input-group-icon"><i class="fa fa-check"></i></span>
											</div>
										</div>

									</div>



								</div>







								<div class="preview-btn text-left p-buttons">
									<button class="btn" id="submit" type="submit">submit</button>
									<button class="btn" id="reste" type="reset">reset</button>
									<button class="btn" id="home" type="submit">home</button>
								</div>
							</div>
						</div>
				</form>
			</div>
		</div>


	</section>








</body>
</html>
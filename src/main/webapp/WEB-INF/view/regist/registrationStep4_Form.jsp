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
				<form id="p-form-skin" method="post" action="${cp}/regist/regist4 }"
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
													class="btn">중복확인</button></span> <input type="id" id="id"
												name="id" placeholder="영어, 숫자, 특수기호 사용가능  8글자까지"
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

							</div>





							<!-- 없어질 것 -->

							<div>
								<div class="p-subtitle text-right" data-base-class="p-subtitle">
									<span data-p-role="subtitle" class="p-title-side">추가 입력사항</span>
								</div>

								<div class="col-sm-13">
									<div class="form-group">
										<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;질병</label>
										<div class="p-form-cg pt-form-inline">
											<div class="checkbox">

												<label><input type="checkbox" name="disease"
													value="cherry"> <span class="p-check-icon"><span
														class="p-check-block"></span></span> <span class="p-label">방문간병</span></label>
											</div>

											<div class="checkbox">
												<label><input type="checkbox" name="disease"
													value="lemon"> <span class="p-check-icon"><span
														class="p-check-block"></span></span> <span class="p-label">병원간병</span></label>
											</div>

											<div class="checkbox">
												<label><input type="checkbox" name="disease"
													value="melon"> <span class="p-check-icon"><span
														class="p-check-block"></span></span> <span class="p-label">운동도움</span></label>
											</div>
										</div>
									</div>
								</div>




							</div>

						</div>


						<div class="clearfix">
							<div class="p-subtitle text-right" data-base-class="p-subtitle">
								<span data-p-role="subtitle" class="p-title-side">보호자
									인적사항</span>
							</div>


							<div>

								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<div class="input-group p-has-icon">
												<input type="text" id="pro_name" name="pro_name"
													placeholder="보호자성함" class="form-control"> <span
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
												<input type="email" id="pro_phone" name="pro_phone"
													placeholder="보호자연락처" class="form-control"> <span
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
												<input type="email" id="pro_rel" name="pro_rel"
													placeholder="보호자관계" class="form-control"> <span
													class="input-group-state"><span class="p-position"><span
														class="p-text"><span class="p-valid-text"><i
																class="fa fa-check"></i></span> <span class="p-error-text"><i
																class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
												<span class="input-group-icon"><i class="fa fa-check"></i></span>
											</div>
										</div>

									</div>



								</div>


								<div class="form-group">
									<div class="checkbox">
										<label><input type="checkbox" id="terms" name="terms">
											<span class="p-check-icon"><span class="p-check-block"></span></span>
											<span class="p-label">이용약관, 개인정보 수집 및 이용에 모두
												동의합니다.&nbsp;&nbsp; &nbsp; <a href="#" target="_blank">이용약관
													& 개인정보 약관 보기</a>
										</span></label>
									</div>
								</div>






								<div class="preview-btn text-left p-buttons">
									<button class="btn" type="submit">submit</button>
									<button class="btn" type="reset">reset</button>
								</div>
							</div>
						</div>
				</form>
			</div>
		</div>


	</section>








</body>
</html>
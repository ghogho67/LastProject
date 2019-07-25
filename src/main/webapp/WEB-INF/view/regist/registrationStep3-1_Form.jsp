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
<script type="text/javascript" src="/js/jquery/jquery-3.2.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(document).ready(function() {

	var msg = '${msg}'; //메세지이므로 ''로 묶여야된다
	if (msg != '')
		alert(msg);
	
	
	//id중복체크
	$("#idCheckBtn").on("click",function(){
		var data = $('#mem_id').val();
		console.log(data);
		if(data==''||data==null){
			alert("아이디를 입력해주세요");
			return;
		}
		$.ajax({
			url: "${cp}/regist/idCheck",
			data : "mem_id="+data,
			success :  function(data){
				console.log(data);
				if(data.mem_id == "mem_id"){
					alert("아이디를 정규식에 맞게 입력해 주세요");
					$("#mem_id").val("");
					$("#mem_id").focus();
					return;
				}
				if(data.mem_id == "yes"){
					alert("사용가능한 아이디입니다");
				}else{
					alert("사용중인 아이디입니다");
					$('#mem_id').val("");
					$('#mem_id').focus();
				}
			}
		});
		
	});
	
	//정규식체크
	$("#submit").on("click", function(){
		var frmData = $("#frm").serialize();

		if($("#mem_id").val()==''||$("#mem_id").val()==null){
			alert("아이디를 입력해주세요");
			return;
		} else if($("#mem_pass").val()==''||$("#mem_pass").val()==null){
			alert("패스워드를 넣어주세요");
			return;
		} else if($("#mem_nm").val()==''||$("#mem_nm").val()==null){
			alert("입력값을 넣어주세요");
			return;
		}else if($("#mem_phone").val()==''||$("#mem_phone").val()==null){
			alert("입력값을 넣어주세요");
			return;
		}else if($("#mem_mail").val()==''||$("#mem_mail").val()==null){
			alert("입력값을 넣어주세요");
			return;
		}
		console.log(frmData);
		$.ajax({
			url : "${cp}/regist/regist3",
			data : frmData,
			type : "post",
			success : function(data){
				console.log(data);

				if(data == "mem_pass"){
					alert("패스워드를 정규식에 맞게 입력해 주세요");
					$("#mem_pass").val("");
					$("#mem_pass").focus();
					return;
				}
				if(data == "mem_nm"){
					alert("이름을 정규식에 맞게 입력해 주세요");
					$("#mem_nm").val("");
					$("#mem_nm").focus();
					return;
				}
				if(data == "mem_phone"){
					alert("휴대폰 번호를 정규식에 맞게 입력해 주세요");
					$("#mem_phone").val("");
					$("#mem_phone").focus();
					return;
				}
				if(data == "mem_mail"){
					alert("이메일을 정규식에 맞게 입력해 주세요");
					$("#mem_mail").val("");
					$("#mem_mail").focus();
					return;
				}
				if(data == 'success'){
					console.log("suc")
//						location.href = "${cp}/regist/regist4"
//						$("#frm").attr("action", "${cp}/regist/regist4");
//						$("#frm").attr("method", "post");
					$("#frm2").submit();
				}
			},error : function(xhr){
				alert(xhr.status);
			}
			
		});
		
	});
	
	

	//등록
//		$("#submit").on("click", function(){
//			$("#frm").attr("action", "${cp}/regist/regist4");
//			$("#frm").attr("method", "get");
//			$("#frm").submit();
		
//		});
	
	//home
	$("#home").on("click", function(){
		$("#frm").attr("action", "${cp}/login");
		$("#frm").attr("method", "get");
		$("#frm").submit();
		
	});
	
	

});
</script>
</head>

<body>

	<form id="frm2" method="post" action="${cp}/regist/regist4">
	</form>


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
													class="btn">중복확인</button></span> <input type="text" id="mem_id"
												name="mem_id" placeholder="영어, 숫자, 특수기호 사용가능  4~8글자까지"
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
											<input type="password" id="mem_pass" name="mem_pass"
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
											<input type="text" id="mem_nm" name="mem_nm"
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
											<input type="tel" id="mem_phone" name="mem_phone"
												placeholder="000-0000-0000형식으로 입력하세요" class="form-control"> <span
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
											<input type="email" id="mem_mail" name="mem_mail"
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
											<input type="text" id="mem_birth" name="mem_birth"
												placeholder="연연/월/일 입력해 주세요" class="form-control">
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
											<input type="text" id="cw_diver" name="cw_diver"
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
											<input type="text" id="loc_dong" name="loc_dong"
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

											<label><input type="checkbox" name="mem_gender" value="M">
												<span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">남</span></label>

											<label><input type="checkbox" name="mem_gender" value="F">
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
											<label><input type="checkbox" name="cw_day"
												value="1"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">일</span></label>
										</div>
									
										<div class="checkbox">

											<label><input type="checkbox" name="cw_day"
												value="2"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">월</span></label>
										</div>

										<div class="checkbox">
											<label><input type="checkbox" name="cw_day"
												value="3"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">화</span></label>
										</div>

										<div class="checkbox">
											<label><input type="checkbox" name="cw_day"
												value="4"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">수</span></label>
										</div>
										
										<div class="checkbox">
											<label><input type="checkbox" name="cw_day"
												value="5"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">목</span></label>
										</div>
										
										<div class="checkbox">
											<label><input type="checkbox" name="cw_day"
												value="6"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">금</span></label>
										</div>
										
										<div class="checkbox">
											<label><input type="checkbox" name="cw_day"
												value="7"> <span class="p-check-icon"><span
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
												value="1"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">방문간병</span></label>
										</div>

										<div class="checkbox">
											<label><input type="checkbox" name="ser_type"
												value="2"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">병원간병</span></label>
										</div>

										<div class="checkbox">
											<label><input type="checkbox" name="ser_type"
												value="3"> <span class="p-check-icon"><span
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
												<input type="text" id="hos_nm" name="hos_nm"
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
												<input type="date" id="career_st_dt" name="career_st_dt"
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
												<input type="date" id="career_end_dt" name="career_end_d"
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
												<input type="text" id="career_cont" name="career_cont"
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
									<button class="btn" id="submit" type="button">submit</button>
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
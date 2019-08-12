<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@include file="/WEB-INF/view/common/joinCare.jsp"%>
<link rel="stylesheet"	href="${cp}/resource/wrap/Test/bootstrap-rtl.min.css" />
<link rel="stylesheet" href="${cp}/resource/wrap/Test/bootstrap.min.css" />
<link rel="stylesheet"	href="${cp}/resource/wrap/Test/flat-forms-plus.css" />
<link rel="stylesheet" href="${cp}/resource/wrap/Test/style-rtl.css" />
<link rel="stylesheet"	href="${cp}/resource/wrap/Test/modern-forms-plus.css" />
<link rel="stylesheet" href="${cp}/resource/wrap/Test/livepreview.css" />
<link rel="stylesheet" href="${cp}/resource/wrap/Test/orange.css" />
<link rel="stylesheet" href="${cp}/resource/wrap/Test/cadetBlue.css" />
<link rel="stylesheet"	href="${cp}/resource/wrap/Test/font-awesome.min.css" />
<link rel="stylesheet"	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"/>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>
$(document).ready(function(){
	$("#trans").on("click", function(){
		$("#frm").attr("action", "${cp}/donation/nonmemberDonation");
		$("#frm").attr("method", "post");
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

</head>
<body>

	<section class="memberjoin">


		<div class="wrap-offset">
			<div class="container-fluid">
				<form id="frm" method="post" action="${cp}/donation/nonmemberDonation" class="modern-p-form modern-ao-form-rtl p-form-modern-cadetBlue">
					<div data-base-class="p-form" class="p-form p-shadowed p-form-md">

						<div class="p-title" data-base-class="p-title">
							<span data-p-role="title" class="p-title-line">기부하기&nbsp;&nbsp;<i
								class="fa fa-list"></i></span>
						</div>

						<div class="p-subtitle text-right" data-base-class="p-subtitle">
							<span data-p-role="subtitle" class="p-title-side">필수입력 사항</span>
						</div>
						<div>
							<div class="row">


								<div class="col-sm-6">
									<div class="form-group">
										<label for="email1">기부자 이름</label>
										<div class="input-group p-has-icon">
											<input type="text" id="doner" name="doner"
												value="${doner }" placeholder="이름을 입력하세요 "
												class="form-control"> <span
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
										<label for="email1">핸드폰 번호</label>
										<div class="input-group p-has-icon">
											<input type="tel" id="doner_phone" name="doner_phone"
												value="${doner_phone }" placeholder="000-0000-0000형식으로 입력하세요"
												class="form-control"> <span
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
										<label for="email1">결제금액</label>
										<div class="input-group p-has-icon">
											<input type="text" id="app_pay" name="app_pay"
												value="${app_pay }" placeholder="금액을 입력해 주세요"
												class="form-control"> <span
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
										<label for="email1">기부 사유</label>
											<div class="input-group p-has-icon">
													<textarea rows="1" cols="1" id="doner_comment" name="doner_comment" placeholder="기부사유를을 간단히 적어주세요" class="form-control" ></textarea>
													 <span
													class="input-group-state"><span class="p-position"><span
														class="p-text"><span class="p-valid-text"><i
																class="fa fa-check"></i></span> <span class="p-error-text"><i
																class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
												<span class="input-group-icon"><i class="fa fa-check"></i></span>
											</div>
										</div>

									</div>
									

							</div>
						</div>
						
						<div class="preview-btn text-left p-buttons">
							<button class="btn" id="trans" type="button">submit</button>
							<button class="btn" id="reset" type="reset">reset</button>
							<button class="btn" id="home" type="submit">home</button>
						</div>
						
						
					</div>
				</form>
			</div>
		</div>

	</section>


</body>
</html>
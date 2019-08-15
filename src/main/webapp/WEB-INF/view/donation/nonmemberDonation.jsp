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
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<script>
$(document).ready(function(){
// 	$("#trans").on("click", function(){
// 		$("#frm").attr("action", "${cp}/donation/nonmemberDonation");
// 		$("#frm").attr("method", "post");
// 		$("#frm").submit();
// 	});
	
	//home
	$("#home").on("click", function(){
		$("#frm").attr("action", "${cp}/login");
		$("#frm").attr("method", "get");
		$("#frm").submit();
		
	});
	$(document).ready(function() {
		IMP.init("imp21318637");
	})
	
});

</script>

<script>
	// import결제 함수
	function requestPay() {
		var app_pay;
		var app_type;
		var mem_id;
		IMP.request_pay({
			// 결제회사
			pg : 'kakaopay', // version 1.1.0부터 지원.
			// 입급종류 ex)카드, 무통장 입금 등..
			pay_method : 'card',
			// 주문번호 -> seq로 대체
			merchant_uid : 'merchant_' + new Date().getTime(),
			// 주문명
			name : '주문명:결제테스트',
			// 가격 -> 게시글 가격으로 넣을 졔정
			amount : 1,
			// 구매자 이메일-> MemberVo값으로 넣을 예정
			buyer_email : 'alsckd123@naver.com',
			// 구매자 이름 -> MemberVo값으로 넣을 예정
			buyer_name : '구매자이름',
			// 구매자 전화번호 -> MemberVo값으로 넣을 예정
			buyer_tel : '010-1234-5678',
			// 구매자 집 주소 -> MemberVo값으로 넣을 예정
			buyer_addr : '서울특별시 강남구 삼성동',
			// 구매자 zipcode -> MemberVo값으로 넣을 예정
			buyer_postcode : '123-456',
		}, function(rsp) {
			if (rsp.success) {
				// [1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
				jQuery.ajax({
					url : "/donation/nonmemberDonation", // cross-domain error가 발생하지 않도록
					// 동일한 도메인으로 전송
					type : 'POST',
					data : {
// 						imp_uid C: rsp.imp_uid,
// 						app_type : editType.val(),
// 						app_pay : 1,
// 						mem_id : rsp.buyer_name
						doner :$("#doner").val(),
						doner_phone :$("#doner_phone").val(),
						app_pay :$("#app_pay").val(),
						doner_comment :$("#doner_comment").val()

					// 기타 필요한 데이터가 있으면 추가 전달
					}
				}).done(function(data) {
					// [2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
					// if ( everythings_fine ) {
					var msg = '결제가 완료되었습니다.';
					location.href = "/donation/detailDonation";
					alert(data);
					// msg += '\n고유ID : ' + rsp.imp_uid;
					// msg += '\n상점 거래ID : ' + rsp.merchant_uid;
					// msg += '\결제 금액 : ' + rsp.paid_amount;
					// msg += '카드 승인번호 : ' + rsp.apply_num;
					//
					// } else {
					// // [3] 아직 제대로 결제가 되지 않았습니다.
					// // [4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
					// }
				});
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;

				alert(msg);
			}
		});
	}
</script>


</head>
<body>

	<section class="memberjoin">


		<div class="wrap-offset">
			<div class="container-fluid">
				<form id="frm" method="get" action="${cp}/donation/nonmemberDonation" class="modern-p-form modern-ao-form-rtl p-form-modern-cadetBlue">
<%-- 					<input type="hidden" name="app_id" id="app_id" value="${app_id }"> --%>
<%-- 					<input type="hidden" name="don_id" id="don_id" value="${don_id }"> --%>
					
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
							<button class="btn" id="trans" type="button" onclick="requestPay()">submit</button>
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
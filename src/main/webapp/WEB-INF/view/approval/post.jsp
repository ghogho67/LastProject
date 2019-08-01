<meta charset="utf-8">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"
	type="text/javascript"></script>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f7a976957407edfce0f821ce36e56056&libraries=services,clusterer,drawing"></script>
<script>
	$(document).ready(function() {
		//결제 CID 초기화
		IMP.init("imp21318637");
	});

	//import결제 함수 
	function requestPay() {
		IMP.request_pay({
			//결제회사
			pg : 'kakaopay', // version 1.1.0부터 지원.
			//입급종류 ex)카드, 무통장 입금 등..
			pay_method : 'card',
			//주문번호 -> seq로 대체
			merchant_uid : 'merchant_' + new Date().getTime(),
			//주문명
			name : '주문명:결제테스트',
			//가격 -> 게시글 가격으로 넣을 졔정
			amount : 1,
			//구매자 이메일-> MemberVo값으로 넣을 예정
			buyer_email : 'alsckd123@naver.com',
			//구매자 이름 -> MemberVo값으로 넣을 예정
			buyer_name : '구매자이름',
			//구매자 전화번호 -> MemberVo값으로 넣을 예정
			buyer_tel : '010-1234-5678',
			//구매자 집 주소 -> MemberVo값으로 넣을 예정
			buyer_addr : '서울특별시 강남구 삼성동',
			//구매자 zipcode -> MemberVo값으로 넣을 예정
			buyer_postcode : '123-456',
		}, function(rsp) {
			if (rsp.success) {
				//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
				jQuery.ajax({
					url : "/approval/approval", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
					type : 'POST',
					dataType : 'json',
					data : {
						imp_uid : rsp.imp_uid
					//기타 필요한 데이터가 있으면 추가 전달
					}
				}).done(function(data) {
					//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
					if (everythings_fine) {
						var msg = '결제가 완료되었습니다.';
						msg += '\n고유ID : ' + rsp.imp_uid;
						msg += '\n상점 거래ID : ' + rsp.merchant_uid;
						msg += '\결제 금액 : ' + rsp.paid_amount;
						msg += '카드 승인번호 : ' + rsp.apply_num;

						alert(msg);
					} else {
						//[3] 아직 제대로 결제가 되지 않았습니다.
						//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
					}
				});
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				alert(msg);
			}
		});
	}
</script>
<body>
	<div class="col-sm-8 blog-main">
		<button onclick="requestPay()">결제하기</button>
	</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>



<script>
$(document).ready(function(){
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
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '주문명:결제테스트',
			amount : 1,
			buyer_email : 'alsckd123@naver.com',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
		}, function(rsp) {
			if (rsp.success) {
				jQuery.ajax({
					url : "/gradeChangeToGold", 
					type : 'GET',
					data : {

					}
				}).done(function(data) {
					var msg = '결제가 완료되었습니다.';
					location.href = "/main";
					alert(msg);
	
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


		<div class="modal fade" id="myModalGrade" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" style="padding: 50px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content"  style="background-image: url('/image/gold.png');  
				background-size: 700px; background-repeat: no-repeat;">
				<button class="btn" id="trans" type="button" onclick="requestPay()"style="margin-left:151px; height:52px; width:58%; position:absolute;top: 77%; background-color: transparent;"></button>
				<%-- <a href="${cp}/gradeChangeToGold" style="margin-left:151px; height:52px; width:58%; position:absolute;top: 77%" ></a> --%>
				</div>
			</div>
		</div>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">
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



<script>
	$(document).ready(function() {

		var msg = '${msg}';
		if (msg != '')
			alert(msg);

	
		$("#withdrawalComplete").on('click', function() {

			$("#frm").submit();

		});

	});
</script>

</head>
<body>
	<%@include file="/WEB-INF/view/common/mypage/navigationBar.jsp"%>
	<%@include file="/WEB-INF/view/common/mypage/sidebarW.jsp"%>



	<div class="content-wrapper">

		<div class="row mb-4">


			<div class="col-lg-12">

				<div
					class="content-wrapper full-page-wrapper d-flex align-items-center auth-pages">
					<div class="card col-lg-4 mx-auto">


						<div class="card-body px-5 py-5">

							<h3>회원탈퇴</h3>

							<p>
								<span class="item-txt" style="width: 100%; background: none;">
									탈퇴 후에는 아이디 <span class="cblue bold ng-binding">${MEM_INFO.mem_id}</span>
									로 다시 가입할 수 없으며, 아이디와 데이터는 복구할 수 없습니다.<br> 게시판 서비스에 남아 있는
									게시글은 탈퇴 후 삭제할 수 없습니다.
								</span>
							</p>


							<br> <br>
							<h4>탈퇴를 위해 아이디와 비밀번호를 한번더 입력해주세요</h4>
							<form action="${cp}/mypage/Worker_Wd" method="post" id="frm">
								<input type="hidden" id="memid" name="memid"
									value="${MEM_INFO.mem_id}">
								<input type="hidden" id="mempass" name="mempass"
									value="${MEM_INFO.mem_pass}">

								<div class="form-group">
									<input type="text" class="form-control p_input" id="id" name="id"
										placeholder="아이디">
								</div>
								<div class="form-group">
									<input type="password" class="form-control p_input" id="pass" name="pass"
										placeholder="비밀번호">
								</div>

								<div class="text-center">
									<button type="submit"
										class="btn btn-primary btn-block enter-btn" id="withdrawalComplete">탈퇴완료</button>
									<a href="${cp}/main"
										class="facebook-login btn btn-facebook btn-block">메인으로</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>




	</div>

















</body>
</html>
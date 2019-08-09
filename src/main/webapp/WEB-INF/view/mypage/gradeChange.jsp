<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




	<form id="frm" action="/category/InsertCategory" method="post">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" style="padding: 50px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">카테고리 추가</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<span>대분류명</span>
					<input type="hidden"  id="cataPId" name="cataPId" value="${catePId}" readonly="readonly">
					<input type="text"  id="catatitle" name="cataPtitle" value="${parentCate.cate_title}" readonly="readonly">
					
					<span>카테고리명</span>
					<input type="text" id="catatitle" name="catetitle">
					
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-danger" id="inserBtn"
							data-dismiss="modal">추가</button>
					</div>
				</div>
			</div>
		</div>

	</form>


</body>
</html>
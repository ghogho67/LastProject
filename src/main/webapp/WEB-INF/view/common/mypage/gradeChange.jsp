<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function() {

	

		$("#inserBtn").on("click", function() {

			$("#changeBtn").submit();
		});
		
	});
</script>


</head>
<body>


	<form id="frm" action="/gradeChangeToGold" method="post">
		<div class="modal fade" id="myModalGrade" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" style="padding: 50px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content"  style="background-image: url('/image/gold.png');  
				background-size: 700px; background-repeat: no-repeat;">
				
			
					
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-danger" id="changeBtn"
							data-dismiss="modal">추가</button>
					</div>
				</div>
			</div>
		</div>

	</form>


</body>
</html>
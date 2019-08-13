<%@page import="kr.or.ddit.page.model.PageVo"%>
<%@page import="kr.or.ddit.member.member.model.MemberVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>사용자 등록</title>

<!-- css, js -->

<script>
	$(document).ready(function() {

		$("#userRegBtn").on("click", function() {
			$("#frm").submit();
		});
	});
</script>

</head>

<body>
	<!-- header -->

	<div class="container-fluid">
		<div class="row">

			<!-- left -->

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="row">
					<div class="col-sm-8 blog-main">
						<h2 class="sub-header">
							게시글 답글 등록 postReply.jsp<br>
						</h2>
<pre>
cate_id : ${cate_id }<br><br>
post_id : ${post_id }<br><br>
</pre>
						<form id="frm" class="form-horizontal" role="form"
							action="${cp }/post/reply"
							method="post" enctype="multipart/form-data">
							<input type="hidden" name="cate_id" value="${cate_id }">
							<input type="hidden" name="post_id" value="${post_id }">
							<div class="form-group">
								<label for="filename" class="col-sm-2 control-label">제목</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="mem_id"
										name="post_nm">
								</div>
							</div>

							<div class="form-group">
								<label for="mem_id" class="col-sm-2 control-label">글내용</label>
								<div class="col-sm-10">
									<%@include file="../../../SE2/SE2postReply.jsp"%>
								</div>
							</div>

							<div class="form-group">
								<label for="userNm" class="col-sm-2 control-label">첨부파일</label>

								파일추가/제거 <input type="button" value="파일추가" id="addFileBtn">
								<div class="col-sm-10" id="fileArea">
									<input type="file" name="file" multiple><br> <input
										type="hidden" name="cate_id" value="${cate_id }">
								</div>
							</div>
						</form>
						<button id="userRegBtn" type="button" class="btn btn-default">저장</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	var form = document.forms[0];
	var addFileBtn = document.getElementById("addFileBtn");
	var delFileBtn = document.getElementById("delFileBtn");
	var fileArea = document.getElementById("fileArea");
	var cnt = 2;

	form.onsubmit = function() {
		event.preventDefault();
	};

	addFileBtn.onclick = function() {
		if (cnt <= 5) {
			var element = document.createElement("input");
			element.type = "file";
			element.name = "file";
			cnt++;
			fileArea.appendChild(element);
			fileArea.appendChild(document.createElement("br"));
		} else {
			alert("파일은 5개까지만 추가 가능합니다");
		}

	};

	delFileBtn.onclick = function() {
		if (cnt > 1) {
			cnt--;
			var inputs = fileArea.getElementsByTagName('input');
			fileArea.removeChild(inputs[cnt].nextElementSibling);
			fileArea.removeChild(inputs[cnt]);
		}
	}
</script>
</html>





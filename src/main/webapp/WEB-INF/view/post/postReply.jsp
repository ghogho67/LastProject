<%@page import="kr.or.ddit.page.model.PageVo"%>
<%@page import="kr.or.ddit.member.member.model.MemberVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>사용자 등록</title>

<script>
	$(document).ready(function() {

		$("#userRegBtn").on("click", function() {
			$("#frm").submit();
		});
	});
</script>

</head>

<body>

	<div class="container" style="margin-top: 100px;">
		<div class="card">
			<div class="card-body" style="padding: 50px;">
				<h2 class="sub-header">
					게시글 답글 등록<br>
				</h2>
				<form id="frm" class="form-horizontal" role="form"
					action="${cp }/post/reply" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="cate_id" value="${cate_id }"> <input
						type="hidden" name="post_id" value="${post_id }">
					<div>
						<label for="filename" class="col-sm-2 control-label">제목</label>
						<div>
							<input type="text" class="form-control" id="mem_id"
								name="post_nm">
						</div>
					</div>
					<div>
						<label for="mem_id" class="col-sm-2 control-label">글내용</label>
						<%@include file="../../../SE2/SE2postReply.jsp"%>
					</div>
					<div>
						<input type="button" class="btn btn-primary btn-sm" value="파일추가"
							id="addFileBtn">
						<div id="fileArea">
							<input type="file" name="file" multiple><br> <input
								type="hidden" name="cate_id" value="${cate_id }">
						</div>
					</div>
				</form>
				<form id="postContFrm" method="get" style="float: left;"
					action="${cp}/post/pagingList?cate_id='${cate_id }'">
					<input type="hidden" name="cate_id" value="${cate_id }" /> <input
						type="hidden" name="post_id" value="${post_id }" />
				</form>
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






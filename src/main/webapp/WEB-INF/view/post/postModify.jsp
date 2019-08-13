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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
	$(document).ready(function() {

		$("#postModifyBtn").on("click", function() {
			$("#frm").submit();
		});

	});
</script>

</head>

<body>


	<div class="container-fluid">

		<div class="row">



			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

				<div class="row">

					<div class="col-sm-8 blog-main">

						<h2 class="sub-header">게시글 수정 postModify.jsp</h2>

						<pre>
cate_id : ${cate_id }<br> 
post_id : ${post_id } <br>
attachmentList : ${attachmentList }<br>
postVo : ${postVo}<br>
</pre>

						<form id="frm" class="form-horizontal" role="form"
							action="${cp}/post/modify" method="post"
							enctype="multipart/form-data">

							<input type="hidden" name="post_id" value="${post_id }">

							<input type="hidden" name="cate_id" value="${cate_id }">

							<div class="form-group">

								<label for="filename" class="col-sm-2 control-label">제목</label>

								<div class="col-sm-10">

									<input type="text" class="form-control" id="post_nm"
										name="post_nm" value="${postVo.post_nm}">
								</div>
							</div>

							<div class="form-group">

								<label for="mem_id" class="col-sm-2 control-label">글내용</label>

								<div class="col-sm-10">

									<%@include file="../../../SE2/SE2postModify.jsp"%>

								</div>
							</div>

							<div class="form-group">

								<label for="userNm" class="col-sm-2 control-label">첨부파일</label>

								<div class="col-sm-10">

									<c:forEach items="${attachmentList}" var="attachment">
										<br>

										<label for="attachmentName" class="col-sm-5 control-label">${attachment.att_nm }</label>
										<br>

										${attachment.att_id}

										<a id="a"
											href="${cp}/attachment/delete?att_id=${attachment.att_id}&post_id=${post_id }&cate_id=${cate_id }"
											class="attachment	btn-default pull-right">X</a>
									</c:forEach>
								</div>

								파일추가 <input type="button" value="파일추가" id="addFileBtn">

								<div class="col-sm-10" id="fileArea">

									<input type="file" name="file" multiple><br> <input
										type="hidden" name="cate_id" value="${cate_id }">

								</div>
							</div>

							<button type="submit" id="postModifyBtn">수정완료</button>

						</form>
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
		var a = $('.attachment').length;

		if (a + cnt <= 5) {
			var element = document.createElement("input");
			element.type = "file";
			element.name = "file"
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
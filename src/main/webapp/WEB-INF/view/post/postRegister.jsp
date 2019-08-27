
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>게시글 등록</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath }/se2/js/HuskyEZCreator.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>
<style>
div {
	width: 800px;
}
</style>
<script>
$( document ).ready(function() {
	$("#text") = str_replace("<", "&lt", $("#text"));
	$("#text") = str_replace(">", "&lt", $("#text"));
})
</script>
</head>
<body>
	<div class="container">
								<h2 class="sub-header">
									게시글 신규 등록<br> <br> WEB-INF/view/post/postRegister.jsp<br> <br>
								</h2>
				<form id="frm1" role="form" action="${cp}/post/register" method="post" enctype="multipart/form-data">
				<input type="hidden" name="cate_id" value="${cate_id }" />
			<div class="card">
						<label for="post_nm" class="col-sm-2 control-label">제목</label>
				<div>
					<input type="text" id = "text" class="form-control" name="post_nm">
				</div>
			</div>
			<div>
						<label for="post_cont" class="col-sm-2 control-label">글내용</label>
				<div>
					<%@include file="../../../SE2/SE2postRegister.jsp"%>
				</div>
			</div>
			<div id="fileArea">
				<input type="button" value="파일추가" class="btn btn-primary btn-sm" id="addFileBtn"> <br> 
				<input type="file" name="file"	multiple> 
				<input type="hidden" name="cate_id"	value="${cate_id }">
			</div>
				</form>
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
			alert(element);
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






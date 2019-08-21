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

<!-- css, js -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
	$(document).ready(function() {

		$("#reportModifyBtn").on("click", function() {
			$("#frm").submit();
		});

	});
</script>

</head>

<body>


	<div class="container">
									<h2 class="sub-header">게시글 수정 reportModify.jsp</h2>
									<pre>
									reportAttachList : ${reportAttachList}  reportVo : ${reportVo}
									</pre>
		<form id="frm" class="form-horizontal" role="form" action="${cp}/report/modify" method="post" enctype="multipart/form-data">
				<input type="hidden" name="mat_id" value="${mat_id }"> 
			<div>
				<label for="filename" class="col-sm-2 control-label">제목</label>
				<input type="text" class="form-control" id="rep_title" name="rep_title" value="${reportVo.rep_title}">
			</div>
			<div>
				<label for="mem_id" class="col-sm-2 control-label">글내용</label>
			<div>
				<div>
				<br>
					<textarea name="rep_cont" id="smarteditor" rows="10" cols="100"	style="width: 1110px; height: 412px;"></textarea>
				</div>
					<input type="button" id="savebutton" value="수정완료" class="btn btn-primary btn-sm" style="float:right;"/>
					<a href="${cp}/report/pagingList" class="btn btn-primary btn-sm pull-right">매칭목록</a>
				</div>
			</div>
			<div>
				<div>
					<c:forEach items="${reportList}" var="report">
						<label for="rep_title" class="col-sm-5 control-label">${report.att_nm }</label>${report.att_id}
						<a id="a" href="${cp}/report/delete?rep_id=${report.mat_id} class="btn btn-primary btn-sm">X</a>
					</c:forEach>
				</div>
				<div id="fileArea">
					<input type="button" value="파일추가" class="btn btn-primary btn-sm"	id="addFileBtn"> <br> 
					<input type="file" name="file" multiple> 
				</div>
			</div>
		</form>
	</div>
	<form id="reportContFrm" method="get" style="float: left;" action="${cp}/report/pagingList">
		<input type="hidden" name="rep_id" value="${ReportVo.mat_id }" /> 
	</form>
		
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
		var a = $("a").length;

		if (a + cnt <= 32) {
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

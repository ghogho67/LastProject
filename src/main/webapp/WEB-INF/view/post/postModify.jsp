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

		$("#postModifyBtn").on("click", function() {
			$("#frm").submit();
		});

	});
</script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script
	src="${pageContext.request.contextPath}/SE2/js/HuskyEZCreator.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath }/se2/js/HuskyEZCreator.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>
<script type="text/javascript">
	var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함.
	$(document)
			.ready(
					function() {
						// Editor Setting
						nhn.husky.EZCreator
								.createInIFrame({
									oAppRef : oEditors, // 전역변수 명과 동일해야 함.
									elPlaceHolder : "smarteditor", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
									sSkinURI : "${pageContext.request.contextPath}/SE2/SmartEditor2Skin.html", // Editor HTML
									fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X
									htParams : {
										// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
										bUseToolbar : true,
										// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
										bUseVerticalResizer : true,
										// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
										bUseModeChanger : true,
									}
								});

						// 전송버튼 클릭이벤트
						$("#savebutton").click(
								function() {
									if (confirm("저장하시겠습니까?")) {
										// id가 smarteditor인 textarea에 에디터에서 대입
										oEditors.getById["smarteditor"].exec(
												"UPDATE_CONTENTS_FIELD", []);

										// 이부분에 에디터 validation 검증
										if (validation()) {
											var rep_title = $("#post_nm").val()
													.replace(/</gi, "&lt;");
											var text = rep_title.replace(/>/gi,
													"&gt;");
											$("#post_nm").val(text);
											$("#post_nm").val();
											$("#saveFrm").submit();
										}
									}
								})

						$("#postCont").click(function() {
							$("#postContFrm").submit();
						})

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
								fileArea.appendChild(document
										.createElement("br"));
							} else {
								alert("파일은 5개까지만 추가 가능합니다");
							}

						};
						delFileBtn.onclick = function() {
							if (cnt > 1) {
								cnt--;
								var inputs = fileArea
										.getElementsByTagName('input');
								fileArea
										.removeChild(inputs[cnt].nextElementSibling);
								fileArea.removeChild(inputs[cnt]);
							}
						}
					});

	// 필수값 Check
	function validation() {
		var contents = $.trim(oEditors[0].getContents());
		if (contents === '<p>&nbsp;</p>' || contents === '') { // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음. 
			alert("내용을 입력하세요.");
			oEditors.getById['smarteditor'].exec('FOCUS');
			return false;
		}

		return true;
	}
</script>

</head>

<body>

	<div class="container" style="margin-top: 100px;">
		<div class="card">
			<div class="card-body" style="padding: 50px;">
				<h2 class="sub-header">게시글 수정</h2>
				<form id="saveFrm" class="form-horizontal" role="form"
					action="${cp}/post/modify" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="post_id" value="${post_id }"> <input
						type="hidden" name="cate_id" value="${cate_id }">
					<div>
						<label for="filename" class="col-sm-2 control-label">제목</label> <input
							type="text" class="form-control" id="post_nm" name="post_nm"
							value="${postVo.post_nm}">
					</div>
					<div>
						<label for="mem_id" class="col-sm-2 control-label">글내용</label>
						<div>
							<textarea name="post_cont" id="smarteditor" rows="10" cols="100"
								style="width: 600px; height: 412px;">${postVo.post_cont}</textarea>
							<input type="button" id="savebutton" value="글등록"
								class="btn btn-primary btn-sm" style="float: right;" /> <input
								id="postCont" type="button"
								class="btn btn-primary btn-sm pull-right" name="button"
								value="글목록">
						</div>
					</div>
					<div>
						<div>
							<c:forEach items="${attachmentList}" var="attachment">
								<label for="attachmentName" class="col-sm-5 control-label">${attachment.att_nm }</label>${attachment.att_id}
						<a id="a"
									href="${cp}/attachment/delete?att_id=${attachment.att_id}&post_id=${post_id }&cate_id=${cate_id }"
									class="btn btn-primary btn-sm">X</a>
							</c:forEach>
						</div>
						<div id="fileArea">
							<input type="button" value="파일추가" class="btn btn-primary btn-sm"
								id="addFileBtn"> <br> <input type="file"
								name="file" multiple> <input type="hidden"
								name="cate_id" value="${cate_id }">
						</div>
					</div>
				</form>
			</div>
			<form id="postContFrm" method="get" style="float: left;"
				action="${cp}/post/pagingList?cate_id='${cate_id }'">
				<input type="hidden" name="cate_id" value="${cate_id }" /> <input
					type="hidden" name="post_id" value="${post_id }" />
			</form>
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

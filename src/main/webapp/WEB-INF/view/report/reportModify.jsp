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

<title>reportModify</title>
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
						$("#savebutton")
								.click(
										function() {
											if ($("#rep_title").val() === '_$t&nbsp;_$ta'
													|| $("#rep_title").val() === '') {
												alert("제목을 입력해주세요")
												return;
											} else {

												if (confirm("저장하시겠습니까?")) {

													// id가 smarteditor인 textarea에 에디터에서 대입
													oEditors.getById["smarteditor"]
															.exec(
																	"UPDATE_CONTENTS_FIELD",
																	[]);

													// 이부분에 에디터 validation 검증
													if (validation()) {
														var rep_title = $(
																"#rep_title")
																.val().replace(
																		/</gi,
																		"&lt;");
														var text = rep_title
																.replace(/>/gi,
																		"&gt;");
														$("#rep_title").val(
																text);
														$("#rep_title").val();
														$("#frm").submit();
													}
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
		if (contents === '_$t&nbsp;_$ta' || contents === '') { // 기본적으로 아무것도 입력하지 않아도 _$t&nbsp;_$ta 값이 입력되어 있음. 
			alert("내용을 입력하세요.");
			oEditors.getById['smarteditor'].exec('FOCUS');
			return false;
		}

		return true;
	}
</script>
<script>
	$(document).ready(function() {

		$("#reportModifyBtn").on("click", function() {
			$("#frm").submit();
		});

	});
</script>
<style>
#addFileBtn {
	height: 27.19px;
	width: 60.55px;
	padding: 0px;
	border: 0px;
	min-height: 10px;
	color: white;
	font: sans-serif;
	font-size: 12px;
	background-color: #6772e5;
	font-size: 12px;
	font-weight: normal;
	border-radius: 3px;
}

#savebutton {
	height: 27.19px;
	width: 60.55px;
	padding: 0px;
	border: 0px;
	min-height: 10px;
	color: white;
	background-color: #6772e5;
	font: sans-serif;
	font-size: 12px;
	font-weight: normal;
	border-radius: 3px;
}
</style>

</head>

<body>

	<div class="content-wrapper"
		style="margin-top: 30px; width: 1140px; margin-left: 380px;">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body" style="padding: 30px;">
					<div class="titlee">
						<h2 class="sub-header">보고서 수정</h2>
						<form id="frm" class="form-horizontal" role="form"
							action="${cp}/report/modify" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="mat_id" value="${mat_id }">
							<div>
								<!-- 								<label for="filename" class="col-sm-2 control-label">제목</label> -->
								<input type="text" class="form-control" id="rep_title"
									name="rep_title" value="${reportVo.rep_title}">
							</div>
							<div>
								<!-- 								<label for="mem_id" class="col-sm-2 control-label">글내용</label> -->
								<div>
									<div>
										<br>
										<textarea name="rep_cont" id="smarteditor" rows="10"
											cols="100" style="width: 800px; height: 412px;">
					${reportVo.rep_cont}
					</textarea>
									</div>
									<input type="button" id="savebutton" value="수정완료"
										style="float: right;" /> <a href="${cp}/report/pagingList"
										class="btn btn-primary btn-sm pull-right">매칭목록</a>
								</div>
							</div>
							<div>
								<div>
									<c:forEach items="${reportAttachList}" var="attach">
										<label for="reportAttach" class="col-sm-5 control-label">${attach.rep_att_nm }</label>
										<a id="a"
											href="${cp}/reportAttach/delete?mat_id=${reportVo.mat_id}&rep_att_id=${attach.rep_att_id}"
											class="btn btn-primary btn-sm">X</a>
									</c:forEach>
								</div>
								<div id="fileArea">
									<input type="button" value="파일추가" id="addFileBtn"> <br>
									<input type="file" name="file" multiple>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form id="reportContFrm" method="get" style="float: left;"
		action="${cp}/report/pagingList">
		<input type="hidden" name="mat_id" value="${reportVo.mat_id }" />
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Smart Editor</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script
	src="${pageContext.request.contextPath}/SE2/js/HuskyEZCreator.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

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

											if ($("#text").val() === '<p>&nbsp;</p>'
													|| $("#text").val() === '') {
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
														$("#frm1").submit();
													}
												}
											}
										})
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
	$("#postCont").on("click", function() {
		$("#postContFrm").submit();
	})
</script>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="row">
					<div class="col-sm-8 blog-main">
						<h2 class="sub-header">
							게시글 신규 등록<br> <br> postRegister.jsp<br> <br>
						</h2>
						<form id="frm1" class="form-horizontal" role="form"
							action="${cp}/post/register" method="post"
							enctype="multipart/form-data">

							<input type="hidden" name="cate_id" value="${cate_id }" />
							cate_id = ${cate_id }
							<div class="form-group">

								<label for="post_nm" class="col-sm-2 control-label">제목</label>

								<div class="col-sm-10">

									<input type="text" class="form-control" name="post_nm">
								</div>
							</div>
							<div class="form-group">
								<label for="post_cont" class="col-sm-2 control-label">글내용</label>
								<div class="col-sm-10">
									<textarea name="post_cont" id="smarteditor" rows="10"
										cols="100" style="width: 600px; height: 412px;"></textarea>
									<input type="button" id="savebutton" value="post/register" />
								</div>
							</div>
							<form action="${pageContext.request.contextPath }/postRegister"
								method="post" id="frm">
								<textarea name="post_content" id="smarteditor" rows="10"
									cols="100" style="width: 600px; height: 412px;"></textarea>
							</form>
							<input type="button" id="savebutton" value="글등록" /> <input
								id="postCont" type="button"
								class="btn btn-primary btn-sm pull-right" name="button"
								value="글목록">
							<div class="form-group">
								<label for="userNm" class="col-sm-2 control-label">첨부파일</label>
								파일추가/제거 <input type="button"
									class="btn btn-primary btn-sm full-right" value="파일추가"
									id="addFileBtn">
								<div class="col-sm-10" id="fileArea">
									<input type="file" name="file"><br> <input
										type="hidden" name="cate_id" value="${cate_id }">
								</div>
							</div>
						</form>
						<form id="postContFrm" method="get" style="float: left;"
							action="${cp}/post/pagingList?cate_id='${cate_id }'">
							<input type="hidden" name="cate_id" value="${cate_id }" /> <input
								type="hidden" name="post_id" value="${post_id }" /> <input
								id="postCont" type="button"
								class="btn btn-primary btn-sm pull-right" name="button"
								value="글목록">
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

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
			// 			element.name = "upfile" + cnt;
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

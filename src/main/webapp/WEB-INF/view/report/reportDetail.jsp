<%@page import="kr.or.ddit.page.model.PageVo"%>
<%@page import="kr.or.ddit.member.member.model.MemberVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>사용자 상세조회</title>
<style type="text/css">
#titlee h2, #pzone h2 {
	font-size: 40px;
	font-weight: normal;
	letter-spacing: -1px;
}

#titlee h2 {
	padding: 25px 35px;
}

#titlee h2 span {
	font-weight: bold;
	color: #473fa0;
}

tr {
	text-align: center;
	font-weight: 500;
}

td {
	text-align: center;
}

.title {
	background-color: transparent;
	width: 180px;
	padding: 3px;
	font-size: 14px;
	text-align: center;
}

.kkk {
	background-color: transparent;
	border-color: transparent;
	width: 30px;
	padding: 3px;
	font-size: 9pt;
	width: 30px;
}

.btn {
	vertical-align: center;
	padding: 10px;
	margin: 10px;
}

textarea {
	height: 100px;
	width: 500px;
	vertical-align: center;
}

#reply_box {
	vertical-align: center;
	margin: 5px;
	padding: 5px;
}

.div {
	vertical-align: center;
	padding: 5px;
	margin: 5px;
}
</style>

<script>
	$(document).ready(function() {
		$("#reportModifyBtn").on("click", function() {
			$("#reportModifyfrm").submit();
		});
		$("#postDeleteBtn").on("click", function() {
			$("#postDeletefrm").submit();
		});
		$("#postReBtn").on("click", function() {
			$("#postRefrm").submit();
		});
		$("#replyBtn").on("click", function() {
			$("#replyfrm").submit();
		})
		$("#postCont").on("click", function() {
			$("#postContFrm").submit();
		})

	});
</script>

<script>
	var count = 1;
	var num = 1;

	function addBox(x) {
		if (document.all) { // 인터넷 익스플로러 4.0 이상이면,
			var Commentext = '<p><textarea NAME="Comment' + count++ + '" rows="5" cols="50" style="background-color:#F5F5F5">textarea '
					+ num++ + '<\/textarea>';
			x.insertAdjacentHTML('beforeEnd', Commentext)
		} else if (document.getElementById) { // 넷스케이프 6.0 이상이면,
			var newArea = document.createElement('textarea');
			newArea.name = 'Comment' + count++;
			newArea.rows = 5;
			newArea.cols = 50;
			x.appendChild(document.createElement('p'));
			x.appendChild(newArea);
		} else if (document.layers) { // 넷스케이프 4.0 이상이면,
			var newLayer = new Layer(window.innerWidth);
			var Commentext = '';
			Commentext += '<html><body><form name="myForm">';
			Commentext += '<textarea name="Comment" rows="5" cols="50" style="background-color:#F5F5F5">textarea '
					+ num++ + '<\/textarea>';
			Commentext += '<\/form><\/body><\/html>';
			newLayer.document.write(Commentext);
			newLayer.document.close();
			newLayer.top = document.height;
			document.height += newLayer.document.height;
			newLayer.visibility = 'show';
		} else {
			alert('네츠케이프와 익스플로러 4.0 이상에서만 사용할 수 있습니다')
		}
		;
	}
</script>
</head>
<body>
	<div class="content-wrapper">

		<div class="col-lg-12">

			<div class="card">
				<div class="card-body">

				
						<h2 class="sub-header">보고서 조회</h2>
						<div class="form-group col-sm-8">
							<div class="col-sm-10">
								<h4>${reportVo.rep_title}</h4>
							</div>
							<hr>
						</div>
						<div class="form-group col-sm-8">
							<div class="col-sm-10">
								<label class="control-label">${reportVo.rep_cont}</label>
							</div>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<hr>
						</div>
						<div class="form-group col-sm-8">
							<label for="userNm" class="col-sm-2 control-label">첨부파일</label>
							<div class="col-sm-10">
								<c:forEach items="${reportAttachList}" var="reportAttachVo">
									<br>
									<div>
										${reportAttachVo.rep_att_nm } <a
											href="${cp}/reportAttach/download?mat_id=${mat_id }&rep_att_id=${reportAttachVo.rep_att_id }"
											class="btn btn-primary btn-sm pull-right">다운로드</a>
									</div>
									<br>
								</c:forEach>
							</div>
						</div>
					</div>

					<div class="form-group col-sm-8 text-left">
						<hr>
						<c:if test="${cw_mem_id eq mem_id }">
							<form style="float: left;" id="reportModifyfrm" method="post"
								action="${cp}/report/modifyView">
								<button id="reportModifyBtn" type="button"
									class="btn btn-primary btn-sm" name="button">수정</button>
								<input type="hidden" value="${mat_id }" name="mat_id">
							</form>
						</c:if>
						<a href="${cp}/report/pagingList"
							class="btn btn-primary btn-sm pull-right">매칭목록</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>






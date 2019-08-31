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

<style>
#reportModifyBtn {
	height: 27.19px;
	width: 60.55px;
	background-color: #6772e5;
	color: white;
	border-radius: 5px;
	font: sans-serif;
	font-size: 12px;
}

#cont {
	height: 27.19px;
	background-color: #6772e5;
	display: inline-block;
	text-align: center;
	padding: 5px;
	color: white;
	width: 60.55px;
	margin-left: 2px;
	border-radius: 3px;
	font: sans-serif;
	font-size: 12px;
}
</style>

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
	<div class="content-wrapper"
		style="width: 1140px; margin-left: 400px; height: 683px; padding: 50px; min-height: 50vh; margin-top: 50px;">
		<!-- 		<div class="col-lg-12"> -->
		<div class="card"
			style="width: 100%; height: 600px; overflow: auto; height: 600px;">
			<div class="card-body"
				style="height: 600px; overflow: auto; padding-top: 0px;">
				<div>
					<div style="width: 8%; float: left;">
						<img id="img" src="${cp }/matching/photo?mem_id=${cw_mem_id} "
							style="width: 100px; height: 100px;" alt="${cp}/image/tes.png" />
					</div>
					<div class=" col-sm-12"
						style="margin-left: 100px; margin-top: 40px;">
						<h2>${reportVo.rep_title}</h2>
						<span> <fmt:formatDate value="${reportVo.rep_time}"
								pattern="yyyy.MM.dd. hh:mm" />
						</span>
						<%-- 						<span style="color: #c8967f"> ${reportVo.mem_id} </span> --%>
						<br> <br>
					</div>
					<br>
					<hr>
				</div>

				<div style="height: 500px;" style="overflow: scroll">
					<div style="padding-left: 5px;">
						<label class="control-label">${reportVo.rep_cont}</label> <br>
						<br> <br> <br> <br> <br> <br> <br>
						<br> <br> <br> <br> <br>
						<!-- 					<label for="userNm" class="col-sm-2 control-label">첨부파일</label> -->
						<c:forEach items="${reportAttachList}" var="reportAttachVo">
							<hr>
							<div style="height: 20px; padding-left: 2px;">
								${reportAttachVo.rep_att_nm } <a
									href="${cp}/reportAttach/download?mat_id=${mat_id }&rep_att_id=${reportAttachVo.rep_att_id }"
									style="height: 20px;"><img id="img"
									src="${cp}/image/down.png" style="width: 20px; height: 20px;"
									alt="${cp}/image/down.png" /></a>
							</div>
						</c:forEach>
					</div>

				</div>
			</div>
			<div style="margin-left: 10px;">
				<hr>
				<c:if test="${cw_mem_id eq mem_id }">
					<form style="float: left;" id="reportModifyfrm" method="post"
						action="${cp}/report/modifyView">
						<button id="reportModifyBtn" type="button" name="button"
							style="float: right;">수정</button>
						<input type="hidden" value="${mat_id }" name="mat_id">
					</form>
				</c:if>
				<a href="${cp}/report/pagingList" id="cont">매칭목록</a>
			</div>
		</div>
	</div>
</body>
</html>






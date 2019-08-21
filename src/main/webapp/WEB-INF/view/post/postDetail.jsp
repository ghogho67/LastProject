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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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

textarea{
height: 100px;
width: 500px;
vertical-align: center;
}

#reply_box{
vertical-align: center;
margin: 5px;
padding: 5px;
}

.div{
vertical-align: center;
padding:5px;
margin:5px;
}
</style>

<script>
	$(document).ready(function() {
		$("#postModifyBtn").on("click", function() {
			$("#postModifyfrm").submit();
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
	<div class="container">
		<div style="padding-top: 50px; width: 1250px;">
			<div class="card">
				<div class="card-body">
					<div class="titlee">
						<h2 class="sub-header">게시글 상세조회 postDetail.jsp</h2>
						<pre>
cate_id : ${cate_id } post_id : ${post_id } replyList : ${replyList } attachmentList : ${attachmentList } postVo : ${postVo }mem_id : ${mem_id } cw_mem_id:${cw_mem_id }
</pre>
						<div class="form-group col-sm-8">
							<div class="col-sm-10">
								<h4>${postVo.post_nm}</h4>
								<!-- 								<input type="text" class="form-control" id="mem_id" -->
								<%-- 									name="mem_id" value="${postVo.post_nm}"> --%>
							</div>
							<hr>
						</div>
						<div class="form-group col-sm-8">
							<div class="col-sm-10">
								<label class="control-label">${postVo.post_cont}</label>
							</div>
							<br><br><br><br><br><br><br><br><br><br><br><br><br>
							<hr>
						</div>
						<div class="form-group col-sm-8">
							<label for="userNm" class="col-sm-2 control-label">첨부파일</label>
							<div class="col-sm-10">
								<c:forEach items="${attachmentList}" var="attachment">
									<br>
										<div>
										${attachment.att_nm }
										<a href="${cp}/attachment/download?cate_id=${cate_id}&post_id=${post_id }&att_id=${attachment.att_id }"
										class="btn btn-primary btn-sm pull-right">다운로드</a>
										</div>
										
									<br>
								</c:forEach>
							</div>
						</div>
						<div class="form-group col-sm-8">
						<hr>
							<label for="userNm" class="col-sm-2 control-label">댓글</label>
							<div>
							<br>
								<c:forEach items="${replyList}" var="reply">
										<c:choose>
											<c:when test="${reply.reply_del eq 'Y'}">
											삭제된 댓글입니다
										</c:when>
											<c:otherwise>
											<strong>${reply.mem_id } </strong> <fmt:formatDate	value="${reply.reply_time }" pattern="yyyy.MM.dd. hh:mm" /><br>
											<br>
											${reply.reply_cont}
											<hr>
											${attachment.att_id} 
										</c:otherwise>
										</c:choose> <c:if
											test="${reply.mem_id eq mem_id && reply.reply_del eq 'N'}">
										</c:if>
								</c:forEach>
							</div>
							</div>
						</div>
						<div class="form-group col-sm-8">
							<label for="userNm" class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
								<form id="replyfrm" method="post" action="${cp}/reply/register">
									<div id="reply_box">
									<div>
										<textarea name="reply_cont" maxlength="500"></textarea>
										<button id="replyBtn" type="submit" class="btn btn-primary btn-sm" name="button" style="float:right;">댓글 등록</button>
									</div>
										<input type="hidden" name="post_id" value="${post_id}">
										<input type="hidden" name="cate_id" value="${cate_id }">
									</div>
								</form>
							</div>
						</div>
						
						<div class="form-group col-sm-8 text-left">
									<hr>
							<form style="float:left;" id="postModifyfrm" method="post" action="${cp}/post/modifyView">
								<button id="postModifyBtn" type="button" class="btn btn-primary btn-sm" name="button">수정</button>
								<input type="hidden" value="${post_id }" name="post_id">
								<input type="hidden" value="${cate_id }" name="cate_id">
							</form>
							<c:if test="${postVo.mem_id eq mem_id }">
								<form style="float:left;" id="postDeletefrm" method="post" action="${cp}/post/delete?cate_id=${cate_id}">
									<button id="postDeleteBtn" type="button" class="btn btn-primary btn-sm" name="button">삭제</button>
									<input type="hidden" value="${post_id }" name="post_id">
									<input type="hidden" value="${cate_id }" name="cate_id">
								</form>
							</c:if>
							<form id="postRefrm" method="get" style="float:left;" action="${cp}/post/reply?cate_id='${cate_id }'">
								<input type="hidden" name="cate_id" value="${cate_id }" /> 
								<input type="hidden" name="post_id" value="${post_id }" />
								<button id="postReBtn" type="button" class="btn btn-primary btn-sm" name="button">답글</button>
							</form>
							<form id="postContFrm" method="get" style="float:left;" action="${cp}/post/pagingList?cate_id='${cate_id }'">
								<input type="hidden" name="cate_id" value="${cate_id }" /> 
								<input type="hidden" name="post_id" value="${post_id }" />
								<input id="postCont" type="button" class="btn btn-primary btn-sm pull-right" name="button" value="글목록">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>






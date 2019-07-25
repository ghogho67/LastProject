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
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<title>사용자 상세조회</title>
<script>
	$(document).ready(function() {
		
		$('#sitenameDisabled').click(function() {
			  $('input').prop('disabled', true);
			});
		
		$('#sitenameEnabled').click(function() {
			  $('input').prop('disabled', false);
			});


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
	
	});
</script>

<SCRIPT>
var count = 1; 
var num = 1; 

function addBox (x) {
  if (document.all) {  // 인터넷 익스플로러 4.0 이상이면,
    var Commentext = '<p><textarea NAME="Comment' + count++ + '" rows="5" cols="50" style="background-color:#F5F5F5">textarea '+num++ +'<\/textarea>';
    x.insertAdjacentHTML('beforeEnd', Commentext)
  }
  else if (document.getElementById) {  // 넷스케이프 6.0 이상이면,
    var newArea = document.createElement('textarea');
    newArea.name = 'Comment' + count++;
    newArea.rows = 5;
    newArea.cols = 50;
    x.appendChild(document.createElement('p'));
    x.appendChild(newArea);
  }
  else if (document.layers) {  // 넷스케이프 4.0 이상이면,
    var newLayer = new Layer (window.innerWidth);
    var Commentext = '';
    Commentext += '<html><body><form name="myForm">';
    Commentext += '<textarea name="Comment" rows="5" cols="50" style="background-color:#F5F5F5">textarea '+num++ +'<\/textarea>';
    Commentext += '<\/form><\/body><\/html>';
    newLayer.document.write(Commentext);
    newLayer.document.close();
    newLayer.top = document.height;
    document.height += newLayer.document.height;
    newLayer.visibility = 'show';
  }
 else {alert('네츠케이프와 익스플로러 4.0 이상에서만 사용할 수 있습니다')};
}

</SCRIPT>
</head>
<body>

	<div class="container-fluid">

		<div class="row">


			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

				<div class="row">

					<div class="c blog-main">

						<h2 class="sub-header">게시글 상세조회 postDetail.jsp</h2>


						<pre>
cate_id : ${cate_id } <br>
post_id : ${post_id }<br>
replyList : ${replyList }<br>
attachmentList : ${attachmentList }<br>
postVo : ${postVo }<br>
mem_id : ${mem_id }
</pre>
						<div class="form-group col-sm-8">

							<label for="userNm" class="col-sm-2 control-label">제목</label>

							<div class="col-sm-10">
								<p>${postVo.post_nm}</p>
								<!-- 								<input type="text" class="form-control" id="mem_id" -->
								<%-- 									name="mem_id" value="${postVo.post_nm}"> --%>
							</div>
						</div>
						<div class="form-group col-sm-8">

							<label for="userNm" class="col-sm-2 control-label">글내용</label>

							<div class="col-sm-10">

								<label class="control-label">${postVo.post_cont}</label>
							</div>
						</div>

						<div class="form-group col-sm-8">

							<label for="userNm" class="col-sm-2 control-label">첨부파일</label>

							<div class="col-sm-10">

								<c:forEach items="${attachmentList}" var="attachment">
									<br>

									<label for="attachmentName" class="col-sm-5 control-label">

										<a
										href="${cp}/attachment/download?cate_id=${cate_id}&post_id=${post_id }&att_id=${attachment.att_id }"
										class=" btn btn-default pull-right">다운로드</a>${attachment.att_nm }
									</label>
									<br>
								</c:forEach>
							</div>
						</div>

						<div class="form-group col-sm-8">

							<label for="userNm" class="col-sm-2 control-label">댓글</label>

							<div class="col-sm-10">

								<c:forEach items="${replyList}" var="reply">
									<br>

									<label for="replyName" class="col-sm-10 control-label">
										<c:choose>
											<c:when test="${reply.reply_del eq 'Y'}">
											삭제된 댓글입니다
										</c:when>

											<c:otherwise>

											${reply.reply_cont}<br>

											[작성자 : ${reply.mem_id } 작성시간 : <fmt:formatDate
													value="${reply.reply_time }" pattern="yyyy년MM월dd일hh시mm분ss초" />]<br>

											${attachment.att_id} 

										</c:otherwise>

										</c:choose> 
										<c:if test="${reply.mem_id eq mem_id && reply.reply_del eq 'N'}">
<!-- 											<INPUT TYPE="button" VALUE="Textarea 추가" onclick="addBox(this.form)"> -->
<!-- 											<a href="#" class="filter-70 m-tcol-c _btnEdit">수정</a> -->
<%-- 											<a href="${cp}/reply/modify?reply_id=${reply.reply_id }&post_id=${post_id }&cate_id=${cate_id }" class=" btn btn-default pull-right">수정</a> --%>
<!-- 											<textarea id="comment_text" cols="50" rows="2" class="textarea m-tcol-c" maxlength="6000" style="overflow: hidden; line-height: 14px; height: 41px;" title="댓글수정">a</textarea> -->
<%-- 											<a href="${cp}/reply/delete?reply_id=${reply.reply_id }&post_id=${post_id }&cate_id=${cate_id }" class=" btn btn-default pull-right">삭제</a> --%>
<!-- 											<br> -->
										<input type="text" placeholder="site name" />
										<button id="sitenameDisabled">Disable</button>
										<input type="text" placeholder="site name" />
										<button id="sitenameEnabled">Enabled</button>
										</c:if>
									</label>
								</c:forEach>
							</div>
						</div>

						<div class="form-group col-sm-8">

							<label for="userNm" class="col-sm-2 control-label"></label>

							<div class="col-sm-10">

								<form id="replyfrm" method="post" action="${cp}/reply/register">

									<div id="reply_box">

										<textarea name="reply_cont" maxlength="500"></textarea>

										<input type="hidden" name="post_id" value="${post_id}">

										<input type="hidden" name="cate_id" value="${cate_id }">
										<button id="replyBtn" type="submit" class="btn btn-default"	name="button">댓글저장</button>
									</div>
								</form>
							</div>
						</div>

						<div class="form-group col-sm-8 text-right">

							<form id="postModifyfrm" method="post" action="${cp}/post/modifyView">
								<button id="postModifyBtn" type="button" class="btn btn-default" name="button">수정</button>
								<input type="hidden" value="${post_id }" name="post_id">
								<input type="hidden" value="${cate_id }" name="cate_id">
							</form>

							<c:if test="${postVo.mem_id eq mem_id }">

								<form id="postDeletefrm" method="post"
									action="${cp}/post/delete?cate_id=${cate_id}">

									<button id="postDeleteBtn" type="button" class="btn btn-default" name="button">삭제</button>

									<input type="hidden" value="${post_id }" name="post_id">
									<input type="hidden" value="${cate_id }" name="cate_id">
								</form>
							</c:if>

							<form id="postRefrm" method="get"
								action="${cp}/post/reply?cate_id="${cate_id }">

								<input type="hidden" name="cate_id" value="${cate_id }" /> <input
									type="hidden" name="post_id" value="${post_id }" />

								<button id="postReBtn" type="button" class="btn btn-default"
									name="button">답글</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>






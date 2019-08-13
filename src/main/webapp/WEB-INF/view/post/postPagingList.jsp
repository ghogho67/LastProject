<%@page import="kr.or.ddit.page.model.PageVo"%>
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
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>postPagingList</title>

<!-- css, js -->
<style>
.postTr:hover {
	cursor: pointer;
}
</style>
<script>
	$(document).ready(function() {
		$(".postTr").on("click", function() {
			var post_id = $(this).find(".postId").text();
			$("#post_id").val(post_id);
			$("#frm").submit();
		});
	});
</script>
</head>

<body>
	<div class="container">
	<div style="padding-top: 50px; width: 1250px;">
			<div class="card">
			<div class="card-body">
				<div class="row">
					<div class="col-sm-8 blog-main">
						<h2 class="sub-header">
							postPagingList.jsp <br> <br>
						</h2>
						<pre>
cate_id :${cate_id} <br><br> 
postList : ${postList }<br><br>
pageVo : ${pageVo }<br><br>
paginationSize = ${paginationSize }
mem_id:${mem_id }
</pre>
						<form id="frm" action="${cp}/post/detail" method="post"
							enctype="multipart/form-data">
							<input type="hidden" class="post_id" id="post_id" name="post_id">


							<div class="table-responsive">
								<table class="table center-aligned-table">
									<tr class="text-primary">
										<th>게시글 번호</th>
										<th>제목</th>
										<th>작성자 아이디</th>
										<th>작성일시</th>
									</tr>
									<c:forEach items="${postList }" var="post">
										<c:choose>
											<c:when test="${post.post_del eq 'N' }">
												<tr class="Category" id="${post.post_id }" data-post_id="${post.post_id }">
													<td class="CategoryId">${post.post_id }</td>
													<td><c:if test="${post.level > 1 }">
														<c:forEach var="i" begin="1" end="${post.level+1 }"	step="1">
															&nbsp;&nbsp;
														</c:forEach>
														</c:if>
														${post.post_nm }
														</td>
													<td>${post.mem_id }</td>
													<td><fmt:formatDate value="${post.post_time }" pattern="yyyy-MM-dd" /></td>
												</tr>
												<input type="hidden" name="cate_id" value="${cate_id }">
												<input type="hidden" class="post_id" value="${post.post_id }">
											</c:when>
											<c:otherwise>
												<tr>
													<td>${post.post_id }</td>
													<td colspan="3">삭제된 게시글입니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</table>
							</div>
							<a href="${cp}/post/register?cate_id=${cate_id}"
								class=" btn	btn-default pull-right">새글등록</a>
							<div class="text-center">
								<ul class="pagination">
									<c:choose>
										<c:when test="${pageVo.page == 1 }">
											<li class="disabled"><span>«</span></li>
										</c:when>
										<c:otherwise>
											<li><a
												href="${cp}/post/pagingList?page=${pageVo.page-1}&pageSize=${pageVo.pageSize}&cate_id=${cate_id}">«</a>
											</li>
										</c:otherwise>
									</c:choose>
									<c:forEach begin="1" end="${paginationSize}" var="i">
										<c:choose>
											<c:when test="${pageVo.page == i}">
												<li class="active"><span>${i}</span></li>
											</c:when>
											<c:otherwise>
												<li><a
													href="${cp}/post/pagingList?page=${i}&pageSize=${pageVo.pageSize}&cate_id=${cate_id}">${i}</a>
												</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${pageVo.page == paginationSize}">
											<li class="disabled"><span>»</span></li>
										</c:when>
										<c:otherwise>
											<li><a
												href="${cp}/post/pagingList?page=${pageVo.page+1}&pageSize=${pageVo.pageSize}&cate_id=${cate_id}">»</a>
											</li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>
		
</body>
</html>

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>postPagingList</title>

<!-- css, js -->
<style>
.postTr:hover {
	cursor: pointer;
}
</style>
<style>
.pagination-outer{ text-align: center; }
.pagination{
    font-family: 'Rubik', sans-serif;
    padding: 0 30px;
    display: inline-flex;
    position: relative;
}
.pagination li a.page-link{
    color: #909090;
    background-color: transparent;
    font-size: 15px;
    line-height: 35px;
    height: 45px;
    width: 40px;
    margin: 0 3px;
    border: none;
    border-radius: 0;
    overflow: hidden;
    position: relative;
    transition: all 0.4s ease 0s;
}
.pagination li.active a.page-link,
.pagination li a.page-link:hover,
.pagination li.active a.page-link:hover{
    color: #006266;
    background-color: transparent;
}
.pagination li a.page-link span{
    display: block;
    transition: all 0.3s;
}
.pagination li a.page-link:hover span{ transform: rotateY(360deg); }
.pagination li a.page-link:before,
.pagination li a.page-link:after{
    content: "";
    background-color: #006266;
    height: 3px;
    width: 0;
    opacity: 1;
    position: absolute;
    left: 0;
    bottom: 0;
    z-index: -1;
    transition: all 0.3s;
}
.pagination li a.page-link:before{
    background: linear-gradient(135deg,transparent 49%, #006266 50%);
    height: 15px;
    width: 15px;
    transform: translateX(-50%) rotate(45deg);
    bottom: auto;
    top: -20px;
    left: 50%;
}
.pagination li a.page-link:hover:after{ width: 100%; }
.pagination li a.page-link:hover:before{ top: -10px; }
.pagination li a.page-link:hover:before,
.pagination li.active a.page-link:before{
    top: -10px;
}
.pagination li a.page-link:hover:after,
.pagination li.active a.page-link:after{
    width: 100%;
}
@media only screen and (max-width: 480px){
    .pagination{ display: block; }
    .pagination li{
        margin-bottom: 10px;
        display: inline-block;
    }
}



* {box-sizing: border-box;}
.for {
  position: relative;
  width: 250px;
  margin: 0 auto;
}
.d1 {background: white;
position: absolute;
right: 21%;


}
.d1 input {
  width: 100%;
  height: 32px;
  padding-left: 10px;
  border: 2px solid #7BA7AB;
  border-radius: 5px;
  outline: none;
  background: white;
  color: #9E9C9C;
  font-size: 13px;
}
.d1 button {
  position: absolute; 
  top: 0;
  right: 0px;
  width: 32px;
  height: 32px;
  border: none;
  background: #7BA7AB;
  border-radius: 0 5px 5px 0;
  cursor: pointer;
}
.d1 button:before {
  content: "\f002";
  font-family: FontAwesome;
  font-size: 16px;
  color: #F9F0DA;
}



</style>

<script>
	$(document).ready(function() {
		$(".Category").on("click", function() {
			var post_id = $(this).find(".CategoryId").text();
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
cate_id :${cate_id}  postList : ${postList }  pageVo : ${pageVo }  paginationSize = ${paginationSize }  mem_id:${mem_id }
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
								class="btn btn-primary btn-sm pull-right">새글등록</a>
							<div class="demo">
								<ul class="pagination">
									<c:choose>
										<c:when test="${pageVo.page == 1 }">
											<li class="page-item prev disabled"><a href="#" class="page-link" aria-label="Previous"><span aria-hidden="true">«</span>
              </a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" aria-label="Next" 
												href="${cp}/post/pagingList?page=${pageVo.page-1}&pageSize=${pageVo.pageSize}&cate_id=${cate_id}"><span aria-hidden="true">«</span></a>
											</li>
										</c:otherwise>
									</c:choose>
									
									<c:forEach begin="1" end="${paginationSize}" var="i">
										<c:choose>
											<c:when test="${pageVo.page == i}">
												<li class="page-item active"><a class="page-link" href="#">${i}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													href="${cp}/post/pagingList?page=${i}&pageSize=${pageVo.pageSize}&cate_id=${cate_id}">${i}</a>
												</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									
									<c:choose>
										<c:when test="${pageVo.page == paginationSize}">
											<li class="page-item next disabled"><a href="#" class="page-link" aria-label="Next"><span aria-hidden="true">»</span></a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" aria-label="Next" 
												href="${cp}/post/pagingList?page=${pageVo.page+1}&pageSize=${pageVo.pageSize}&cate_id=${cate_id}"><span aria-hidden="true">»</span></a>
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

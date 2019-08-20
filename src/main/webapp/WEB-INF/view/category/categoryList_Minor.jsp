<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BasicSubPage</title>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>
<%@include file="/WEB-INF/view/common/LibForMypage.jsp"%>

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
	font-size: 8pt;
	text-align: center;
}

.kkk {
	background-color: transparent;
	border-color: transparent;
	width: 30px;
	padding: 3px;
	font-size: 9pt;
}
</style>



<script>
	$(document).ready(function() {

		$(".kkk").on("click", function() {

			$("#frm").submit();
		});

		$("#inserBtn").on("click", function() {

			$("#frm2").submit();
		});
		
	});
</script>




</head>

<body>

	<%@include file="/WEB-INF/view/common/subPageheader.jsp"%>
	<%@include file="/WEB-INF/view/common/subPagesideBar.jsp"%>


	<div class="container">
		<div style="padding-top: 50px; width: 1250px;">
			<div class="card">
				<div class="card-body">
			<div id="titlee">
						<h2>
							<span>카테고리 관리</span> 소분류
						</h2>
						</div>
					<hr>
					<div class="table-responsive">
						<table class="table center-aligned-table">
							<thead>
								<tr class="text-primary">
									<th>카테고리 아이디</th>
									<th>카테고리명</th>
									<th>생성일시</th>
									<th>생성자</th>
									<th>&nbsp;&nbsp;상태&nbsp;&nbsp;</th>
									<th>&nbsp;&nbsp;사용여부변경&nbsp;&nbsp;</th>
								</tr>
							</thead>



							<tbody>




								<c:forEach items="${MinorCategoryList}" var="Category">


									<tr class="Category" data-userid="${Category.cate_id}">
										<td class="CategoryId">${Category.cate_id}</td>


										<form id="frm" action="/category/updateCategoryTitle2"
											method="post">
											<td><input class="title" id="CateTitle" name="CateTitle"
												value="${Category.cate_title}"> <input type="hidden"
												value="${Category.cate_id}" id="cate_id" name="cate_id">
												<input type="hidden" value="${Category.cate_paerent_id}"
												id="cate_paerent_id" name="cate_paerent_id"> <input
												type="submit" value="수정" class="kkk"></td>
										</form>


									<td><fmt:formatDate value="${Category.cate_date}"
												pattern="yyyy-MM-dd HH:mm" /></td>
										<td>${Category.mem_id}</td>
										<c:choose>
											<c:when test="${Category.cate_usage=='Y'}">
												<td><label class="badge badge-success">&nbsp;&nbsp;&nbsp;사용&nbsp;&nbsp;&nbsp;</label></td>
											</c:when>
											<c:otherwise>
												<td><label class="badge badge-danger">사용안함</label></td>
											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${Category.cate_usage=='Y'}">
													<td><a
														href="${cp}/category/categoryDelete?cate_id=${Category.cate_id}"
														onclick="return confirm('해당카테고리를 사용하지 않으시겠습니까?')"
														class="btn btn-outline-danger btn-sm">&nbsp;&nbsp;&nbsp;사용안함&nbsp;&nbsp;&nbsp;</a></td>
												</c:when>
											<c:otherwise>
												<td><a
													href="${cp}/category/categoryMinorUse?cate_id=${Category.cate_id}&cate_paerent_id=${Category.cate_paerent_id}"
													onclick="return confirm('해당카테고리를 사용 하시겠습니까?')"
													class="btn btn-outline-primary btn-sm">&nbsp;&nbsp;&nbsp;사용&nbsp;&nbsp;&nbsp;</a></td>
											</c:otherwise>
										</c:choose>


									</tr>

								</c:forEach>

								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td>


									<button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#myModal">카테고리 추가
									</button>
									</td>

								</tr>


							</tbody>




						</table>


					</div>
				</div>
			</div>
		</div>
	</div>









	<!-- Modal -->

	<form id="frm2" action="/category/InsertCategory" method="post">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" style="padding: 50px; z-index: 1400">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">카테고리 추가</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<span>대분류명</span>
					<input type="hidden"  id="cataPId" name="cataPId" value="${catePId}" readonly="readonly">
					<input type="text"  id="catatitle" name="cataPtitle" value="${parentCate.cate_title}" readonly="readonly">
					
					<span>카테고리명</span>
					<input type="text" id="catatitle" name="catetitle">
					
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-danger" id="inserBtn"
							data-dismiss="modal">추가</button>
					</div>
				</div>
			</div>
		</div>

	</form>




</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
</style>



<script>
	$(document).ready(function() {

		$(".kkk").on("click", function() {
		
			$("#frm").submit();
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
							<span>카테고리 관리</span> 대분류
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
									<th>&nbsp;&nbsp;관리&nbsp;&nbsp;</th>
									<th>&nbsp;&nbsp;사용여부변경&nbsp;&nbsp;</th>
								</tr>
							</thead>


								<tbody>
									<c:forEach items="${CategoryList}" var="Category">
										<tr class="Category" data-userid="${Category.cate_id}">
											<td class="CategoryId" id="CategoryId" name="CategoryId">${Category.cate_id}</td>
											
								<form id="frm" action="/category/updateCategoryTitle" method="post">
											<td><input class="title" id="CateTitle" name="CateTitle"
												value="${Category.cate_title}">
												<input type="hidden" value="${Category.cate_id}"  id="cate_id" name="cate_id">
												<input type="submit" value="수정" class="kkk"></td>
							</form>
											<td>${Category.cate_date}</td>
											<td>${Category.mem_id}</td>
											<c:choose>
												<c:when test="${Category.cate_usage=='Y'}">
													<td><label class="badge badge-success">&nbsp;&nbsp;&nbsp;사용&nbsp;&nbsp;&nbsp;</label></td>
												</c:when>
												<c:otherwise>
													<td><label class="badge badge-danger">사용안함</label></td>
												</c:otherwise>
											</c:choose>
											<td><a
												href="${cp}/category/categoryManagement?cate_id=${Category.cate_id}"
												class="btn btn-primary btn-sm">소분류관리</a></td>
											<c:choose>
												<c:when test="${Category.cate_usage=='Y'}">
													<td><a
														href="${cp}/category/categoryDelete?cate_id=${Category.cate_id}"
														onclick="return confirm('해당카테고리를  삭제하시겠습니까?')"
														class="btn btn-outline-danger btn-sm">&nbsp;&nbsp;&nbsp;삭제&nbsp;&nbsp;&nbsp;</a></td>
												</c:when>
												<c:otherwise>
													<td><a
														href="${cp}/category/categoryUse?cate_id=${Category.cate_id}"
														onclick="return confirm('해당카테고리를 사용 하시겠습니까?')"
														class="btn btn-outline-primary btn-sm">&nbsp;&nbsp;&nbsp;사용&nbsp;&nbsp;&nbsp;</a></td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</tbody>


						</table>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>
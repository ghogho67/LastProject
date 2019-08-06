<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BasicSubPage</title>


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
	width: 30px;
}
.for {
	position: relative;
	width: 250px;
	height: 30px;
	margin: 0 auto;
}

.d1 {
	height: 30px;
	background: white;
	position: absolute;
	right: 1%;
	top: 75px;
}

.d1 input {
	width: 100%;
	height: 30px;
	padding-left: 90px;
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
	height: 30px;
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

#searchType {
	height: 30px;
	width: 70px;
	font-size: 11px;
	border-radius: 5px 0px 0px 5px;
	border-top: 2px solid #7BA7AB;
	border-bottom: 2px solid #7BA7AB;
	border-left: 2px solid #7BA7AB;
	border-right: 2px solid #7BA7AB;
}

</style>


<script>
$(document).ready(function(){
	$(".shTr").on("click", function(){
		console.log("shTr click");
		
		var sh_id = $(this).find(".sh_id").text();
		$("#sh_id").val(sh_id);
		$("#frm").attr("action", "${cp}/shelter/detailShelter");
		$("#frm").attr("method", "get");
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
							<span>병원, 요양원</span>
						</h2>
						</div>
					
						
					<hr>
					<form id="frm" action="${cp }/hospital/searchPagingList?hos_add=${hos_add}" method="post">
					 <input type="hidden" class="form-control" id="hos_add" name="hos_add" value="${hos_add}">
					<div class="table-responsive">
						<table class="table center-aligned-table">
						<thead>
							<tr>
								<th>병원아이디</th>
								<th>병원이름</th>
								<th>병원주소</th>
								<th>병원 전화번호</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${getSearchHosAdd}" var="vo" varStatus="status">
								<tr class="hosTr" data-hos_id="${vo.hos_id }">
									<td>${vo.hos_id }</td>
									<td>${vo.hos_nm }</td>
									<td>${vo.hos_add }</td>
									<td>${vo.hos_phone }</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
					
					<!-- 페이지네이션 -->
							<div class="text-center">
								<ul class="pagination">
									<c:choose>
										<c:when test="${pageVo.page == 1 }">
											<li class="disabled"><span>«</span></li>
										</c:when>
										<c:otherwise>
											<li><a href="${cp}/hospital/searchPagingList?page=${pageVo.page-1}&pageSize=${pageVo.pageSize}">«</a></li>
										</c:otherwise>
									</c:choose>
									
									<c:forEach begin="1" end="${paginationSize}" var="i">
										<c:choose>
											<c:when test="${pageVo.page == i}">
												<li class="active"><span>${i}</span></li>
											</c:when>
											<c:otherwise>
												<li><a href="${cp}/hospital/searchPagingList?page=${i}&pageSize=${pageVo.pageSize}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									
									<c:choose>
										<c:when test="${pageVo.page == paginationSize}">
											<li class="disabled"><span>»</span></li>
										</c:when>
										<c:otherwise>
											<li><a href="${cp}/hospital/searchPagingList?page=${pageVo.page+1}&pageSize=${pageVo.pageSize}">»</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
					
					</form>
					
	
					
					
				</div>
			</div>
		</div>
	</div>
	
	


</body>
</html>
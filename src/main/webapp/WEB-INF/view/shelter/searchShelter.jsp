<%@page import="kr.or.ddit.category.others.shelter.model.ShelterVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무더위 쉼터</title>

<style>
.shTr:hover {
	cursor: pointer;
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
   
   <div class="container-fluid">
      <div class="row">

         <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="row">
               <div class="col-sm-8 blog-main">
                  <h2 class="sub-header">주소로 찾기</h2>
                  <form id="frm" class="form-horizontal" role="form" action="${cp }/shelter/searchShelter?sh_add=${sh_add}" method="post">
<%--                      <input type="hidden" class="form-control" id="sh_add" name="sh_add" value="${sh_add}"> --%>
                     <input type="hidden" class="form-control" id="sh_id" name="sh_id" value="${sh_id}">


						<div class="table-responsive">
							<table class="table table-striped">
								<tr>
									<th>쉼터아이디</th>
									<th>쉼터이름</th>
									<th>쉼터주소</th>
									<th>운영시작일</th>
									<th>운영종료일</th>
								</tr>
								<c:forEach items="${getAddShelterList }" var="vo" varStatus="status">
										<tr class="shTr" data-sh_id="${vo.sh_id }">
											<td class="sh_id">${vo.sh_id }</td>
											<td>${vo.sh_nm }</td>
											<td>${vo.sh_add }</td>
											<td>${vo.sh_st_dt }</td>
											<td>${vo.sh_end_dt }</td>
										</tr>
									</c:forEach>
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
											<li><a href="${cp}/shelter/pagingList?page=${pageVo.page-1}&pageSize=${pageVo.pageSize}">«</a></li>
										</c:otherwise>
									</c:choose>
									
									<c:forEach begin="1" end="${paginationSize}" var="i">
										<c:choose>
											<c:when test="${pageVo.page == i}">
												<li class="active"><span>${i}</span></li>
											</c:when>
											<c:otherwise>
												<li><a href="${cp}/shelter/pagingList?page=${i}&pageSize=${pageVo.pageSize}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									
									<c:choose>
										<c:when test="${pageVo.page == paginationSize}">
											<li class="disabled"><span>»</span></li>
										</c:when>
										<c:otherwise>
											<li><a href="${cp}/shelter/pagingList?page=${pageVo.page+1}&pageSize=${pageVo.pageSize}">»</a></li>
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
</body>
</html>
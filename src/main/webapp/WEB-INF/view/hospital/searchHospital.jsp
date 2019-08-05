<%@page import="kr.or.ddit.member.careWorker.hospital.model.HospitalVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요양시설, 기관 상세보기</title>

</head>
<body>
   
   <div class="container-fluid">
      <div class="row">

         <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="row">
               <div class="col-sm-8 blog-main">
                  <h2 class="sub-header">주소로 찾기</h2>
                  <form id="frm" class="form-horizontal" role="form" action="${cp }/hospital/searchPagingList?hos_add=${hos_add}" method="post">
                     <input type="hidden" class="form-control" id="hos_add" name="hos_add" value="${hos_add}">
<%--                      <input type="hidden" class="form-control" id="hos_id" name="hos_id" value="${hos_id}"> --%>


						<div class="table-responsive">
							<table class="table table-striped">
								<tr>
									<th>병원아이디</th>
									<th>병원이름</th>
									<th>병원주소</th>
									<th>병원 전화번호</th>
								</tr>
								<c:forEach items="${getSearchHosAdd}" var="vo" varStatus="status">
									<tr class="hosTr" data-hos_id="${vo.hos_id }">
										<td>${vo.hos_id }</td>
										<td>${vo.hos_nm }</td>
										<td>${vo.hos_add }</td>
										<td>${vo.hos_phone }</td>
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
   </div>
</body>
</html>
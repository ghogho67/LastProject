<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 



총 <span class="education-board-cnt ng-binding">${boardCnt}</span>개의 글

SEPERATORSEPERATOR



 <c:if test="${list ne null}">
   


<c:forEach items="${list}" var="post" varStatus="status">

<li class="item">
	<a href="${cp}/post/festvalPost?contenid=${post.contentid}&startDate=${post.eventstartdate}&endDate=${post.eventenddate}" class="anchor">
		<div class="border">
			<div class="rank_area">
				<strong class="num">${status.count}</strong>
			</div>
			<div class="fig">
				<div class="thumb">
				<c:choose>
					<c:when test="${post.firstimage2==null}">
					<img
						src="${cp}/image/no_image.gif"
						alt="${post.title}">
					
					</c:when>
					<c:otherwise>
					<img
						src="${post.firstimage2}"
						alt="${post.title}">
					
					</c:otherwise>
				
				</c:choose>

						
				</div>
				<div class="mask">
					<div class="mask_bg"></div>
					<span class="mask_info"></span>
				</div>
			</div>
			<div class="info">
				<p class="title_name">${post.title}</p>
				<p >${post.addr1}</p>
				<fmt:parseDate value="${post.eventstartdate}" var="eventstartdate" pattern="yyyyMMdd"/>
				<fmt:parseDate value="${post.eventenddate}" var="eventenddate" pattern="yyyyMMdd"/>
				<p><fmt:formatDate value="${eventstartdate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${eventenddate}" pattern="yyyy-MM-dd"/></p>

			</div>
		</div>
	</a>
</li>
</c:forEach>

</c:if>


SEPERATORSEPERATOR





<c:choose>
	<c:when test="${pageVo.page==1}">
		<li class="page-item prev disabled">
			<a href="#" class="page-link" aria-label="Previous">
                    <span aria-hidden="true">«</span>
              </a>
        </li>
	</c:when>
	<c:otherwise>
		<li class="page-item">
			<a class="page-link" aria-hidden="Previous" href="javascript:boardPagingListAjaxHtml(1, ${pageVo.pageSize} , areaid, firstDate, lastDate);"><span aria-hidden="true">«</span></a></li>
	</c:otherwise>
</c:choose>



<c:choose>
	<c:when test="${pageVo.page==1}">
		<li class="page-item prev disabled" >
			<a href="#" class="page-link" aria-label="Previous">
                    <span aria-hidden="true">‹</span>
              </a>
        </li>
	</c:when>
	<c:otherwise>
		<li class="page-item"><a class="page-link" aria-label="Previous"
			href="javascript:boardPagingListAjaxHtml(${pageVo.page-1}, ${pageVo.pageSize} , areaid, firstDate, lastDate);"><span aria-hidden="true">‹</span></a></li>
	</c:otherwise>
</c:choose>

<c:forEach begin="${startPage}" end="${paginationSize}" var="i">
	<c:choose>
		<c:when test="${pageVo.page == i}">
			<li class="page-item active"><a class="page-link" href="#">${i}</a></li>
		</c:when>
		<c:otherwise>
			<li><a class="page-link"
				href="javascript:boardPagingListAjaxHtml(${i}, ${pageVo.pageSize}, areaid, firstDate, lastDate);">${i}</a></li>
		</c:otherwise>
	</c:choose>

</c:forEach>

<c:choose>
	<c:when test="${pageVo.page == lastpaginationSize}">
		<li class="page-item next disabled">
			<a href="#" class="page-link" aria-label="Next">
                    <span aria-hidden="true">›</span>
            </a>
		</li>
	</c:when>
	<c:otherwise>
		<li class="page-item"><a class="page-link"aria-label="Next" 
			href="javascript:boardPagingListAjaxHtml(${pageVo.page+1}, ${pageVo.pageSize}, areaid, firstDate, lastDate);"><span aria-hidden="true">›</span></a></li>
	</c:otherwise>
</c:choose>


<c:choose>
	<c:when test="${pageVo.page == lastpaginationSize}">
		<li class="page-item next disabled"><a href="#" class="page-link" aria-label="Next"><span aria-hidden="true">»</span></a></li>
	</c:when>
	<c:otherwise>
		<li class="page-item"><a class="page-link" aria-label="Next"
			href="javascript:boardPagingListAjaxHtml(${lastpaginationSize}, ${pageVo.pageSize}, areaid, firstDate, lastDate);"><span aria-hidden="true">»</span></a></li>
	</c:otherwise>
</c:choose>


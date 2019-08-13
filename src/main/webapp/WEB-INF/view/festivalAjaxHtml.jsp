<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 



총 <span class="education-board-cnt ng-binding">${boardCnt}</span>개의 글

SEPERATORSEPERATOR

<c:forEach items="${list}" var="post" varStatus="status">

<li class="item">
	<a href="${cp}/post/aaa" class="anchor">
		<div class="border">
			<div class="rank_area">
				<strong class="num">${status.count}</strong>
			</div>
			<div class="fig">
				<div class="thumb">
					<img
						src="${post.firstimage2}"
						alt="${post.title}">
				</div>
				<div class="mask">
					<div class="mask_bg"></div>
					<span class="mask_info"></span>
				</div>
			</div>
			<div class="info">
				<p class="title_name">${post.title}</p>
				<p>${post.eventstartdate} ~ ${post.eventenddate}</p>
			</div>
		</div>
	</a>
</li>
</c:forEach>


SEPERATORSEPERATOR


<c:choose>
	<c:when test="${pageVo.page==1}">
		<li class="page-item prev disabled"><span>«</span></li>
	</c:when>
	<c:otherwise>
		<li class="page-item prev">
			<a class="page-link" aria-label="Previous" href="javascript:boardPagingListAjaxHtml(1, ${pageVo.pageSize});">«</a></li>
	</c:otherwise>
</c:choose>



<c:choose>
	<c:when test="${pageVo.page==1}">
		<li class="page-item prev disabled"><span>‹</span></li>
	</c:when>
	<c:otherwise>
		<li class="page-item prev"><a class="page-link" aria-label="Previous"
			href="javascript:boardPagingListAjaxHtml(${pageVo.page-1}, ${pageVo.pageSize});">‹</a></li>
	</c:otherwise>
</c:choose>

<c:forEach begin="1" end="${paginationSize}" var="i">
	<c:choose>
		<c:when test="${pageVo.page == i}">
			<li class="page-item active"><span>${i}</span></li>
		</c:when>
		<c:otherwise>
			<li><a class="page-link"
				href="javascript:boardPagingListAjaxHtml(${i}, ${pageVo.pageSize});">${i}</a></li>
		</c:otherwise>
	</c:choose>

</c:forEach>

<c:choose>
	<c:when test="${pageVo.page == paginationSize}">
		<li class="page-item next disabled"><span>›</span></li>
	</c:when>
	<c:otherwise>
		<li class="page-item next"><a class="page-link" aria-label="Next"
			href="javascript:boardPagingListAjaxHtml(${pageVo.page+1}, ${pageVo.pageSize});">›</a></li>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${pageVo.page == paginationSize}">
		<li class="page-item next disabled"><span>»</span></li>
	</c:when>
	<c:otherwise>
		<li class="page-item next"><a class="page-link" aria-label="Next"
			href="javascript:boardPagingListAjaxHtml(${paginationSize}, ${pageVo.pageSize});">»</a></li>
	</c:otherwise>
</c:choose>
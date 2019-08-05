
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<%@include file="/WEB-INF/view/common/LibForMypage.jsp"%>
<%@include file="/WEB-INF/view/common/LibForWebpage2.jsp"%>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>

</head>
<body>

		<tiles:insertAttribute name="header" />
<div class="container-fluid">
<c:choose>
		    <c:when test="${MEM_INFO.mem_grade==0}">
		      <%@include file="/WEB-INF/view/common/mypage/sidebarA.jsp"%>
		
		    </c:when>
		 
		    <c:when test="${MEM_INFO.mem_grade==3}">
		     <%@include file="/WEB-INF/view/common/mypage/sidebarW.jsp"%>
		
		    </c:when>
		 
		    <c:otherwise>
		       <%@include file="/WEB-INF/view/common/mypage/sidebarP.jsp"%>
		    </c:otherwise>
</c:choose>
		

		<div>
			<tiles:insertAttribute name="body" />
		</div>
	</div>

	





</body>
</html>
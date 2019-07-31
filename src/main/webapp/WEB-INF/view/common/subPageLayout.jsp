<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>
</head>


<body>
	<tiles:insertAttribute name="header" />
	<div class="container-fluid">
		<div class="row">
			<tiles:insertAttribute name="left" />


			<br> <br> <br>
			<div>
				<tiles:insertAttribute name="body" />
			</div>
		</div>
	</div>
</body>
</html>
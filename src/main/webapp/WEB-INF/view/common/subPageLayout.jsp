<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>
</head>


<body>

   <tiles:insertAttribute name="header" />
   <div class="container-fluid">
      <div class="row">
         <tiles:insertAttribute name="left" />
      </div>
         <br> <br> <br>
         <div>
            <tiles:insertAttribute name="body" />
         </div>
      
   </div>

</body>
</html>
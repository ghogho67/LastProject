<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<style type="text/css">
</style>




<script>
	
</script>

</head>
<body>


	<%@include file="/WEB-INF/view/common/subPageheader.jsp"%>
	<%@include file="/WEB-INF/view/common/subPagesideBar.jsp"%>

	<div class="container">
		<div style="padding-top: 50px; width: 1350px;">

			<div class="card">
				<div class="card-body">




					<div class="content">

						<ul class="sub-tab">
							<li><a href="#anchor1">학습소개</a></li>
							<li><a href="#anchor2">학습목차</a></li>
							<li class="last"><a href="#"
								class="ui basic green fluid button">강좌목록가기</a></li>

						</ul>
						<div class="ui warning message detail-info">
							<label class="ui orange basic small button mr10">분반1</label>


							<ul>
								<li>귀건강상담학</li>
								
							</ul>
							<a href="javascript:viewDeclsDetailGo('2019-04550', '1')"
								class="go-btn"><i class="chevron circle right icon"></i></a>
						</div>
						<div id="anchor1" class="anchor"></div>
						<h4 class="tit_comm">학습소개</h4>

						<div class="ui divider"></div>
						<div id="anchor2" class="anchor"></div>


						<div class="wrap_btn">
							<a href="javascript:history.back(-1);" class="ui grey button">목록보기</a>











						</div>
					</div>


















				</div>
			</div>
		</div>
	</div>






</body>
</html>
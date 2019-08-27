<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage navigation bar</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<style>
.ko {
	color: white !important;
}
</style>
<%@include file="/resource/chat/chatAlram.jsp" %>
<%@include file="/resource/chatbot/chatbotView.jsp" %>
</head>
<body>

	<nav
		class="navbar navbar-default col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
		
		<div class="navbar-menu-wrapper d-flex align-items-center">
	
			<button class=" navbar-toggler   navbar-dark align-self-center mr-5"
				type="button" data-toggle="minimize">
				

				<div id="header" class="header-scrolled2">
					<div class="container">
						<div class="row  justify-content-between d-flex">
							<div id="logo">
							
								<a href="index.html"></a>

							</div>
							<nav id="nav-menu-container">
								<ul class="nav-menu" style="color: white;">


									<li><a class="ko" href="${cp}/crawling">Home</a></li>
									<c:forEach items="${categoryList}" var="category">
										<c:if test="${category.cate_usage =='Y'}">
											<c:if test="${category.cate_paerent_id==0}">

												<c:set var="count" value="0" />
												<c:forEach items="${categoryList}" var="categoryOne">
													<c:if
														test="${categoryOne.cate_paerent_id eq category.cate_id}">
														<c:set var="count" value="${count+1}" />
													</c:if>
												</c:forEach>
												<c:choose>
													<c:when test="${count==0}">
														<li><a class="ko"
															href="${cp}/re/cate?cate_id=${category.cate_id}">${category.cate_title}</a></li>
													</c:when>
													<c:otherwise>
														<li><a class="ko">${category.cate_title}</a>


															<ul>

																<c:forEach items="${categoryList}" var="categoryCh">
																	<c:if
																		test="${categoryCh.cate_paerent_id eq category.cate_id}">
																		<c:if test="${categoryCh.cate_usage =='Y'}">
																			<li><a
																				href="${cp}/re/cate?cate_id=${categoryCh.cate_id}">${categoryCh.cate_title}</a></li>
																		</c:if>
																	</c:if>
																</c:forEach>
															</ul>
															</li>
													</c:otherwise>
												</c:choose>

											</c:if>

										</c:if>
									</c:forEach>


									<c:choose>
										<c:when test="${MEM_INFO.mem_grade==0}">

											<li class="menu-has-children"><a>관리자 메뉴 </a>
												<ul>
														<li><a href="${cp}/category/categoryList">카테고리 관리</a></li>
						<li><a href="${cp}/lecture/lectureListManagement"> 강좌 관리</a></li>
						<li><a href="${cp}/lecture/cultureListManagement"> 문화센터 관리</a></li>


												</ul></li>

										</c:when>

									</c:choose>

									<li>
									<a class="ko" style="position: absolute; left: 80%;" href="/logout">로그아웃</a></li>

								</ul>
							</nav>
						</div>
					</div>
				</div>
				<hr>
				<br>
			</button>
		</div>
	</nav>

</body>
</html>
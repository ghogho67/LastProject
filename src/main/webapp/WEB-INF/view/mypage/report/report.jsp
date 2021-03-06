
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<%@include file="/WEB-INF/view/common/LibForMypage.jsp"%>
<%@include file="/WEB-INF/view/common/LibForWebpage2.jsp"%>



<style>
#titlee h2, #pzone h2 {
	font-size: 40px;
	font-weight: normal;
	letter-spacing: -1px;
}

#titlee h2 {
	padding: 15px 5px;
}

#titlee h2 span {
	font-weight: bold;
	color: #473fa0;
}

.mail-header h4 {
	font-weight: 300;
}

.mail-sender, .attachment-mail {
	width: 100%;
	display: inline-block;
	margin: 20px 0;
	border-top: 1px solid #EFF2F7;
	border-bottom: 1px solid #EFF2F7;
	padding: 10px 0;
}

.mail-sender img {
	width: 30px;
	border-radius: 3px;
	-webkit-border-radius: 3px;
}

.mail-sender .date {
	line-height: 30px;
	text-align: right;
}

.view-mail a, .attachment-mail a:hover {
	color: #4ECDC4;
}

.attachment-mail a {
	color: #4ECDC4;
}

.attachment-mail ul li {
	float: left;
	width: 200px;
	list-style: none;
}

.attachment-mail ul li a.atch-thumb img {
	width: 200px;
	height: 180px;
	margin-bottom: 10px;
}

.attachment-mail ul li a.name span {
	float: right;
	color: #767676;
}

.btn-sm {
	padding: .25rem .5rem;
	font-size: 12px;
}

.pull-left {
	float: left !important
}

.compose-mail {
	width: 100%;
	display: inline-block;
	position: relative;
	margin-top: 20px;
}

.compose-mail .compose-options {
	color: #979797;
	cursor: pointer;
	display: inline-block;
	font-size: 14px;
	position: absolute;
	right: 10px;
	top: 7px;
}

.compose-mail input, .compose-mail input:focus {
	border: none;
	padding: 0;
	width: 80%;
	float: left;
}

.compose-mail .form-group {
	border: 1px solid #F2F3F6;
	display: inline-block;
	width: 100%;
	margin-bottom: 0;
}

.compose-mail .form-group label {
	line-height: 34px;
	width: 10%;
	float: left;
	padding-left: 5px;
	margin-bottom: 0;
}

.compose-editor input {
	margin-top: 15px;
}

.compose-editor {
	margin-bottom: 15px;
	display: inline-block;
	width: 100%;
}

.compose-btn {
	float: left;
	margin-top: 6px;
}

.note-editor.note-frame {
	border: 1px solid #b1b8bb;
}

.note-editor.note-frame .panel-heading {
	padding: 6px 10px 10px;
	border-bottom: 1px solid rgba(120, 130, 140, 0.13);
}

#main-content {
	margin-left: 210px;
}

.sidebar-closed #main-content {
	margin-left: 0px;
}
</style>

<script>
	
</script>

</head>
<body>
	<%@include file="/WEB-INF/view/common/mypage/navigationBar.jsp"%>



	<!-- <C:SET VAR="DATA" VALUE="개발자" /> -->

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








	<div class="content-wrapper">

		<div class="row mb-4">


			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div id="titlee">
							<h2>
								<span>보고서</span> 상세조회
							</h2>
							<hr>

						</div>

						<div class="row">

							<!--main content start-->
							<section id="main-content">
								<section class="wrapper">
									<!-- page start-->
									<div class="row mt">

										<div class="col-sm-9">
											<section class="panel">
												<header class="panel-heading wht-bg">
													<h4 class="gen-case">
													</h4>
												</header>
												<div class="panel-body ">
													<div class="mail-header row">
														<div class="col-md-8">
															<h4 class="pull-left">${report.rep_title}</h4>
														</div>
														<div class="col-md-4">
															<div class="compose-btn pull-right">
															</div>
														</div>
													</div>
													<div class="mail-sender">
														<div class="row">
															<div class="col-md-8">
																<img src="img/ui-zac.jpg" alt=""> <strong>담당
																	요양보호사</strong> &nbsp;&nbsp;&nbsp; <span>${report.cw_mem_id}</span>
															</div>
															<div class="col-md-4">
																<p class="date">
																	<fmt:formatDate value="${report.rep_time}"
																		pattern="yyyy-MM-dd" />
																	
																</p>
															</div>
														</div>
													</div>
													<div class="view-mail">${report.rep_cont}</div>
													<div class="attachment-mail">
														<p>
															<span><i class="fa fa-paperclip"></i>첨부파일</span>

														</p>
														<ul>
															<li><a id="DownGOGO"
																href="/report/DownGOGO?repattid=${report.rep_att_id}"
																class="btn btn-default"> ${report.rep_att_nm}</a>
																<div class="links"></div></li>
														</ul>
													</div>
													<div class="compose-btn pull-left">
														<a href="${cp}/report/reportList?memid=${MEM_INFO.mem_id}&memgrade=${MEM_INFO.mem_grade}"
															class="btn btn-sm btn-theme"><i class="fa fa-reply"></i>뒤로가기</a>
													</div>
												</div>
											</section>
										</div>
									</div>
								</section>
							</section>


						</div>
					</div>
				</div>

			</div>
		</div>
	</div>







</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

		<div class="container-fluid">
			<div class="row row-offcanvas row-offcanvas-right">
				<nav class="bg-white sidebar sidebar-offcanvas" id="sidebar">
					<div class="user-info">
						<img
							src="${cp}/resource/Admin/images/300.jpg">
						<p class="name">${MEM_INFO.mem_nm}</p>
						<p class="designation"></p>
						<span class="emp"> </span>


					</div>
					<ul class="nav">
						<li class="nav-item active"><a class="nav-link"
							href="${cp}/mypage/Patient_Info"> <img
								src="${cp}/resource/Admin/images/icons/1.png"
								alt=""> <span class="menu-title">회원정보</span>
						</a></li>
					
						<li class="nav-item"><a class="nav-link"
							href="${cp}/resource/Admin/pages/forms/index.html">
								<img
								src="${cp}/resource/Admin/images/icons/005-forms.png"
								alt=""> <span class="menu-title">결산 관리</span>
						</a></li>
						
						<li class="nav-item"><a class="nav-link"
							data-toggle="collapse" href="#sample-pages" aria-expanded="false"
							aria-controls="sample-pages"> <img
								src="${cp}/resource/Admin/images/icons/9.png"
								alt=""> <span class="menu-title">회원 관리<i
									class="fa fa-sort-down"></i></span>
						</a>
							<div class="collapse" id="sample-pages">
								<ul class="nav flex-column sub-menu">
									<li class="nav-item"><a class="nav-link" href="#l">
										  회원목록  </a></li>
										  
									<li class="nav-item"><a class="nav-link" href="${cp}/report/reportList?memid=${MEM_INFO.mem_id}">
											보고서 확인 </a></li>
									<li class="nav-item"><a class="nav-link" href="#">
											보고서 작성 </a></li>
									
								</ul>
							</div>
							
							</li>

						<li class="nav-item"><a class="nav-link"
							data-toggle="collapse" href="#sample-pages" aria-expanded="false"
							aria-controls="sample-pages"> <img
									src="${cp}/resource/Admin/images/icons/6.png"
								alt=""> <span class="menu-title">일정 관리<i
									class="fa fa-sort-down"></i></span>
						</a>
							<div class="collapse" id="sample-pages">
								<ul class="nav flex-column sub-menu">
									<li class="nav-item"><a class="nav-link" href="/attendance/cwMatList">
										  출퇴근확인  </a></li>
									<li class="nav-item"><a class="nav-link" href="#l">
										  스케쥴 관리  </a></li>
									<li class="nav-item"><a class="nav-link" href="#">
											전체 일정 </a></li>
									<li class="nav-item"><a class="nav-link" href="#">
										일정 조율 </a></li>
									
								</ul>
							</div>
							
							</li>
						
						
						<li class="nav-item"><a class="nav-link"
							href="${cp}/mypage/Worker_Wd">
								<img src="${cp}/resource/Admin//images/icons/10.png"
								alt=""> <span class="menu-title">회원탈퇴</span>
						</a></li>
						
					</ul>
				</nav>

			</div>
		</div>

</body>
</html>
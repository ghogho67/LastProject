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
							src="${cp}/resource/Admin/images/900.jpg">
						<p class="name">${MEM_INFO.mem_nm}</p>
						<p class="designation"></p>
						<span class="gold"> </span>


					</div>
					<ul class="nav">
						<li class="nav-item active"><a class="nav-link"
							href="${cp}/mypage/Patient_Info"> <img
								src="${cp}/resource/Admin/images/icons/1.png"
								alt=""> <span class="menu-title">회원정보</span>
						</a></li>
						
						
						<li class="nav-item"><a class="nav-link"
							data-toggle="collapse" href="#sample-pages" aria-expanded="false"
							aria-controls="sample-pages"> <img
								src="${cp}/resource/Admin/images/icons/3.png"
								alt=""> <span class="menu-title">나의 건강 정보<i
									class="fa fa-sort-down"></i></span>
						</a>
							<div class="collapse" id="sample-pages">
								<ul class="nav flex-column sub-menu">
									<li class="nav-item"><a class="nav-link" href="#l">
										스트레스 지수  </a></li>
									<li class="nav-item"><a class="nav-link" href="#">
									     수면 기록 </a></li>
									     <li class="nav-item"><a class="nav-link" href="#">
									     심박 정보 </a></li>
									      <li class="nav-item"><a class="nav-link" href="#">
									     인지 활동 내역 </a></li>
									
								</ul>
							</div>
							
							</li>
						
					
						
						<li class="nav-item"><a class="nav-link"
							data-toggle="collapse" href="#sample-pages" aria-expanded="false"
							aria-controls="sample-pages"> <img
								src="${cp}/resource/Admin/images/icons/9.png"
								alt=""> <span class="menu-title">서비스 이용내역<i
									class="fa fa-sort-down"></i></span>
						</a>
							<div class="collapse" id="sample-pages">
								<ul class="nav flex-column sub-menu">
									
<<<<<<< HEAD
										<li class="nav-item"><a class="nav-link" href="#">
											결제 내역 </a></li>
										<li class="nav-item"><a class="nav-link" href="#">
=======
										<li class="nav-item"><a class="nav-link" href="${cp}/report/reportList?memid=${MEM_INFO.mem_id}">
>>>>>>> b8be8faa8f0ecb303b28fef617f32046ab958725
											보고서 조회 </a></li>
								
								</ul>
							</div>
							
						

						<li class="nav-item"><a class="nav-link"
							data-toggle="collapse" href="#sample-pages" aria-expanded="false"
							aria-controls="sample-pages"> <img
									src="${cp}/resource/Admin/images/icons/6.png"
								alt=""> <span class="menu-title">일정 관리<i
									class="fa fa-sort-down"></i></span>
						</a>
							<div class="collapse" id="sample-pages">
								<ul class="nav flex-column sub-menu">
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
							href="${cp}/mypage/Patient_Wd">
								<img
									src="${cp}/resource/Admin//images/icons/10.png"
								alt=""> <span class="menu-title">회원탈퇴</span>
						</a></li>
						
					</ul>
				</nav>

			</div>
		</div>

</body>
</html>
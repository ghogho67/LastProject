<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



		<div class="container-fluid">
			<div class="row row-offcanvas row-offcanvas-right">
				<nav class="bg-white sidebar sidebar-offcanvas" id="sidebar">
					<div class="user-info">
						<img
							src="${cp}/resource/Admin//images/900.jpg">
						<p class="name">리차드 박</p>
						<p class="designation">치매</p>
						<span class="gold"> </span>


					</div>
					<ul class="nav">
						<li class="nav-item active"><a class="nav-link"
							href="../../index.html"> <img
								src="${cp}/resource/Admin/images/icons/1.png"
								alt=""> <span class="menu-title">회원정보수정</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${cp}/resource/Admin/pages/widgets.html">
								<img
								src="${cp}/resource/Admin/images/icons/2.png"
								alt=""> <span class="menu-title">일정관리</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${cp}/resource/Admin/pages/forms/index.html">
								<img
								src="${cp}/resource/Admin/images/icons/005-forms.png"
								alt=""> <span class="menu-title">결제내역관리</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${cp}/resource/Admin/pages/ui-elements/buttons.html">
								<img
								src="${cp}/resource/Admin/images/icons/4.png"
								alt=""> <span class="menu-title">검진결과</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${cp}/resource/Admin/pages/tables/index.html">
								<img
								src="${cp}/resource/Admin/images/icons/5.png"
								alt=""> <span class="menu-title">어쩌구</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${cp}/resource/Admin/pages/charts/index.html">
								<img
								src="${cp}/resource/Admin/images/icons/6.png"
								alt=""> <span class="menu-title">어쩌구</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${cp}/resource/Admin/pages/icons/index.html">
								<img
								src="${cp}/resource/Admin/images/icons/7.png"
								alt=""> <span class="menu-title">Icons</span>
						</a></li>

						<li class="nav-item"><a class="nav-link"
							data-toggle="collapse" href="#sample-pages" aria-expanded="false"
							aria-controls="sample-pages"> <img
								src="${cp}/resource/Admin/images/icons/9.png"
								alt=""> <span class="menu-title">옵션<i
									class="fa fa-sort-down"></i></span>
						</a>
							<div class="collapse" id="sample-pages">
								<ul class="nav flex-column sub-menu">
									<li class="nav-item"><a class="nav-link" href="#l">
											Blank Page </a></li>
									<li class="nav-item"><a class="nav-link" href="#">
											Login </a></li>
									<li class="nav-item"><a class="nav-link" href="#">
											Register </a></li>
									<li class="nav-item"><a class="nav-link" href="#"> 404
									</a></li>
									<li class="nav-item"><a class="nav-link" href="#"> 500
									</a></li>
								</ul>
							</div></li>
						<li class="nav-item"><a class="nav-link" href="#"> <img
								src="${cp}/resource/Admin//images/icons/10.png"
								> <span class="menu-title">Settings</span>
						</a></li>
					</ul>
				</nav>

			</div>
		</div>

</body>
</html>
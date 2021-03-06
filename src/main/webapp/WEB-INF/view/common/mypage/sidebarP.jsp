<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link href="${cp}/resource/wrap/css/mypageSide.css" rel="stylesheet">
   <script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@include file="/WEB-INF/view/common/gradeSuggest.jsp"%>
</head>
<body>




<div style="     background-color: #a7a7a71c;
    width: 5px;
    height: 100%;
    position: absolute;
    left: 14%;
    top: 15%;
    max-height: 70%;" >
</div>

		<div class="container-fluid">
			<div class="row row-offcanvas row-offcanvas-right">
				<nav class="bg-white sidebar sidebar-offcanvas" id="sidebar">
					<div class="user-info">
						<img
							src="${cp }/chat/tokProfileView?mem_id=${MEM_INFO.mem_id}">
						<p class="name">${MEM_INFO.mem_nm}</p>
						<p class="designation"></p>
						
						<c:choose>
						<c:when test="${MEM_INFO.mem_grade==2}">
							<span class="gold"> </span>
						</c:when>
						<c:otherwise>
							<span class="silver"> </span>
						</c:otherwise>
						</c:choose>
					
					</div>
					
					
					
									
					
<div id='cssmenu'>
<ul>
   <li><a href="${cp}/mypage/Patient_Info"><span>회원정보</span></a></li>
   
   <li class='active has-sub'><a><span>나의건강정보<i class="fa fa-sort-down"></i></span></a>
      <ul>
        <c:choose>
				<c:when test="${MEM_INFO.mem_grade==1}">
				 <li ><a  data-toggle="modal" data-target="#myModalGradeSu"><span>스트레스 지수</span></a></li>
			 <li ><a data-toggle="modal" data-target="#myModalGradeSu"><span>GPS 정보</span></a></li>
         <li ><a data-toggle="modal" data-target="#myModalGradeSu"><span>심박 정보</span></a></li>
               <li ><a href="${cp}/mypage/recognitionActResult"><span>인지활동내역</span></a></li>
           <li><a data-toggle="modal" data-target="#myModalGradeSu"><span>HOME CCTV</span></a></li>
         
				 
				</c:when>
				<c:otherwise>
					 <li ><a  href="${cp}/mypage/stress?mem_id=${MEM_INFO.mem_id}"><span>스트레스 지수</span></a></li>
					          <li ><a href="${cp}/mypage/gpxMap?mem_id=${MEM_INFO.mem_id}"><span>GPS 정보</span></a></li>
         <li ><a href="${cp}/mypage/realBpm?mem_id=${MEM_INFO.mem_id}"><span>심박 정보</span></a></li>
         <li ><a href="${cp}/mypage/recognitionActResult"><span>인지활동내역</span></a></li>
            <li><a href="${cp}/mypage/cctv?open=false&sessionid=${MEM_INFO.mem_id}_cctv&publicRoomIdentifier=&userFullName=${MEM_INFO.mem_id}"><span>HOME CCTV</span></a></li>
         
					 
				</c:otherwise>

			</c:choose>




	    


							</ul>
   </li>
      <li class='active has-sub'><a href='#'><span>서비스 이용내역<i class="fa fa-sort-down"></i></span></a>
      <ul>
         <li class='has-sub'><a href="${cp}/report/pagingList"><span>보고서 조회</span></a> </li>
         <li class='has-sub'><a href="${cp}/approval/approvalCheck?page=1&pageSize=10&searchType=type&searchVal="><span>결재내역</span></a></li>
      </ul>
   </li>
   
        <li class='active has-sub'><a href="/mypage/scheduleView"><span>나의 스케쥴</span></a>
   </li>
   
   <li class='last'><a href="${cp}/mypage/Patient_Wd"><span>회원탈퇴</span></a></li>
</ul>
</div>
					
					
			
						

				</nav>

			</div>
		</div>










</body>
</html>
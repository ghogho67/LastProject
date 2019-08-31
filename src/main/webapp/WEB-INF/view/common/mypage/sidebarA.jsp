<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link href="${cp}/resource/wrap/css/mypageSide.css" rel="stylesheet">
   <script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>
   
   
   
   
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
                     src="${cp}/resource/Admin/images/5000.png">
                  <p class="name">${MEM_INFO.mem_nm}</p>
                  <p class="designation"></p>
                  <span class="admin"> </span>


               </div>
               
               
               
<div id='cssmenu'>
<ul>
   <li><a href='${cp}/mypage/Patient_Info'><span>회원정보</span></a></li>
   <li><a href="${cp}/approval/approvalCheckA?page=1&pageSize=10"><span>결산관리</span></a></li>
   
   <li class='active has-sub'><a href="${cp }/mypage/pagingList?page=1&pageSize=10"><span>회원관리</span></a>
      <ul>
<!--          <li class='has-sub'><a href='#'><span>보고서</span></a> -->
<!--             <ul> -->
<!--                <li><a href='#'><span>보고서 조회</span></a></li> -->
<!--                <li class='last'><a href='#'><span>보고서 관리</span></a></li> -->
<!--             </ul> -->
<!--          </li> -->
<!--          <li class='has-sub'><a href='#'><span>회원관리</span></a> -->
<!--             <ul> -->
<%--                <li><a href="${cp }/mypage/pagingList?page=1&pageSize=10"><span>회원목록</span></a></li> --%>
<!--                <li class='last'><a href='#'><span>탈퇴회원</span></a></li> -->
<!--             </ul> -->
<!--          </li> -->
      </ul>
   </li>
      <li class='active has-sub'><a href="/attendance/adminSaerch?page=1&pageSize=10&searchType=memid&searchVal="><span>출퇴근 관리</span></a>
      <ul>
<!--          <li class='has-sub'><a href='#'><span>일정관리</span></a> -->
<!--             <ul> -->
<!--                <li><a href="/attendance/adminSaerch?page=1&pageSize=10&searchType=memid&searchVal="><span>출퇴근 관리</span></a></li> -->
<!--                <li><a href='#'><span>스케쥴 관리</span></a></li> -->
<!--                <li class='last'><a href='#'><span>일정조율</span></a></li> -->
<!--             </ul> -->
            
<!--          </li> -->
<!--          <li class='has-sub'><a href='#'><span>전체일정</span></a> -->
        
<!--          </li> -->
      </ul>
   </li>
   <li><a href="${cp}/donation/pagingList?page=1&pageSize=10"><span>기부관리</span></a></li>
<!--    <li class='last'><a href='#'><span>회원탈퇴</span></a></li> -->
	
</ul>
</div>
               
               
   
               
               
               
               
               
               
            </nav>

         </div>
      </div>

</body>
</html>
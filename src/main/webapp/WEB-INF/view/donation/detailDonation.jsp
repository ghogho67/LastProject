<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부</title>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css); font-family: 'Noto Sans KR', sans-serif;
#titlee h2, #pzone h2 {
   font-size: 40px;
   font-weight: normal;
   letter-spacing: -1px;
}

#titlee h2 {
   padding: 5px 5px;
}

#titlee h2 span {
   font-weight: bold;
   color: #473fa0;
}

p {
font-family: 'Noto Sans KR', sans-serif;
letter-spacing: 1px;
line-height:1.6em
}

#loginBtn{
/* 	text-align: right; */
	float : right;
	margin-right: 100px;
}
</style>


<script >
$(document).ready(function(){
// 	   <c:if test="${not empty msg}">
// 	      alert("${msg}");
// 	   </c:if>
	   
});

	
</script>


</head>



<body>
   <%@include file="/WEB-INF/view/common/subPageheader.jsp"%>
   <%@include file="/WEB-INF/view/common/subPagesideBar.jsp"%>

   <div class="container">
      <div style="padding-top: 50px; width: 1350px;">

         <div class="card">
            <div class="card-body">

               <div id="titlee">
                  <h2>
                     <span>기부</span> 상세보기
                  </h2>
               </div>
               <hr>

				 <form class="form-horizontal" role="form" action="${cp }/donation/detailDonation" method="get">
                           <input type="hidden" class="form-control" id="app_id" name="app_id" placeholder="결제 아이디" value="${appovalVo.app_id}">
                           <input type="hidden" class="form-control" id="don_id" name="don_id" placeholder="결제 아이디" value="${donationVo.don_id}">
				
               <div class="container">
                  <div class="row">


<!--                      <div class="col-lg-4"> -->
                     <div class="col-lg-12">
                        <div class="blog_right_sidebar">
                           <aside class="single_sidebar_widget popular_post_widget">

                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                                 
                                    <p>기부자 이름 : ${donationApprovalVo.doner }</p>
<%--                                     <p>기부자 이름 : ${donationVo.doner }</p> --%>
                                 </div>
                              </div>
                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                                    <p>회원 아이디 : ${donationApprovalVo.mem_id }</p>
<%--                                     <p>회원 아이디 : ${approvalVo.mem_id }</p> --%>
                                 </div>
                              </div>

                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                              
                                    <p>전화번호: ${donationApprovalVo.doner_phone }</p>
<%--                                     <p>전화번호: ${donationVo.doner_phone }</p> --%>
                                 </div>
                              </div>


                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                              
<%--                                     <p>기부날자: <fmt:formatDate value="${approvalVo.app_time }" --%>
<%--                                              pattern="yyyy-MM-dd" /></p> --%>
										<p>기부 날자: ${donationApprovalVo.app_time }</p>
<%-- 										<p>기부 날자: ${approvalVo.app_time }</p> --%>
                                 </div>
                              </div>


                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                                    <p>기부 금액: ${donationApprovalVo.app_pay }</p>
<%--                                     <p>기부 금액: ${approvalVo.app_pay }</p> --%>

                                 </div>
                              </div>

                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                                    <p>기부사유: ${donationApprovalVo.doner_comment }</p>
<%--                                     <p>기부 사유: ${donationVo.doner_comment }</p> --%>

                                 </div>
                              </div>

                              <div class="br"></div>
                           </aside>

                        </div>
                        
                       
                        
                     </div>

                  </div>

               </div>
               
               </form> 
               <br><br>
               
               <form action="${cp }/login" >
               		<button type="submit" id="loginBtn" class="btn btn-default btn-md">로그인 화면 가기</button>
               </form>
               
               
            </div>






         </div>
      </div>
   </div>






</body>


</html>
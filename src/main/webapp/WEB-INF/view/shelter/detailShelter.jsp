<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무더위 쉼터 상세보기</title>

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
</style>

<script >
$(document).ready(function(){
   <c:if test="${not empty msg}">
      alert("${msg}");
   </c:if>
   
	   
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
                     <span>무더위 쉼터</span> 상세보기
                  </h2>
               </div>
               <hr>

				 <form class="form-horizontal" role="form" action="${cp }/shelter/detailShelter" method="get">
                         <input type="hidden" class="form-control" id="sh_id" name="sh_id" placeholder="무더위 쉼터 아이디" value="${shelterVo.sh_id}">
				
               <div class="container">
                  <div class="row">


<!--                      <div class="col-lg4"> -->
                     <div class="col-lg12">
                        <div class="blog_right_sidebar">
<!--                            <aside class="single_sidebar_widget author_widget"> -->
<%--                               <h3>${lecture.lec_nm}</h3> --%>
<%--                               <h4>${lecture.lec_tea}</h4> --%>
<!--                                  <div class="media-body"> -->
<%--                               <p>${lecture.lec_cont}</p> --%>
<!--                               </div> -->
<!--                               <div class="br"></div> -->
<!--                            </aside> -->
                           <aside class="single_sidebar_widget popular_post_widget">

                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                                 
                                    <p>무더위 쉼터 아이디 : ${shelterVo.sh_id }</p>
                                 </div>
                              </div>
                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                                    <p>무더위쉼터 이름 : ${shelterVo.sh_nm }</p>
                                 </div>
                              </div>

                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                              
                                    <p>무더위쉼터 주소: ${shelterVo.sh_add }</p>
                                 </div>
                              </div>


                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                              
                                    <p>무더위쉼터 운영시작일 : <fmt:formatDate value="${shelterVo.sh_st_dt}"
                                             pattern="yyyy.MM.dd" /></p>
                                 </div>
                              </div>


                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                                    <p>무더위쉼터 운영종료일: <fmt:formatDate value="${shelterVo.sh_end_dt}"
                                             pattern="yyyy.MM.dd"/></p>

                                 </div>
                              </div>

                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                                    <p>무더위쉼터 평일 시작시간 :<fmt:formatDate value="${shelterVo.sh_day_st }"
                                             pattern="HH:mm:ss" /></p>
                                    
                                            

                                 </div>
                              </div>
                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                                    <p>무더위쉼터 평일 종료시간 :<fmt:formatDate value="${shelterVo.sh_day_end }"
                                             pattern="HH:mm:ss" /></p>
                                    

                                 </div>
                              </div>
                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                                    <p>무더위쉼터 주말 시작시간 :<fmt:formatDate value="${shelterVo.sh_we_st }"
                                             pattern="HH:mm:ss" /></p>
                                    

                                 </div>
                              </div>
                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                                    <p>무더위쉼터 주말 종료시간:<fmt:formatDate value="${shelterVo.sh_we_end }"
                                            pattern="HH:mm:ss" /></p>
                                    

                                 </div>
                              </div>
                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                                    <p>무더위쉼터 담당자: ${shelterVo.sw_nm }</p>
                                    

                                 </div>
                              </div>
                              <div class="media post_item">
                                 <img src="/image/dotdot.png">
                                 <div class="media-body">
                                    <p>무더위쉼터 담당자 연락처 : ${shelterVo.sw_phone }</p>
                                    

                                 </div>
                              </div>


                              <div class="br"></div>
                           </aside>

                        </div>
                     </div>

<!--                      <div class="col-lg-8 posts-list"> -->
<!--                         <div class="single-post row"> -->

<!--                            <div class="col-lg-12 blog_details"> -->
<!--                               <h3>무더위 쉼터</h3> -->
<!--                               <div id="map" style="width: 100%; height: 500px;"></div> -->
<!--                            </div> -->
                           
<!--                         </div> -->
<!--                      </div> -->

                  </div>

               </div>
               
               </form> 
            </div>






         </div>
      </div>
   </div>






</body>

</html>
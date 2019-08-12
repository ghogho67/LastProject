<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script >
$(document).ready(function(){
	   <c:if test="${not empty msg}">
	      alert("${msg}");
	   </c:if>
	});
</script>


</head>



<body>
   <!-- header -->

   <div class="container-fluid">
      <div class="row">


         <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="row">
               <div class="col-sm-8 blog-main">
                  <h2 class="sub-header">기부 상세보기</h2>
                  <form class="form-horizontal" role="form" action="${cp }/donation/detailDonation" method="get">
<%--                            <input type="hidden" class="form-control" id="don_id" name="don_id" placeholder="도네이션 아이디" value="${donationVo.don_id}"> --%>
                           <input type="hidden" class="form-control" id="app_id" name="app_id" placeholder="결제아이디" value="${donationAppovalVo.app_id}">
      
                     <div class="form-group">
                        <label for="userNm" class="col-sm-2 control-label">기부자 이름</label>
                        <div class="col-sm-10">
                           <label class="control-label">${donationAppovalVo.doner }</label>
                        </div>
                     </div>
                     
                     <div class="form-group">
                        <label for="userNm" class="col-sm-2 control-label">회원 아이디</label>
                        <div class="col-sm-10">
                           <label class="control-label">${donationAppovalVo.mem_id }</label>
                        </div>
                     </div>
                     
                     <div class="form-group">
                        <label for="userNm" class="col-sm-2 control-label">전화번호</label>
                        <div class="col-sm-10">
                           <label class="control-label">${donationAppovalVo.doner_phone }</label>
                        </div>
                     </div>
                     
                     <div class="form-group">
                        <label for="userNm" class="col-sm-2 control-label">기부날자</label>
                        <div class="col-sm-10">
                           <label class="control-label">${donationAppovalVo.app_time }</label>
                        </div>
                     </div>
                     
                     <div class="form-group">
                        <label for="userNm" class="col-sm-2 control-label">기부 금액</label>
                        <div class="col-sm-10">
                           <label class="control-label">${donationAppovalVo.app_pay }</label>
                        </div>
                     </div>
                     
                    <div class="form-group">
                        <label for="userNm" class="col-sm-2 control-label">기부사유</label>
                        <div class="col-sm-10">
                           <label class="control-label">${donationAppovalVo.don_comment }</label>
                        </div>
                     </div>
                     
 						

                  </form>   

               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>
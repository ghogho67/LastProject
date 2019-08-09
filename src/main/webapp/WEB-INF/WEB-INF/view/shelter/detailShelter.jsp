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
                  <h2 class="sub-header">상세보기</h2>
                  <form class="form-horizontal" role="form" action="${cp }/shelter/detailShelter" method="get">
                           <input type="hidden" class="form-control" id="sh_id" name="sh_id" placeholder="무더위쉼터 아이디" value="${shelterVo.sh_id}">
      
                     <div class="form-group">
                        <label for="sh_id" class="col-sm-2 control-label" >무더위쉼터 아이디</label>
                        <div class="col-sm-10">
                           <label class="control-label">${shelterVo.sh_id }</label>
                           
                        </div>
                     </div>
      
                     <div class="form-group">
                        <label for="userNm" class="col-sm-2 control-label">쉼터이름</label>
                        <div class="col-sm-10">
                           <label class="control-label">${shelterVo.sh_nm }</label>
                        </div>
                     </div>
                     
                     <div class="form-group">
                        <label for="userNm" class="col-sm-2 control-label">	쉼터주소</label>
                        <div class="col-sm-10">
                           <label class="control-label">${shelterVo.sh_add }</label>
                        </div>
                     </div>
                     
                     <div class="form-group">
                        <label for="userNm" class="col-sm-2 control-label">운영시작일</label>
                        <div class="col-sm-10">
                           <label class="control-label">${shelterVo.sh_st_dt }</label>
                        </div>
                     </div>
                     
                     <div class="form-group">
                        <label for="userNm" class="col-sm-2 control-label">운영종료일</label>
                        <div class="col-sm-10">
                           <label class="control-label">${shelterVo.sh_end_dt }</label>
                        </div>
                     </div>
                     
 						<div class="form-group">
                        <label for="userNm" class="col-sm-2 control-label">평일 시작시간</label>
                        <div class="col-sm-10">
                           <label class="control-label">${shelterVo.sh_day_st }</label>
                        </div>
                     </div>
 						<div class="form-group">
                        <label for="userNm" class="col-sm-2 control-label">평일 종료시간</label>
                        <div class="col-sm-10">
                           <label class="control-label">${shelterVo.sh_day_end }</label>
                        </div>
                     </div>
 						<div class="form-group">
                        <label for="userNm" class="col-sm-2 control-label">주말 시작시간</label>
                        <div class="col-sm-10">
                           <label class="control-label">${shelterVo.sh_we_st }</label>
                        </div>
                     </div>
 						<div class="form-group">
                        <label for="userNm" class="col-sm-2 control-label">주말 종료시간</label>
                        <div class="col-sm-10">
                           <label class="control-label">${shelterVo.sh_we_end }</label>
                        </div>
                     </div>
 						<div class="form-group">
                        <label for="userNm" class="col-sm-2 control-label">담당자</label>
                        <div class="col-sm-10">
                           <label class="control-label">${shelterVo.sw_nm }</label>
                        </div>
                     </div>
 						<div class="form-group">
                        <label for="userNm" class="col-sm-2 control-label">담당자 연락처</label>
                        <div class="col-sm-10">
                           <label class="control-label">${shelterVo.sw_phone}</label>
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
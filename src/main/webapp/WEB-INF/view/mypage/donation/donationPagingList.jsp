<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<head>
<meta charset="UTF-8">
<title>기부 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


<style>

.pagination-outer {
	text-align: center;
}

.pagination {
	font-family: 'Rubik', sans-serif;
	padding: 0 30px;
	display: inline-flex;
	position: relative;
}

.pagination li a.page-link {
	color: #909090;
	background-color: transparent;
	font-size: 15px;
	line-height: 35px;
	height: 45px;
	width: 40px;
	margin: 0 3px;
	border: none;
	border-radius: 0;
	overflow: hidden;
	position: relative;
	transition: all 0.4s ease 0s;
}

.pagination li.active a.page-link, .pagination li a.page-link:hover,
	.pagination li.active a.page-link:hover {
	color: #006266;
	background-color: transparent;
}

.pagination li a.page-link span {
	display: block;
	transition: all 0.3s;
}

.pagination li a.page-link:hover span {
	transform: rotateY(360deg);
}

.pagination li a.page-link:before, .pagination li a.page-link:after {
	content: "";
	background-color: #006266;
	height: 3px;
	width: 0;
	opacity: 1;
	position: absolute;
	left: 0;
	bottom: 0;
	z-index: -1;
	transition: all 0.3s;
}

.pagination li a.page-link:before {
	background: linear-gradient(135deg, transparent 49%, #006266 50%);
	height: 15px;
	width: 15px;
	transform: translateX(-50%) rotate(45deg);
	bottom: auto;
	top: -20px;
	left: 50%;
}

.pagination li a.page-link:hover:after {
	width: 100%;
}

.pagination li a.page-link:hover:before {
	top: -10px;
}

.pagination li a.page-link:hover:before, .pagination li.active a.page-link:before
	{
	top: -10px;
}

.pagination li a.page-link:hover:after, .pagination li.active a.page-link:after
	{
	width: 100%;
}

@media only screen and (max-width: 480px) {
	.pagination {
		display: block;
	}
	.pagination li {
		margin-bottom: 10px;
		display: inline-block;
	}
}

.for {
	position: relative;
	width: 250px;
	height: 50px;
	margin: 0 auto;
}

.d1 {
	height: 30px;
	background: white;
	position: absolute;
	right: 16%;
}

.d1 input {
	width: 110%;
	height: 20px;
	padding-left: 90px;
	border: 2px solid #7BA7AB;
	border-radius: 5px;
	outline: none;
	background: white;
	color: #9E9C9C;
	font-size: 13px;
}

.d1 button {
	position: absolute;
	top: 0;
	right: -25px;
/* 	left : 2px; */
	width: 32px;
	height: 38px;
	border: none;
 	background: #7BA7AB;
	border-radius: 0 5px 5px 0;
 	cursor: pointer; 
}

.d1 button:before {
	content: "\f002";
	font-family: FontAwesome;
	font-size: 16px;
	color: #F9F0DA;
}

#searchType {
	height: 40px;
	width: 90px;
	font-size: 12px;
	border-radius: 5px 0px 0px 5px;
	border-top: 2px solid #7BA7AB;
	border-bottom: 2px solid #7BA7AB;
	border-left: 2px solid #7BA7AB;
	border-right: 2px solid #7BA7AB;
}
</style>

<script>

$( document ).ready(function() {
	   $("#saerchBtn").click("on",function(){
			var data = $("#saerchList").serialize();
			console.log(data);
			$.ajax({
				type: "POST",
				url : "${cp}/attendance/adminSaerch",
				data : data,
				success : function(data){
					console.log(data);
				},
			error : function(xhr){
					alert(xhr.status);
				
			}
		 });
		});
	   
	 

	
});



</script>

</head>
<body>

	<div class="content-wrapper">

		<div class="row mb-4">


			<div class="col-lg-12">
				<h3 class="accept-title">&nbsp;&nbsp;&nbsp;기부 목록</h3>
		
                
<!-- 		<div  style="padding-top: 50px; width: 1350px;"> -->
      <div class="col-lg-12" style="padding-top: 50px;">
         <div class="card">
            <div class="card-body">
            
					 <div class="d1">
                          <form id="saerchList" class="for" method="POST" action="${cp}/donation/donationPagingList">

                             <select id="searchType" name="searchType"
							style="position: absolute; z-index: 999;">
                                <option value="all">전체 기부자</option>
                                <option value="mem_y">기부자(회원)</option>
                                <option value="mem_n">기부자(비회원)</option>
                             </select> 
                            <input id="saerchVal" name="saerchVal" type="text" placeholder=""><br>
                           <button id="saerchBtn" name="saerch" type="button"></button>
                          </form>
                       </div>
                       
               <h3 style="font-size: 30px; font-weight: 500; margin-left: 220px;">기부자 보기</h3>
              
               <hr>
								<div class="board-list-in">
									<table class="education-table" style="margin-left: 0px; margin-right: 100px">


										<colgroup>
											<col style="width: 10%">
											<col style="width: 25%" class="ng-scope">
											<col style="width: 25%">
											<col style="width: 20%">
											<col style="width: 10%">
											<col style="width: 10%">
										</colgroup>

										<thead>
											<tr>
												<th scope="col">NO.</th>
												<th scope="col">출근시간</th>
												<th scope="col">퇴근시간</th>
												<th scope="col">회원아이디</th>
												<th scope="col">요양보호사아이디</th>
												<th scope="col">매칭번호</th>
											</tr>
										</thead>

						
						<tbody>
                        <c:forEach items="${adminCheckList }" var="vo" varStatus="status">
                        				<tr>
											<td>${vo.rn }</td>
											<td>${vo.ad_st }</td>
											<td>${vo.ad_end }</td>
											<td>${vo.mem_id }</td>
											<td>${vo.cw_mem_id }</td>
											<td>${vo.mat_id }</td>
										</tr>
									</c:forEach>
						</tbody>
                  </table>
               </div>
               <!-- 페이지네이션 -->
							<div class="text-center">
								<ul class="pagination">
							
									<c:choose>
										<c:when test="${pageVo.page == 1 }">
											<li class="disabled"><span>«</span></li>
										</c:when>
										<c:otherwise>
											<li><a href="${cp}/attendance/cwMatList?page=${pageVo.page-1}&pageSize=${pageVo.pageSize}">«</a></li>
										</c:otherwise>
									</c:choose>
									
									<c:forEach begin="1" end="${paginationSize}" var="i">
										<c:choose>
											<c:when test="${pageVo.page == i}">
												<li class="active"><span>${i}</span></li>
											</c:when>
											<c:otherwise>
												<li><a href="${cp}/attendance/cwMatList?page=${i}&pageSize=${pageVo.pageSize}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									
									<c:choose>
										<c:when test="${pageVo.page == paginationSize}">
											<li class="disabled"><span>»</span></li>
										</c:when>
										<c:otherwise>
											<li><a href="${cp}/attendance/cwMatList?page=${pageVo.page+1}&pageSize=${pageVo.pageSize}">»</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
            </div>
         </div>
      </div>
   </div>

</div>
</div>
</div>





</body>
</html>
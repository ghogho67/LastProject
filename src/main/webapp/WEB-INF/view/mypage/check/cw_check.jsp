<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<style type="text/css">
tr {
   text-align: center;
   font-weight: 500;
}

td {
   text-align: center;
}

.title {
   background-color: transparent;
   width: 180px;
   padding: 3px;
   font-size: 8pt;
   text-align: center;
}

.kkk {
   background-color: transparent;
   border-color: transparent;
   width: 30px;
   padding: 3px;
   font-size: 9pt;
   width: 30px;
}

<
style>.pagination-outer {
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
   height: 30px;
   margin: 0 auto;
}

.d1 {
   height: 30px;
   background: white;
   position: absolute;
   right: 21%;
}

.d1 input {
   width: 100%;
   height: 30px;
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
   right: 0px;
   width: 32px;
   height: 30px;
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
   height: 30px;
   width: 70px;
   font-size: 11px;
   border-radius: 5px 0px 0px 5px;
   border-top: 2px solid #7BA7AB;
   border-bottom: 2px solid #7BA7AB;
   border-left: 2px solid #7BA7AB;
   border-right: 2px solid #7BA7AB;
}
</style>




<script>
   $(document).ready(function() {

      $(".kkk").on("click", function() {

         $("#frm").submit();
      });

   });
</script>

</head>
<body>

		 <div class="d1">
                          <form class="for">

                             <select id="searchType" name="searchType"
                                style="position: absolute; z-index: 999;">
                                <option value="mem_id">회원명</option>
                                <option value="day">날짜</option>
                                <option value="day">매칭번호</option>
                             </select> 
                             <input type="text" placeholder="검색어 입력"
                                style="position: absolute; top: 0px; right: 0px;">
                             <button type="submit"></button>
                          </form>
                       </div>

   <div class="container">
      <div class="col-lg-12" style="padding-top: 50px;">
         <div class="card">
            <div class="card-body">

               <h3 style="font-size: 30px; font-weight: 500;">요양보호사 출석체크 관리</h3>
               <hr>
               
               <div class="table-responsive">
                  <table class="table center-aligned-table">
                        <tr class="text-primary">
                           <th>NO.</th>
                           <th>출근시간</th>
                           <th>퇴근시간</th>
                           <th>회원이름</th>
                           <th>매칭번호</th>
                        </tr>


                        <tr>
                           <td>dd</td>
						   <td>출석시간</td>
                           <td>퇴근시간</td>
                           <td>회원이름</td>	
                           <td>매칭번호</td>	
                       </tr>
                  </table>
               </div>
            </div>
         </div>
      </div>
   </div>







</body>
</html>
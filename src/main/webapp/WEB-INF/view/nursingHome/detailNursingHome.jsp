<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BasicSubPage</title>


<style type="text/css">
#titlee h2, #pzone h2 {
	font-size: 40px;
	font-weight: normal;
	letter-spacing: -1px;
}

#titlee h2 {
	padding: 25px 35px;
}

#titlee h2 span {
	font-weight: bold;
	color: #473fa0;
}


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
	right: 1%;
	top: 75px;
}

.d1 input {
	width: 100%;
	height: 30px;
	padding-left: 90px;
	border: 2px solid #5ab4dc;
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
	background: #5ab4dc;
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
	border-top: 2px solid #5ab4dc;
	border-bottom: 2px solid #5ab4dc;
	border-left: 2px solid #5ab4dc;
	border-right: 2px solid #5ab4dc;
}

</style>



</head>

<body>

	<%@include file="/WEB-INF/view/common/subPageheader.jsp"%>
	<%@include file="/WEB-INF/view/common/subPagesideBar.jsp"%>

	<div class="container">
		<div style="padding-top: 50px; width: 1250px;">
			<div class="card">
				<div class="card-body">
							<div id="titlee">
						<h2>
							<span>요양시설 상세보기</span>
						</h2>
						</div>
					
						
					<hr>
					
					<form id="frm" class="form-horizontal" role="form" action="${cp }/nursingHome/detailNursing" method="get">
                           <input type="hidden" class="form-control" id="nh_id" name="nh_id" placeholder="무더위쉼터 아이디" value="${nursingHomeVo.nh_id}">
      
      
                     <div class="form-group">
                        <label for="userNm" class="col-sm-2 control-label">요양시설 이름</label>
                        <div class="col-sm-10">
                           <label class="control-label">${nursingHomeVo.nh_nm }</label>
                        </div>
                     </div>
                     
                     <div class="form-group">
                        <label for="userNm" class="col-sm-2 control-label">요양시설 대표</label>
                        <div class="col-sm-10">
                           <label class="control-label">${nursingHomeVo.nh_rep }</label>
                        </div>
                     </div>
                     
                     <div class="form-group">
                        <label for="userNm" class="col-sm-2 control-label">주소</label>
                        <div class="col-sm-10">
                           <label class="control-label">${nursingHomeVo.nh_add }</label>
                        </div>
                     </div>
                     
                     <div class="form-group">
                        <label for="userNm" class="col-sm-2 control-label">전화번호</label>
                        <div class="col-sm-10">
                           <label class="control-label">${nursingHomeVo.nh_phone }</label>
                        </div>
                     </div>
                     
 						<div class="form-group">
                        <label for="userNm" class="col-sm-2 control-label">평점</label>
                        <div class="col-sm-10">
                           <label class="control-label">${nursingHomeVo.nh_grade }</label>
                        </div>
                     </div>

                  </form> 
                  
                  <!-- 뒤로가기 -->
					<a href="${cp}/nursingHome/searchNursing"><img  src="/image/backButton.svg" style="width: 50px;"></a>
                  
                  
				</div>
			</div>
		</div>
	</div>
	
	


</body>
</html>
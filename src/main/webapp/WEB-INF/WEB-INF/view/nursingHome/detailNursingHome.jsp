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
                  
                  
                    <!-- 댓글 -->
                     
<!--                     <div class="form-group"> -->
                    
<!--                         <label for="replyid" class="col-sm-2 control-label">댓글</label><br> -->
<%--  						<c:forEach items="${replyList }" var="replyVo" varStatus="status"> --%>
<%-- 		                    <form id="redelfrm" class="form-horizontal" role="form" action="${pageContext.request.contextPath}/deleteReply" method="post"> --%>
		                      
		                      
<%-- 		                       <input type="hidden" class="form-control" id="post_id" name="post_id" value="${replyVo.post_id }"> --%>
<%-- 		                       <input type="hidden" class="form-control" id="reply_id" name="reply_id" value="${replyVo.reply_id }"> --%>
<%-- 		                       <input type="hidden" class="form-control" id="reuse_yn" name="reuse_yn" value="${replyVo.reuse_yn }"> --%>
<%-- 		                       <input type="hidden" class="form-control" id="board_id" name="board_id" value="${postVo.board_id }"> --%>
	                        	
<!-- 		                      <table> -->
	                        
<%-- 	                        	<c:choose> --%>
<%-- 	                        	<c:when test="${replyVo.reuse_yn == '1' }"> --%>
<!-- 		                        	<tr> -->
<%-- 		                        	<td class="control-label">${replyVo.reply_content }</td> --%>
<%-- 		                        	<td class="control-label">${replyVo.userid}</td> --%>
<%-- 		                        	<td class="control-label">${replyVo.reply_date }</td> --%>
<!-- 		                        	</tr> -->
<!-- 	                        		<button id="removeReply" class="removeReply">댓글삭제</button> -->
<%-- 		                        </c:when> --%>
		                        	
<%-- 	                        	<c:otherwise> --%>
<!-- 	                        	<tr> -->
<!-- 	                        		<td>삭제된 댓글입니다</td> -->
<!-- 	                        	</tr> -->
	                        		
<%-- 	                        	</c:otherwise> --%>
<%-- 	                        	</c:choose> --%>
	                        	
<!-- 		                       </table> -->
<!-- 	                        </form> -->
<%--                         </c:forEach>    --%>
                        
                        
<%--                         <form id="refrm" class="form-horizontal" role="form" action="${pageContext.request.contextPath}/reply" method="post"> --%>
<!--                         	<input type="text" class="form-control" id="reply_content" name="reply_content" > -->
<%--                         	<input type="hidden" class="form-control" id="userid" name="userid" value="${replyVo.userid }"> --%>
<%--                         	<input type="hidden" class="form-control" id="reply_date" name="reply_date" value="${replyVo.reply_date }"> --%>
<%--                         	<input type="hidden" class="form-control" id="post_id" name="post_id" value="${postVo.post_id}"> --%>
<%--                         	<input type="hidden" class="form-control" id="board_id" name="board_id" value="${postVo.board_id}"> --%>
<!--                             <button type="submit" class="btn btn-default" id="replyBtn">댓글저장</button> -->
<!-- 						</form>                      -->
<!--                         </div> -->
					
	
					
					
				</div>
			</div>
		</div>
	</div>
	
	


</body>
</html>
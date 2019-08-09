<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sample</title>

<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>
<%@include file="/WEB-INF/view/common/joinCare.jsp"%>

<style>




/* 검색 CSS */
* {box-sizing: border-box;}
.for {
  position: relative;
  width: 250px;
  margin: 0 auto;
}
.d1 {background: white;
position: absolute;
right: 21%;


}
.d1 input {
  width: 100%;
  height: 32px;
  padding-left: 10px;
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
  height: 32px;
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


</style>

</head>
<body>



<!--  검색 -->
<div class="d1">
  <form class="for">
  <input type="text" placeholder="검색어 입력" >
  <button type="submit"></button>
  </form>
</div>








	<div class="board-list-in">
		<table class="education-table">
			<caption class="sr-only ng-binding">치매커뮤니케이션</caption>

			<colgroup>
				<col style="width: 10%">
				<col style="width: 50%" class="ng-scope">
				<col style="width: 10%">
				<col style="width: 20%">
				<col style="width: 10%">
			</colgroup>

			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col" class="hidden-xs">작성자</th>
					<th scope="col">등록일</th>
					<th scope="col" class="border-no1 hidden-xs">조회수</th>
				</tr>
			</thead>

			<tbody>



				<!-- 반복 -->
				<tr>
					<td class="ng-binding">글번호</td>

					<td class="left pl20"><a href="태그주소" class="ng-binding">
							제목 </a></td>

					<td class="hidden-xs"><a href="#" class="ng-binding"> 작성자
					</a></td>

					<td><a href="#" class="ng-binding"> 작성일 </a></td>

					<td class="border-no hidden-xs"><a href="#" class="ng-binding">
							조회수</a></td>
				</tr>

				<!-- 반복 -->
			</tbody>
		</table>

	</div>


<!-- 버튼 -->


	<a href="#" class="genric-btn success medium" style="float: right">버튼</a>






</body>
</html>
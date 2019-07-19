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

</style>

</head>
<body>





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




<!-- 검색 -->

	<div class="board-search input-group">
		<input type="text"
			class="form-control form-control-small ng-pristine ng-untouched ng-valid ng-empty">
		<span class="input-group-btn">
			<button class="btn btn-default">검색</button>
		</span>
	</div>



</body>
</html>
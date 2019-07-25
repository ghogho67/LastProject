<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>





.searchk {
  width: 100%;
  position: relative;
  display: flex;
}

.searchTerm {
 width: 200px;
  height: 36px;
  border: 3px solid gray;
  border-right: none;
  padding: 5px;
 
  border-radius: 0px 0 0 0px;
  outline: none;
  color: #9DBFAF;
 
}

.searchTerm:focus{
  color: #00B4CC;
}

.searchButton {
  width: 40px;
  height: 36px;
  border: 1px solid gray;
  background: gray;
  text-align: center;
  color: #fff;
  border-radius: 0 5px 5px 0;
  cursor: pointer;
  font-size: 20px;
}


#searchType{
border-radius: 5px 0px 0px 5px;
border-top: 3px solid gray;
border-bottom: 3px solid gray;
border-left: 3px solid gray;
border-right: 0px;

}

</style>

</head>
<body>






<form id="frm3" action="/search/searchInReport" method="post">
								<div class="searchk">
								
									<select id="searchType" name="searchType">
										<option value="all">전체</option>
										<option value="title">제목</option>
										<option value="content">내용</option>
										<option value="writer">작성자</option>
										<option value="tc">제목+내용</option>
									</select> 
							
							
							
									<input type="text" class="searchTerm" id="keyword"
										name="keyword" value="${keyword}" placeholder="검색어를 입력하세요"> 
										
										<input type="hidden" id="boardid"
										name="boardid" placeholder="게시판지정" value="${boardid}">
									
									
									<button type="submit" class="searchButton" id="searchBtn">
										<i class="fa fa-search"></i>
									</button>
								</div>


						</form>

</body>
</html>
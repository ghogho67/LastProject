<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BasicQnA</title>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>
<%@include file="/WEB-INF/view/common/joinCare.jsp"%>

<style>
.pagination-outer{ text-align: center; }
.pagination{
    font-family: 'Rubik', sans-serif;
    padding: 0 30px;
    display: inline-flex;
    position: relative;
}
.pagination li a.page-link{
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
.pagination li.active a.page-link,
.pagination li a.page-link:hover,
.pagination li.active a.page-link:hover{
    color: #006266;
    background-color: transparent;
}
.pagination li a.page-link span{
    display: block;
    transition: all 0.3s;
}
.pagination li a.page-link:hover span{ transform: rotateY(360deg); }
.pagination li a.page-link:before,
.pagination li a.page-link:after{
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
.pagination li a.page-link:before{
    background: linear-gradient(135deg,transparent 49%, #006266 50%);
    height: 15px;
    width: 15px;
    transform: translateX(-50%) rotate(45deg);
    bottom: auto;
    top: -20px;
    left: 50%;
}
.pagination li a.page-link:hover:after{ width: 100%; }
.pagination li a.page-link:hover:before{ top: -10px; }
.pagination li a.page-link:hover:before,
.pagination li.active a.page-link:before{
    top: -10px;
}
.pagination li a.page-link:hover:after,
.pagination li.active a.page-link:after{
    width: 100%;
}
@media only screen and (max-width: 480px){
    .pagination{ display: block; }
    .pagination li{
        margin-bottom: 10px;
        display: inline-block;
    }
}
License Terms
</style>

</head>

<body>
<%@include file="/WEB-INF/view/common/header.jsp"%>
<%@include file="/WEB-INF/view/common/sideBar.jsp"%>

	<br>
	<br>
	<br>

	

    <section class="patient-area section-padding3" ">
        <div class="container">
            <div class="row">
            
         <section class="ng-scope">
		<div class="board-list-in">
			<div class="board-top">
				<p class="board-count">
					총 <span class="education-board-cnt ng-binding">21</span>개의 글
				</p>
			
			</div>
		</div>

		<div class="board-list-in">
			<table class="education-table">
				<colgroup>
					<col style="width: 10%">
					<col style="width: 10%" class="ng-scope">
					<col style="width: 40%" class="ng-scope">
					<col style="width: 10%">
					<col style="width: 20%">
					<col style="width: 10%">
				</colgroup>
				
				
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col" ng-if="boardInfo.board_type=='QNA'"
							class="ng-scope">접수상태</th>
						<th scope="col">제목</th>
						<th scope="col" class="hidden-xs">작성자</th>
						<th scope="col">등록일</th>
						<th scope="col" class="border-no1 hidden-xs">조회수</th>
					</tr>
				</thead>

   <!-- 반복 -->
					<tr class="ng-scope">
						<td class="ng-binding">1</td>
						
						<td  class="ng-scope"> <a href="#" > <span  class="ng-scope">답ㅇ변여부출력</span></a>
						</td>
						
						<td class="left pl20">
						<a href="#" class="ng-binding">타이틀 </a>
						</td>
						
						<td class="hidden-xs">
						<a href="#" class="ng-binding"> 작성자 </a>
						</td>
							
						<td>
						<a href="#" class="ng-binding"> 작성일 </a>
						</td>
						
						<td class="border-no hidden-xs">
						<a href="#" class="ng-binding"> 조회수 </a>
						</td>
					</tr>
   <!-- 반복 -->

   <!-- 샘플 /삭제 -->

					<tr ng-if="boardList.filterData.length > 0"
						class="ng-scope">
						<td class="ng-binding">2</td>
						<td ng-if="boardInfo.board_type=='QNA'" class="ng-scope"><a
							href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)">
								<span ng-if="list.comment_cnt > 0" class="ng-scope">답변완료</span>
						</a></td>
						<td class="left pl20"><a href="javascript:;"
							class="ng-binding"> <!-- ngIf: list.pw=='Y' --> 치매할머니가 심부전으로
								입원을 하셨는데 안절부절 못하시며 침대에 누워있으려고 하지 않습니다. <!-- ngIf: list.comment_cnt > 0 -->
								<span class="comment_cnt ng-binding ng-scope"
								ng-if="list.comment_cnt > 0">[1]</span> <!-- end ngIf: list.comment_cnt > 0 -->
						</a></td>
						<td class="hidden-xs"><a href="javascript:;"
							class="ng-binding"> 이현숙 </a></td>
						<td><a href="javascript:;"
							class="ng-binding"> 2019-06-07 </a></td>
						<td class="border-no hidden-xs"><a href="javascript:;"
							class="ng-binding"> 6 </a></td>
					</tr>
					<tr ng-if="boardList.filterData.length > 0"
						ng-repeat="list in (boardList.filterData = ( boardList.data | filter:{is_notice:'N'} | filter:{subject:boardList.searchText})) | startFrom:((pageNo - 1) * pageRow) | limitTo:pageRow"
						class="ng-scope">
						<td class="ng-binding">3</td>
						<td ng-if="boardInfo.board_type=='QNA'" class="ng-scope"><a
							href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)">
								<!-- ngIf: list.comment_cnt < 1 --> <span
								ng-if="list.comment_cnt < 1" class="ng-scope">접수상태</span> <!-- end ngIf: list.comment_cnt < 1 -->
						</a></td>
						<td class="left pl20"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> <!-- ngIf: list.pw=='Y' --> 오랜만에 뵙는 부모님,
								괜찮으신가요? 부모님을 위해 미리 살펴보아야 할 것들 <!-- ngIf: list.comment_cnt > 0 -->
						</a></td>
						<td class="hidden-xs"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 최고관리자 </a></td>
						<td><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 2019-02-02 </a></td>
						<td class="border-no hidden-xs"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 35 </a></td>
					</tr>

					<tr ng-if="boardList.filterData.length > 0"
						ng-repeat="list in (boardList.filterData = ( boardList.data | filter:{is_notice:'N'} | filter:{subject:boardList.searchText})) | startFrom:((pageNo - 1) * pageRow) | limitTo:pageRow"
						class="ng-scope">
						<td class="ng-binding">4</td>
						<td ng-if="boardInfo.board_type=='QNA'" class="ng-scope"><a
							href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)">
								<span ng-if="list.comment_cnt > 0" class="ng-scope">답변완료</span>
						</a></td>
						<td class="left pl20"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> <!-- ngIf: list.pw=='Y' --> 4남매 가운데 혼자서
								어머니를 돌봐드리는데, 이 수고를 아무도 알아주지 않습니다. <!-- ngIf: list.comment_cnt > 0 -->
								<span class="comment_cnt ng-binding ng-scope"
								ng-if="list.comment_cnt > 0">[1]</span> <!-- end ngIf: list.comment_cnt > 0 -->
								<!-- ngIf: boardInfo.new_date <= list.new_date -->
						</a></td>
						<td class="hidden-xs"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 최고관리자 </a></td>
						<td><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 2018-10-04 </a></td>
						<td class="border-no hidden-xs"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 51 </a></td>
					</tr>
					<tr ng-if="boardList.filterData.length > 0"
						ng-repeat="list in (boardList.filterData = ( boardList.data | filter:{is_notice:'N'} | filter:{subject:boardList.searchText})) | startFrom:((pageNo - 1) * pageRow) | limitTo:pageRow"
						class="ng-scope">
						<td class="ng-binding">5</td>
						<td ng-if="boardInfo.board_type=='QNA'" class="ng-scope"><a
							href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)">
								<span ng-if="list.comment_cnt < 1" class="ng-scope">접수상태</span>
								<!-- end ngIf: list.comment_cnt < 1 -->
						</a></td>
						<td class="left pl20"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> <!-- ngIf: list.pw=='Y' --> 3분에 한 번 꼴로
								화장실에 가시겠다는 할머니, 어떻게 해야 하나요? <!-- ngIf: list.comment_cnt > 0 -->
								<!-- ngIf: boardInfo.new_date <= list.new_date -->
						</a></td>
						<td class="hidden-xs"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 최고관리자 </a></td>
						<td><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 2018-10-01 </a></td>
						<td class="border-no hidden-xs"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 32 </a></td>
					</tr>
					<tr ng-if="boardList.filterData.length > 0"
						ng-repeat="list in (boardList.filterData = ( boardList.data | filter:{is_notice:'N'} | filter:{subject:boardList.searchText})) | startFrom:((pageNo - 1) * pageRow) | limitTo:pageRow"
						class="ng-scope">
						<td class="ng-binding">6</td>
						<td ng-if="boardInfo.board_type=='QNA'" class="ng-scope"><a
							href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)">
								<span ng-if="list.comment_cnt > 0" class="ng-scope">답변완료</span>
						</a></td>
						<td class="left pl20"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> <!-- ngIf: list.pw=='Y' --> <span
								class="glyphicon glyphicon-lock ng-scope" aria-hidden="true"
								ng-if="list.pw=='Y'"></span> <!-- end ngIf: list.pw=='Y' -->
								안녕하세요 <!-- ngIf: list.comment_cnt > 0 --> <span
								class="comment_cnt ng-binding ng-scope"
								ng-if="list.comment_cnt > 0">[1]</span> <!-- end ngIf: list.comment_cnt > 0 -->
								<!-- ngIf: boardInfo.new_date <= list.new_date -->
						</a></td>
						<td class="hidden-xs"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 김하진 </a></td>
						<td><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 2018-09-16 </a></td>
						<td class="border-no hidden-xs"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 4 </a></td>
					</tr>
					<tr ng-if="boardList.filterData.length > 0"
						ng-repeat="list in (boardList.filterData = ( boardList.data | filter:{is_notice:'N'} | filter:{subject:boardList.searchText})) | startFrom:((pageNo - 1) * pageRow) | limitTo:pageRow"
						class="ng-scope">
						<td class="ng-binding">7</td>
						<td ng-if="boardInfo.board_type=='QNA'" class="ng-scope"><a
							href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)">
								<!-- ngIf: list.comment_cnt < 1 --> <span
								ng-if="list.comment_cnt < 1" class="ng-scope">접수상태</span> <!-- end ngIf: list.comment_cnt < 1 -->
						</a></td>
						<!-- end ngIf: boardInfo.board_type=='QNA' -->
						<td class="left pl20"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> <!-- ngIf: list.pw=='Y' --> 치매 어머니가 기저귀를
								싫어하십니다. 어떻게 하면 좋을까요? <!-- ngIf: list.comment_cnt > 0 --> <!-- ngIf: boardInfo.new_date <= list.new_date -->
						</a></td>
						<td class="hidden-xs"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 최고관리자 </a></td>
						<td><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 2018-06-16 </a></td>
						<td class="border-no hidden-xs"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 39 </a></td>
					</tr>
					<tr ng-if="boardList.filterData.length > 0"
						ng-repeat="list in (boardList.filterData = ( boardList.data | filter:{is_notice:'N'} | filter:{subject:boardList.searchText})) | startFrom:((pageNo - 1) * pageRow) | limitTo:pageRow"
						class="ng-scope">
						<td class="ng-binding">8</td>
						<td ng-if="boardInfo.board_type=='QNA'" class="ng-scope"><a
							href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)">
								<!-- ngIf: list.comment_cnt < 1 --> <span
								ng-if="list.comment_cnt < 1" class="ng-scope">접수상태</span> <!-- end ngIf: list.comment_cnt < 1 -->
						</a></td>
						<td class="left pl20"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> <!-- ngIf: list.pw=='Y' --> 치매판정을 받았지만
								주간보호센터에 가지 않으려고 합니다. <!-- ngIf: list.comment_cnt > 0 --> <!-- ngIf: boardInfo.new_date <= list.new_date -->
						</a></td>
						<td class="hidden-xs"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 김태훈 </a></td>
						<td><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 2018-05-26 </a></td>
						<td class="border-no hidden-xs"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 40 </a></td>
					</tr>
					<tr ng-if="boardList.filterData.length > 0"
						ng-repeat="list in (boardList.filterData = ( boardList.data | filter:{is_notice:'N'} | filter:{subject:boardList.searchText})) | startFrom:((pageNo - 1) * pageRow) | limitTo:pageRow"
						class="ng-scope">
						<td class="ng-binding">9</td>
						<td ng-if="boardInfo.board_type=='QNA'" class="ng-scope"><a
							href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)">
								<span ng-if="list.comment_cnt > 0" class="ng-scope">답변완료</span>
						</a></td>
						<td class="left pl20"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> <!-- ngIf: list.pw=='Y' --> <span
								class="glyphicon glyphicon-lock ng-scope" aria-hidden="true"
								ng-if="list.pw=='Y'"></span> <!-- end ngIf: list.pw=='Y' --> 저희
								어머니가 너무 괴팍해지시고 치매초기인데 어떻게 해야 할지 모르겠어요 <!-- ngIf: list.comment_cnt > 0 -->
								<span class="comment_cnt ng-binding ng-scope"
								ng-if="list.comment_cnt > 0">[1]</span> <!-- end ngIf: list.comment_cnt > 0 -->
								<!-- ngIf: boardInfo.new_date <= list.new_date -->
						</a></td>
						<td class="hidden-xs"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 김양희 </a></td>
						<td><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 2018-04-22 </a></td>
						<td class="border-no hidden-xs"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 5 </a></td>
					</tr>
					<tr ng-if="boardList.filterData.length > 0"
						ng-repeat="list in (boardList.filterData = ( boardList.data | filter:{is_notice:'N'} | filter:{subject:boardList.searchText})) | startFrom:((pageNo - 1) * pageRow) | limitTo:pageRow"
						class="ng-scope">
						<td class="ng-binding">10</td>
						<td ng-if="boardInfo.board_type=='QNA'" class="ng-scope"><a
							href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)">
								<span ng-if="list.comment_cnt > 0" class="ng-scope">답변완료</span>
						</a></td>
						<td class="left pl20"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> <!-- ngIf: list.pw=='Y' --> <span
								class="glyphicon glyphicon-lock ng-scope" aria-hidden="true"
								ng-if="list.pw=='Y'"></span> <!-- end ngIf: list.pw=='Y' -->
								알츠하이머 중기이신 엄마에게 필요한 요양보호사분을 찾습니다. <!-- ngIf: list.comment_cnt > 0 -->
								<span class="comment_cnt ng-binding ng-scope"
								ng-if="list.comment_cnt > 0">[1]</span> <!-- end ngIf: list.comment_cnt > 0 -->
						</a></td>
						<td class="hidden-xs"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 김현정 </a></td>
						<td><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 2018-04-09 </a></td>
						<td class="border-no hidden-xs"><a href="javascript:;"
							ng-click="goBoardView(list.board_seq, list.board_index, list.pw, list.user_id)"
							class="ng-binding"> 4 </a></td>
					</tr>
					
	   <!-- 샘플 /삭제 -->				
					
				</tbody>
			</table>



			<br> <a href="#" class="genric-btn success medium"
				style="float: right">글쓰기</a>


		</div>
	</section>

              


        <div class="demo">
    <nav class="pagination-outer" aria-label="Page navigation">
        <ul class="pagination">
            <li class="page-item">
                <a href="#" class="page-link" aria-label="Previous">
                    <span aria-hidden="true">«</span>
                </a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item active"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">4</a></li>
            <li class="page-item"><a class="page-link" href="#">5</a></li>
            <li class="page-item">
                <a href="#" class="page-link" aria-label="Next">
                    <span aria-hidden="true">»</span>
                </a>
            </li>
        </ul>
    </nav>
		</div>

            </div>
        </div>
        

    </section>
    

</body>
</html>
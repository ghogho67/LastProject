<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BasicSubPage</title>
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
    color: #5ab4dc;
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
    background-color: #5ab4dc;
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
    background: linear-gradient(135deg,transparent 49%, #5ab4dc 50%);
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
  height: 32px;
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



</style>




	<section class="patient-area section-padding3">
	

        <div class="container">
	 <span style="font-size:30px;">자유게시판</span>
	 <br>
            <div class="row">
           

	
           <section class="board-list">

		<div class="board-list-in">
			<div class="board-top">
				<p class="board-count">
					총 <span class="education-board-cnt ng-binding">24</span>개의 글
				</p>
				



<div class="d1">
  <form class="for">
  <input type="text" placeholder="검색어 입력" >
  <button type="submit"></button>
  </form>
</div>

         
				
			</div>
		</div>

		<!-- 게시글리스트 시작 -->
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

						<td class="border-no hidden-xs"><a href="#"
							class="ng-binding"> 조회수</a></td>
					</tr>

					<!-- 반복 -->

					<!-- 샘플 /삭제 -->

					<tr class="ng-scope">
						<td class="ng-binding">2</td>
						<td class="left pl20"><a href="javascript:;"
							class="ng-binding"> 이런 행동도 치매인가요?(전두측두형 치매 이해하기) </a></td>
						<td class="hidden-xs"><a href="javascript:;"
							class="ng-binding"> 최고관리자 </a></td>
						<td><a href="javascript:;" class="ng-binding"> 2019-04-25
						</a></td>
						<td class="border-no hidden-xs"><a href="javascript:;"
							class="ng-binding"> 13 </a></td>
					</tr>
					<tr class="ng-scope">
						<td class="ng-binding">3</td>
						<td class="left pl20"><a href="javascript:;"
							class="ng-binding"> 유튜브로 보는 치매만화 </a></td>
						<td class="hidden-xs"><a href="javascript:;"
							class="ng-binding"> 최고관리자 </a></td>
						<td><a href="javascript:;" class="ng-binding"> 2019-04-21
						</a></td>
						<td class="border-no hidden-xs"><a href="javascript:;"
							class="ng-binding"> 8 </a></td>
					</tr>
					<tr class="ng-scope">
						<td class="ng-binding">4</td>
						<td class="left pl20"><a href="javascript:;"
							class="ng-binding"> 치매환자, 이해하기 </a></td>
						<td class="hidden-xs"><a href="javascript:;"
							class="ng-binding"> 최고관리자 </a></td>
						<td><a href="javascript:;" class="ng-binding"> 2019-02-23
						</a></td>
						<td class="border-no hidden-xs"><a href="javascript:;"
							class="ng-binding"> 171 </a></td>
					</tr>
					<tr class="ng-scope">
						<td class="ng-binding">5</td>
						<td class="left pl20"><a href="javascript:;"
							class="ng-binding"> 조인케어 치매만화_어르신들의 음식 욕심, 어떻게 대처하면 좋을까요? </a></td>
						<td class="hidden-xs"><a href="javascript:;"
							class="ng-binding"> 최고관리자 </a></td>
						<td><a href="javascript:;" class="ng-binding"> 2019-02-16
						</a></td>
						<td class="border-no hidden-xs"><a href="javascript:;"
							class="ng-binding"> 225 </a></td>
					</tr>
					<tr ng-if="boardList.filterData.length > 0" class="ng-scope">
						<td class="ng-binding">6</td>
						<td class="left pl20"><a href="javascript:;"
							class="ng-binding"> 치매만화_집 같은 요양원이란? </a></td>
						<td class="hidden-xs"><a href="javascript:;"
							class="ng-binding"> 최고관리자 </a></td>
						<td><a href="javascript:;" class="ng-binding"> 2019-02-11
						</a></td>
						<td class="border-no hidden-xs"><a href="javascript:;"
							class="ng-binding"> 62 </a></td>
					</tr>
					<tr class="ng-scope">
						<td class="ng-binding">7</td>
						<td class="left pl20"><a href="javascript:;"
							class="ng-binding"> 치매만화_ 엄마의 중국집 추억 </a></td>
						<td class="hidden-xs"><a href="javascript:;"
							class="ng-binding"> 최고관리자 </a></td>
						<td><a href="javascript:;" class="ng-binding"> 2019-02-02
						</a></td>
						<td class="border-no hidden-xs"><a href="javascript:;"
							class="ng-binding"> 177 </a></td>
					</tr>
					<tr class="ng-scope">
						<td class="ng-binding">8</td>
						<td class="left pl20"><a href="javascript:;"
							class="ng-binding"> 조인케어 치매만화_시계보기 </a></td>
						<td class="hidden-xs"><a href="javascript:;"
							class="ng-binding"> 최고관리자 </a></td>
						<td><a href="javascript:;" class="ng-binding"> 2019-01-26
						</a></td>
						<td class="border-no hidden-xs"><a href="javascript:;"
							class="ng-binding"> 155 </a></td>
					</tr>
					<tr class="ng-scope">
						<td class="ng-binding">9</td>
						<td class="left pl20"><a href="javascript:;"
							class="ng-binding"> 조인케어 치매만화_사장님, 회의하러 가시죠! </a></td>
						<td class="hidden-xs"><a href="javascript:;"
							class="ng-binding"> 김동선 </a></td>
						<td><a href="javascript:;" class="ng-binding"> 2019-01-18
						</a></td>
						<td class="border-no hidden-xs"><a href="javascript:;"
							class="ng-binding"> 256 </a></td>
					</tr>
					<tr class="ng-scope">
						<td class="ng-binding">10</td>
						<td class="left pl20"><a href="javascript:;"
							class="ng-binding"> 치매만화_약 먹는 것을 거부하는 치매환자, 이렇게 해 보세요. </a></td>
						<td class="hidden-xs"><a href="javascript:;"
							class="ng-binding"> 최고관리자 </a></td>
						<td><a href="javascript:;" class="ng-binding"> 2019-01-10
						</a></td>
						<td class="border-no hidden-xs"><a href="javascript:;"
							class="ng-binding"> 196 </a></td>
					</tr>


					<!-- 샘플 /삭제 -->
				</tbody>
			</table>
			</div>

			<br> <a href="#" class="genric-btn success medium"
				style="float: right">글쓰기</a>



<br>
<br>

        <div class="demo" style="position:absolute; right: 40%;">
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



	</section>
              



            </div>
        </div>
        

    </section>
    


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BasicSubPage</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Rubik&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${cp}/common/festival.css" />
<link rel="stylesheet" href="${cp}/common/content.css" />


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

.default-tmplgroup.list_wrap.col4 .item .fig img {
    width: 100%;
    height: 100%;
}

.info {
	 background: #fff;
}
.box_rightType1 {
    float: right;
    width: 300px;
}

.tit_mPop {
    display: none;
}

.area_tagList {
    width: 100%;
    padding: 36px 0 20px;
    background-color: #f7f7f7;
}

.area_tagList .tag_list {
    margin: 0 30px;
    padding: 12px 0;
    border-top: 1px solid #e6e6e6;
}

.area_tagList .tag_list li {
    position: relative;
    float: left;
    margin: 6px 5px 0 0;
}


/* .area_tagList ul{ */
/* list-style: none; */

/*         display: block; */
/*     list-style-type: disc; */
/*     margin-block-start: 1em; */
/*     margin-block-end: 1em; */
/*     margin-inline-start: 0px; */
/*     margin-inline-end: 0px; */
/*     padding-inline-start: 40px */
/* } */


/* .category_deallist { */
/*     position: relative; */
/*     width: 100%; */
/*     margin-top: 24px; */
/* } */


/* .list_wrap default-tmplgroup type-best-tmpl col4 { */
/*     float: left; */
/*     width: 600px; */
/* } */




</style>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		var areaid;
		var monthid = new Array();

		boardPagingListAjaxHtml(1, 8);

		$('#monthlist').on('click', "li button", function() {
			var id = $(this).parent().prop('id');
			// 			console.log(id);
			if (id == 'All1' && $(this).attr('class') == '') {
				$('#monthlist li button').attr('class', 'btn');
				$(this).attr('class', 'btn_all_active');
				return;
			}

			if ($(this).attr('class') == 'btn') {
				$(this).attr('class', 'btn active');
				$('#All1 button').attr('class', '');
				// 			$(this).removeClass('btn').addClass('btn active');
			} else {
				$(this).attr('class', 'btn');

			}

			if ($("#monthlist li .active").children().length == 0) {
				$("#All1 button").attr('class', 'btn_all_active');
			}

			$("#monthlist li .active").parent().each(function(i) {
				monthid[i] = this.id;
				console.log(monthid[i]);

			});

			console.log(monthid.length);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/post/ImageBoard",
				data : "page=" + page + "&pageSize=" + pageSize,
				success : function(data) {
					var html = data.split("SEPERATORSEPERATOR");

					$('.board-count').html(html[0]);
					$('#_dealList').html(html[1]);
					$('.pagination').html(html[2]);

				},
				error : function(status) {
				}
			});
			
			

		});

		$('#arealist').on('click', "li button", function() {
			var id = $(this).parent().prop('id');

			if (id == 'All2' && $(this).attr('class') == '') {
				$('#arealist li button').attr('class', 'btn');
				$(this).attr('class', 'btn_all_active');
				return;
			}

			if ($(this).attr('class') == 'btn') {
				$('#All2 button').attr('class', '');
				$('#arealist li button').attr('class', 'btn');
				$(this).attr('class', 'btn active');
				// 			$(this).removeClass('btn').addClass('btn active');
			} else {
				$(this).attr('class', 'btn');
				$('#All2 button').attr('class', 'btn_all_active');

			}

			if ($("#arealist li .active").children().length == 0) {
				$("#arealist #All2 button").attr('class', 'btn_all_active');

			}
			console.log($("#arealist li .active").children().length);

			areaid = $("#arealist li .active").parent().prop('id');
			console.log(areaid);
			
			
			
			
			
		});

	});

	function boardPagingListAjaxHtml(page, pageSize) {
		$.ajax({
			url : "${pageContext.request.contextPath}/post/ImageBoard",
			data : "page=" + page + "&pageSize=" + pageSize,
			success : function(data) {
				var html = data.split("SEPERATORSEPERATOR");

				$('.board-count').html(html[0]);
				$('#_dealList').html(html[1]);
				$('.pagination').html(html[2]);

			},
			error : function(status) {
			}
		});

	}
</script>





<section class="patient-area section-padding3">
	

        <div class="container">
	 <span style="font-size:30px;">자유게시판</span>
	 <br>
            <div class="row">
           

	
           <section class="board-list">

		<div class="board-list-in">
			<div class="board-top">
				<p class="board-count">
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
		<div class="category_deallist">
		            <!-- 태그 리스트 -->
            <div class="area_tagList">
                <!-- ul class="tag_menu">
                    <li id="thismonth"><a href="javascript:">#이달의축제</a></li>
                </ul-->
                <ul class="tag_list js_multi" id="monthlist">
                    <li id="All1"><button  type="button" class=""><span>#전체</span></button></li>
                    <li id="01"><button type="button" class="btn"><span>#1월</span></button></li>
                    <li id="02"><button type="button" class="btn active"><span>#2월</span></button></li>
                    <li id="03"><button type="button" class="btn"><span>#3월</span></button></li>
                    <li id="04"><button type="button" class="btn"><span>#4월</span></button></li>
                    <li id="05"><button type="button" class="btn"><span>#5월</span></button></li>
                    <li id="06"><button type="button" class="btn"><span>#6월</span></button></li>
                    <li id="07"><button type="button" class="btn"><span>#7월</span></button></li>
                    <li id="08"><button type="button" class="btn"><span>#8월</span></button></li>
                    <li id="09"><button type="button" class="btn"><span>#9월</span></button></li>
                    <li id="10"><button type="button" class="btn"><span>#10월</span></button></li>
                    <li id="11"><button type="button" class="btn"><span>#11월</span></button></li>
                    <li id="12"><button type="button" class="btn"><span>#12월</span></button></li>
                </ul>
                <ul class="tag_list area_list js_one" id="arealist">
                    <li id="All2"><button type="button" class="btn_all_active"><span>#전체</span></button></li>
                    <li id="1"><button type="button" class="btn"><span>#서울</span></button></li>
                    <li id="6"><button type="button" class="btn"><span>#부산</span></button></li>
                    <li id="4"><button type="button" class="btn"><span>#대구</span></button></li>
                    <li id="2"><button type="button" class="btn"><span>#인천</span></button></li>
                    <li id="5"><button type="button" class="btn"><span>#광주</span></button></li>
                    <li id="3"><button type="button" class="btn"><span>#대전</span></button></li>
                    <li id="7"><button type="button" class="btn"><span>#울산</span></button></li>
                    <li id="8"><button type="button" class="btn"><span>#세종</span></button></li>
                    <li id="31"><button type="button" class="btn"><span>#경기</span></button></li>
                    <li id="32"><button type="button" class="btn"><span>#강원</span></button></li>
                    <li id="33"><button type="button" class="btn"><span>#충북</span></button></li>
                    <li id="34"><button type="button" class="btn"><span>#충남</span></button></li>
                    <li id="35"><button type="button" class="btn"><span>#경북</span></button></li>
                    <li id="36"><button type="button" class="btn"><span>#경남</span></button></li>
                    <li id="37"><button type="button" class="btn"><span>#전북</span></button></li>
                    <li id="38"><button type="button" class="btn"><span>#전남</span></button></li>
                    <li id="39"><button type="button" class="btn"><span>#제주</span></button></li>
                </ul>
            </div>
            <!-- //태그 리스트 -->
        </div>
		<div class="list_wrap default-tmplgroup type-best-tmpl col4">
			<ul id="_dealList" class="list" data-reviewtype="A"
				data-eventbinding="true">
				
			</ul>

		</div>
	</div>
	
	<div class="box_rightType1">
            <div class="tit_mPop">
                <h2>태그선택</h2>
<!--                 <button type="button" class="btn_close">닫기</button> -->
            </div>




<br>
<br>

        <div class="demo" style="position:absolute; right: 40%;">
    <nav class="pagination-outer" aria-label="Page navigation">
        <ul class="pagination">

        </ul>
    </nav>
		</div>



	</section>
              



            </div>
        </div>
        

    </section>
    


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BasicSubPage</title>


<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Rubik&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${cp}/common/festival.css" />
<link rel="stylesheet" href="${cp}/common/content.css" />

<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>
<%@include file="/WEB-INF/view/common/LibForMypage.jsp"%>


<style type="text/css">
#titlee h2, #pzone h2 {
	font-size: 40px;
	font-weight: normal;
	letter-spacing: -1px;
}

#titlee h2 {
	padding: 15px 25px;
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
	font-size: 14px;
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

.default-tmplgroup.list_wrap.col4 .item .fig img {
    width: 100%;
    height: 100%;
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



.list_wrap.default-tmplgroup.col4 .title_name {
    margin-top: 1px;
    font-weight: 400;
    font-size: 15px;
    margin-bottom: 10px;
}

.info {
	 background: #fff !important;
}

#header{
    z-index: 2;
}

 .container{
 	z-index: 1;
 	position: relative;
    top: 100px;
    right: 9px;
    margin-right: 120px !important;
}
 }



</style>



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">

Date.prototype.format = function (f) {
    if (!this.valueOf()) return " ";
    var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];
    var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    var d = this;

    return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear(); // 년 (4자리)
            case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)
            case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)
            case "dd": return d.getDate().zf(2); // 일 (2자리)
            case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)
            case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)
            case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)
            case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)
            case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)
            case "mm": return d.getMinutes().zf(2); // 분 (2자리)
            case "ss": return d.getSeconds().zf(2); // 초 (2자리)
            case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분
            default: return $1;
        }

    });

};

String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };
String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };
Number.prototype.zf = function (len) { return this.toString().zf(len); };


var now= new Date();

var areaid =0;
var monthid;
var month;
var firstDate = new Date(now.getFullYear(), 1-1,1).format("yyyyMMdd");
var lastDate = new Date(now.getFullYear(), 12,0).format("yyyyMMdd");


 
	$(document).ready(function() {
		
		



		boardPagingListAjaxHtml(1, 8, areaid , firstDate, lastDate);

		$('#monthlist').on('click', "li button", function() {
			monthid = new Array();
			var id = $(this).parent().prop('id');
			// 			console.log(id);
			if (id == 'All1' && $(this).attr('class') == '') {
				$('#monthlist li button').attr('class', 'btn');
				$(this).attr('class', 'btn_all_active');
				$("#monthlist li .btn_all_active").parent().each(function(i) {
					monthid[i] = this.id;
					console.log(monthid[i]);
				});
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
				monthid[0] = 'All1';
			}

			$("#monthlist li .active").parent().each(function(i) {
				monthid[i] = this.id;
				console.log(monthid[i]);

			});
			monthid.sort();

			if(monthid[0]!='All1'){
				firstDate = new Date(now.getFullYear(), monthid[0]-1,1);
				lastDate = new Date(now.getFullYear(), monthid[monthid.length-1],0);
			}else{
				firstDate = new Date(now.getFullYear(), 1-1,1);
				lastDate = new Date(now.getFullYear(), 12,0);
				
			}
			firstDate=firstDate.format("yyyyMMdd");
			lastDate=lastDate.format("yyyyMMdd");
			console.log(firstDate);
			console.log(lastDate);
			
			boardPagingListAjaxHtml(1, 8, areaid , firstDate, lastDate)


			
			

		});

		$('#arealist').on('click', "li button", function() {
			var id = $(this).parent().prop('id');

			if (id == 'All2' && $(this).attr('class') == '') {
				$('#arealist li button').attr('class', 'btn');
				$(this).attr('class', 'btn_all_active');
				
				areaid = $(this).parent().prop('id');
				
			}

			if ($(this).attr('class') == 'btn') {
				$('#All2 button').attr('class', '');
				$('#arealist li button').attr('class', 'btn');
				$(this).attr('class', 'btn active');
				areaid = $(this).parent().prop('id');
				// 			$(this).removeClass('btn').addClass('btn active');
			} else {
				$(this).attr('class', 'btn');
				$('#All2 button').attr('class', 'btn_all_active');
				areaid = $(this).parent().prop('id');

			}

			if ($("#arealist li .active").children().length == 0) {
				$("#arealist #All2 button").attr('class', 'btn_all_active');
				areaid = 'All2';

			}
			console.log($("#arealist li .active").children().length);

// 			areaid = $("#arealist li .active").parent().prop('id');
			console.log(areaid);
			
			if(areaid=='All2'){
				areaid=0;
			}
			console.log(areaid);
			boardPagingListAjaxHtml(1, 8, areaid , firstDate, lastDate)

			
		});

	});

	function boardPagingListAjaxHtml(page, pageSize, areaid , firstDate, lastDate) {
		$.ajax({
			url : "${pageContext.request.contextPath}/post/ImageBoard",
			data : "page=" + page + "&pageSize=" + pageSize + "&areaid=" + areaid + "&firstDate=" + firstDate + "&lastDate=" + lastDate,
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



</head>

<body>

	<%@include file="/WEB-INF/view/common/subPagesideBar.jsp"%>
<%@include file="/WEB-INF/view/common/subPageheader.jsp"%>

		<div style="    padding-top: 50px;
    padding-left: 358px;
    width: 95%;">
			<div class="card">
				<div class="card-body">
					<div id="titlee">
						<h2>
							<span>2019 축제</span>
						</h2>
						<p class="board-count"></p>
					</div>
					<hr>
				<div class="table-responsive">
						<!-- 게시글리스트 시작 -->
				<div class="category_deallist">
				            <!-- 태그 리스트 -->
		            <div class="area_tagList">
		                <ul class="tag_list js_multi" id="monthlist">
		                    <li id="All1"><button  type="button" class="btn_all_active"><span>#전체</span></button></li>
		                    <li id="01"><button type="button" class="btn"><span>#1월</span></button></li>
		                    <li id="02"><button type="button" class="btn"><span>#2월</span></button></li>
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
		        </div>
				<div class="list_wrap default-tmplgroup type-best-tmpl col4">
					<ul id="_dealList" class="list" data-reviewtype="A"
						data-eventbinding="true">
						
					</ul>
		
				</div>
				<br>
				<br>



				</div>

			</div>
		</div>
							</div>
							
			<div class="demo" style="position:absolute; right: 20%;">
		    	<nav class="pagination-outer" aria-label="Page navigation">
		        	<ul class="pagination">
		
		        	</ul>
		    	</nav>
			</div>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>
<%@include file="/WEB-INF/view/common/LibForMain.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script>
	window.onload = function() {
		var a_href1 = $('dl:nth-child(1) dt a').attr("href");
		var a_href2 = $('dl:nth-child(2) dt a').attr("href");
		var a_href3 = $('dl:nth-child(3) dt a').attr("href");
		var a_href4 = $('dl:nth-child(4) dt a').attr("href");
		var a_href5 = $('dl:nth-child(5) dt a').attr("href");
		var a_href6 = $('dl:nth-child(6) dt a').attr("href");
		var title1 = $('dl:nth-child(1) dt a').attr("title");
		var title2 = $('dl:nth-child(2) dt a').attr("title");
		var title3 = $('dl:nth-child(3) dt a').attr("title");
		var title4 = $('dl:nth-child(4) dt a').attr("title");
		var title5 = $('dl:nth-child(5) dt a').attr("title");
		var title6 = $('dl:nth-child(6) dt a').attr("title");
		var p1 = $('dl:nth-child(1) dd:nth-child(3)').text();
		var p2 = $('dl:nth-child(2) dd:nth-child(3)').text();
		var p3 = $('dl:nth-child(3) dd:nth-child(3)').text();
		var p4 = $('dl:nth-child(4) dd:nth-child(3)').text();
		var p5 = $('dl:nth-child(5) dd:nth-child(3)').text();
		var p6 = $('dl:nth-child(6) dd:nth-child(3)').text();
		$(".cr1").attr("href", a_href1);
		$(".cr2").attr("href", a_href2);
		$(".cr3").attr("href", a_href3);
		$(".cr4").attr("href", a_href4);
		$(".cr5").attr("href", a_href5);
		$(".cr6").attr("href", a_href6);
		$(".name1").html(title1);
		$(".name2").html(title2);
		$(".name3").html(title3);
		$(".name4").html(title4);
		$(".name5").html(title5);
		$(".name6").html(title6);
		$(".p1").html(p1);
		$(".p2").html(p2);
		$(".p3").html(p3);
		$(".p4").html(p4);
		$(".p5").html(p5);
		$(".p6").html(p6);
	}

	function popup() {
		//       window.open("http://192.168.0.32/chat/thistok?mem_id=${mem_id}",
		//             "thisTok!", "width=400, height=700, left=100, top=50");
		window.open("/chat/thistok?mem_id=${mem_id}", "thisTok!",
				"width=400, height=700, left=100, top=50");
	}
</script>
<style>

.slidebanner {
	position: absolute;
    height: 50px;
    width: 95%;
    overflow: hidden;
    left: 6%;
    top: 85%;
}

.slidebanner .bannerbox {
	position: absolute;
	margin: 0;
	padding: 0;
}

.slidebanner li {
	float: left;
	list-style: none;
	margin-left: 10px
}

.slidebanner li:first-child {
	margin: 0
}

.bannerli img{
width:150px;
height: 70px; 

}


.fixalram {
	position: fixed;
	right: 45px;
	bottom: 79px;
	z-index: 1000;
	background: red;
	border-radius: 50%;
	width: 25px;
	height: 25px;
	/* 	display: none; */
}

#alramCount {
	color: white;
	font-size: 7px;
	font-style: italic;
	text-align: center;
	margin-top: 3px;
}

#fixedbtn {
	position: fixed;
	right: 50px;
	bottom: 50px;
	z-index: 999
}

#fixedbtn2 {
	position: fixed;
	right: 50px;
	bottom: 120px;
	z-index: 998
}
</style>



</head>
<body>


	<!-- 베너영역 -->
	<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>THISCARE</h1>
					<a href="${pageContext.request.contextPath}/main">Noincare,HowCare</a>
					<span>|</span> <a href="${pageContext.request.contextPath}/main">Home</a>




				</div>
			</div>
		</div>
	</section>

	<div id="crawling" style="display: none">${src }</div>





	<header class="header-area">
		<%@include file="/WEB-INF/view/common/top_Header.jsp"%>
		<div>
			<div class="container">
				<div style="position: absolute; left: 45%;">
					<%@include file="/WEB-INF/view/common/navMenu.jsp"%>
				</div>
			</div>
			<br> <br>
		</div>
	</header>





	<section class="department-area doa-padding4">
		<div class="container2"
			style="width: 1500px; padding-right: 15px; padding-left: 15px; margin-right: auto; margin-left: auto">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="section-top text-center">
						<h2>데일리 건강</h2>
						<p>회원가입시 입력하신 질병정보를 바탕으로 당신에게 딱 맞는 건강정보를 선정하여 제공해 드립니다</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="department-slider owl-carousel">



						<div class="single-slide">
							<div class="slide-img">
								<img
									src="${pageContext.request.contextPath}/resource/medino/images/dementia.jpg"
									alt="" class="img-fluid">
								<div class="hover-state">
									<a class="cr1"
										href="http://www.dailymedi.com/detail.php?number=846076&thread=22r02"><i
										class="fa fa-stethoscope"></i></a>
								</div>
							</div>
							<div class="single-department item-padding text-center">
								<h3 class="name1">치매라도 괜찮아</h3>
								<p class="p1">어르신들은 암이나 뇌경색에 비해 치매를 가장 두려워합니다. 사고능력의 감퇴로 일상적
									활동을 완전히 혼자 수행하기 어려운 정도로 악화된 상태를 치매라고 하는데요.</p>
							</div>
						</div>




						<div class="single-slide">
							<div class="slide-img">
								<img
									src="${pageContext.request.contextPath}/resource/medino/images/aa.gif"
									alt="" class="img-fluid">
								<div class="hover-state">
									<a class="cr2" href="departments.html"><i
										class="fa fa-stethoscope"></i></a>
								</div>
							</div>
							<div class="single-department item-padding text-center">
								<h3 class="name2">술이 술술? 비만 위험이 술술</h3>
								<p class="p2">당뇨병은 인슐린의 분비량이 부족하거나 포도당의 대사에 이상이 생겨 일어나는 대사
									질환의 일종으로 혈중 포도당, 즉 혈당이 높은 것이 특징이다</p>
							</div>
						</div>



						<div class="single-slide">
							<div class="slide-img">
								<img
									src="${pageContext.request.contextPath}/resource/medino/images/10.jpg"
									alt="" class="img-fluid">
								<div class="hover-state">
									<a class="cr3" href="departments.html"><i
										class="fa fa-stethoscope"></i></a>
								</div>
							</div>
							<div class="single-department item-padding text-center">
								<h3 class="name3">노인비만 예반 10계명</h3>
								<p class="p3">건강한 노후를 위한 습관</p>
							</div>
						</div>





						<div class="single-slide">
							<div class="slide-img">
								<img
									src="${pageContext.request.contextPath}/resource/medino/images/2.jpg"
									alt="" class="img-fluid">
								<div class="hover-state">
									<a class="cr4" href="departments.html"><i
										class="fa fa-stethoscope"></i></a>
								</div>
							</div>
							<div class="single-department item-padding text-center">
								<h3 class="name4">젋을때와 달라 달라~</h3>
								<p class="p4">백세시대 건강한 노후</p>
							</div>
						</div>


						<div class="single-slide">
							<div class="slide-img">
								<img
									src="${pageContext.request.contextPath}/resource/medino/images/11.jpg"
									alt="" class="img-fluid">
								<div class="hover-state">
									<a class="cr5" href="departments.html"><i
										class="fa fa-stethoscope"></i></a>
								</div>
							</div>
							<div class="single-department item-padding text-center">
								<h3 class="name5">사상체질별 건강관리 비법</h3>
								<p class="p5">노인 비만은 지방에 비해 근육량이 현저히 감소하는 근감소성 비만이 많다. 노인
									비만, 어떻게 탈출할 수 있을까?</p>
							</div>
						</div>




						<div class="single-slide">
							<div class="slide-img">
								<img
									src="${pageContext.request.contextPath}/resource/medino/images/4.jpg"
									alt="" class="img-fluid">
								<div class="hover-state">
									<a class="cr6" href="departments.html"><i
										class="fa fa-stethoscope"></i></a>
								</div>
							</div>
							<div class="single-department item-padding text-center">
								<h3 class="name6">유병장수? 무병장수!</h3>
								<p class="p6">백세시대의 또 다른 이름은 '유병장수시대'라고 한다. 건강백세를 위한 건강법은
									무엇이 있을까?</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<br> <br> <br>

	</section>


	<script type="text/javascript">
		//  $(document).ready(function() { 
		// 		 setInterval(function(){
		// 				$.ajax({
		// 					type: "POST",
		// 					url : "${cp}/chatText/chatAllCnt",
		// 					success : function(data){
		// 						if(data.cnt != null){
		// 							$(".fixalram").css("display","inline");
		// 							$("#alramCount").html(data.cnt);
		// 						}else{

		// 						}

		// 					},
		// 				error : function(xhr){

		// 				}
		// 				});
		// 		},1000)
		//  });

		var socket;

		function initSocket() {

			socket = new SockJS("/alram");

			socket.onopen = function(evt) {
				onOpen(evt);
			}
			socket.onmessage = function(evt) {
				onMessage(evt);
			}
			socket.onclose = function(evt) {
				onClose(evt);
			}

			function onOpen(evt) {
				// 	   setInterval(function(){
				socket.send($("${mem_id}"));
				// 	   },1000)
			}

			function sendMessage() {

			}

			//evt 파라미터는 websocket이 보내준 데이터다.
			function onMessage(evt) { //변수 안에 function자체를 넣음.
				var data = evt.data;
				var strArray = data.split('[');
				$('#alramCount').html(strArray[0]);
				console.log(strArray[0]);

			}

			function onClose(evt) {

			}

		}

		$(document).ready(function() {
			initSocket(); //websocket 연결

		});
	</script>
	<div>
		<form id="chatCnt" action="">

			<div class="fixalram">
				<p id="alramCount"></p>
				<input type="hidden" id="chatCounter">
			</div>
			<img src="/image/1419496.svg" style="width: 50px; height: auto;"
				id="fixedbtn" onclick="popup()">
		</form>
		
		<form action="${cp }/chatbot">
		<button type="submit">
			<img src="/image/bot.svg" style="width: 50px; height: auto;"
				id="fixedbtn2">
		</button>

	</form>
		
		
	</div>





	

	<div class="slidebanner">
		<ul class="bannerbox">
			<li class="bannerli"><img src="/image/banner/banner1.jpg"	alt="dw" /></li>
			<li class="bannerli"><img src="/image/banner/banner2.jpg"alt="dw" /></li>
			<li class="bannerli"><img src="/image/banner/banner3.jpg" alt="dw" /></li>
			<li class="bannerli" ><img src="/image/banner/banner4.png"alt="dw" /></li>
			<li class="bannerli"><img src="/image/banner/banner5.png"></li>
			<li class="bannerli"><img src="/image/banner/banner6.png"alt="dw" /></li>
			<li class="bannerli"><img src="/image/banner/banner7.jpg"alt="dw" /></li>
			<li class="bannerli"><img src="/image/banner/BannerImg_201810220113360510.jpg"></li>
			<li class="bannerli"><img src="/image/banner/banner1.jpg"	alt="dw" /></li>
			<li class="bannerli"><img src="/image/banner/banner2.jpg"alt="dw" /></li>
			<li class="bannerli"><img src="/image/banner/banner3.jpg" alt="dw" /></li>
			<li class="bannerli" ><img src="/image/banner/banner4.png"alt="dw" /></li>
			<li class="bannerli"><img src="/image/banner/banner5.png"></li>
			<li class="bannerli"><img src="/image/banner/banner6.png"alt="dw" /></li>
			<li class="bannerli"><img src="/image/banner/banner7.jpg"alt="dw" /></li>
			<li class="bannerli"><img src="/image/banner/BannerImg_201810220113360510.jpg"></li>
			<li class="bannerli"><img src="/image/banner/BannerImg_201810220113360510.jpg"></li>
		</ul>
	</div>






	<footer class="footer-area" style="height: 150px; padding: 20px 0;">
		<div class="row" style="width: 100%; padding-left: 490px;">
			<div style="width: 30%;">
				<div>
					<a href="#" class="icon-button twitter"><i
						class="fa fa-twitter"></i><span></span></a> <a href="#"
						class="icon-button facebook"><i class="fa fa-facebook"></i><span></span></a>
					<a href="#" class="icon-button google-plus"><i
						class="fa fa-google-plus"></i><span></span></a> <a href="#"
						class="icon-button instagram"><i class="fa fa-instagram"></i><span></span></a>
					<a href="#" class="icon-button pinterest"><i
						class="fa fa-pinterest"></i><span></span></a>
				</div>
			</div>
			<div style="width: 60%;">
				<div>
					<p>
						Email: hello@havoccreative.com </br>+971 (0)55 151 0491 or +971 (0)55
						282 2114 </br>PO Box 769558, twofour54, Abu Dhabi
						his bare hands by Michael Whitehead.</br> &copy Havoc Creative 2017
					</p>
</div> 
			</div>
		</div>
	</footer>





	<script language="JavaScript">
		timer();
		var current=0;
		var $interval;

		function timer(){
		  var $interval=setInterval(function(){slide()},2000);                        
		}

		function slide(){
		  $(".bannerbox").animate({left:"-=187px"},1000,function(){
		    $(this).css({"left":0});
		    $(".bannerbox").append( $(".bannerbox").children(".bannerli").eq(0) );
		  });    
		  current++;
		  if(current==5)current=0;
		}
	</script>





</body>
</html>
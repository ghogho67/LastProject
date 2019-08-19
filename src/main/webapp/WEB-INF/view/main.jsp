<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>
<%@include file="/WEB-INF/view/common/LibForMain.jsp"%>

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
		window.open("http://192.168.0.32/chat/thistok?mem_id=${mem_id}",
				"thisTok!", "width=400, height=700, left=100, top=50");
	}
</script>
<style>
/* 배너존 */
.banner_zone {
	width: 1500px;
	height: 70px;
	overflow: hidden;
	background-color: #fff;
	position: absolute;
	border-radius: 13px;
	box-shadow: 1px 1px 2px 0 rgba(0, 0, 0, 0.2);
	top: 722px;
	left: 0;
}

.banner_zone h2 {
	position: absolute;
	top: 25px;
	left: 15px;
	font-size: 15px;
	font-family: "NanumBold";
	color: #1d1d1d
}

.banner_zone .btn {
	position: absolute;
	left: 80px;
	top: 26px
}

.banner_zone .btn a {
	float: left;
	margin-right: 2px;
	font-size: 0;
	text-indent: -10000em;
	width: 20px;
	height: 20px;
	vertical-align: top
}

.banner_zone .btn a.pre {
	background: url(/images/template/02162/main/btn_b_prev.gif) no-repeat
}

.banner_zone .btn a.next {
	background: url(/images/template/02162/main/btn_b_next.gif) no-repeat
}

.banner_zone .btn a.stop {
	background: url(/images/template/02162/main/btn_b_stop.gif) no-repeat
}

.banner_zone .btn a.list {
	background: url('/images/template/02162/main/btn_b_list.gif') no-repeat
}

.banner_zone ul {
	padding-top: 16px;
	overflow: hidden
}

.banner_zone ul li {
	float: left;
	margin-left: 8px;
}

.banner_zone ul li a img {
	width: 155px;
	height: 40px
}


.slidebanner{position:relative;height:50px;width:985px;overflow:hidden;}
.slidebanner .bannerbox{position:absolute;margin:0;padding:0;}
.slidebanner li{float:left;list-style:none;margin-left:10px}
.slidebanner li:first-child{margin:0}
</style>



</head>
<body>
	

	<!-- 베너영역 -->
	<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>ThisCare</h1>
					<a href="${pageContext.request.contextPath}/main">Noincare,HowCare</a>
					<span>|</span> <a href="${pageContext.request.contextPath}/main">Home</a>
					<form action="${cp }/chatbot">
						<button type="submit">챗봇</button>
					</form>
					<button id="submitBtn" type="button" onclick="popup()">ThisTok!</button>
					<form action="${cp }/donation/memberDonation">
						<button type="submit">기부하기</button>
					</form>
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
		<div class="container">
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




<div class="slidebanner" style="padding-left: 1500px;">
  <ul class="bannerbox">    
    <li><img src="http://placehold.it/187x50/E64E4F" alt="dw" /></li>
    <li><img src="/image/banner/BannerImg_201709111200074660.gif" alt="dw" /></li>
    <li><img src="/image/banner/BannerImg_201902250554538880.jpg" alt="dw" /></li>
    <li><img src="/image/banner/BannerImg_201709111200074660.gif"alt="dw" /></li>
    <li><img src="/image/banner/BannerImg_201709111200074660.gif" alt="dw" /></li>
    <li><img src="/image/banner/BannerImg_201709111200074660.gif" alt="dw" /></li>
    <li><img src="http://placehold.it/187x50/7992D9" alt="dw" /></li>
    <li><img src="/image/banner/BannerImg_201709111200074660.gif" alt="dw" /></li>
    <li><img src="http://placehold.it/187x50/FFA500" alt="dw" /></li>
    <li><img src="/image/banner/Banner_201702071159070710.png" alt="dw" /></li>
  </ul>                
</div>





	<section
		style="position: absolute; bottom: 50%; margin: 0 auto; right: 90%;">
		
		<div id="banner_zone" class="banner_zone">
		
			<div class="inner">
			
				<ul style="left: 0px; width: 2119px; position: relative;">

					<li style="opacity: 1;">
					<a href="http://edu.edurang.net/ebs/index.html" target="_blank" title="[EBS 논술톡] ICT 자료 연결하기(새창으로)">
					<img src="/image/banner/Banner_201702071159070710.png"></a></li>

					<li style="opacity: 1;"><a
						href="http://www.teachforkorea.go.kr" target="_blank"
						title="교육기부 연결하기(새창으로)"><img
							src="/image/banner/Banner_201612280116006010.gif"></a></li>
					<li style="opacity: 1;"><a
						href="http://www.dje.go.kr/fac/main.do" title="학교시설사용예약시스템 연결하기"><img
							src="/image/banner/BannerImg_201703300814427710.gif"></a></li>
					<li style="opacity: 1;"><a href="http://www.ebs.co.kr/main"
						target="_blank" title="ebs 연결하기(새창으로)"><img
							src="/image/banner/Banner_201612280117151560.gif"></a></li>
					<li style="opacity: 1;"><a
						href="http://www.uschoolnet.co.kr/v3/?sc_id=sanseong"
						title="원어민초스피드자동암기 연결하기"><img
							src="/image/banner/Banner_201703030320183440.jpg"></a></li>
					<li style="opacity: 1;"><a
						href="https://1398.acrc.go.kr/hpg/cts/selectHpgContentView.do?contentTyCode=CMS011"
						title="공익신고 연결하기"><img
							src="/image/banner/BannerImg_201707190411398180.jpg"></a></li>
					<li style="opacity: 1;"><a
						href="http://www.airkorea.or.kr/realschoolSearch"
						title="학교 인근 대기질 정보 제공 연결하기"><img
							src="/image/banner/BannerImg_201712121047180930.jpg"></a></li>
					<li style="opacity: 1;"><a
						href="http://1398.acrc.go.kr/case/ISGAcase" target="_blank"
						title="청탁금지법 통합검색 서비스 연결하기(새창으로)"><img
							src="/image/banner/BannerImg_201709111200074660.gif"></a></li>
					<li style="opacity: 1;"><a
						href="https://together.kakao.com/promotions/68" target="_blank"
						title="[통합배너] 온라인 학교폭력 피해상담 상다미쌤 연결하기(새창으로)"><img
							src="/image/banner/BannerImg_201803140938370700.jpg"></a></li>
					<li style="opacity: 1;"><a
						href="https://www.moe.go.kr/sub/info.do?m=011508&amp;page=011508&amp;s=moe"
						target="_blank" title="[통합배너] 교육분야 성희롱 성폭력 온라인 신고센터 연결하기(새창으로)"><img
							src="/image/banner/Banner_201803270948084380.jpg"></a></li>
					<li style="opacity: 1;"><a
						href="http://asp.djsch.kr/boardCnts/view.do?boardID=81226&amp;boardSeq=7213828&amp;lev=0&amp;searchType=null&amp;statusYN=W&amp;page=1&amp;pSize=12&amp;s=call&amp;m=0604&amp;opType=N"
						target="_blank" title="[통합]신학년 신학기 개인정보 처리 유의사항 안내 연결하기(새창으로)"><img
							src="/image/banner/BannerImg_201902250554538880.jpg"></a></li>
					<li style="opacity: 1;"><a
						href="http://www.parents.go.kr/index.do" title="학부모On누리 연결하기"><img
							src="/image/banner/Banner_201612280116596210.gif" alt="학부모On누리"></a></li>
					<li style="opacity: 1;"><a href="http://www.edunet.net"
						target="_blank" title="에듀넷 T-CLEAR 연결하기(새창으로)"><img
							src="/image/banner/BannerImg_201810220113360510.jpg"></a></li>
				</ul>
			</div>
		</div>


	</section>



	<%@include file="/WEB-INF/view/common/footer.jsp"%>


<!-- <script language="JavaScript"> -->
// timer();
// var current=0;
// var $interval;

// function timer(){
//   var $interval=setInterval(function(){slide()},2000);                        
// }

// function slide(){
//   $(".bannerbox").animate({left:"-=187px"},1000,function(){
//     $(this).css({"left":0});
//     $(".bannerbox").append( $("ul").children("li").eq(0) );
//   });    
//   current++;
//   if(current==5)current=0;
// }    
<!-- </script> -->




</body>
</html>
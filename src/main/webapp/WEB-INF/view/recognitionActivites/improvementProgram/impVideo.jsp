<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script src="https://apis.google.com/js/client.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
@charset "UTF-8";


#program {
	width: 100%;
	height: 900px;
	margin-right: 3%;
}

#program h2, #pzone h2 {
	font-size: 40px;
	font-weight: normal;
	letter-spacing: -1px;
}

#program h2 {
	padding: 25px 35px;
}

#program h2 span {
	font-weight: bold;
	color: #473fa0;
}


#middle {
	margin-top: 50px;
	position: absolute;
	left: 22%;
	width: 70%
}


</style>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>
<%@include file="/WEB-INF/view/common/LibForMypage.jsp"%>





</head>
<body>


<script type='text/javascript'>


var x = document.getElementById("vid").ended;

 </script>
 
<!-- <!-- <script type='text/javascript'> --> -->
<!-- //     document.getElementById('vid').addEventListener('ended',myHandler,false); -->
<!-- //     function myHandler(e) { -->
<!-- //         if(!e) { e = window.event; } -->
<!-- //         alert("Video Finished"); -->
<!-- //     } -->
<!-- <!-- </script> --> -->


	<%@include file="/WEB-INF/view/common/subPageheader.jsp"%>
	<%@include file="/WEB-INF/view/common/subPagesideBar.jsp"%>






var aud = document.getElementById("vid");
aud.onended = function() {
    alert("The audio has ended");
};


	<div id="middle">

		<div id="program">
			<h2>
				<span>인지 능력</span> 향상  프로그램
			</h2>

<hr>

        <div class="container">
            <div class="row">
             
             
             
             <video  id="vid" src="/image/콩국수에는_슬픈_전설이_하나_있어.mp4" controls="controls"
             poster="/image/kong.PNG"  width="1000px" height="auto;" autoplay="autoplay" ></video>
             
             
             //동영상 종료시 문제 실행 화면으로 이동 
             
        
            </div>
        </div>




		</div>


	</div>
</body>
</html>
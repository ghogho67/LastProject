<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script src="https://apis.google.com/js/client.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인지 능력 향상프로그램</title>

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
	margin-top: 10px;
	position: absolute;
	left: 22%;
	width: 70%
}


</style>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>
<%@include file="/WEB-INF/view/common/LibForMypage.jsp"%>





</head>
<body>



	<%@include file="/WEB-INF/view/common/subPageheader.jsp"%>
	<%@include file="/WEB-INF/view/common/subPagesideBar.jsp"%>




	<div id="middle">

		<div id="program">
			<h2>
				<span>인지 능력</span> 향상  프로그램
			</h2>

<hr>

        <div class="container">
            <div class="row">
          
     
       <iframe width="1200px" height="600px" src="${video.video_path}" 
            frameborder="0" allow="autoplay; encrypted-media" allowfullscreen allow="autoplay; encrypted-media" >
            </iframe>

     
     
            </div>
        </div>
        
        <br>

  <a style="text-align: right;position:absolute; left:85%; font-size:2em; font-weight: bold; color: #473fa0;"  href="${cp}/recognitionImp/impTestQ1?sur_id=${sur_id}"> 문제풀기</a>

		</div>


	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@include file="/WEB-INF/view/common/joinCare.jsp"%>
<style type="text/css">

div{ width:670;
 height:120;

}

.join1 .sel_box li.bg1 {
    background: url(../../../resource/joinCare/images/113.png) no-repeat center 10px;
    background-size: 200px 200px;
    
}

.join1 .sel_box li.bg3 {
    background: url(../../../resource/joinCare/images/112.png) no-repeat center 10px;
      background-size: 200px 200px;
}

.join1 .sel_box li:first-child {
    border-left: none;
}
.join1 .sel_box li {
    float: left;
    padding: 185px 0 40px 0;
    width: 50%;
    border-left: 1px solid #eee;
    box-sizing: border-box;
}
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, form, fieldset, p, button, table, th, td, pre {
    margin: 0;
    padding: 0;
}
user agent stylesheet
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
.join1 .sel_box {
    background: #fff;
    border-radius: 5px;
    text-align: center;
    *zoom: 1;
}
ul, ol {
    list-style-type: none;
}
user agent stylesheet
ul {
    list-style-type: disc;
}
body, div, dl, dt, dd, h1, h2, h3, h4, h5, h6, form, fieldset, p, th, td, input, textarea, select, button, pre, a {
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 16px;
    color: #222;
}

.join1 .sel_box li.bg1 a {
    background: #ffbc22;
}

.join1 .sel_box li.bg3 a {
    background: #f07378;
}

.join1 .sel_box li a {
    display: block;
    margin: 0 auto;
    width: 228px;
    height: 70px;
    line-height: 70px;
    color: #fff;
    font-size: 24px;
    border-radius: 70px;
}
a {
    color: #666;
    text-decoration: none;
}

h3 {
    display: block;
    font-size: 1.17em;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}


.join1 .info {
    margin-top: 40px;
    padding: 40px 0 0 0;
    border-top: 1px solid #eaeaea;
    *zoom: 1;
}

.join1 .info > div {
    float: left;
    position: relative;
    width: 50%;
    *width: 50%;
    text-align: center;
}

</style>

</head>
<body>



<section class="memberjoin">
      <div class="memberjoin-in">
        <h4 class="memberjoin-title ng-binding">회원가입(일반회원)</h4>
        <ul>
          <li class="memberjoin01 active">01.가입종류선택</li>
          <li class="right-arrow"></li>
          <li class="memberjoin02 ">02.약관동의</li>
          <li class="right-arrow"></li>
          <li class="memberjoin03">03.정보입력</li>
          <li class="right-arrow"></li>
          <li class="memberjoin04">04.가입완료</li>
        </ul>
      </div>

      <form name="agreeform" id="agreeform" role="form" data-toggle="validator"  class="ng-pristine ng-invalid ng-invalid-required" method="post">
        <div class="memberkind-in">
          <div>
            

<div class="join1">

<ul class="sel_box">
        <li class="bg1">
        
            <h3>일반<strong>회원가입</strong></h3>
<!--             <a href="javascript:goMemjoin('1');">바로가기</a> -->
            <a href="${cp }/regist/regist2">바로가기</a>
        </li>
        
        <li class="bg3">
            <h3>요양보호사<strong>회원가입</strong></h3>
<!--             <a href="javascript:goMemjoin('3');">바로가기</a> -->
            <a href="${cp }/regist/regist2-1">바로가기</a>
        </li>
        </ul>
        
        
        
        
        <div class="info">
         
            <div class="c1">
                <h3>무료회원에 가입하시면<br> 아래 메뉴를 <br>무료로 이용할 수 있습니다.</h3>
                <ul>
                <li>요양보호사 매칭</li>
                <li>요양기관 정보</li>
                <li>인지 향상 프로그램</li>
                </ul>
            </div>
            <div class="c2">
                <h3>대상자 매칭을 원하실경우<br>요양보호사 회원에 가압히세요.</h3>
                <ul>
                <li>요양보호사 자격증 소지 필수 </li>
                <li>대상자 매칭</li>
            
                </ul>
            </div>
        </div>
        
        
        </div>
        




            
            </div>
            
        </div>
      </form>
    </section>

</body>
</html>
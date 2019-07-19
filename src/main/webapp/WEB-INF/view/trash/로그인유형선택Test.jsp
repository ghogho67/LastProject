<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.join1 .sel_box li.bg1 {
    background: url(/img/mypage/bg_people1.png) no-repeat center 35px;
}

.join1 .sel_box li.bg2 {
    background: url(/img/mypage/bg_people2.png) no-repeat center 35px;
}

.join1 .sel_box li.bg3 {
    background: url(/img/mypage/bg_people3.png) no-repeat center 35px;
}

.join1 .sel_box li:first-child {
    border-left: none;
}
.join1 .sel_box li {
    float: left;
    padding: 185px 0 40px 0;
    width: 33.3%;
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
.join1 .sel_box li.bg2 a {
    background: #46a5f0;
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
    width: 33.33%;
    *width: 33%;
    text-align: center;
}
</style>

</head>
<body>

<div class="join1">

<ul class="sel_box">
        <li class="bg1">
            <h3>일반<strong>회원가입</strong></h3>
            <a href="javascript:goMemjoin('1');">바로가기</a>
        </li>
        <li class="bg2">
            <h3>유료<strong>회원가입</strong></h3>
            <a href="javascript:goMemjoin('2');">바로가기</a>
        </li>
        <li class="bg3">
            <h3>요양보호사<strong>회원가입</strong></h3>
            <a href="javascript:goMemjoin('3');">바로가기</a>
        </li>
        </ul>
        
        
        
        
        <div class="info">
            <div class="c1">
                <h3>유료회원 가입 문의 및 상담</h3>
                <p>금성출판사 전국지점에서도<br>가입하실 수 있습니다.</p>
                <strong>080-969-1000</strong>
                <strong>1577-7799</strong>
            </div>
            <div class="c2">
                <h3>무료회원에 가입하시면<br>여러가지 메뉴를<br>무료로 이용할 수 있습니다.</h3>
                <ul>
                <li>푸르넷 닷컴 5일 무료체험</li>
                <li>학습정보</li>
                <li>테마특강</li>
                <li>3Q진단검사 무료이용</li>
                </ul>
            </div>
            <div class="c3">
                <h3>유료회원에 가입하시면<br>무료회원의 혜택과 더불어 학습에<br>중요한 많은 혜택이 있습니다.</h3>
                <ul>
                <li>과학적 문제은행 시스템제공</li>
                <li>다양한 이벤트 강좌 제공</li>
                <li>수행평가 자료 무료 제공</li>
                <li>실시간 학습 Q&amp;A답변제공</li>
                <li>다양한 이벤트 참여기회 제공</li>
                </ul>
            </div>
        </div>
        
        
        </div>
        
        
        
        
</body>
</html>
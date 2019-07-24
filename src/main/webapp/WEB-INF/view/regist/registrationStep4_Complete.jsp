<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@include file="/WEB-INF/view/common/joinCare.jsp"%>
<style type="text/css">

div{ 

 overflow-x:hidden; 
 overflow-y:auto;
}

.accept-div{

height: 200px;

}


.accept-title{
background:url(../../../resource/howcare/images/mypage_title.png) no-repeat 0px 50%;

  font-family: 'NanumSquare', gulim;
  font-size:25px;
  font-weight:700;
  color:#3b3b3b;
  margin:50px 0px 30px 0px;
  padding-left:25px;
}



 .end-div {
    text-align: center;
    height: 400px;
    background-color: #f6f6f6;
    padding: 100px 0px;
    border-radius: 5px

}



.end-txt1 {
    font-family: 'NanumSquare', gulim;
    font-size: 50px;
    font-weight: 700;
    color: #3b3b3b;
}

.end-txt2 {
    font-family: 'Noto Sans KR', gulim;
    font-size: 28px;
    font-weight: 300;
    color: #3b3b3b;
}


</style>

</head>
<body>

<section class="memberjoin">
      <div class="memberjoin-in">
        <h4 class="memberjoin-title ng-binding">회원가입(일반회원)</h4>
        <ul>
          <li class="memberjoin01">01.가입종류선택</li>
          <li class="right-arrow"></li>
          <li class="memberjoin02">02.약관동의</li>
          <li class="right-arrow"></li>
          <li class="memberjoin03">03.정보입력</li>
          <li class="right-arrow"></li>
          <li class="memberjoin04 active">04.가입완료</li>
        </ul>
      </div>

      <div class="memberkind-in">
        <h4 class="joinkind ng-binding">
        
        </h4>
        <div class="end-div">
          <p class="end-txt1">회원가입이 완료되었습니다!</p>
          <p class="end-txt2">로그인 후 서비스를 이용하실 수 있습니다.</p>
          <p class="end-txt3">메뉴 상단의 건강정보에서 인지테스트를 선택하신 후 꼭 테스트를 받아 주세요.</p>
        </div>
        <div class="accept-btn-div">
          <a href="${cp }/main" class="accept-btn">메인으로</a>
          <a href="${cp }/login" class="accept-btn accept-btn1">로그인하기</a>
        </div>

      </div>
    </section>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
<%@include file="/WEB-INF/view/common/joinCare.jsp"%>


</head>
<body>



<div style="font-size: 25px;"> HOME</div>









<div id="template-idpw-find" class="ng-scope">
 
  <section id="contents" class="login-idpwfind-contents">
    <h2 class="non-visible">본문영역</h2>


    <section id="login-idpwfind" class="login-idpwfind">
      <div class="login-idpwfind-in">
        <h4 class="login-idpwfind-title">아이디/비밀번호 찾기</h4>

        <ul>
          <li>
            <h4 class="idpw-title id-title">아이디찾기</h4>
            <p class="idpw-txt">휴대폰 본인인증으로 아이디 찾기가 진행됩니다.</p>
            <div class="find-btn-div">
              <button type="button" class="hp-btn" ng-click="hpAuthCheck('id');">휴대폰 본인인증</button>
            </div>
          </li>
          <li class="form-inline">
            <h4 class="idpw-title pw-title">비밀번호찾기</h4>
            <p class="mt20">
              <input type="text" name="id" maxlength="20" size="30" ng-model="findpw_id" value="" class="form-control ng-pristine ng-untouched ng-valid ng-empty ng-valid-maxlength" placeholder="회원 아이디 입력">
            </p>
            <div class="find-btn-div">
              <button type="button" class="hp-btn" ng-click="hpAuthCheck('pw');">휴대폰 본인인증</button>
            </div>
          </li>
        </ul>
        <p class="idpw-txt dot">
          아이디/비밀번호 찾기가 진행되지 않을 경우
          <a href="doadoa88@naver.com">doadoa88@naver.com.co.kr</a>로 메일  주시기 바랍니다.
        </p>
      </div>
    </section>

  </section>
  <!-- contents 종료 -->

  
</div>



</body>
</html>
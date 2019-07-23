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



<br>
<a href="" style="font-size: 25px; color: black; font-weight: 800;" >&nbsp;&nbsp; &nbsp;HOME</a>

<div id="template-idpw-find" class="ng-scope">
  <section id="contents" class="login-idpwfind-contents">
    <section id="login-idpwfind" class="login-idpwfind">
      <div class="login-idpwfind-in">
        <h4 class="login-idpwfind-title">아이디/비밀번호 찾기</h4>
        <ul>
            <li class="form-inline">
            <h4 class="idpw-title id-title">아이디찾기</h4>
            <p class="mt20">
              <input type="text" name="id" maxlength="20" size="30"  value="" class="form-control ng-pristine ng-untouched ng-valid ng-empty ng-valid-maxlength" placeholder="회원 아이디 입력">
            </p>
             <p class="mt20">
              <input type="text" name="id" maxlength="20" size="30"  value="" class="form-control ng-pristine ng-untouched ng-valid ng-empty ng-valid-maxlength" placeholder="회원 아이디 입력">
            </p>
            <div class="find-btn-div">
              <button type="button" class="hp-btn" ng-click="hpAuthCheck('pw');">본인인증 확인</button>
            </div>
          </li>
          
          
          
          <li class="form-inline">
            <h4 class="idpw-title pw-title">비밀번호찾기</h4>
            <p class="mt20">
              <input type="text" name="id" maxlength="20" size="30" value="" class="form-control ng-pristine ng-untouched ng-valid ng-empty ng-valid-maxlength" placeholder="회원 아이디 입력">
            </p>
             <p class="mt20">
              <input type="text" name="id" maxlength="20" size="30"  value="" class="form-control ng-pristine ng-untouched ng-valid ng-empty ng-valid-maxlength" placeholder="회원 아이디 입력">
            </p>
            <div class="find-btn-div">
              <button type="button" class="hp-btn">이메일 본인인증</button>
                  <p class="idpw-txt">이메일로 임시 비밀번호가 발송됩니다.</p>
            </div>
          </li>
        </ul>
        <p class="idpw-txt dot">
          아이디/비밀번호 찾기가 진행되지 않을 경우
          <a href="doadoa88@naver.com">doadoa88@naver.com</a>로 메일  주시기 바랍니다.
        </p>
      </div>
    </section>

  </section>
  <!-- contents 종료 -->

  
</div>



</body>
</html>
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
 overflow-x:hidden; 
 overflow-y:auto;
}

</style>

</head>
<body>



  <section id="contents" class="memberjoin-contents">

  <div ng-class="{indicator:progress}" id="progressbar"></div>
    <h2 class="non-visible">본문영역</h2>

    <section class="page-title">
      <div class="page-title-in">
        <h3 class="non-visible">회원가입</h3>

        <ul class="path">
          <li><a href="/"><span class="glyphicon glyphicon-home"></span><span class="sr-only">HOME</span></a></li>
          <li>회원가입</li>
          <li class="ng-binding">일반회원</li>
          <li>정보입력</li>
        </ul>
      </div>
    </section>

    <section class="memberjoin">
      <div class="memberjoin-in">
        <h4 class="memberjoin-title ng-binding">회원가입(일반회원)</h4>
        <ul>
          <li class="memberjoin01">01.가입종류선택</li>
          <li class="right-arrow"></li>
          <li class="memberjoin02">02.약관동의</li>
          <li class="right-arrow"></li>
          <li class="memberjoin03 active">03.정보입력</li>
          <li class="right-arrow"></li>
          <li class="memberjoin04">04.가입완료</li>
        </ul>
      </div>

      <div class="memberkind-in">
        <h4 class="joinkind ng-binding">
          <span class="bold">가입종류 : </span>
          일반회원
          <!-- ngIf: group!='facility' --><span ng-if="group!='facility'" class="ng-binding ng-scope">
            <span class="color-gray">&gt;</span>
            골드회원
          </span><!-- end ngIf: group!='facility' -->
          가입
        </h4>

        <div class="daumPost"></div>

        <form name="joinform" id="joinform" class="form-horizontal ng-pristine ng-invalid ng-invalid-required ng-valid-maxlength" role="form" data-toggle="validator" ng-submit="checkvalidator();">
          <input type="hidden" name="authcheck" ng-model="memjoin.authcheck" ng-value="memjoin.authcheck" autocomplete="off" class="ng-pristine ng-untouched ng-valid ng-empty">
          <input type="hidden" name="idcheck" ng-model="memjoin.idcheck" ng-value="memjoin.idcheck" autocomplete="off" class="ng-pristine ng-untouched ng-valid ng-empty">
          <input type="hidden" name="level" ng-model="memjoin.level" ng-value="memjoin.level" autocomplete="off" class="ng-pristine ng-untouched ng-valid ng-not-empty" value="2">
          <input type="hidden" name="group_code" ng-model="memjoin.group_code" ng-value="memjoin.group_code" autocomplete="off" class="ng-pristine ng-untouched ng-valid ng-not-empty" value="2">
          <input type="hidden" name="dupinfo" ng-model="memjoin.dupinfo" ng-value="memjoin.dupinfo" autocomplete="off" class="ng-pristine ng-untouched ng-valid ng-empty" value="">

          <!-- ngIf: group=='facility' -->

          <div>
            <p class="item-title">
              <!-- ngIf: group=='facility' -->
              본인인증
            </p>
            <p><span class="item-txt">필수 항목은 모두 기입해 주시기 바랍니다.</span></p>

            <div class="item-div">
              <label for="name" class="need">이름</label>
              <input type="text" name="name" id="name" ng-model="memjoin.name" class="inputbox ng-pristine ng-empty ng-invalid ng-invalid-required ng-touched" required="required" placeholder="휴대폰인증을 진행해주세요." readonly="readonly" autofocus="" ng-click="hpauthcheck()">
              <button type="button" class="btn item-btn" ng-click="hpauthcheck()">휴대폰인증</button>
              <!-- ngIf: memjoin.authcheck === true -->
              <!-- ngIf: memjoin.authcheck === false -->
              <br>

              <label for="birth-date" class="need">생년월일</label>
              <input type="text" name="birthdate" ng-model="memjoin.birthdate" id="birth-date" class="inputbox ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" required="required" placeholder="휴대폰인증을 진행해주세요." readonly="readonly">
              <br>

              <label for="gender" class="need">성별</label>
              <input type="hidden" name="gender" ng-model="memjoin.gender" ng-value="memjoin.gender" autocomplete="off" class="ng-pristine ng-untouched ng-valid ng-empty" value="">
              <div class="btn-group pl10" role="group">
                <button type="button" class="btn btn-lg btn-default" ng-class="{active:memjoin.gender=='M'}" readonly="readonly">남자</button>
                <button type="button" class="btn btn-lg btn-default" ng-class="{active:memjoin.gender=='F'}" readonly="readonly">여자</button>
              </div>
            </div>

          </div>
          <div>
            <p class="item-title">회원계정 생성</p>
            <p><span class="item-txt">필수 항목은 모두 기입해 주시기 바랍니다.</span></p>

            <div class="item-div">
              <label for="id" class="need">아이디</label>
              <input type="text" name="id" id="id" ng-model="memjoin.id" class="inputbox ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" placeholder="아이디입력" required="required">
              <button type="button" class="btn item-btn" ng-click="checkMemberID()">중복확인</button>

              <span>6~20자의 영문,숫자만 가능합니다.</span><br>
              <!-- ngIf: memjoin.idcheck -->
              <!-- ngIf: memjoin.idcheck == false -->

              <label for="password" class="need">비밀번호</label>
              <input type="password" name="password" id="password" ng-model="memjoin.password" class="inputbox ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required ng-valid-maxlength" required="required" placeholder="숫자, 영문, 특수문자 조합" maxlength="20">
              <span>6~20자의 영문,숫자만 가능합니다.</span><br>

              <label for="repassword" class="need">비밀번호 확인</label>
              <input type="password" name="repassword" id="repassword" ng-model="memjoin.repassword" class="inputbox ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required ng-valid-maxlength" required="required" placeholder="비밀번호를 한번 더 입력하세요." maxlength="20">
              <span>비밀번호를 한번 더 확인합니다.</span><br>
            </div>
          </div>
          <div>
            <!-- ngIf: group!='facility' --><p ng-if="group!='facility'" class="item-title ng-scope">회원정보 입력</p><!-- end ngIf: group!='facility' -->
            <!-- ngIf: group=='facility' -->
            <p><span class="item-txt">필수 항목은 모두 기입해 주시기 바랍니다.</span></p>

            <div class="item-div">
              <label for="email">이메일</label>
              <input type="text" id="email" name="email" ng-model="memjoin.email" class="inputbox ng-pristine ng-untouched ng-valid ng-empty" placeholder="이메일 주소 입력"><br>

              <label for="tel">연락처</label>
              <input type="text" id="tel" name="tel" ng-model="memjoin.tel" class="inputbox ng-pristine ng-untouched ng-valid ng-empty" placeholder="연락처 입력"><br>

              <label for="hp" class="need">휴대폰 번호</label>
              <input type="text" id="hp" name="hp" ng-model="memjoin.hp" class="inputbox ng-pristine ng-untouched ng-valid ng-empty" placeholder="휴대폰 번호 입력"><br>

            

              <label for="addr1">주소</label>
              <input type="hidden" name="zipcode" ng-model="memjoin.zipcode" autocomplete="off" class="ng-pristine ng-untouched ng-valid ng-empty">
              <input type="text" id="addr1" name="addr1" ng-model="memjoin.addr1" class="inputbox ng-pristine ng-untouched ng-valid ng-empty" readonly="readonly" placeholder="우편번호 검색을 이용하세요">
              <button type="button" ng-address-callback="zipcode(data)" class="btn item-btn item-btn-black ng-isolate-scope" ng-address="">주소검색</button><br>

              <!-- ngIf: group=='facility' -->
              <!-- ngIf: group=='facility' -->

              <label for="addr2">상세주소</label>
              <input type="text" id="addr2" name="addr2" ng-model="memjoin.addr2" class="inputbox ng-pristine ng-untouched ng-valid ng-empty"><br>

              <!-- ngIf: group=='careworker' -->
              <!-- ngIf: group=='facility' -->

              <div style="float:left;margin:7px 0px 10px 17px;width:75%;" class="memjoin-note-div">
                <!-- ngIf: group=='careworker' || group=='facility' -->
              </div>
              <br class="cb">

              

            </div>

          </div>

          <!-- ngIf: group=='careworker' -->

          <!-- ngIf: (group=='member' && ( groupType == 1 || groupType == 2 )) || (group=='careworker' && groupType==1) --><div ng-if="(group=='member' &amp;&amp; ( groupType == 1 || groupType == 2 )) || (group=='careworker' &amp;&amp; groupType==1)" class="ng-scope">
            <p class="item-title">유료 서비스</p>
            <p><span class="item-txt">필수 항목은 모두 기입해 주시기 바랍니다.</span></p>

            <div class="item-div">
              <label for="start_date" class="need">유료서비스 기간</label>
              <input type="text" name="start_date" ng-model="memjoin.start_date" ng-change="calcDate()" id="start_date" class="inputbox ng-pristine ng-untouched ng-valid hasDatepicker ng-not-empty ng-valid-required" required="required" placeholder="2017-01-01" jqdatepicker="">
              ~
              <input type="text" name="end_date" ng-model="memjoin.end_date" id="end_date" class="inputbox ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required" required="required" readonly="readonly" placeholder="2017-01-01">
              <br>

              <label for="depositor" class="need">입금계좌주</label>
              <input type="text" name="depositor" id="depositor" ng-model="memjoin.depositor" class="inputbox readonly ng-pristine ng-untouched ng-valid ng-empty" readonly="readonly">
              <br>

              <label for="bankname" class="need">입금은행</label>
              <input type="text" name="bankname" id="bankname" ng-model="memjoin.bankname" class="inputbox readonly ng-pristine ng-untouched ng-valid ng-empty" readonly="readonly">
              <br>

              <label for="account" class="need">입금계좌</label>
              <input type="text" name="account" id="account" ng-model="memjoin.account" class="inputbox readonly ng-pristine ng-untouched ng-valid ng-empty" readonly="readonly">
              <br>

              <label for="price" class="need">입금금액</label>
              <input type="text" name="price" id="price" class="inputbox readonly right pr10" readonly="readonly" value="10,000"> 원

            </div>
          </div><!-- end ngIf: (group=='member' && ( groupType == 1 || groupType == 2 )) || (group=='careworker' && groupType==1) -->

          <div>
            <p class="item-title">기타 서비스</p>
            <div class="item-div">
              <label for="email_yn">이메일 수신여부</label>
              <input type="checkbox" name="email_yn" id="email_yn" ng-model="memjoin.email_yn" ng-click="checkYN(memjoin.email_yn)" value="N" class="ng-pristine ng-untouched ng-valid ng-empty">
              <label for="email_yn" style="width:50%;text-align:left;">정보 메일을 받겠습니다.</label>
              <br>

              <label for="sms_yn">SMS 수신여부</label>
              <input type="checkbox" name="sms_yn" id="sms_yn" ng-model="memjoin.sms_yn" ng-click="checkYN(memjoin.sms_yn)" value="N" class="ng-pristine ng-untouched ng-valid ng-empty">
              <label for="sms_yn" style="width:50%;text-align:left;">핸드폰 문자메세지를 받겠습니다.</label>
              <br>

              <label for="dm_yn">DM 수신여부</label>
              <input type="checkbox" name="dm_yn" id="dm_yn" ng-model="memjoin.dm_yn" ng-click="checkYN(memjoin.dm_yn)" value="N" class="ng-pristine ng-untouched ng-valid ng-empty">
              <label for="dm_yn" style="width:50%;text-align:left;">관련정보를 DM으로 받겠습니다.</label>
              <br>
            </div>
          </div>

          <div class="accept-btn-div">
            <a href="#/join/member/step1/gold" class="accept-btn">취소</a>
            <button type="submit" class="accept-btn accept-btn1">확인</button>
          </div>
        </form>

      </div>
    </section>

  </section>

</body>
</html>
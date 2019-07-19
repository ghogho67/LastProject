<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>

input:-webkit-input-placeholder {color: #f00;font-style: italic;}

</style>

<meta charset="UTF-8">
<%@include file="/WEB-INF/view/common/LibForMypage.jsp" %>

</head>
<body>
    <div class="container-fluid">
      <div class="row">
        <div class="content-wrapper full-page-wrapper d-flex align-items-center auth-pages">
          <div class="card col-lg-4 mx-auto">
            <div class="card-body px-5 py-5">
              <h3 class="card-title text-left mb-3">Login</h3>
              <form>
                <div class="form-group">
                  <input type="text" class="form-control p_input" placeholder="Username">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control p_input" placeholder="Password">
                </div>
                  <div class="form-group d-flex align-items-center justify-content-between">
                  <div class="form-check"><label>로그인 정보 저장</label></div>
                  <a href="#" class="forgot-pass">아이디/비밀번호 찾기</a>
                </div>
                <div class="text-center">
                  <button type="submit" class="btn btn-primary btn-block enter-btn">로그인</button>
                <a href="#" class="facebook-login btn btn-facebook btn-block">회원가입</a>
                </div>
    <a href="${cp}/basicU/main">메인주소</a>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

</body>
</html>
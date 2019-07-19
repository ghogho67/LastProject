<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@include file="/WEB-INF/view/common/LibForMypage.jsp" %>
<title>회원가입</title>
<style>

input[type=text]::-webkit-input-placeholder {color:black; font-size: 15px;}

.form-group{
z-index: 1;
}


</style>


</head>
<body>
  <div class="container-scroller">
    <div class="container-fluid">
      <div class="row">
        <div class="content-wrapper full-page-wrapper d-flex align-items-center auth-pages">
          <div class="card col-lg-4 mx-auto">
            <div class="card-body px-5 py-5">
              <h3 class="card-title text-left mb-3">회원가입</h3>
              <form>
                <div class="form-group">
                  <input type="text" class="form-control p_input" placeholder="이름을 입력하세요">
                </div>
                <div class="form-group">
                  <input type="email" class="form-control p_input" placeholder="아이디를 입력하세요(영문 6글자이상)">
                </div>
                <div class="form-group">
                  <input type="password" class="form-control p_input" placeholder="Password">
                </div>
                <div class="form-group">
                  <input type="password" class="form-control p_input" placeholder="Repeat Password">
                </div>
                  <div class="form-group">
                 <div class="form-check">
                <label>
                          <input type="checkbox" class="form-check-input">
                         치매
                        </label>
                        <label>
                          <input type="checkbox" class="form-check-input">
                         중풍
                        </label>
                        <label>
                          <input type="checkbox" class="form-check-input">
                     파킨슨
                        </label>
                        <label>
                          <input type="checkbox" class="form-check-input">
                        부정맥
                        </label>
                        <label>
                          <input type="checkbox" class="form-check-input">
                         당뇨
                        </label>
                      </div>  
                </div>
                
                
                
                   <div class="form-group">
                      <div class="form-check">
                        <label>
                          <input type="checkbox" class="form-check-input">
                          Check me out
                        </label>
                      </div>
                      <div class="form-check disabled">
                        <label>
                          <input type="checkbox" disabled class="form-check-input">
                          Disabled Checkbox
                        </label>
                      </div>
                      <div class="form-radio">
                        <label>
                          <input name="sample" value="" type="radio">
                          Radio option 1
                        </label>
                      </div>
                      <div class="form-radio">
                        <label>
                          <input name="sample" value="" type="radio">
                          Radio option 2
                        </label>
                      </div>
                      <div class="form-radio disabled">
                        <label>
                          <input name="sample" value="" type="radio" disabled>
                          Disabled Radio option
                        </label>
                      </div>
                    </div>
                
              
                <div class="text-center">
                  <button type="submit" class="btn btn-primary btn-block enter-btn">회원가입 완료</button>
                </div>
                
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>
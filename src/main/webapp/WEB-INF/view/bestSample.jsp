<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BasicSubPage</title>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>
</head>

<body>
<%@include file="/WEB-INF/view/common/subPageheader.jsp"%>
<%@include file="/WEB-INF/view/common/subPagesideBar.jsp"%>

	<br>
	<br>
	<br>

	
    <!-- Patient Area Starts -->
    <section class="patient-area section-padding3" ">
        <div class="container"   style="border:2px red solid;">
            <div class="row" style="border:2px red solid;">
                <div class="col-lg-6 offset-lg-3">
                    <div class="section-top text-center">
                        <h2>타이틀</h2>
                        <p>subtitle</p>
                    </div>
                </div>
            </div>
            <div class="row" style="border:2px red solid;">
            
            
         <div style=" font-size: 35px;">           
             <a href="${cp}/test/basicSubPage">basicSubPage 왼쪽 오른쪽 나뉨</a> <br>
             <a href="${cp}/test/basicSubPage2">basicSubPage2</a><br>
             <a href="${cp}/test/main">MAIN</a><br>
             <a href="${cp}/test/login">login</a><br>
             <a href="${cp}/test/loginTest">loginTest</a><br>
             <a href="${cp}/test/basicBoard">basicBoard</a> 타이틀없음<br>
             <a href="${cp}/test/basicQnA">basicQnA 타이틀없음 <br></a>
             <a href="${cp}/test/registrationStep1_TypeSelect">registrationStep1_TypeSelect</a><br>
             <a href="${cp}/test/registrationStep2_Regulation">registrationStep2_Regulation</a><br>
             <a href="${cp}/test/registrationStep3_Form">registrationStep3_Form</a><br>
             <a href="${cp}/test/registrationStep4_RecognitionTest">registrationStep4_RecognitionTest</a><br>
             <a href="${cp}/test/registrationStep5_Complete">registrationStep5_Complete</a><br>
             <a href="${cp}/test/mypage_Worker">mypage_Worker  </a><br>
             <a href="${cp}/test/mypage_Patient">mypage_Patient  </a><br>
             <a href="${cp}/test/mypage_Admin">mypage_Admin </a><br>
             <a href="${cp}/test/sample2">sample2  가로 div   </a><br>
             <a href="${cp}/test/sample3">sample3 6칸 grid </a><br>
             <a href="${cp}/test/sample9"> sample9 </a><br>
             <a href="${cp}/test/sample"> sample 반반 두칸 div class="card 위에 class="col-lg-4 col-xlg-5 col-md-7" width 조절</a>  <br> 
             <a href="${cp}/test/idpwFinding"> idpwFinding</a>  <br> 
          
           
           </div>
           
           
           
           
                         
            </div>
        </div>
    </section>
    <!-- Patient Area Starts -->
    

</body>
</html>
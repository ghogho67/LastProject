<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp" %>

<script type="text/javascript">
function showPopup() { 
	window.open("${cp}/thistok/thistok", "a", "width=400, height=700, left=100, top=50"); 
}
</script>
</head>
<body>
<%@include file="/WEB-INF/view/common/LibForMain.jsp" %>

<!-- 베너영역 -->
    <section class="banner-area other-page">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1>ThisCare</h1>
                      <a href="${pageContext.request.contextPath}/main">Noincare,HowCare</a>
                    <span>|</span> <a href="${pageContext.request.contextPath}/main">Home</a>
                </div>
            </div>
        </div>
    </section>
    
   



  
   <form action="${cp }/chatbot">
      <button type="submit">챗봇</button>
   </form>
   <form>
	<input name="mem_id" type="hidden" value="${mem_id}">   
	<button onclick="showPopup()">ThisTok!</button>
   </form>
  
  
	

    <header class="header-area">
    <%@include file="/WEB-INF/view/common/top_Header.jsp"%>
        <div>
            <div class="container" >
            <div style="position: absolute; left: 45%;">
                <%@include file="/WEB-INF/view/common/navMenu.jsp" %>
           </div>
            </div>
            <br>
            <br>
        </div>
    </header>
    
    



    <section class="department-area doa-padding4">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="section-top text-center">
                        <h2>데일리 건강</h2>
                        <p>회원가입시 입력하신 질병정보를 바탕으로 당신에게 딱 맞는 건강정보를 선정하여 제공해 드립니다</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="department-slider owl-carousel">
                    
                    
                    
                        <div class="single-slide">
                            <div class="slide-img">
                                <img src="${pageContext.request.contextPath}/resource/medino/images/dementia.jpg" alt="" class="img-fluid">
                                <div class="hover-state">
                                    <a href="#"><i class="fa fa-stethoscope"></i></a>
                                </div>
                            </div>
                            <div class="single-department item-padding text-center">
                                <h3>치매라도 괜찮아</h3>
                                <p>어르신들은 암이나 뇌경색에 비해 치매를 가장 두려워합니다.
사고능력의 감퇴로 일상적 활동을 완전히 혼자 수행하기 어려운 정도로 악화된 상태를 치매라고 하는데요.
</p>
                            </div>
                        </div>
                        
                        
                        
                        
                        <div class="single-slide">
                            <div class="slide-img">
                                <img src="${pageContext.request.contextPath}/resource/medino/images/aa.gif" alt="" class="img-fluid">
                                <div class="hover-state">
                                    <a href="departments.html"><i class="fa fa-stethoscope"></i></a>
                                </div>
                            </div>
                            <div class="single-department item-padding text-center">
                                <h3>술이 술술? 비만 위험이 술술</h3>
                                <p>당뇨병은 인슐린의 분비량이 부족하거나 포도당의 대사에 이상이 생겨 일어나는 대사 질환의 일종으로 혈중 포도당, 즉 혈당이 높은 것이 특징이다</p>
                            </div>
                        </div>
                        
                        
                        
                        <div class="single-slide">
                            <div class="slide-img">
                                <img src="${pageContext.request.contextPath}/resource/medino/images/10.jpg" alt="" class="img-fluid">
                                <div class="hover-state">
                                    <a href="departments.html"><i class="fa fa-stethoscope"></i></a>
                                </div>
                            </div>
                            <div class="single-department item-padding text-center">
                                <h3>노인비만 예반 10계명</h3>
                                <p>건강한 노후를 위한  습관</p>
                            </div>
                        </div>
                        
                        
                        
                                 
                        
                        <div class="single-slide">
                            <div class="slide-img">
                                <img src="${pageContext.request.contextPath}/resource/medino/images/2.jpg" alt="" class="img-fluid">
                                <div class="hover-state">
                                    <a href="departments.html"><i class="fa fa-stethoscope"></i></a>
                                </div>
                            </div>
                            <div class="single-department item-padding text-center">
                                <h3>젋을때와 달라 달라~</h3>
                                <p>백세시대 건강한 노후</p>
                            </div>
                        </div>
                        
                        
                               <div class="single-slide">
                            <div class="slide-img">
                                <img src="${pageContext.request.contextPath}/resource/medino/images/11.jpg" alt="" class="img-fluid">
                                <div class="hover-state">
                                    <a href="departments.html"><i class="fa fa-stethoscope"></i></a>
                                </div>
                            </div>
                            <div class="single-department item-padding text-center">
                                <h3>사상체질별 건강관리 비법</h3>
                                <p>노인 비만은 지방에 비해 근육량이 현저히 감소하는 근감소성 비만이 많다. 노인 비만, 어떻게 탈출할 수 있을까?</p>
                            </div>
                        </div>
                        
                        
                        
                        
                        <div class="single-slide">
                            <div class="slide-img">
                                <img src="${pageContext.request.contextPath}/resource/medino/images/4.jpg" alt="" class="img-fluid">
                                <div class="hover-state">
                                    <a href="departments.html"><i class="fa fa-stethoscope"></i></a>
                                </div>
                            </div>
                            <div class="single-department item-padding text-center">
                                <h3>유병장수? 무병장수!</h3>
                                <p>백세시대의 또 다른 이름은 '유병장수시대'라고 한다. 건강백세를 위한 건강법은 무엇이 있을까?</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


	<%@include file="/WEB-INF/view/common/footer.jsp" %>
</body>
</html>
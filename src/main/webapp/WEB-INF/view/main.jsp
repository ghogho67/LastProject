<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp" %>
</head>
<body>
<%@include file="/WEB-INF/view/common/LibForMain.jsp" %>

<!-- 베너영역 -->
    <section class="banner-area other-page">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1>HowCare</h1>
                      <a href="${cp}/main">Noincare,YoroCare</a>
                    <span>|</span> <a href="${cp}/main">Home</a>
                </div>
            </div>
        </div>
    </section>
    
   

    <header class="header-area">
    <%@include file="/WEB-INF/view/common/top_Header.jsp"%>
        <div>
            <div class="container" >
            <div style="position: absolute; left: 40%;">
                <%@include file="/WEB-INF/view/common/navMenu.jsp" %>
           </div>
            </div>
        </div>
    </header>
    
    

    <section class="department-area doa-padding4">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="section-top text-center">
                        <h2>Medical Information</h2>
                        <p>데이터 god saw day multiply
                         under fill in the cattle fowl a all, 
                         living, tree word link available in the service for subdue fruit.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="department-slider owl-carousel">
                    
                    
                    
                        <div class="single-slide">
                            <div class="slide-img">
                                <img src="${cp}/resource/medino/images/department1.jpg" alt="" class="img-fluid">
                                <div class="hover-state">
                                    <a href="#"><i class="fa fa-stethoscope"></i></a>
                                </div>
                            </div>
                            <div class="single-department item-padding text-center">
                                <h3>cardiac clinic</h3>
                                <p>Hath creeping subdue he fish gred face whose spirit that seasons today multiply female midst upon</p>
                            </div>
                        </div>
                        
                        
                        
                        
                        <div class="single-slide">
                            <div class="slide-img">
                                <img src="${cp}/resource/medino/images/department2.jpg" alt="" class="img-fluid">
                                <div class="hover-state">
                                    <a href="departments.html"><i class="fa fa-stethoscope"></i></a>
                                </div>
                            </div>
                            <div class="single-department item-padding text-center">
                                <h3>plastic surgery</h3>
                                <p>Hath creeping subdue he fish gred face whose spirit that seasons today multiply female midst upon</p>
                            </div>
                        </div>
                        
                        
                        
                        <div class="single-slide">
                            <div class="slide-img">
                                <img src="${cp}/resource/medino/images/department3.jpg" alt="" class="img-fluid">
                                <div class="hover-state">
                                    <a href="departments.html"><i class="fa fa-stethoscope"></i></a>
                                </div>
                            </div>
                            <div class="single-department item-padding text-center">
                                <h3>dental clinic</h3>
                                <p>Hath creeping subdue he fish gred face whose spirit that seasons today multiply female midst upon</p>
                            </div>
                        </div>
                        
                        
                        <div class="single-slide">
                            <div class="slide-img">
                                <img src="${cp}/resource/medino/images/department1.jpg" alt="" class="img-fluid">
                                <div class="hover-state">
                                    <a href="departments.html"><i class="fa fa-stethoscope"></i></a>
                                </div>
                            </div>
                            <div class="single-department item-padding text-center">
                                <h3>cardiac clinic</h3>
                                <p>Hath creeping subdue he fish gred face whose spirit that seasons today multiply female midst upon</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>






</body>
</html>
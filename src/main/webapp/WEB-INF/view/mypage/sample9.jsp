<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/view/common/LibForMypage.jsp"%>
<%@include file="/WEB-INF/view/common/LibForWebpage.jsp"%>
</head>
<body>
	<%@include file="/WEB-INF/view/common/mypage/navigationBar.jsp"%>
	<%@include file="/WEB-INF/view/common/mypage/sidebarP.jsp"%>


	<!-- partial -->
	
        <div class="content-wrapper">
        <div class="row mb-4">
			<div class="col-lg-12">
          <div class="row">
            <div class="col-lg-6 col-12 mb-4">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title mb-4">1</h5>
                  <canvas id="lineChart" style="height:250px"></canvas>
                </div>
              </div>
            </div>
            <div class="col-lg-6 col-12 mb-4">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title mb-4">2</h5>
                  <canvas id="barChart" style="height:230px"></canvas>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-6 col-12 mb-4">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title mb-4">3</h5>
                  <canvas id="areaChart" style="height:250px"></canvas>
                </div>
              </div>
            </div>
            <div class="col-lg-6 col-12 mb-4">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title mb-4">4</h5>
                  <canvas id="doughnutChart" style="height:250px"></canvas>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-6 col-12 mb-4">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title mb-4">5</h5>
                  <canvas id="pieChart" style="height:250px"></canvas>
                </div>
              </div>
            </div>
            <div class="col-lg-6 col-12 mb-4">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title mb-4">6</h5>
                  <canvas id="scatterChart" style="height:250px"></canvas>
                </div>
              </div>
            </div>
          </div>
          </div>
          </div>
</div>
    




</body>
</html>
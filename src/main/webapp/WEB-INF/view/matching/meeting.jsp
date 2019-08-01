<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>간단한 지도 표시하기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dnxk8c7baj&submodules=geocoder"></script>

</head>
<body>

	<header class="mapdetail-header">

		<div class="photo-mapdetail">
			<div id="carousel-generic" class="carousel slide"
				data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators"
					style="bottom: 0px !important; display: block !important;">
					<!-- ngRepeat: (idx, filename) in imageList -->
					<!-- ngIf: imageList.length < 1 -->
					<li data-target="#carousel-generic" data-slide-to="0"
						class="active ng-scope" ng-if="imageList.length < 1"></li>
					<!-- end ngIf: imageList.length < 1 -->
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<!-- ngRepeat: (idx, filename) in imageList -->
					<!-- ngIf: imageList.length < 1 -->
					<div class="item active ng-scope" ng-if="imageList.length < 1">
						<img src="/images/no_image_big.png">
					</div>
					<!-- end ngIf: imageList.length < 1 -->
				</div>

				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-generic"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#carousel-generic"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>

		<div class="summary-mapdetail">
			<h4 class="bold">
				<!-- ngIf: mapDetail.group_code != '01' -->
				<!-- ngIf: mapDetail.group_code == '01' -->
				<span ng-if="mapDetail.group_code == '01'" class="ng-scope">
					<!-- ngIf: member.info.id=='admin' --> <!-- ngIf: member.info.id!='admin' -->
					<span ng-if="member.info.id!='admin'" class="ng-binding ng-scope">du
						fenz*</span> <!-- end ngIf: member.info.id!='admin' -->
				</span>
				<!-- end ngIf: mapDetail.group_code == '01' -->
			</h4>

			<ul>
				<li>
					<!-- ngIf: mapDetail.group_code == '01' --> <span
					ng-if="mapDetail.group_code == '01'" class="ng-binding ng-scope">서울
				</span> <!-- end ngIf: mapDetail.group_code == '01' --> <!-- ngIf: mapDetail.group_code != '01' -->
				</li>
				<li class="ng-binding">요양보호사</li>
				<!-- ngIf: mapDetail.group_code == '01' -->
				<li ng-if="mapDetail.group_code == '01'" class="ng-binding ng-scope">
					평가 ( <span class="star_graph"> <span style="width: 0%">별점</span>
				</span> )
				</li>
				<!-- end ngIf: mapDetail.group_code == '01' -->
				<!-- ngIf: mapDetail.group_code != '01' -->
			</ul>

			<div class="summary-info ng-binding">요양병원 근무 희망, 개인간병인도 가능</div>

			<div class="btn-area">
				<div>
					<!-- ngIf: !member.info.mem_no -->
					<a href="#/login" ng-if="!member.info.mem_no"
						class="btn-extra form-control f18 center pt10 ng-scope">관심등록</a>
					<!-- end ngIf: !member.info.mem_no -->
					<!-- ngIf: member.info.mem_no && mapDetail.favorite == null && mapDetail.group_code!='01' -->
					<!-- ngIf: member.info.mem_no && mapDetail.favorite == null && mapDetail.group_code=='01' -->
				</div>
				<div class="btn-matching">
					<!-- ngIf: !member.info.mem_no -->
					<a href="#/login" ng-if="!member.info.mem_no"
						class="btn-extra1 form-control f18 center pt10 ng-scope">매칭신청</a>
					<!-- end ngIf: !member.info.mem_no -->
					<!-- ngIf: member.info.mem_no -->
				</div>
			</div>
		</div>

	</header>

</body>
</html>
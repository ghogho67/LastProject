<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">



<head>
<meta charset="utf-8" />
<link rel=" shortcut icon" href="image/favicon.ico">
<head>

<style>
#calendar {
	width: 1000px;
	margin: 0 auto;
}
</style>

<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"
	type="text/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>FullCalendar Example</title>

<link rel=" shortcut icon"
	href="/FullCalendar-Example-master/image/favicon.ico">
<link rel="stylesheet"
	href="/FullCalendar-Example-master/vendor/css/fullcalendar.min.css" />
<link rel="stylesheet"
	href="/FullCalendar-Example-master/vendor/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/FullCalendar-Example-master/vendor/css/select2.min.css" />
<link rel="stylesheet"
	href="/FullCalendar-Example-master/vendor/css/bootstrap-datetimepicker.min.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="/FullCalendar-Example-master/css/main.css">
<body>


	<div class="container style="width: 1000px; height: 1000px;">

		<div id="wrapper"></div>
		<div id="loading"></div>
		<div id="calendar"></div>
	</div>

	<!-- /.container -->
	<input id="mem_id" type="hidden" value="${mem_id }">
	<div id="wrapper">
		<div>
			<table class="cw" border="1" style="visibility: hidden;">
				<tbody>
					<tr>
						<th>요양보호사 아이디</th>
						<td id="mem_id">${mem_id }</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="loading"></div>
		<div id="calendar"></div>
	</div>
	<script src="/FullCalendar-Example-master/vendor/js/jquery.min.js"></script>
	<script src="/FullCalendar-Example-master/vendor/js/bootstrap.min.js"></script>
	<script src="/FullCalendar-Example-master/vendor/js/moment.min.js"></script>
	<script
		src="/FullCalendar-Example-master/vendor/js/fullcalendar.min.js"></script>
	<script src="/FullCalendar-Example-master/vendor/js/ko.js"></script>
	<script src="/FullCalendar-Example-master/vendor/js/select2.min.js"></script>
	<script
		src="/FullCalendar-Example-master/vendor/js/bootstrap-datetimepicker.min.js"></script>
	<script src="/FullCalendar-Example-master/js/main.js"></script>
	<script src="/FullCalendar-Example-master/js/addEvent.js"></script>
	<script src="/FullCalendar-Example-master/js/editEvent.js"></script>
	<script src="/FullCalendar-Example-master/js/etcSetting.js"></script>
</body>
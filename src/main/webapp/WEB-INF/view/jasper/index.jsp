<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
/* table { */
/* 	width: 1000px; */
/* } */
input[type="radio"] {
	-webkit-appearance: checkbox; /* Chrome, Safari, Opera */
	-moz-appearance: checkbox; /* Firefox */
	-ms-appearance: checkbox; /* not currently supported */
}

table {
	border-collapse: collapse;
	text-align: center;
}

tbody {
	width: 800px;
}
</style>
<script>
	$(document).ready(function() {
		$("#cost").click(function() {
			$("#choose").submit();
		});
	});
</script>

</head>
<body>
	<pre>
                                 						장기요양급여 제공기록지(방문요양)
	</pre>
	<div width="1300px;">
		<form id="choose" class="form-horizontal" role="form"
			action="${cp }/jasper/jasper" method="post"
			enctype="multipart/form-data">
			<table border="1" width="800px;"
				style="margin-left: auto; margin-right: auto;">
				<!-- /*style="margin-left: auto; margin-right: auto;"*/ -->
				<tr>
					<td>수급자 성명 <input type="text" style="width: 100px;"
						name="name" value="1"></td>
					<td>생년월일 <input type="number" style="width: 200px;" name="reg"
						value="1"></td>
					<td>장기요양등급 <input type="text" style="width: 100px;"
						name="grade" value="1"></td>
					<td>장기요양인정번호 <input type="number" style="width: 100px;"
						name="cwnum" value="1"></td>
				</tr>
				<tr>
					<td colspan="2">장기요양기관명 <input type="text"
						style="width: 400px;" name="facnm" value="1"></td>
					<td colspan="2">장기요양기관기호 <input type="text"
						style="width: 400px;" name="facnum" value="1"></td>
				</tr>
				<!-- 	style="margin-left: auto; margin-right: auto;" -->
				<tr>
					<td align="center" rowspan="4" width="100px;">일정관리</td>
					<td align="center" colspan="3">(<input type="date"
						style="width: 200px;" name="year" value="1"> )년 월/일
					</td>
				</tr>
				<tr>
					<td rowspan="3" align="center" width="100px;">제공 시간</td>
					<td align="center" width="250px;">총시간</td>
					<td align="center" width="100px;"><input type="number"
						style="width: 30px;" name="tt" value="1">분</td>
				</tr>
				<tr>
					<td align="center">시작시간</td>
					<td align="center" width="200px;"><input type="time"
						style="width: 100px;" name="sh" value="1"></td>
				</tr>
				<tr>
					<td align="center">종료시간</td>
					<td align="center" width="200px;"><input type="time"
						style="width: 100px;" name="eh" value="1"></td>
				</tr>
				<tr>
					<td rowspan="5">서비스 제공</td>
					<td align="center">신체활동지원</td>
					<td class="3">세면ㆍ구강관리,머리감기ㆍ 목욕ㆍ옷갈아입히기ㆍ화장 실이용하기ㆍ식사ㆍ이동도움ㆍ체위변경 등</td>
					<td align="center" width="200px;"><input type="number"
						style="width: 30px;" name="physup" value="1">분</td>
				</tr>
				<tr>
					<td rowspan="2" align="center">인지활동지원</td>
					<td>인지자극활동</td>
					<td align="center" width="200px;"><input type="number"
						style="width: 30px;" name="cogsur" value="1">분</td>
				</tr>
				<tr>
					<td>일상생활 함께하기</td>
					<td align="center" width="200px;"><input type="number"
						style="width: 30px;" name="life" value="1">분</td>
				</tr>
				<tr>
					<td align="center">정서지원</td>
					<td align="center">말벗, 격려</td>
					<td align="center" width="200px;"><input type="number"
						style="width: 30px;" name="talk" value="1">분</td>
				</tr>
				<tr>
					<td align="center">가사 및 일상생활 지원</td>
					<td align="center">식사준비, 청소, 세탁 등</td>
					<td align="center" width="200px;"><input type="number"
						style="width: 30px;" name="clean" value="1">분</td>
				</tr>
				<tr>
					<td rowspan="5">변화 상태</td>
					<td align="center">신체기능</td>
					<td align="center">1호전 2유지 3악화</td>
					<td align="center">1<input type="radio" name="phy1" value="1">
						2<input type="radio" name="phy1" value="2"> 3<input
						type="radio" name="phy" value="3">
					</td>
				</tr>
				<tr>
					<td align="center">식사기능</td>
					<td align="center">1호전 2유지 3악화</td>
					<td align="center">1<input type="radio" name="food1" value="1">
						2<input type="radio" name="food1" value="2"> 3<input
						type="radio" name="food" value="3"></td>
				</tr>
				<tr>
					<td align="center">인지기능</td>
					<td align="center">1호전 2유지 3악화</td>
					<td align="center">1<input type="radio" name="cog1" value="1">
						2<input type="radio" name="cog1" value="2"> 3<input
						type="radio" name="cog" value="3"></td>
				</tr>
				<tr>
					<td rowspan="2" align="center">배변변화</td>
					<td>대변 실수 횟수</td>
					<td align="center" width="200px;"><input type="number"
						style="width: 30px;" name="ln" value="1">회</td>
				</tr>
				<tr>
					<td>소변 실수 횟수</td>
					<td align="center" width="200px;"><input type="number"
						style="width: 30px;" name="sn" value="1">회</td>
				</tr>
				<tr>
					<td>특이사항</td>
					<td align="center"><input type="text" width="50px;" name="ft1"></td>
					<td colspan="8"><input type="text" style="width: 450px;"
						name="fc"></td>
				</tr>
				<tr>
					<td rowspan="2">서명</td>
					<td>장기요양요원 성명(서명)</td>
					<td colspan="2"><input type="text" style="width: 48px;"
						name="sign" value="1"></td>
				</tr>
				<tr>
					<td>수급자 또는 보호자 성명 (서명)</td>
					<td colspan="2"><input type="text" style="width: 48px;"
						name="patsign" value="1"></td>
				</tr>

			</table>
		</form>
		<center>
			<input type="button" id="cost" value="작성" class="cost">
		</center>
	</div>
</body>
</html>

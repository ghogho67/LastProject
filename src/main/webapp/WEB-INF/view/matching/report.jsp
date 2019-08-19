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
    -moz-appearance: checkbox;    /* Firefox */
    -ms-appearance: checkbox;     /* not currently supported */
}
</style>
<script>

$( document ).ready(function() {
	$("#cost").click(function(){
		$("#choose").submit();
	});
});

</script>

</head>
<body>
	<pre>
														장기요양급여 제공기록지(방문요양)
	</pre>
	<div  width = "1300px;">
	<form id="choose" class="form-horizontal" role="form" action="${cp}/report/write" method="post" enctype="multipart/form-data">
	<table border="1" width = "1300px;" style="margin-left: auto; margin-right: auto;">
<!-- /*style="margin-left: auto; margin-right: auto;"*/ -->
		<tr>
			<td>수급자 성명 <input type="text" style="width: 100px;" name = "name" value = "1"></td>
			<td>생년월일 <input type="text" style="width: 100px;" name = "reg" value = "1"></td>
			<td>장기요양등급 <input type="text" style="width: 100px;" name="grade" value = "1"></td>
			<td>장기요양인정번호 <input type="text" style="width: 100px;" name = "cwnum" value = "1"></td>
		</tr>
		<tr>
			<td colspan="2">장기요양기관명 <input type="text" style="width: 400px;" name = "facnm" value = "1"></td>
			<td colspan="2">장기요양기관기호 <input type="text" style="width: 400px;" name = "facnum" value = "1"></td>
		</tr>
	</table>
	<table border="1" width = "1300px;" style="margin-left: auto; margin-right: auto;">
<!-- 	style="margin-left: auto; margin-right: auto;" -->
		<tr>
			<td align="center" rowspan="4" width="40px;">일정관리</td>
			<td align="center" colspan="2">(<input type="text" style="width: 100px;" name = "year" value = "1"> )년 월/일</td>
			<td align="center" width="200px;"><input type="text" style="width: 30px;" name = "m1" value = "1">/<input type="text" style="width: 30px;" name = "d1" value = "1"></td>
			<td align="center" width="200px;"><input type="text" style="width: 30px;" name = "m2" value = "1">/<input type="text" style="width: 30px;" name = "d2" value = "1"></td>
			<td align="center" width="200px;"><input type="text" style="width: 30px;" name = "m3" value = "1">/<input type="text" style="width: 30px;" name = "d3" value = "1"></td>
			<td align="center" width="200px;"><input type="text" style="width: 30px;" name = "m4" value = "1">/<input type="text" style="width: 30px;" name = "d4" value = "1"></td>
			<td align="center" width="200px;"><input type="text" style="width: 30px;" name = "m5" value = "1">/<input type="text" style="width: 30px;" name = "d5" value = "1"></td>
			<td align="center" width="200px;"><input type="text" style="width: 30px;" name = "m6" value = "1">/<input type="text" style="width: 30px;" name = "d6" value = "1"></td>
			<td align="center" width="200px;"><input type="text" style="width: 30px;" name = "m7" value = "1">/<input type="text" style="width: 30px;" name = "d7" value = "1"></td>
		</tr>
		<tr>
			<td rowspan="3" align="center" width="100px;">제공 시간</td>
			<td align="center" width="300px;">총시간</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "tt1" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "tt2" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "tt3" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "tt4" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "tt5" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "tt6" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "tt7" value = "1">분</td>
		</tr>                                                                        
		<tr>
			<td align="center">시작시간</td>
			<td align="center" width="200px;"><input type="text" style="width: 30px;" name = "sh1" value = "1">:<input type="text" style="width: 30px;" name = "sm1" value = "1"></td>
			<td align="center" width="200px;"><input type="text" style="width: 30px;" name = "sh2" value = "1">:<input type="text" style="width: 30px;" name = "sm2" value = "1"></td>
			<td align="center" width="200px;"><input type="text" style="width: 30px;" name = "sh3" value = "1">:<input type="text" style="width: 30px;" name = "sm3" value = "1"></td>
			<td align="center" width="200px;"><input type="text" style="width: 30px;" name = "sh4" value = "1">:<input type="text" style="width: 30px;" name = "sm4" value = "1"></td>
			<td align="center" width="200px;"><input type="text" style="width: 30px;" name = "sh5" value = "1">:<input type="text" style="width: 30px;" name = "sm5" value = "1"></td>
			<td align="center" width="200px;"><input type="text" style="width: 30px;" name = "sh6" value = "1">:<input type="text" style="width: 30px;" name = "sm6" value = "1"></td>
			<td align="center" width="200px;"><input type="text" style="width: 30px;" name = "sh7" value = "1">:<input type="text" style="width: 30px;" name = "sm7" value = "1"></td>
		</tr>
		<tr>
			<td align="center">종료시간</td>
			<td align="center" width="200px;"><input type="text" style="width: 30px;" name = "eh1" value = "1">:<input type="text" style="width: 30px;" name = "em1" value = "1"></td>
			<td align="center" width="200px;"><input type="text" style="width: 30px;" name = "eh2" value = "1">:<input type="text" style="width: 30px;" name = "em2" value = "1"></td>
			<td align="center" width="200px;"><input type="text" style="width: 30px;" name = "eh3" value = "1">:<input type="text" style="width: 30px;" name = "em3" value = "1"></td>
			<td align="center" width="200px;"><input type="text" style="width: 30px;" name = "eh4" value = "1">:<input type="text" style="width: 30px;" name = "em4" value = "1"></td>
			<td align="center" width="200px;"><input type="text" style="width: 30px;" name = "eh5" value = "1">:<input type="text" style="width: 30px;" name = "em5" value = "1"></td>
			<td align="center" width="200px;"><input type="text" style="width: 30px;" name = "eh6" value = "1">:<input type="text" style="width: 30px;" name = "em6" value = "1"></td>
			<td align="center" width="200px;"><input type="text" style="width: 30px;" name = "eh7" value = "1">:<input type="text" style="width: 30px;" name = "em7" value = "1"></td>
		</tr>                                                         
		<tr>
			<td rowspan="5" >서비스 제공</td>
			<td align="center">신체활동지원</td>
			<td class="3">세면ㆍ구강관리,머리감기ㆍ 목욕ㆍ옷갈아입히기ㆍ화장
				실이용하기ㆍ식사ㆍ이동도움ㆍ체위변경 등</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "physup1" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "physup2" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "physup3" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "physup4" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "physup5" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "physup6" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "physup7" value = "1">분</td>
		</tr>
		<tr>
			<td rowspan="2" align="center">인지활동지원</td>
			<td>인지자극활동</td>          																		
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "cogsur1" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "cogsur2" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "cogsur3" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "cogsur4" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "cogsur5" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "cogsur6" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "cogsur7" value = "1">분</td>
		</tr>
		<tr>
			<td>일상생활 함께하기</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "life1" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "life2" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "life3" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "life4" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "life5" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "life6" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "life7" value = "1">분</td>
		</tr>
		<tr>
			<td align="center">정서지원</td>
			<td align="center">말벗, 격려</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "talk1" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "talk2" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "talk3" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "talk4" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "talk5" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "talk6" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "talk7" value = "1">분</td>
		</tr>
		<tr>
			<td align="center">가사 및 일상생활 지원</td>
			<td align="center">식사준비, 청소, 세탁 등</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "clean1" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "clean2" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "clean3" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "clean4" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "clean5" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "clean6" value = "1">분</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "clean7" value = "1">분</td>
		</tr>
		<tr>
			<td rowspan="5">변화 상태</td>
			<td align="center">신체기능</td>
			<td align="center">1호전 2유지 3악화</td>
			<td align="right">
			1<input type="radio" name = "phy1" value = "1">
			2<input type="radio" name = "phy1" value = "2">
			3<input type="radio" name = "phy1" value = "3">
			</td>
			<td align="right">
			1<input type="radio" name = "phy2" value = "1">
			2<input type="radio" name = "phy2" value = "2">
			3<input type="radio" name = "phy2" value = "3"></td>
			<td align="right">
			1<input type="radio" name = "phy3" value = "1">
			2<input type="radio" name = "phy3" value = "2">
			3<input type="radio" name = "phy3" value = "3"></td>
			<td align="right">
			1<input type="radio" name = "phy4" value = "1">
			2<input type="radio" name = "phy4" value = "2">
			3<input type="radio" name = "phy4" value = "3"></td>
			<td align="right">
			1<input type="radio" name = "phy5" value = "1">
			2<input type="radio" name = "phy5" value = "2">
			3<input type="radio" name = "phy5" value = "3"></td>
			<td align="right">
			1<input type="radio" name = "phy6" value = "1">
			2<input type="radio" name = "phy6" value = "2">
			3<input type="radio" name = "phy6" value = "3"></td>
			<td align="right">
			1<input type="radio" name = "phy7" value = "1">
			2<input type="radio" name = "phy7" value = "2">
			3<input type="radio" name = "phy2" value = "3"></td>
		</tr>
		<tr>
			<td align="center">식사기능</td>
			<td align="center">1호전 2유지 3악화</td>
				<td align="right">                         
			1<input type="radio" name = "food1" value = "1">
			2<input type="radio" name = "food1" value = "2">
			3<input type="radio" name = "food1" value = "3"></td>
			<td align="right">                                        
			1<input type="radio" name = "food2" value = "1">
			2<input type="radio" name = "food2" value = "2">
			3<input type="radio" name = "food2" value = "3"></td>
			<td align="right">                                        
			1<input type="radio" name = "food3" value = "1">
			2<input type="radio" name = "food3" value = "2">
			3<input type="radio" name = "food3" value = "3"></td>
			<td align="right">                                        
			1<input type="radio" name = "food4" value = "1">
			2<input type="radio" name = "food4" value = "2">
			3<input type="radio" name = "food4" value = "3"></td>
			<td align="right">                                        
			1<input type="radio" name = "food5" value = "1">
			2<input type="radio" name = "food5" value = "2">
			3<input type="radio" name = "food5" value = "3"></td>
			<td align="right">                                        
			1<input type="radio" name = "food6" value = "1">
			2<input type="radio" name = "food6" value = "2">
			3<input type="radio" name = "food6" value = "3"></td>
			<td align="right">                                        
			1<input type="radio" name = "food7" value = "1">
			2<input type="radio" name = "food7" value = "2">
			3<input type="radio" name = "food7" value = "3"></td>
		</tr>                                              
		<tr>
			<td align="center">인지기능</td>
			<td align="center">1호전 2유지 3악화</td>
						<td align="right">                
			1<input type="radio" name = "cog1" value = "1">
			2<input type="radio" name = "cog1" value = "2">
			3<input type="radio" name = "cog1" value = "3"></td>
			<td align="right">                                       
			1<input type="radio" name = "cog2" value = "1">
			2<input type="radio" name = "cog2" value = "2">
			3<input type="radio" name = "cog2" value = "3"></td>
			<td align="right">                                       
			1<input type="radio" name = "cog3" value = "1">
			2<input type="radio" name = "cog3" value = "2">
			3<input type="radio" name = "cog3" value = "3"></td>
			<td align="right">                                       
			1<input type="radio" name = "cog4" value = "1">
			2<input type="radio" name = "cog4" value = "2">
			3<input type="radio" name = "cog4" value = "3"></td>
			<td align="right">                                       
			1<input type="radio" name = "cog5" value = "1">
			2<input type="radio" name = "cog5" value = "2">
			3<input type="radio" name = "cog5" value = "3"></td>
			<td align="right">                                       
			1<input type="radio" name = "cog6" value = "1">
			2<input type="radio" name = "cog6" value = "2">
			3<input type="radio" name = "cog6" value = "3"></td>
			<td align="right">                                       
			1<input type="radio" name = "cog7" value = "1">
			2<input type="radio" name = "cog7" value = "2">
			3<input type="radio" name = "cog7" value = "3"></td>
		</tr>                                             
		<tr>ateatee
			<td rowspan="2" align="center">배변변화</td>
			<td>대변 실수 횟수</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "ln1" value = "1">회</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "ln2" value = "1">회</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "ln3" value = "1">회</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "ln4" value = "1">회</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "ln5" value = "1">회</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "ln6" value = "1">회</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "ln7" value = "1">회</td>
		</tr>
		<tr>
			<td>소변 실수 횟수</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "sn1" value = "1">회</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "sn2" value = "1">회</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "sn3" value = "1">회</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "sn4" value = "1">회</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "sn5" value = "1">회</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "sn6" value = "1">회</td>
			<td align="right" width="200px;"><input type="text" style="width: 30px;" name = "sn7" value = "1">회</td>
		</tr>
		<tr>
			<td rowspan="7">특이사항</td>
			<td align="center"><input type="text" width="50px;" name = "ft1"></td>
			<td colspan="8"><input type="text" style="width: 1000px;" name = "fc1"></td>
		</tr>
		<tr>
			<td align="center"><input type="text" width="50px;" name = "ft2"></td>
			<td colspan="8"><input type="text" style="width: 1000px;" name = "fc2"></td>
		</tr>
		<tr>
			<td align="center"><input type="text" width="50px;" name = "ft3"></td>
			<td colspan="8"><input type="text" style="width: 1000px;" name = "fc3"></td>
		</tr>
		<tr>
			<td align="center"><input type="text" width="50px;" name = "ft4"></td>
			<td colspan="8"><input type="text" style="width: 1000px;" name = "fc4"></td>
		</tr>
		<tr>
			<td align="center"><input type="text" width="50px;" name = "ft5"></td>
			<td colspan="8"><input type="text" style="width: 1000px;" name = "fc5"></td>
		</tr>
		<tr>
			<td align="center"><input type="text" width="50px;" name = "ft6"></td>
			<td colspan="8"><input type="text" style="width: 1000px;" name = "fc6"></td>
		</tr>
		<tr>
			<td align="center"><input type="text" width="50px;" name = "ft7"></td>
			<td colspan="8"><input type="text" style="width: 1000px;" name = "fc7"></td>
		</tr>
		<tr>
			<td colspan="2" rowspan="2">서명</td>
			<td>장기요양요원 성명(서명)</td>
			<td><input type="text" style="width: 48px;" name = "sign1" value = "1"></td>
			<td><input type="text" style="width: 48px;" name = "sign2" value = "1"></td>
			<td><input type="text" style="width: 48px;" name = "sign3" value = "1"></td>
			<td><input type="text" style="width: 48px;" name = "sign4" value = "1"></td>
			<td><input type="text" style="width: 48px;" name = "sign5" value = "1"></td>
			<td><input type="text" style="width: 48px;" name = "sign6" value = "1"></td>
			<td><input type="text" style="width: 48px;" name = "sign7" value = "1"></td>
		</tr>
		<tr>
			<td>수급자 또는 보호자 성명 (서명)</td>
			<td><input type="text" style="width: 48px;" name = "patsign1" value = "1"></td>
			<td><input type="text" style="width: 48px;" name = "patsign2" value = "1"></td>
			<td><input type="text" style="width: 48px;" name = "patsign3" value = "1"></td>
			<td><input type="text" style="width: 48px;" name = "patsign4" value = "1"></td>
			<td><input type="text" style="width: 48px;" name = "patsign5" value = "1"></td>
			<td><input type="text" style="width: 48px;" name = "patsign6" value = "1"></td>
			<td><input type="text" style="width: 48px;" name = "patsign7" value = "1"></td>
		</tr>

	</table>
</form>
</div>
<center><input type="button" id = "cost" value="작성" class="cost" ></center>
</body>
</html>
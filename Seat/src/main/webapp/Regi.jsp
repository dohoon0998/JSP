<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<h3>근무좌석예약</h3>
<section>
	<div>
		<form action="RegiConfirm.jsp" name="form" >
			<table border="1">
				<tr>
					<th>예약번호</th>
					<td><input type="text" name="resvno" id="resvno">예) 20210001</td>
				</tr>
				
				<tr>
					<th>사원번호</th>
					<td><input type="text" name="empno" >예) 1001</td>
				</tr>
				
				<tr>
					<th>근무일자</th>
					<td><input type="text" name="resvdate" >예) 20211231</td>
				</tr>
				
				<tr>
					<th>좌석번호</th>
					<td><input type="text" name="seatno">예) S001 ~ S009</td>
				</tr>
				
				<tr>
					<th>시작시간</th>
					<td><input type="text" name="stime">예) 0930</td>
				</tr>
				
				<tr>
					<th>종료시간</th>
					<td><input type="text" name="ftime">예) 1230</td>
				</tr>
				<tr>
				<td colspan="2"><input type="submit" value="등록" onclick="fn_submit(); return false;">
				 | <button type="button" onclick="fn_reset(); return false;">다시쓰기</button></td>
				</tr>
			</table>
		</form>
	</div>
</section>
<script>
function fn_submit(){
	var f = document.form;	
	
	if(f.resvno.value == ""){
		alert("예약번호가 입력되지 않았습니다!");
		f.resvno.focus(); return false;
	}
	if(f.empno.value == ""){
		alert("근무일자가 입력되지 않았습니다!");
		f.empno.focus(); return false;
	}
	if(f.resvdate.value == ""){
		alert("좌석번호가 입력되지 않았습니다!");
		f.resvdate.focus(); return false;
	}
	if(f.seatno.value == ""){
		alert("좌석번호가 입력되지 않았습니다!");
		f.seatno.focus(); return false;
	}
	if(f.stime.value == ""){
		alert("좌석번호가 입력되지 않았습니다!");
		f.stime.focus(); return false;
	}
	if(f.ftime.value == ""){
		alert("좌석번호가 입력되지 않았습니다!");
		f.ftime.focus(); return false;
	}
	f.submit();
}
function fn_reset(){
alert("정보를 지우고 처음부터 다시 입력합니다!");
document.getElementById("resvno").focus();
f.resvno.focus();
return false;
location="Regi.jsp";
}
</script> 
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
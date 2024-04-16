<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>접종예약조회</title>
<link rel="stylesheet" href="Global.css">
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<h3 class="H3">접종예약조회</h3>
<section class="Sec">
<div>
<form action="RegiListConfirm.jsp" name="form">
	<table border="1">
		<tr>
			<th>예약번호를 입력 하시오</th>
			<td>
			<input type="text" name="resvno" id="resvno">
			</td>
		</tr>
		<tr>
		<td colspan="2">
			<input type="submit" value="예약조회" onclick="fn_submit(); return false;">
			<a href="Index.jsp">홈으로</a>
			</td>
		</tr>
	</table>
</form>
</div>
</section>
<script>
function fn_submit(){
	var f = document.form;	
	
	var resvno = f.resvno.value;
	if(resvno == ""){
		alert("예약번호가 입력되지 않았습니다");
		f.resvno.focus(); return false;
	}
	f.submit();
}
</script> 
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
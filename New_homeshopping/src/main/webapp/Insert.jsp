<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="Header.jsp" %>
	<%@ include file="Nav.jsp" %>
	
<form name="frm" action="insert">
<input type="hidden" id="GUBUN" value="insert" >
<div class="wrapper">
<table border="1">
	<tr>
		<th>회원번호(자동발생)</th>
		<td><input name="custno" value="" readonly value="1"></td>
	</tr>
	<tr>
		<th>회원성명</th>
		<td><input type="text" name="custname" ></td>
	</tr>
	<tr>
		<th>회원전화</th>
		<td><input type="text" name="phone" ></td>
	</tr>
	<tr>
		<th>회원주소</th>
		<td><input type="text" name="address" ></td>
	</tr>
	<tr>
		<th>가입일자</th>
		<td><input type="text" name="date" ></td>
	</tr>
	<tr>
		<th>고객등급[A:VIP,B:일반,C:직원]</th>
		<td><input type="text" name="grade" ></td>
	</tr>
	<tr>
		<th>도시코드</th>
		<td><input type="text" name="city" ></td>
	</tr>
	<tr>
		<td colspan="2">
		<button class="btn" type="submit">등 록</button>
		<a href="List.jsp">조회</a>
		</td>
	</tr>
</table>
</div>
</form>
	<%@ include file="Footer.jsp" %>
</body>
</html>
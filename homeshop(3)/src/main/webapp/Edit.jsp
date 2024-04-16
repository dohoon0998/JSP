<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="footer.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String custno = request.getParameter("custno");
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("grade");
String city = request.getParameter("city");
%>
<section>
<h2>판매등록</h2>
<form action="EditConfirm.jsp">

	<table border="1">
		<tr>
			<th>회원번호</th>
			<td>
			<input type="text" name="custno" value="<%= custno %>">
			</td>
		</tr>
		<tr>
			<th>회원성명</th>
			<td>
			<input type="text" name="custname" value="<%= custname %>">
			</td>
		</tr>
		
		<tr>
			<th>회원전화</th>
			<td>
			<input type="text" name="phone" value="<%= phone %>">			
			</td>
		</tr>
		<tr>
			<th>회원주소</th>
			<td>
			<input type="text" name="address" value="<%= address %>">
			</td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td>
			<input type="text" name="joindate" value="<%= joindate.substring(0, 10) %>">
			</td>
		</tr>
		<tr>
			<th>고객등급[A:VIP, B:일반, C:직원]</th>
			<td>
			<input type="text" name="grade" value="<%= grade %>">
			</td>
		</tr>
		<tr>
			<th>도시코드</th>
			<td>
			<input type="text" name="city" value="<%= city %>">
			</td>
		</tr>
		<tr>
		<td>
			<input type="submit" value="등록">
			<a href="List.jsp">조회</a>
			</td>
		</tr>
	</table>
</form>

</section>

</body>
</html>
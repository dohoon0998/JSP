<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<%
ResultSet rs = null;
Connection conn = null;
PreparedStatement pstmt = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql = "SELECT rt.custno, rt.custname, rt.grade, SUM(price) "
			+ "from member_tbl_02 rt, money_tbl_02 yt "
			+ "where rt.custno = yt.custno " 
			+ "group by rt.custno, rt.custname, rt.grade order by rt.custno, SUM(price) desc ";

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

rs.next();
%>
<body>
<%@ include file="nav.jsp" %>
<section>
<div class="title">
회원매출조회
</div>
<div class="wrapper">
<table border="1">
<tr>
	<th>회원번호</th>
	<th>회원성명</th>
	<th>고객등급</th>
	<th>매출</th>
</tr>

<tr>
	<td><%= rs.getString(1) %></td>
	<td><%= rs.getString(2) %></td>
	<td><%= rs.getString(3).equalsIgnoreCase("A") ? "VIP" : rs.getString(3).equalsIgnoreCase("B") ? "일반" : (rs.getString(3).equalsIgnoreCase("C") ? "직원" : "") %></td>
	<td><%= rs.getString(4) %></td>
</tr>

<%
while (rs.next()) {
%>
<tr>
	<td><%= rs.getString(1) %></td>
	<td><%= rs.getString(2) %></td>
	<td><%= rs.getString(3).equalsIgnoreCase("A") ? "VIP" : rs.getString(3).equalsIgnoreCase("B") ? "일반" : (rs.getString(3).equalsIgnoreCase("C") ? "직원" : "") %></td>
	<td><%= rs.getString(4) %></td>
</tr>
<%
}
%>
</table>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>
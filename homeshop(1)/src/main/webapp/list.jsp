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

String sql = "SELECT * from member_tbl_02";

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();


rs.next();
%>
<body>
	<%@ include file="nav.jsp"%>
	<section>
		<div class="title">쇼핑몰 회원관리 프로그램</div>
		<div class="wrapper">

			<table style="width: 900px" border="1">
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>가입일자</th>
					<th>고객등급</th>
					<th>거주지역</th>
				</tr>

<tr>
					<td><a href="modi.jsp?custno=<%=rs.getInt("custno")%>?custname=<%=rs.getString("custname")%>"><%=rs.getInt("custno")%></a></td>
					<td><%=rs.getString("custname")%></td>
					<td><%=rs.getString("phone")%></td>
					<td><%=rs.getString("address")%></td>
					<td><%=rs.getString("joindate").substring(0, 11)%></td>
					<td><%=rs.getString("grade").equalsIgnoreCase("A") ? "VIP" : rs.getString("grade").equalsIgnoreCase("B") ? "일반" : (rs.getString("grade").equalsIgnoreCase("C") ? "직원" : "")%></td>
					<td><%=rs.getString("city")%></td>
				</tr>
				<%
				while (rs.next()) {
				%>
				<tr>
					<td><a href="modi.jsp?custno=<%=rs.getInt("custno")%>?custname=<%=rs.getString("custname")%>"><%=rs.getInt("custno")%></a></td>
					<td><%=rs.getString("custname")%></td>
					<td><%=rs.getString("phone")%></td>
					<td><%=rs.getString("address")%></td>
					<td><%=rs.getString("joindate").substring(0, 11)%></td>
					<td><%=rs.getString("grade").equalsIgnoreCase("A") ? "VIP" : rs.getString("grade").equalsIgnoreCase("B") ? "일반" : (rs.getString("grade").equalsIgnoreCase("C") ? "직원" : "")%></td>
					<td><%=rs.getString("city")%></td>
				</tr>
				<%
				
}
				%>

			</table>
		</div>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>
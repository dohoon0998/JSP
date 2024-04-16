<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 샘플</title>
<style>
* {
	box-sizing: border-box;
	margin: 0;
}

h2 {
	margin-bottom: 10px;
}

div {
	display: flex;
	justify-content: center;
}

td {
	text-align: center;
}

.td {
	background: lightgray;
}
</style>

<%@include file="header.jsp"%>
<%@include file="nav.jsp"%>
<%@include file="footer.jsp"%>


<%
ResultSet rs = null;
Connection conn = null;
PreparedStatement pstmt = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql = "SELECT mt.id, mt.name, mt.gender, subStr(mt.id, 1, 1), subStr(mt.id, 2, 2), subStr(mt.id, 4, 2)"
		+ "from member_tbl mt";

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

rs.next();
%>
</head>
<body>
	<section>
		<h2 align="center">학생 조회</h2>
		<div>
			<table border=1>

				<tr>
					<td>학번</td>
					<td>이름</td>
					<td>학년</td>
					<td>반</td>
					<td>번호</td>
					<td>성별</td>
				</tr>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(3)%></td>
				
				</tr>

				<%
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(3)%></td>

				</tr>
				<%
				}
				%>
			</table>
		</div>
	</section>
</body>
</html>

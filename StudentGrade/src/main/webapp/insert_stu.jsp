<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생정보</title>
<style>
* {
	box-sizing: border-box;
	margin: 0;
}

h2 {
	margin-bottom: 10px;
}

table {
	border: 1px solid black;
}

div {
	display: flex;
	justify-content: center;
}

section {
	margin: 0;
	padding: 0;
	position: absolute;
	top: 200px;
	left: 30%;
}

section {
	position: absolute;
	left: 35%;
}

td {
	text-align: center;
	border: 1px solid black;
}
</style>
</head>
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

String sql = "select mt.id, mt.name, mt.id, mt.name, mt.gender, subStr(mt.id, 1, 1), subStr(mt.id, 2, 2), subStr(mt.id, 4, 2) "
		+ "st.korean, st.english, st.math, st.history "
		+ "SUM(st.korean + st.english + st.math + st.history), AVG(st.korean + st.english + st.math + st.history) "
		+ "FROM member_tbl mt, score_tbl st "
		+ "WHERE mt.id = st.id "
		+ "GROUP BY st.id"; 
		
/* 	String sql = "select mt.id, mt.name, mt.gender, subStr(mt.id, 1, 1) AS substr1, subStr(mt.id, 2, 2) AS substr2, subStr(mt.id, 4, 2) AS substr3, st.korean, st.english, st.math, st.history "
				+ "SUM(st.korean + st.english + st.math + st.history) AS total_score "
				+ "AVG(st.korean + st.english + st.math + st.history) AS avg_score "
				+ "from member_tbl mt "
				+ "join score_tbl st ON mt.id=st.id "
				+ "GROUP BY mt.id, mt.name, mt.gender, SUBSTR(mt.id, 1, 1), SUBSTR(mt.id, 2, 2), SUBSTR(mt.id, 4, 2), st.korean, st.english, st.math, st.history "; */

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

rs.next();
%>
<body>
	<h2 align="center">학생정보</h2>
	<div>
		<table>

			<tr>
				<td>학번</td>
				<td>이름</td>
				<td>학년</td>
				<td>반</td>
				<td>번호</td>
				<td>성별</td>
				<td>국어</td>
				<td>수학</td>
				<td>영어</td>
				<td>역사</td>
				<td>합계</td>
				<td>평균</td>
				<td>평균</td>
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
</body>
</html>
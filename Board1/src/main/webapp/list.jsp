<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.JDBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
StringBuffer sb = new StringBuffer();
sb.append(" select * from board_tbl order by date1 ");
String sql = sb.toString();
Connection conn = JDBConnection.getConnection();
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@ include file="inter.jsp"%>
	<section>
	<h2 class="title">게시판 목록/조회</h2>

	<table border="1">
		<tr>
			<td>번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>내용</td>
			<td>작성일</td>
			<td>수정일</td>
		</tr>
		<%
		while (rs.next()) {
			String id = rs.getString(1);
			String na = rs.getString(2);
			String ti = rs.getString(3);
			String co = rs.getString(4);
			String da = rs.getString(5);
			String cr = rs.getString(6);
		%>
		<tr>
			<td><a href="result.jsp?id=<%= id %>&na=<%= na %>&ti=<%= ti %>&co=<%= co %>&da=<%= da %>&cr=<%= cr %>"><%=rs.getString(1)%></a></td>
			<td><%=rs.getString(2)%></td>
			<td><a href="result.jsp?id=<%= id %>&na=<%= na %>&ti=<%= ti %>&co=<%= co %>&da=<%= da %>&cr=<%= cr %>"><%=rs.getString(3)%></a></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
		</tr>
		<%
		}
		%>
	</table>
	<div class="sub">
	<a href="add.jsp"><input type="button" value="작성하기"></a>
	</div>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>
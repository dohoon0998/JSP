<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="Global.css">
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

String sql = "select empno, empname, deptcode, position from tbl_emp_202108";

PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

%>
<jsp:include page="Header.jsp"></jsp:include>
<h3 class="H3">부서벌근무일수집계</h3>
<section class="Sec">
<div>
	<table border="1">
		<tr>
			<th>사원번호</th>
			<th>이름</th>
			<th>부서명</th>
			<th>근무일수</th>
		</tr>
		<%
		while(rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3).equalsIgnoreCase("10") ? "구매팀" : rs.getString(3).equalsIgnoreCase("20") ? "영업팀" : (rs.getString(3).equalsIgnoreCase("30") ? "총무팀" : "")%></td>
			<td><%=rs.getString(4)%></td>
		</tr>
		<%
		}
		%>
	</table>
</div>
</section> 
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
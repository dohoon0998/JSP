<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검사결과조회</title>
</head>
<body>	
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

String sql = "insert into tbl_result_202004 values(?, ?, ?, ?, ?, ?)";
PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setString(1, request.getParameter("p_no"));
pstmt.setString(2, request.getParameter("t_code"));
pstmt.setString(3, request.getParameter("t_sdate"));
pstmt.setString(4, request.getParameter("t_status"));
pstmt.setString(5, request.getParameter("t_ldate"));
pstmt.setString(6, request.getParameter("t_result"));

pstmt.executeUpdate();
pstmt.close();
con.close();
%>
</body>
</html>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String idx = request.getParameter("idx");
	
		String sql = "DELETE FROM board_tbl WHERE idx = ?";
		
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection
				("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, request.getParameter("idx"));
		
		int rowCount = pstmt.executeUpdate();
		response.sendRedirect("Index.jsp");
	
%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="DBPKG.JDBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
				("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	
	String sql = "DELETE FROM comment_tbl WHERE idx = ?";
		
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("id"));
		
	pstmt.executeUpdate();
	response.sendRedirect("index.jsp");	
%>
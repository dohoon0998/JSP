<%@page import="DBPKG.JDBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	PrintWriter writer = response.getWriter();

	try {
		String sql = "insert into tbl_vote202005 values (?, ?, ?, ?, ?, ?)";
		
		Connection conn = JDBConnection.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, request.getParameter("num"));
		pstmt.setString(2, request.getParameter("name"));
		pstmt.setString(3, request.getParameter("hnum"));
		pstmt.setString(4, request.getParameter("ti"));
		pstmt.setString(5, request.getParameter("ad"));
		pstmt.setString(6, request.getParameter("ch"));
		
		pstmt.executeUpdate();
		
		response.sendRedirect("index.jsp");
	
	} catch(Exception e) {
		e.printStackTrace();
	}
	
%>
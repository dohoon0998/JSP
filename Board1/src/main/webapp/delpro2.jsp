 <%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="DBPKG.JDBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	try {
		String sql = "DELETE FROM board_tbl WHERE idx = ?";
		
		Connection conn = JDBConnection.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, request.getParameter("id"));
		
		int rowCount = pstmt.executeUpdate();
		System.out.println(request.getParameter("id"));		
		response.sendRedirect("index.jsp");
	
	} catch(Exception e) {
		e.printStackTrace();
	}
	
%>
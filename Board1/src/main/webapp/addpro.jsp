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
	PrintWriter writer = response.getWriter();
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date now = new Date();
	String noda = sdf.format(now);
	
	try {
		String sql = "insert into board_tbl values (emp_seq.NEXTVAL, ?, ?, ?, ?, ?)";
		
		Connection conn = JDBConnection.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, request.getParameter("na"));
		pstmt.setString(2, request.getParameter("ti"));
		pstmt.setString(3, request.getParameter("co"));
		pstmt.setString(4, noda);
		pstmt.setString(5, "");
		
		pstmt.executeUpdate();
		
		response.sendRedirect("index.jsp");
	
	} catch(Exception e) {
		e.printStackTrace();
	}
	
%>
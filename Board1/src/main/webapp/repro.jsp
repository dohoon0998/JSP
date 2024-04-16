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
		String sql = "insert into comment_tbl values (con_seq.NEXTVAL, ?, ?, ?, ?)";
		
		Connection conn = JDBConnection.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, request.getParameter("idx"));
		pstmt.setString(2, request.getParameter("nam"));
		pstmt.setString(3, request.getParameter("con"));
		pstmt.setString(4, noda);
		
		pstmt.executeUpdate();
		
		response.sendRedirect("list.jsp");
	
	} catch(Exception e) {
		e.printStackTrace();
	}
	
%>
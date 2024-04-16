<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<% 
String writer = request.getParameter("writer");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
String idxStr = request.getParameter("idx");
int idx = Integer.parseInt(idxStr);

	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	
	String sql = "update board_tbl set writer = ?, subject = ?, content = ? where idx = ? ";
	
	pstmt = conn.prepareStatement(sql);  
	
	pstmt.setString(1, writer);
	pstmt.setString(2, subject);
	pstmt.setString(3, content);
	pstmt.setInt(4, idx);

	pstmt.executeUpdate();
	pstmt.close(); 
	conn.close(); 
	
	response.sendRedirect("Index.jsp");	
%>
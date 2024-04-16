<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<% 
String b_idx = request.getParameter("b_idx");
String writer = request.getParameter("writer");
String content = request.getParameter("content");

Date currentDate = new Date();
Timestamp currentTimestamp = new Timestamp(currentDate.getTime());

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	
	String sql = "insert into comment_tbl values(con_seq.NEXTVAL, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);  
	
	
	pstmt.setString(1, b_idx);
	pstmt.setString(2, writer);
	pstmt.setString(3, content);
	pstmt.setTimestamp(4, currentTimestamp);

	pstmt.executeUpdate();
	pstmt.close(); 
	conn.close(); 
	
	response.sendRedirect("Index.jsp");	
%>
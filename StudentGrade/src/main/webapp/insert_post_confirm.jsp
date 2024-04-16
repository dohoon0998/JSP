<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<% 
    String id =request.getParameter("id");
    String korean =request.getParameter("korean");
    String english =request.getParameter("english");
    String math =request.getParameter("math");
    String history =request.getParameter("history");

	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	
	String sql = "INSERT INTO score_tbl values(?, ?, ?, ?, ?)";
	
	pstmt = conn.prepareStatement(sql);  
	
	pstmt.setString(1,id);
	pstmt.setString(2,korean);
	pstmt.setString(3,english);
	pstmt.setString(4,math);
	pstmt.setString(5,history);
	
	pstmt.executeUpdate();
	pstmt.close(); 
	conn.close(); 
	
	response.sendRedirect("insert.jsp");	
%>
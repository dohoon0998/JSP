<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<% 
String menu_cd = request.getParameter("menu_cd");
String menu_nm = request.getParameter("menu_nm");
String price = request.getParameter("price");
String menu_fg = request.getParameter("menu_fg");


	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	
	String sql = "INSERT INTO menu_tbl_007 values(?, ?, ?, ?)";
	
	pstmt = conn.prepareStatement(sql);  
	
	pstmt.setString(1,menu_cd);
	pstmt.setString(2,menu_nm);
	pstmt.setString(3,price);
	pstmt.setString(4,menu_fg);
	
	pstmt.executeUpdate();
	pstmt.close(); 
	conn.close(); 
	
	response.sendRedirect("Index.jsp");	
%>
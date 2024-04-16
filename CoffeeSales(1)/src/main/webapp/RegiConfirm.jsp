<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<% 
String saleno = request.getParameter("saleno");
String pcode = request.getParameter("pcode");
String saledate = request.getParameter("saledate");
String scode = request.getParameter("scode");
String amount  = request.getParameter("amount");

	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	
	String sql = "INSERT INTO tbl_salelist_01 values(?, ?, ?, ?, ?)";
	
	pstmt = conn.prepareStatement(sql);  
	
	pstmt.setString(1,saleno);
	pstmt.setString(2,pcode);
	pstmt.setString(3,saledate);
	pstmt.setString(4,scode);
	pstmt.setString(5,amount);
	
	pstmt.executeUpdate();
	pstmt.close(); 
	conn.close(); 
	
	response.sendRedirect("Index.jsp");	
%>
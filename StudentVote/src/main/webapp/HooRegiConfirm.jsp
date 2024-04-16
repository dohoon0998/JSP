<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<% 
String no = request.getParameter("no");
String name = request.getParameter("name");
String code = request.getParameter("code");
String school = request.getParameter("school");
String jumin1 = request.getParameter("jumin1");
String jumin2 = request.getParameter("jumin2");
String major = request.getParameter("major");

String alljumin = jumin1 + jumin2;

	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	
	String sql = "INSERT INTO tbl_register values(?, ?, ?, ?, ?, ?)";
	
	pstmt = conn.prepareStatement(sql);  
	
	pstmt.setString(1,no);
	pstmt.setString(2,name);
	pstmt.setString(3,code);
	pstmt.setString(4,school);
	pstmt.setString(5,alljumin);
	pstmt.setString(6,major);
	
	pstmt.executeUpdate();
	pstmt.close(); 
	conn.close(); 
	
	response.sendRedirect("Index.jsp");	
%>
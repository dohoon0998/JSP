<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<% 
String p_no = request.getParameter("p_no");
String t_code = request.getParameter("t_code");
String t_sdate = request.getParameter("t_sdate");
String t_status = request.getParameter("t_status");
String t_ldate = request.getParameter("t_ldate");
String t_result = request.getParameter("t_result");

	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	
	String sql = "INSERT INTO tbl_result_202004 values(?, ?, ?, ?, ?, ?)";
	
	pstmt = conn.prepareStatement(sql);  
	
	pstmt.setString(1,p_no);
	pstmt.setString(2,t_code);
	pstmt.setString(3,t_sdate);
	pstmt.setString(4,t_status);
	pstmt.setString(5,t_ldate);
	pstmt.setString(6,t_result);
	
	pstmt.executeUpdate();
	pstmt.close(); 
	conn.close(); 
	
	response.sendRedirect("index.jsp");	
%>
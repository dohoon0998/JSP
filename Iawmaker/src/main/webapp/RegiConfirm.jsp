<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<% 
String v_jumin = request.getParameter("v_jumin");
String v_name = request.getParameter("v_name");
String m_no = request.getParameter("m_no");
String v_time = request.getParameter("v_time");
String v_area = request.getParameter("v_area");
String v_confirm = request.getParameter("v_confirm");

	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	
	String sql = "INSERT INTO tbl_vote202005 values(?, ?, ?, ?, ?, ?)";
	
	pstmt = conn.prepareStatement(sql);  
	
	pstmt.setString(1,v_jumin);
	pstmt.setString(2,v_name);
	pstmt.setString(3,m_no);
	pstmt.setString(4,v_time);
	pstmt.setString(5,v_area);
	pstmt.setString(6,v_confirm);
	
	pstmt.executeUpdate();
	pstmt.close(); 
	conn.close(); 
	
	response.sendRedirect("Index.jsp");	
%>
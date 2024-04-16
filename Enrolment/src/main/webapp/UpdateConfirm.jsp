<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<% 
request.setCharacterEncoding("UTF-8");
int result = 1;

	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
	
	String sql = "update course_tbl set co_name = ?, credit = ?, lecturer_idx = ?, week = ?, start_hour = ?, end_hour = ? where id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);  
	
	pstmt.setString(1, request.getParameter("co_name"));
	pstmt.setString(2, request.getParameter("credit"));
	pstmt.setString(3, request.getParameter("lecturer_idx"));
	pstmt.setString(4, request.getParameter("week"));
	pstmt.setString(5, request.getParameter("start_hour"));
	pstmt.setString(6, request.getParameter("end_hour"));
	pstmt.setString(7, request.getParameter("id"));

	pstmt.executeUpdate();
	
	if(result == 1){
		%>
			<script>
			alert("");
			location = "Index.jsp";
			</script>
		<%
		}
		%>
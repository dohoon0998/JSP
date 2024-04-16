<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<% 
String id = request.getParameter("id");
String co_name = request.getParameter("co_name");
String credit = request.getParameter("credit");
String lecturer_idx = request.getParameter("lecturer_idx");
String week = request.getParameter("week");
String start_hour = request.getParameter("start_hour");
String end_hour = request.getParameter("end_hour");
int result = 1;


	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	
	String sql = "INSERT INTO course_tbl values(?, ?, ?, ?, ?, ?, ?)";
	
	pstmt = conn.prepareStatement(sql);  
	
	pstmt.setString(1,id);
	pstmt.setString(2,co_name);
	pstmt.setString(3,credit);
	pstmt.setString(4,lecturer_idx);
	pstmt.setString(5,week);
	pstmt.setString(6,start_hour);
	pstmt.setString(7,end_hour);
	
	pstmt.executeUpdate();
	pstmt.close(); 
	conn.close(); 
	
	if(result == 1){
		%>
			<script>
			alert("교과가 모두 입력되었습니다!");
			location = "Index.jsp";
			</script>
		<%
		}else{
		%>

		<%
		}
		%>
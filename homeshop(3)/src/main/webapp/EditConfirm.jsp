<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<% 
String custno = request.getParameter("custno");
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("grade");
String city = request.getParameter("city");
int result = 0;

	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	
	String sql = "update member_tbl_02 set custname = ?, phone = ?, address = ?, joindate = ?, grade = ?, city = ? where custno = ? ";
	
	pstmt = conn.prepareStatement(sql);  
	
	pstmt.setString(7, custno);
	pstmt.setString(1, custname);
	pstmt.setString(2, phone);
	pstmt.setString(3, address);
	pstmt.setString(4, joindate);
	pstmt.setString(5, grade);
	pstmt.setString(6, city);

	
	pstmt.executeUpdate();
	pstmt.close(); 
	conn.close(); 
	
	if(result == 1){
		%>
<script>
			alert("회원등록이 완료 되었습니다!");
			location = "index.jsp";
			</script>
		<%
		}else{
		%>
			
		<%
		}
		%>
%>
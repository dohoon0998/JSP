<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<% 
request.setCharacterEncoding("UTF-8");
int result = 0;

	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
			         ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	
	String sql = "INSERT INTO tbl_vaccresv_202108 values(?, ?, ?, ?, ?, ?)";
	PreparedStatement pstmt = con.prepareStatement(sql); 
	
	pstmt.setString(1,request.getParameter("resvno"));
	pstmt.setString(2,request.getParameter("jumin"));
	pstmt.setString(3,request.getParameter("vcode"));
	pstmt.setString(4,request.getParameter("hospcode"));
	pstmt.setString(5,request.getParameter("resvdate"));
	pstmt.setString(6,request.getParameter("resvtime"));
	
	result = pstmt.executeUpdate();
	
	pstmt.close(); 
	con.close(); 
	
	if(result == 1){
		%>
			<script>
			alert("회원등록이 완료 되었습니다!");
			location = "Index.jsp";
			</script>
		<%
		}else{
		%>

		<%
		}
		%>
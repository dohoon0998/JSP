<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<% 
int result = 1;

	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
	
	String sql = "update tbl_goods_01 set goods_nm = ?, goods_price = ?, cost = ?, in_date = ? where goods_cd = ?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);  
	
	pstmt.setString(1, request.getParameter("goods_cd"));
	pstmt.setString(2, request.getParameter("goods_nm"));
	pstmt.setString(3, request.getParameter("goods_price"));
	pstmt.setString(4, request.getParameter("cost"));
	pstmt.setString(5, request.getParameter("in_date"));

	pstmt.executeUpdate();

	if(result == 1){
		%>
			<script>
			alert("변경되었습니다");
			location = "Index.jsp";
			</script>
		<%
		}else{
		%>

		<%
		}
		%>
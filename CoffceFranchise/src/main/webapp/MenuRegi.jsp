<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp"></jsp:include>

<meta charset="UTF-8">
</head>
<body>
<section>
<h2>메뉴수정</h2>
<%

ResultSet rs = null;
Connection conn = null;
PreparedStatement pstmt = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql = "select max(menu_cd)+1 menu_cd from menu_tbl_007";

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

rs.next();
%>

<form action="MenuRegiConfirm.jsp">

	<table border="1">
		<tr>
			<th>메뉴코드(자동채번)</th>
			<td>
			<input type="text" name="menu_cd" readonly value="<%=rs.getString(1)%>">
			</td>
		</tr>
		<tr>
			<th>메뉴명</th>
			<td>
			<input type="text" name="menu_nm">
			</td>
		</tr>
		<tr>
			<th>메뉴가격</th>
			<td>
			<input type="text" name="price">
			</td>
		</tr>
		<tr>
			<th>메뉴구분</th>
			<td>
			<select name="menu_fg">
				<option></option>
				<option value="0">커피</option>
				<option value="1">티</option>
			</select>		
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center">
			<input type="submit" value="등록">
			</td>
		</tr>
	</table>
</form>
</section>
<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>
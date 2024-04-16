<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<script src="script.js"></script>
</head>
<%
ResultSet rs = null;
Connection conn = null;
PreparedStatement pstmt = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql = "SELECT custno FROM member_tbl_02 order by custno desc";

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

int cu = 0;

if(rs.next()) {
	cu = rs.getInt(1);
}
%>
<body>
<%@ include file="nav.jsp" %>
<section>
<div class="title">
홈쇼핑 회원 등록
</div>
<form name="frm" action="regiAction.jsp">
<input type="hidden" id="GUBUN" value="insert" >
<div class="wrapper">
<table border="1">
	<tr>
		<th>회원번호(자동발생은개뿔)</th>
		<td><input name="custno" value="<%= cu+1 %>"></td>
	</tr>
	<tr>
		<th>회원성명</th>
		<td><input type="text" name="custname" ></td>
	</tr>
	<tr>
		<th>회원전화</th>
		<td><input type="text" name="phone" ></td>
	</tr>
	<tr>
		<th>회원주소</th>
		<td><input type="text" name="address" ></td>
	</tr>
	<tr>
		<th>가입일자</th>
		<td><input type="text" name="joindate" ></td>
	</tr>
	<tr>
		<th>고객등급[A:VIP,B:일반,C:직원]</th>
		<td><input type="text" name="grade" ></td>
	</tr>
	<tr>
		<th>도시코드</th>
		<td><input type="text" name="city" ></td>
	</tr>
	<tr>
		<td colspan="2">
		<button class="btn" type="submit">등 록</button>
		<a href="list.jsp">조 회</a>
		</td>
	</tr>
</table>
</div>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

String sql = "select goods_cd, goods_nm, goods_price, cost, in_date from tbl_goods_01";

PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

%>
<jsp:include page="Header.jsp"></jsp:include>
<h3>상품관리</h3>
<section>
	<div>
		<form action="">
			<table border="1">
				<tr>
					<th>상품코드</th>
					<th>상품명</th>
					<th>단가</th>
					<th>평가</th>
					<th>입고일자</th>
				</tr>
				
				<%
				while(rs.next()) {
				%>
				<tr>
					<td><a href="ListEdit.jsp?goods_cd=<%=rs.getString(1)%>&goods_nm=<%=rs.getString(2)%>&goods_price=<%=rs.getString(3)%>&cost=<%=rs.getString(4)%>&in_date=<%=rs.getString(5)%>&"><%=rs.getString(1) %></a></td>
					<td><%= rs.getString(2) %></td>
					<td>\<%= rs.getString(3) %></td>
					<td>\<%= rs.getString(4) %></td>
					<td><%= rs.getString(5).substring(0, 10) %></td>
				</tr>
				<%
				}
				%>
				<tr>
					<td colspan="5"><a href="ListRegi.jsp">등록</a></td>
				</tr>
			</table>
		</form>
	</div>
</section>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
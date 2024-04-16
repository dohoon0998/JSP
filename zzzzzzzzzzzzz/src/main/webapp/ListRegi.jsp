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

String sql = "select max(goods_cd)+1, sysdate from tbl_goods_01";

PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

rs.next();
%>
<jsp:include page="Header.jsp"></jsp:include>
<h3>상품정보등록</h3>
<section>
	<div>
		<form action="ListRegiConfirm.jsp">
			<table border="1">
				<tr>
					<th>상품코드(자동채번)</th>
					<td><input type="text" readonly name="goods_cd" value="<%=rs.getString(1)%>"></td>
				</tr>
				
				<tr>
					<th>상품명</th>
					<td><input type="text" name="goods_nm"></td>
				</tr>
				
				<tr>
					<th>단가</th>
					<td><input type="text" name="goods_price"></td>
				</tr>
				
				<tr>
					<th>원가</th>
					<td><input type="text" name="cost"></td>
				</tr>
				
				<tr>
					<th>입고날짜(자동세팅)</th>
					<td><input type="text" readonly name="in_date" value="<%=rs.getString(2).substring(0, 10)%>"></td>
				</tr>
				
				<tr>
					<td colspan="2"><input type="submit" value="등록"><a href="List.jsp">상품목록</a></td>
				</tr>
			</table>
		</form>
	</div>
</section>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
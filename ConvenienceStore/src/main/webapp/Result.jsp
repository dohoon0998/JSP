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

String sql1 = "SELECT"
			+ " s.store_nm AS 점포명, "
			+ " SUM(CASE WHEN sa.pay_type = '01' THEN sa.sale_cnt * g.goods_price ELSE 0 END) AS 현금매출, "
			+ " SUM(CASE WHEN sa.pay_type = '02' THEN sa.sale_cnt * g.goods_price ELSE 0 END) AS 카드매출, "
			+ " SUM(sa.sale_cnt * g.goods_price) AS 총매출 "
			+ " FROM sale_tbl_003 sa "
			+ " JOIN store_tbl_003 s ON sa.store_cd = s.store_cd "
			+ "	JOIN tbl_goods_01 g ON sa.goods_cd = g.goods_cd "
			+ "	GROUP BY s.store_nm, sa.sale_fg, sa.sale_no, sa.sale_ymd, g.goods_nm, sa.sale_cnt, sa.pay_type ORDER BY SUM(sa.sale_cnt * g.goods_price) desc";

Statement stmt = conn.createStatement();
%>

<jsp:include page="Header.jsp"></jsp:include>
<h3>점포별매출현황</h3>
<section>
	<div>
		<table border="1">
			<tr>
				<th>점포명</th>
				<th>현금매출</th>
				<th>가드매출</th>
				<th>총매출</th>
			</tr>
			<%
			ResultSet rs = stmt.executeQuery(sql1);
			
			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%>원</td>
				<td><%=rs.getString(3)%>원</td>
				<td><%=rs.getString(4)%>원</td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</section>
<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>
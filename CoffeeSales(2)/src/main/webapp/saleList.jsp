<%@page import="net.coffee.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="net.utility.*" %>
<jsp:useBean id="dao" class="net.coffee.CoffeeDAO"></jsp:useBean>
<jsp:useBean id="dto" class="net.coffee.SaleDTO"></jsp:useBean>  
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매장별 커피 판매관리</title>
 <link rel="stylesheet" href="Global.css">
</head>
<body>

	<header class="Head">
		<h1 class="H1">매장별 커피 판매관리 Ver 1.0</h1>
	</header>
		<div class="nav">
			<jsp:include page="mainMenu.jsp"></jsp:include>
		</div>
		<h2 class="H2">판매현황</h2>
	<section class="Sec">
		<table border='1'>
			<tr>
				<th>판매번호</th>
				<th>상품코드</th>
				<th>판매날짜</th>
				<th>매장코드</th>
				<th>상품명</th>
				<th>판매수량</th>
				<th>총판매액</th>
			</tr>
			<%
				ArrayList<SaleDTO> list = dao.salelist();
				if (list == null) {
					out.println("<tr>");
					out.println("	<td colspan='4'>결과를 찾을 수 없습니다.</td>");
					out.println("</tr>");
				} else {
					for (int i = 0; i < list.size(); i++) {
						dto = list.get(i);
			%>
			<tr>
				<td><%=dto.getSaleno()%></td>
				<td><%=dto.getPcode()%></td>
				<td><%=dto.getSaledate().substring(0, 10)%></td>
				<td><%=dto.getScode()%></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getAmount()%></td>
				<td><%=Utility.comma(dto.getTot())%></td>
			</tr>

			<%
				}
			}
			%>

		</table>
	</section>
	<footer class="Foot">
		<address>Copyright @2018 All right reserved 상미고</address>
	</footer>

</body>
</html>
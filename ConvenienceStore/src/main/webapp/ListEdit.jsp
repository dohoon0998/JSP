
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
String goods_cd = request.getParameter("goods_cd");
String goods_nm = request.getParameter("goods_nm");
String goods_price = request.getParameter("goods_price");
String cost = request.getParameter("cost");
String in_date = request.getParameter("in_date");
%>
<jsp:include page="Header.jsp"></jsp:include>
<h3>상품정보등록</h3>
<section>
	<div>
		<form action="ListEditConfirm.jsp">
			<table border="1">
				<tr>
					<th>상품코드(변경불가)</th>
					<td><input type="text" readonly name="goods_cd" value="<%=goods_cd%>"></td>
				</tr>
				
				<tr>
					<th>상품명</th>
					<td><input type="text" name="goods_nm" value="<%=goods_nm%>"></td>
				</tr>
				
				<tr>
					<th>단가</th>
					<td><input type="text" name="goods_price" value="<%=goods_price%>"></td>
				</tr>
				
				<tr>
					<th>원가</th>
					<td><input type="text" name="cost" value="<%=cost%>"></td>
				</tr>
				
				<tr>
					<th>입고날짜(변경불가)</th>
					<td><input type="text" readonly name="in_date" value="<%=in_date.substring(0, 10)%>"></td>
				</tr>
				
				<tr>
					<td colspan="2"><input type="submit" value="저장"><a href="List.jsp">상품목록</a></td>
				</tr>
			</table>
		</form>
	</div>
</section>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
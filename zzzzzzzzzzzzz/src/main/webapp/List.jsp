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

<jsp:include page="Header.jsp"></jsp:include>
<h3>구매목록</h3>
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
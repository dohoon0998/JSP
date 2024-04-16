<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<section>
<form action="RegiConfirm.jsp">
	<table border="1">
		<tr>
			<th>판매번호</th>
			<td>
			<input type="text" name="saleno">
			</td>
		</tr>
		<tr>
			<th>상품코드</th>
			<td>
			<input type="text" name="pcode">
			</td>
		</tr>
		
		<tr>
			<th>판매날짜</th>
			<td>
			<input type="text" name="saledate">			
			</td>
		</tr>
		<tr>
			<th>매장코드</th>
			<td>
			<input type="text" name="scode" >
			</td>
		</tr>
		<tr>
			<th>판매수량</th>
			<td>
			<input type="text" name="amount">
			</td>
		</tr>
		<tr>
		<td>
			<button type="submit" value="등록"></button>
			</td>
		</tr>
	</table>
</form>
<button onClick="window.location.reload()">다시쓰기</button>

</section>
<a href="Index.jsp">홈으로</a>
</body>
</html>
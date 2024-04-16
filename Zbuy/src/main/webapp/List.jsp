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
					<th>구매번호</th>
					<th>구매일자</th>
					<th>점포명</th>
					<th>상품명</th>
					<th>구매수량</th>
					<th>단가</th>
					<th>총금액</th>
					<th>구매구분</th>
					<th>수취구분</th>
				</tr>
				<tr>
					<td>0001</td>
					<td>2019년03월25일</td>
					<td>이태원점</td>
					<td>라면</td>
					<td>2</td>
					<td>1,500원</td>
					<td>3,000원</td>
					<td>판매</td>
					<td>현금</td>
				</tr>
				<tr>
					<td>0002</td>
					<td>2019년03월26일</td>
					<td>도원점</td>
					<td>컴퓨터</td>
					<td>1</td>
					<td>1,500원</td>
					<td>1,500원</td>
					<td>판매</td>
					<td>현금</td>
				</tr>
				<tr>
					<td>0003</td>
					<td>2019년03월27일</td>
					<td>도원점</td>
					<td>예감</td>
					<td>5</td>
					<td>2,300원</td>
					<td>11,500원</td>
					<td>판매 취소</td>
					<td>카드</td>
				</tr>
				<tr>
					<td>0004</td>
					<td>2019년03월28일</td>
					<td>혜화점</td>
					<td>라면</td>
					<td>2</td>
					<td>1,500원</td>
					<td>3,000원</td>
					<td>판매</td>
					<td>현금</td>
				</tr>
				<tr>
					<td>0005</td>
					<td>2019년03월29일</td>
					<td>강동점</td>
					<td>라면</td>
					<td>1</td>
					<td>1,500원</td>
					<td>1,500원</td>
					<td>판매 취소</td>
					<td>현금</td>
				</tr>
				<tr>
					<td>0006</td>
					<td>2019년03월30일</td>
					<td>한남점</td>
					<td>라면</td>
					<td>2</td>
					<td>1,500원</td>
					<td>3,000원</td>
					<td>판매</td>
					<td>현금</td>
				</tr>
				<tr>
					<td>0007</td>
					<td>2019년03월31일</td>
					<td>강동점</td>
					<td>고소미</td>
					<td>1</td>
					<td>2,000원</td>
					<td>2,000원</td>
					<td>판매</td>
					<td>카드</td>
				</tr>
				<tr>
					<td>0008</td>
					<td>2019년04월01일</td>
					<td>이태원점</td>
					<td>마우스</td>
					<td>2</td>
					<td>5,000원</td>
					<td>10,000원</td>
					<td>판매 취소</td>
					<td>현금</td>
				</tr>
				<tr>
					<td>0009</td>
					<td>2019년04월02일</td>
					<td>이태원점</td>
					<td>컴퓨터</td>
					<td>1</td>
					<td>1,500원</td>
					<td>1,500원</td>
					<td>판매</td>
					<td>현금</td>
				</tr>
			</table>
		</form>
	</div>
</section>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
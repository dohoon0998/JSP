<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매등록</title>
 <link rel="stylesheet" href="Global.css">
</head>
<body>
	<header class="Head">
		<h1 class="H1">매장별 커피 판매관리 Ver 1.0</h1>
	</header>
		<div class="Nav">
			<jsp:include page="mainMenu.jsp"></jsp:include>
		</div>
	<h2 class="H2">판매등록</h2>
		<section class="Sec">
	<div class="wrap" style="margin: 0 auto;">
	<form action="saleIns.jsp" method="post" name="salefrm">
		<table border='1'>
			<tr>
				<th>판매번호</th>
				<td><input type="text" name="saleno" id="saleno">
				</td>
			</tr>
			<tr>
				<th>상품코드</th>
				<td><input type="text" name="pcode" id="pcode" required>
				</td>
			</tr>
			<tr>
				<th>판매날짜</th>
				<td><input type="date" name="saledate" id="saledate">
				</td>
			</tr>
			<tr>
				<th>매장코드</th>
				<td><input type="text" name="scode" id="scode">
				</td>
			</tr>
			<tr>
				<th>판매수량</th>
				<td><input type="number" name="amount" id="amount" required>
				</td>
			</tr>
			<tr>
				<td colspan='2'>
					<button type="submit">입력하기</button>
					<button type="reset">다시쓰기</button>
				</td>
			</tr>
		</table>
	</form>	
	</div>
	</section>
	
	<footer class="Foot">
		<address>Copyright @2018 All right reserved 상미고</address>
	</footer>
</body>
</html>
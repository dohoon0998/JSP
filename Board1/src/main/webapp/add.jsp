<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@ include file="inter.jsp"%>
	<section>

		<h2 class="title">게시판 작성</h2>

		<form action="addpro.jsp">
			<table border="1">
				<tr>
					<td>작성자</td>
					<td><input class="na" type="text" name="na"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input class="ti" type="text" name="ti"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><input class="co" type="text" name="co"></td>
				</tr>
			</table>
		<div class="sub">
		<a href="list.jsp"><input type="button" value="목록"></a>
		<input type="submit" value="완료">
		</div>
		</form>
	</section>
	<%@ include file="footer.jsp"%>

</body>
</html>
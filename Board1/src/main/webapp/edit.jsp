<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
String id = request.getParameter("id");
String na = request.getParameter("na");
String ti = request.getParameter("ti");
String co = request.getParameter("co");

%>
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

		<form action="editpro.jsp">
		<input readonly="readonly" type="text" name="idx" class="idx" value="">
			<table border="1">
				<tr>
					<td>작성자</td>
					<td><input class="na" type="text" name="na" value=""></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input class="ti" type="text" name="ti" value=""></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><input class="co" type="text" name="co" value=""></td>
				</tr>
			</table>
		<div class="sub">
		<a href="list.jsp"><input type="button" value="취소"></a>
		<input type="submit" value="완료">
		</div>
		</form>
	</section>
	<%@ include file="footer.jsp"%>

</body>
</html>
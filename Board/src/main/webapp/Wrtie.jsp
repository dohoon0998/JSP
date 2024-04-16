<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.cl {
	width: 500px;
}
.con {
	width: 500px;
	height: 100px;
}
</style>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<h1>게시판 작성</h1>
	<section>
	<div>
	<form action="WriteConfirm.jsp" name="form">
	<table border="1">
		<tr>
			<th>작성자</th>
			<td><input type="text" name="writer" class="cl"></td>
		</tr>
		
		<tr>
			<th>제 목</th>
			<td><input type="text" name="subject" class="cl"></td>
		</tr>
		
		<tr>
			<th>내 용</th>
			<td><input type="text" name="content" class="con"></td>
		</tr>
		
			<a href="List.jsp">조회</a>
			<input type="submit" vlaue="등록">
		
	</table>
	</form>
	</div>
	</section>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
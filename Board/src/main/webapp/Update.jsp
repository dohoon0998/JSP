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
<%
request.setCharacterEncoding("UTF-8");
String write = request.getParameter("write");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
String idx = request.getParameter("idx");
%>
<jsp:include page="Header.jsp"></jsp:include>
	<h1>게시판 수정</h1>
	<section>
	<div>
	<form action="UpdateConfirm.jsp" name="form">
	<input readonly type="text" name="idx" class="idx" value="<%= idx %>" style="border:none; color:white;">
	<table border="1">
		<tr>
			<th>작성자</th>
			<td><input type="text" name="writer" class="cl" value="<%= write %>"></td>
		</tr>
		
		<tr>
			<th>제 목</th>
			<td><input type="text" name="subject" class="cl" value="<%= subject %>"></td>
		</tr>
		
		<tr>
			<th>내 용</th>
			<td><input type="text" name="content" class="con" value="<%= content %>"></td>
		</tr>
		
			<input type="submit" vlaue="완료">
		
	</table>
	</form>
	</div>
	</section>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
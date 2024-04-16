<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="Header.jsp" %>
	<%@ include file="Nav.jsp" %>
	
<div class="wrapper">
<table border="1">
<tr>
	<th>회원번호</th>
	<th>회원성명</th>
	<th>고객등급</th>
	<th>매출</th>
</tr>
<%-- <%
for(int i=0; i<list.size(); i++){
%>
<tr>
	<td><%=list.get(i).getCustno() %></td>
	<td><%=list.get(i).getCustname() %></td>
	<td><%=list.get(i).getGrade() %></td>
	<td><%=list.get(i).getPrice() %></td>
</tr>
<%}%> --%>
</table>
</div>
<%@ include file="Footer.jsp" %>
</body>
</html>
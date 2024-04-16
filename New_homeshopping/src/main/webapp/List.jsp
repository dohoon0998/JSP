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
<table style="width:900px" border="1">
<tr>
	<th>회원번호</th>
	<th>회원성명</th>
	<th>전화번호</th>
	<th>주소</th>
	<th>가입일자</th>
	<th>고객등급</th>
	<th>거주지역</th>
	<th>삭제</th>
</tr>
<%-- <%for(int i=0; i<list.size(); i++){ %>
<tr>
	<td><a href="modify?custno=<%=list.get(i).getCustno() %>">
	<%=list.get(i).getCustno() %></a></td>
	<td><%=list.get(i).getCustname() %></td>
	<td><%=list.get(i).getPhone() %></td>
	<td><%=list.get(i).getAddress() %></td>
	<td><%=list.get(i).getJoindate() %></td>
	<td><%=list.get(i).getGrade() %></td>
	<td><%=list.get(i).getCity() %></td>
	<td><a href="delete?custno=<%=list.get(i).getCustno() %>">
	Delete</a></td>
</tr>
<%}%> --%>
</table>
</div>
	<%@ include file="Footer.jsp" %>
</body>
</html>
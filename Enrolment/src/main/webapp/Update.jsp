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
<h3>교과목 수정</h3>
<%
String id = request.getParameter("id");
String co_name = request.getParameter("co_name");
String credit = request.getParameter("credit");
String lecturer_idx = request.getParameter("lecturer_idx");
String week = request.getParameter("week");
String start_hour = request.getParameter("start_hour");
String end_hour = request.getParameter("end_hour");
%>
<%

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection(url, user, pw);

String sql = "select lecturer_idx, name from lecturer_tbl group by lecturer_idx, name";

Statement stmt = conn.createStatement();
 
%>
<section>
<div>
<form action="UpdateConfirm.jsp" name="">
<table border="1">
	<tr>
		<th>과목코드</th>
		<td><input type="text" name="id" value="<%=id%>"></td>
	</tr>
	
	<tr>
		<th>과목명</th>
		<td><input type="text" name="co_name" value="<%=co_name%>"></td>
	</tr>
	
	<tr>
		<th>학점</th>
		<td><input type="text" name="credit" value="<%=credit%>"></td>
	</tr>
	
	<tr>
		<th>교수</th>
		<td>
			<%  ResultSet rs = stmt.executeQuery(sql); %>
				<select name="lecturer_idx">
					<option></option>
					<% while(rs.next()) {%>
					<option value="<%= rs.getString(1) %>"><%= rs.getString(2) %></option>
				<%
					}
				rs.close();
				%>
				</select>		
		</td>
	</tr>
	
	<tr>
		<th>요일</th>
			<td>
				<input type="radio" name="week" value="1" checked >
					<label>월</label>
				<input type="radio" name="week" value="2">
					<label>화</label>
				<input type="radio" name="week" value="3">
					<label>수</label>
				<input type="radio" name="week" value="4">
					<label>목</label>
				<input type="radio" name="week" value="5">
					<label>금</label>
			</td>
	</tr>
	
	<tr>
		<th>시작시간</th>
		<td><input type="text" name="start_hour" value="<%=start_hour%>"></td>
	</tr>
	
	<tr>
		<th>종료시간</th>
		<td><input type="text" name="end_hour" value="<%=end_hour%>"></td>
	</tr>
	
	<tr>
		<td colspan="2"><input type="submit" value="수정"><a href="List.jsp">취소</a></td>
	</tr>
</table>
</form>
</div>
</section>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
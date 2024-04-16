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
<form action="insertConfirm.jsp" name="form" id="form">
<table border="1">
	<tr>
		<th>과목코드</th>
		<td><input type="text" name="id" id="id"></td>
	</tr>
	
	<tr>
		<th>과목명</th>
		<td><input type="text" name="co_name" id="co_name"></td>
	</tr>
	
	<tr>
		<th>학점</th>
		<td><input type="text" name="credit" id="credit"></td>
	</tr>
	
	<tr>
		<th>교수</th>
		<td>
			<%  ResultSet rs = stmt.executeQuery(sql); %>
				<select name="lecturer_idx">
					<option id="lecturer_idx"></option>
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
		<td><input type="text" name="start_hour" id="start_hour"></td>
	</tr>
	
	<tr>
		<th>종료시간</th>
		<td><input type="text" name="end_hour" id="end_hour"></td>
	</tr>
	
	<tr>
		<td colspan="2"><input type="submit" value="추가" onclick="fn_submit(); return false;"><a href="List.jsp">목록</a></td>
	</tr>
</table>
</form>
</div>
</section>
<script>
function fn_submit(){
	var f = document.form;	
	
	var id = f.id.value;
	if(id == ""){
		alert("과목코드가 입력되지 않았습니다");
		f.id.focus(); 
		return false;
	}
	var co_name = f.co_name.value;
	if(co_name == ""){
		alert("과목명이 입력되지 않았습니다");
		f.co_name.focus();
		return false;
	}
	if(f.credit.value == ""){
		alert("학점 입력되지 않았습니다");
		f.credit.focus();
		return false;
	}
	if(f.lecturer_idx.value == ""){
		alert("교수가 선택되지 않았습니다");
		f.lecturer_idx.focus(); 
		return false;
	}
	if(f.start_hour.value == ""){
		alert("시작시간 입력되지 않았습니다");
		f.start_hour.focus();
		return false;
	}	
	if(f.end_hour.value == ""){
		alert("종료시간이 입력되지 않았습니다");
		return false;
	}
	f.submit();
}
</script>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
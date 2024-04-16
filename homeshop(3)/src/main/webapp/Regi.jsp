<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="footer.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
</head>
<body>
<%
ResultSet rs = null;
Connection conn = null;
PreparedStatement pstmt = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql = "select max(custno)+1 from member_tbl_02";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

rs.next();
%>
<section>
<h2>회원등록</h2>
<form action="RegiConfirm.jsp" name="form">

	<table border="1">
		<tr>
			<th>회원번호(자동발생)</th>
			<td>
			<input type="text" name="custno" readonly value="<%= rs.getString(1)%>">
			</td>
		</tr>
		<tr>
			<th>회원성명</th>
			<td>
			<input type="text" name="custname" id="custname">
			</td>
		</tr>
		
		<tr>
			<th>회원전화</th>
			<td>
			<input type="text" name="phone">			
			</td>
		</tr>
		<tr>
			<th>회원주소</th>
			<td>
			<input type="text" name="address">
			</td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td>
			<input type="text" name="joindate">
			</td>
		</tr>
		<tr>
			<th>고객등급[A:VIP, B:일반, C:직원]</th>
			<td>
			<input type="text" name="grade">
			</td>
		</tr>
		<tr>
			<th>도시코드</th>
			<td>
			<input type="text" name="city">
			</td>
		</tr>
		<tr>
		<td>
			<input type="submit" value="등록" onclick="fn_submit(); return false;">
			<a href="List.jsp">조회</a>
			</td>
		</tr>
	</table>
</form>
</section>
 <script>
function fn_submit(){
	var f = document.form;	
	
	var custname = f.custname.value;
	if(custname == ""){
		alert("회원성명이 입력되지 않았습니다");
		f.custname.focus(); 
		return false;
	}
	var phone = f.phone.value;
	if(phone == ""){
		alert("회원전화가 입력되지 않았습니다");
		f.phone.focus();
		return false;
	}
	if(f.address.value == ""){
		alert("회원주소가 선택되지 않았습니다");
		f.address.focus();
		return false;
	}
	if(f.joindate.value == ""){
		alert("가입일자가 입력되지 않았습니다");
		f.joindate.focus(); 
		return false;
	}
	if(f.grade.value == ""){
		alert("고객등급이 입력되지 않았습니다");
		f.grade.focus();
		return false;
	}	
	if(f.city.value == ""){
		alert("도시코드가 선택되지 않았습니다");
		return false;
	}
	f.submit();
}
</script>
</body>
</html>
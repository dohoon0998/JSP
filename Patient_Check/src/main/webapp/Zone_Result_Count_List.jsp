<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역별검사건수</title>
</head>
<header>
	<jsp:include page="Header.jsp"></jsp:include>
</header>
<body>
	<h3 align="center">지역별검사건수</h3>
	<table align="center" border="1">
		<tr>
			<td>지역 코드</td>
			<td>지역명</td>
			<td>검사건수</td>
		</tr>

		<%
		//1 단계 : JDBC 드라이버 로드.
		Class.forName("oracle.jdbc.OracleDriver");

		//2 단계 : 커넥션 객체 생성.
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

		//3 단계 : PreparedStatement, Statement, ResultSet 객체생성.
		/*
		■ PreparedStatement : 쿼리문▶ insert, update, delete 문 사용시 사용함.
		■ Statement :         쿼리문▶ select 문 사용시 사용함.
		■ ResultSet :         쿼리문▶ select 문 사용시 사용함.
		*/
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;

		// 4 단계 : String SQL을 통해 쿼리문 작성.
		String SQL = "select p.p_city as p_city, count(p.p_no) as total from tbl_result_202004 r, tbl_patient_202004 p where r.p_no = p.p_no group by p.p_city order by p.p_city";

		// 5 단계 : [select] Statement에 Connection.createStatement() 입력.
		stmt = con.createStatement();

		// 6 단계 : [select] Statement에 executeQuery(SQL) 넣어주기.
		rs = stmt.executeQuery(SQL);

		// 7 단계 : [select] while문을 사용해 보여줄 테이블의 쿼리문을 ResultSet에 getString를 이용해 컬럼값 가져오기.
		while (rs.next()) {
			String p_city = rs.getString("p_city");
			String p_city_name = rs.getString("p_city");
			String total = rs.getString("total");
			
			if (p_city_name.equals("10")) {
				p_city_name = "서울";
			} else if (p_city_name.equals("20")) {
				p_city_name = "경기";
			} else if (p_city_name.equals("30")) {
				p_city_name = "강원";
			} else {
				p_city_name = "대구";
			}
		%>
		<%
		// 8 단계 : [select] <tr>,<td>를 이용해 값 출력.
		%>
		<tr align="center">
			<td><%=p_city%></td>
			<td><%=p_city_name%></td>
			<td><%=total%></td>		
			<%
			}
			// 9 단계 : [select] close() 사용하기.
			stmt.close();
			rs.close();
			con.close();
			%>
		</tr>

	</table>
</body>
<footer>
	<jsp:include page="Footer.jsp"></jsp:include>
</footer>
</html>
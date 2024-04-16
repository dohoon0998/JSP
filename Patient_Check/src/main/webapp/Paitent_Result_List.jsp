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
<title>검사결과조회</title>
</head>
<header>
	<jsp:include page="Header.jsp"></jsp:include>
</header>
<body>
	<h3 align="center">검사결과조회</h3>
	<table align="center" border="1">
		<tr>
			<td>환자 코드</td>
			<td>환자 이름</td>
			<td>검사 명</td>
			<td>검사 시작일</td>
			<td>검사 상태</td>
			<td>검사 완료일</td>
			<td>검사 결과</td>
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
		String SQL = "select r.p_no as p_no, p.p_name as p_name, l.t_name as t_name, r.t_sdate as t_sdate, r.t_status as t_status, r.t_ldate as t_ldate, r.t_result as t_result from tbl_result_202004 r, tbl_patient_202004 p, tbl_lab_test_202004 l where r.p_no = p.p_no and r.t_code = l.t_code";

		// 5 단계 : [select] Statement에 Connection.createStatement() 입력.
		stmt = con.createStatement();

		// 6 단계 : [select] Statement에 executeQuery(SQL) 넣어주기.
		rs = stmt.executeQuery(SQL);

		// 7 단계 : [select] while문을 사용해 보여줄 테이블의 쿼리문을 ResultSet에 getString를 이용해 컬럼값 가져오기.
		while (rs.next()) {
			String p_no = rs.getString("p_no");
			String p_name = rs.getString("p_name");
			String t_name = rs.getString("t_name");
			String t_sdate = rs.getString("t_sdate");
			String t_status = rs.getString("t_status").substring(0,1);
			String t_ldate = rs.getString("t_ldate");
			String t_result = rs.getString("t_result").substring(0,1);	
			
			if (t_status.equals("1")) {
				t_status = "검사중";
			} else {
				t_status = "검사완료";
			}
			
			if (t_result.equals("X")) {
				t_result = "미입력";
			} else if (t_result.equals("P")) {
				t_result = "양성";
			} else {
				t_result = "음성";
			}
		%>
		<%
		// 8 단계 : [select] <tr>,<td>를 이용해 값 출력.
		%>
		<tr align="center">
			<td><%=p_no%></td>
			<td><%=p_name%></td>
			<td><%=t_name%></td>
			<td><%=t_sdate.substring(0,10)%></td>
			<td><%=t_status%></td>
			<td><%=t_ldate.substring(0,10)%></td>
			<td><%=t_result%></td>
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